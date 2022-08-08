import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/data/models/list_produk_penjual_model.dart';
import 'package:growell/data/models/list_riwayat_transaksi_model.dart';
import 'package:growell/data/parameters/detail_riwayat_transaksi_dto.dart';
import 'package:growell/data/parameters/list_riwayat_transaksi_dto.dart';
import 'package:growell/presentation/landing_page/pembeli/riwayat_transaksi/bloc/riwayat_transaksi_bloc.dart';
import 'package:growell/presentation/landing_page/pembeli/riwayat_transaksi/bloc/riwayat_transaksi_event.dart';
import 'package:growell/presentation/landing_page/pembeli/riwayat_transaksi/bloc/riwayat_transaksi_state.dart';
import 'package:growell/utils/currency_formatter.dart';
import 'package:growell/utils/preference.dart';
import 'package:growell/widget/card/card_list_edit_produk.dart';
import 'package:growell/widget/child_page/custom_child_page.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailRiwayatTransaksiPage extends StatefulWidget {
  String? id_riwayat_transaksi;
  DetailRiwayatTransaksiPage({Key? key, this.id_riwayat_transaksi}) : super(key: key);

  @override
  _DetailRiwayatTransaksiPageState createState() => _DetailRiwayatTransaksiPageState();
}

class _DetailRiwayatTransaksiPageState extends State<DetailRiwayatTransaksiPage> {

  RiwayatTransaksiBloc? riwayatTransaksiBloc;
  ListRiwayatTransaksiEntity? listRiwayatTransaksiEntity;
  dynamic dataList, detailRiwayatTransaksi;
  var tanggalOrder = '';
  var totalBayar = "0";
  var idKategori = "";
  var statusTransaksi = 0;
  List<int> harga = [];
  var namaToko = "";

  @override
  void initState() { 
    super.initState();
    riwayatTransaksiBloc = BlocProvider.of<RiwayatTransaksiBloc>(context);
    getValueLocalStorage();
  }

  getValueLocalStorage() async {
    var id_user = await Preference().getStringValue("id_user");
    var id_kategori = await Preference().getStringValue("id_kategori");

    setState(() {
      idKategori = id_kategori;
    });

    riwayatTransaksiBloc!.add(
      GetListRiwayatTransaksiEvent(
        params: ListRiwayatTransaksiDTO(
          id_user: id_user
        )
      )
    );
    riwayatTransaksiBloc!.add(
      GetDetailRiwayatTransaksiEvent(
        params: DetailRiwayatTransaksiDTO(
          id_riwayat_transaksi: widget.id_riwayat_transaksi
        )
      )
    );
    
    Timer.periodic(const Duration(seconds: 5), (timer) { 
      if(statusTransaksi == 0){
        riwayatTransaksiBloc!.add(
          GetListRiwayatTransaksiEvent(
            params: ListRiwayatTransaksiDTO(
              id_user: id_user
            )
          )
        );
        riwayatTransaksiBloc!.add(
          GetDetailRiwayatTransaksiEvent(
            params: DetailRiwayatTransaksiDTO(
              id_riwayat_transaksi: widget.id_riwayat_transaksi
            )
          )
        );
      }else{
        timer.cancel();
      }
    });
  }

  listener(){
    return BlocConsumer<RiwayatTransaksiBloc, RiwayatTransaksiState>(
      bloc: riwayatTransaksiBloc,
      builder: (context, state) {
        return const SizedBox();
      }, 
      listener: (context, state) {
        if(state is LoadedGetListRiwayatTransaksiState){
          setState(() {
            dataList = state.entity!.data;
            statusTransaksi = state.entity!.data!['toko'][0]['status_transaksi'];
            namaToko = state.entity!.data!["pemilik_toko"][0]['nama_toko'];
          });
        }
        if(state is LoadedGetDetailRiwayatTransaksiState){
          setState(() {
            detailRiwayatTransaksi = state.entity!.data;
          });

          for (var item in state.entity!.data) {
            harga.add(
              int.parse(item['harga_produk'])
            );
            totalBayar = harga.isNotEmpty ? 
                harga.reduce((value, element) => value + element).toString() : "0";
          }
        }
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return CustomChildPage(
      title: "Detail Riwayat Transaksi",
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                listener(),
                detailRiwayatTransaksi == null ?
                Center(
                  child: Text(
                    "Maaf, detail riwayat transaksi kosong."
                  ),
                )
                :
                Column(
                  children: [
                    const SizedBox(height: 32,),
                    Text(
                      namaToko,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerRight,
                      child: Text(
                        statusTransaksi == 0 ?
                        "Transaksi Pending"
                        :
                        "Transaksi Sukses"
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 16, top: 8),
                        shrinkWrap: true,
                        itemCount: detailRiwayatTransaksi.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardListEditProduk(
                            title: "Detail Riwayat Transaksi",
                            entity: ProdukPenjualEntity(
                              created_at: detailRiwayatTransaksi[index]['created_at'],
                              detail_produk: detailRiwayatTransaksi[index]['desc_produk'],
                              harga_produk: detailRiwayatTransaksi[index]['harga_produk'],
                              id_kategori: idKategori,
                              id_produk: detailRiwayatTransaksi[index]['id_produk'],
                              id_user: detailRiwayatTransaksi[index]['id_user'],
                              kode_barcode: "",
                              nama_produk: detailRiwayatTransaksi[index]['nama_produk'],
                              path: detailRiwayatTransaksi[index]['path'],
                              // size: "",
                              // stok: 0,
                              updated_at: detailRiwayatTransaksi![index]['edited_at'],
                              total_amount: (double.parse(detailRiwayatTransaksi[index]['harga_produk']).toInt() * double.parse(detailRiwayatTransaksi[index]['jumlah_belanja']).toInt()).toString(),
                              jumlah_belanjaan: int.parse(detailRiwayatTransaksi[index]['jumlah_belanja'])
                            ),
                          );
                        }
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 8, right: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 1, color: Colors.grey)
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Total Belanja",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black
                            )
                          ),
                          const SizedBox(height: 16,),
                          Text(
                            CurrencyFormatter.formatWithoutDecimal(double.parse(totalBayar)),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black
                            )
                          ),
                        ],
                      )
                    ),
                    statusTransaksi == 0 ?
                    Column(
                      children: [
                        const SizedBox(height: 32,),
                        Text("Tunjukan kode QR ke kasir, untuk verifikasi pembayaran"),
                        SizedBox(height: 16,),
                        QrImage(
                          data: widget.id_riwayat_transaksi!,
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                      ],
                    )
                    :
                    const SizedBox()
                  ],
                ),
              ]
            )
          )
        )
      )
    );
  }
}
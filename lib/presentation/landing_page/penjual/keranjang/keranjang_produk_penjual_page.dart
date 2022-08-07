import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/data/models/list_keranjang_produk_penjual_model.dart';
import 'package:growell/data/models/list_produk_penjual_model.dart';
import 'package:growell/data/parameters/add_riwayat_transaksi_detail_dto.dart';
import 'package:growell/data/parameters/add_riwayat_transaksi_dto.dart';
import 'package:growell/data/parameters/get_list_keranjang_produk_dto.dart';
import 'package:growell/presentation/landing_page/penjual/keranjang/bloc/keranjang_penjual_bloc.dart';
import 'package:growell/presentation/landing_page/penjual/keranjang/bloc/keranjang_penjual_event.dart';
import 'package:growell/presentation/landing_page/penjual/keranjang/bloc/keranjang_penjual_state.dart';
import 'package:growell/utils/currency_formatter.dart';
import 'package:growell/utils/preference.dart';
import 'package:growell/widget/button/button_base_custom.dart';
import 'package:growell/widget/card/card_list_edit_produk.dart';
import 'package:growell/widget/child_page/custom_child_page.dart';
import 'package:uuid/uuid.dart';

class KeranjangProdukPenjualPage extends StatefulWidget {
  GetListKeranjangProdukDTO? params;
  KeranjangProdukPenjualPage({Key? key, this.params}) : super(key: key);

  @override
  _KeranjangProdukPenjualPageState createState() => _KeranjangProdukPenjualPageState();
}

class _KeranjangProdukPenjualPageState extends State<KeranjangProdukPenjualPage> {
  KeranjangPenjualBloc? _keranjangPenjualBloc;
  List<ListKeranjangProdukEntity>? listKeranjang = [];
  List<int>? listBayar = [];
  String? idUser, idKategori, fullname, namaToko;
  bool isLoading = false;
  bool isShow = false;
  var id_user = "";
  var id_kategori = "";
  var nama_lengkap = "";
  var totalBayar = "0";
  var nama_toko = "";


  retrieveLocalStorage() async {
    id_user = await Preference().getStringValue("id_user");
    id_kategori = await Preference().getStringValue("id_kategori");
    nama_lengkap = await Preference().getStringValue("fullname");
    nama_toko = await Preference().getStringValue("nama_toko");

    setState(() {
      idUser = id_user;
      idKategori = id_kategori;
      fullname = nama_lengkap;
      namaToko = nama_toko;
    });

    Future.delayed(const Duration(seconds: 1), (){
      _keranjangPenjualBloc!.add(
        GetListKeranjangProdukPenjualEvent(
          params: GetListKeranjangProdukDTO(
            id_user: id_user,
            id_keranjang_toko: id_user
          )
        )
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _keranjangPenjualBloc = BlocProvider.of<KeranjangPenjualBloc>(context);
    setState(() {
      namaToko = "Nama Toko";
    });
    retrieveLocalStorage();
  }

  listener(){
    return BlocConsumer<KeranjangPenjualBloc, KeranjangPenjualState>(
      bloc: _keranjangPenjualBloc,
      builder: (context, state) {
        return const SizedBox();
      }, 
      listener: (context, state) {
        if(state is LoadingGetListKeranjangProdukPenjualState){
          setState(() {
            isLoading = true;
            isShow = false;
          });
        }
        if(state is SuccessGetListKeranjangProdukPenjualState){
          listKeranjang!.clear();
          listBayar!.clear();
          for (var item in state.entity!.entity!) {
            listBayar!.add(
              int.parse(item.total_amount!)
            );
            listKeranjang!.add(
              ListKeranjangProdukEntity(
                created_at: item.created_at,
                detail_produk: item.detail_produk,
                edited_at: item.edited_at,
                harga_produk: item.harga_produk,
                id_keranjang_produk: item.id_keranjang_produk,
                id_keranjang_toko: item.id_keranjang_toko,
                id_produk: item.id_produk,
                id_user: item.id_user,
                jumlah_belanjaan: item.jumlah_belanjaan,
                kode_barcode: item.kode_barcode,
                nama_produk: item.nama_produk,
                path: item.path,
                total_amount: item.total_amount
              )
            );
          }
          setState(() {
            isLoading = false;
            isShow = true;
            totalBayar = listBayar!.isNotEmpty ? 
                listBayar!.reduce((value, element) => value + element).toString() : "0";
          });
        }

        if(state is ErrorGetListKeranjangProdukPenjualState){
          setState(() {
            isLoading = false;
            isShow = true;
          });
        }
      },
    );
  }

  listenerAddRiwayatTransaksi(){
    return BlocConsumer<KeranjangPenjualBloc, KeranjangPenjualState>(
      bloc: _keranjangPenjualBloc,
      builder: (context, state) {
        return const SizedBox();
      }, 
      listener: (context, state) {
        if(state is SuccessAddRiwayatTransaksiPenjualState){
          for (var item in listKeranjang!) {
            _keranjangPenjualBloc!.add(
              AddRiwayatTransaksiDetailEvent(
                params: AddRiwayatTransaksiDetailDTO(
                  created_at: item.created_at,
                  desc_produk: "",
                  harga_produk: item.harga_produk,
                  id_produk: item.id_produk,
                  id_riwayat_transaksi: state.entity!.id_riwayat_transaksi,
                  id_riwayat_transaksi_detail: Uuid().v4(),
                  id_toko: state.entity!.id_toko,
                  id_user: state.entity!.id_user,
                  nama_produk: item.nama_produk,
                  status_transaksi: 1,
                  updated_at: DateTime.now().toString()
                )
              )
            );
          }
        }
      },
    );
  }
  
  listenerAddriwayatTransaksiDetail(){
    return BlocConsumer<KeranjangPenjualBloc, KeranjangPenjualState>(
      bloc: _keranjangPenjualBloc,
      builder: (context, state) {
        return const SizedBox();
      }, 
      listener: (context, state) {
        if(state is SuccessAddRiwayatTransaksiDetailPenjualState){
          Navigator.of(context).pushNamedAndRemoveUntil(RoutesName.landingPage, (route) => false);
        }
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return CustomChildPage(
      title: "Keranjang",
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              listener(),
              listenerAddRiwayatTransaksi(),
              listenerAddriwayatTransaksiDetail(),
              isShow ?
              listKeranjang!.isEmpty ?
              Column(
                children: [
                  const SizedBox(height: 50,),
                  Center(
                    child: Text("Maaf, keranjang kosong")
                  ),
                ],
              )
              :
              Column(
                children: [
                  const SizedBox(height: 32,),
                  Text(
                    namaToko!.isEmpty ? "Nama Toko" : namaToko!,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                  const SizedBox(height: 16,),
                  isLoading ?
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                  :
                  isShow ?
                  listKeranjang!.isEmpty ?
                  Center(
                    child: Text("Maaf, keranjang kosong")
                  )
                  :
                  Container(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 16, top: 8),
                      shrinkWrap: true,
                      itemCount: listKeranjang!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardListEditProduk(
                          title: "keranjang",
                          entity: ProdukPenjualEntity(
                            created_at: listKeranjang![index].created_at,
                            detail_produk: listKeranjang![index].detail_produk,
                            harga_produk: listKeranjang![index].harga_produk,
                            id_kategori: id_kategori,
                            id_produk: listKeranjang![index].id_produk,
                            id_user: listKeranjang![index].id_user,
                            kode_barcode: listKeranjang![index].kode_barcode,
                            nama_produk: listKeranjang![index].nama_produk,
                            path: listKeranjang![index].path,
                            // size: "",
                            // stok: 0,
                            updated_at: listKeranjang![index].edited_at,
                            total_amount: listKeranjang![index].total_amount,
                            jumlah_belanjaan: listKeranjang![index].jumlah_belanjaan
                          ),
                        );
                      }
                    ),
                  )
                  :
                  const SizedBox(),

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
                          "Total Bayar",
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

                  Container(
                    margin: EdgeInsets.only(top: 32, left: 8, right: 8),
                    child: ButtonBaseCustom(
                      function: (){
                        _keranjangPenjualBloc!.add(
                          AddRiwayatTransaksiEvent(
                            params: AddRiwayatTransaksiDTO(
                              id_riwayat_transaksi: Uuid().v4(),
                              id_toko: idKategori == "1" ? idUser : widget.params!.id_keranjang_toko,
                              id_user: idKategori == "1" ? idUser : widget.params!.id_user,
                              status_transaksi: idKategori == "1" ? 1 : 0,
                              total_amount: totalBayar.toString()
                            )
                          )
                        );
                      },
                      text: "Bayar",
                    ),
                  )
                ],
              )
              :
              const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
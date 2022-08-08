import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/data/models/list_riwayat_transaksi_model.dart';
import 'package:growell/data/parameters/list_riwayat_transaksi_dto.dart';
import 'package:growell/presentation/landing_page/pembeli/riwayat_transaksi/bloc/riwayat_transaksi_bloc.dart';
import 'package:growell/presentation/landing_page/pembeli/riwayat_transaksi/bloc/riwayat_transaksi_event.dart';
import 'package:growell/presentation/landing_page/pembeli/riwayat_transaksi/bloc/riwayat_transaksi_state.dart';
import 'package:growell/utils/preference.dart';
import 'package:growell/widget/child_page/custom_child_page.dart';

class RiwayatTransaksiPage extends StatefulWidget {
  RiwayatTransaksiPage({Key? key}) : super(key: key);

  @override
  _RiwayatTransaksiPageState createState() => _RiwayatTransaksiPageState();
}

class _RiwayatTransaksiPageState extends State<RiwayatTransaksiPage> {

  RiwayatTransaksiBloc? riwayatTransaksiBloc;
  ListRiwayatTransaksiEntity? listRiwayatTransaksiEntity;
  dynamic dataList;
  var tanggalOrder = '';

  @override
  void initState() { 
    super.initState();
    riwayatTransaksiBloc = BlocProvider.of<RiwayatTransaksiBloc>(context);
    getValueLocalStorage();
  }

  getValueLocalStorage() async {
    var id_user = await Preference().getStringValue("id_user");

    riwayatTransaksiBloc!.add(
      GetListRiwayatTransaksiEvent(
        params: ListRiwayatTransaksiDTO(
          id_user: id_user
        )
      )
    );
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
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomChildPage(
      title: "Daftar Riwayat Transaksi",
      child: Column(
        children: [
          listener(),
          dataList == null ?
          const Center(
            child: Text("Data null"),
          )
          :
          dataList['toko'].isEmpty ?
          const Center(
            child: Text("Belum ada transaksi"),
          )
          :
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: dataList['pemilik_toko'].length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(RoutesName.detailRiwayatTransaksi, arguments: dataList['toko'][index]['id_riwayat_transaksi']);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.08,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: const Offset(0, 1),
                        )
                      ]
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ClipRRect(
                              //   borderRadius: BorderRadius.all(Radius.circular(50)),
                              //   child: Image.network(
                              //     dataList['pemilik_toko'][index]['path'],
                              //     fit: BoxFit.cover,
                              //   ),
                              // ),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.50,
                                      child: Text(
                                        "Belanja",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis
                                        )
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.50,
                                      child: Text(
                                        dataList['pemilik_toko'][index]['nama_toko'],
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          overflow: TextOverflow.ellipsis
                                        )
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.15,
                                child: Text(
                                  dataList['toko'][index]['created_at'].toString().split(" ")[0],
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    overflow: TextOverflow.ellipsis
                                  )
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            )
          )
        ],
      ),
    );
  }
}
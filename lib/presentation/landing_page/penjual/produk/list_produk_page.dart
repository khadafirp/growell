import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/color/list_color.dart';
import 'package:growell/data/models/list_produk_penjual_model.dart';
import 'package:growell/presentation/landing_page/penjual/produk/bloc/add_produk_bloc.dart';
import 'package:growell/presentation/landing_page/penjual/produk/bloc/add_produk_event.dart';
import 'package:growell/presentation/landing_page/penjual/produk/bloc/add_produk_state.dart';
import 'package:growell/utils/preference.dart';
import 'package:growell/widget/card/card_list_edit_produk.dart';
import 'package:growell/widget/child_page/custom_child_page.dart';

class ListProdukPage extends StatefulWidget {
  ListProdukPage({Key? key}) : super(key: key);

  @override
  _ListProdukPageState createState() => _ListProdukPageState();
}

class _ListProdukPageState extends State<ListProdukPage> {

  AddProdukBloc? _addProdukBloc;
  List<ProdukPenjualEntity>? dataProduk = [];
  bool isLoading = false;
  bool isShow = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _addProdukBloc = BlocProvider.of<AddProdukBloc>(context);
    fetchApi();
  }

  void fetchApi() async {
    var idUser = await Preference().getStringValue("id_user");
    Future.delayed(const Duration(milliseconds: 100), (){
      _addProdukBloc!.add(GetListProdukPenjualEvent(
        params: idUser
      ));
    });
  }

  Widget listener(){
    return BlocConsumer<AddProdukBloc, AddProdukState>(
      bloc: _addProdukBloc,
      builder: (state, context){
        return const SizedBox();
      }, 
      listener: (context, state){
        if(state is LoadingGetListProdukPenjual){
          setState(() {
            isLoading = true;
          });
        }
        if(state is SuccessGetListProdukPenjualState){
          state.entity!.forEach((element) {
            dataProduk!.add(
              ProdukPenjualEntity(
                id_produk: element.id_produk,
                nama_produk: element.nama_produk,
                detail_produk: element.detail_produk,
                harga_produk: element.harga_produk,
                id_kategori: element.id_kategori,
                created_at: element.created_at,
                id_user: element.id_user,
                kode_barcode: element.kode_barcode,
                path: element.path,
                size: element.size,
                stok: element.stok,
                updated_at: element.updated_at
              )
            );
          });
          setState(() {
            isLoading = false;
            isShow = true;
          });
        }
        if(state is ErrorGetListProdukPenjualState){
          setState(() {
            isLoading = false;
            isShow = true;
          });
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomChildPage(
      title: "Daftar Produk",
      child: Column(
        children: [
          listener(),
          isLoading ?
          const Center(
            child: CircularProgressIndicator(),
          )
          :
          isShow ?
          dataProduk!.isEmpty ?
          Center(
            child: Text("Maaf, belum ada produk")
          )
          :
          Container(
            height: MediaQuery.of(context).size.height * 0.79,
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 16, top: 8),
              shrinkWrap: true,
              itemCount: dataProduk!.length,
              itemBuilder: (BuildContext context, int index) {
                return CardListEditProduk(
                  entity: ProdukPenjualEntity(
                    created_at: dataProduk![index].created_at,
                    detail_produk: dataProduk![index].detail_produk,
                    harga_produk: dataProduk![index].harga_produk,
                    id_kategori: dataProduk![index].id_kategori,
                    id_produk: dataProduk![index].id_produk,
                    id_user: dataProduk![index].id_user,
                    kode_barcode: dataProduk![index].kode_barcode,
                    nama_produk: dataProduk![index].nama_produk,
                    path: dataProduk![index].path,
                    size: dataProduk![index].size,
                    stok: dataProduk![index].stok,
                    updated_at: dataProduk![index].updated_at
                  ),
                );
              }
            ),
          )
          :
          const SizedBox()
        ],
      ),
    );
  }
}
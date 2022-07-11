import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/color/list_color.dart';
import 'package:growell/data/models/list_produk_penjual_model.dart';
import 'package:growell/data/models/login_model.dart';
import 'package:growell/presentation/landing_page/penjual/beranda/bloc/beranda_penjual_bloc.dart';
import 'package:growell/presentation/landing_page/penjual/beranda/bloc/beranda_penjual_event.dart';
import 'package:growell/presentation/landing_page/penjual/beranda/bloc/beranda_penjual_state.dart';
import 'package:growell/widget/card/card_list_produk.dart';
import 'package:growell/widget/header/card_header_balance.dart';

class BerandaPenjualPage extends StatefulWidget {
  LoginEntity? entity;
  BerandaPenjualPage({Key? key, this.entity}) : super(key: key);

  @override
  _BerandaPenjualPageState createState() => _BerandaPenjualPageState();
}

class _BerandaPenjualPageState extends State<BerandaPenjualPage> {

  bool showListFloating = false;
  BerandaPenjualBloc? _berandaPenjualBloc;
  List<ProdukPenjualEntity>? listProduk;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _berandaPenjualBloc = BlocProvider.of<BerandaPenjualBloc>(context);
    Future.delayed(const Duration(milliseconds: 100), (){
      _berandaPenjualBloc!.add(
        GetListProdukPenjualEvent(
          idUser: widget.entity!.idUser
        )
      );
    });
  }

  getListProduk(){
    return BlocConsumer<BerandaPenjualBloc, BerandaPenjualState>(
      bloc: _berandaPenjualBloc,
      builder: (context, state){
        if(state is LoadingGetListProdukBerandaPenjualState){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is SuccessGetListProdukBerandaPenjualState){
          return Container(
            height: MediaQuery.of(context).size.height * 0.95,
            padding: EdgeInsets.only(bottom: 250),
            child: GridView.builder(
              padding: const EdgeInsets.only(bottom: 16, top: 40),
              shrinkWrap: true,
              itemCount: state.entity!.entity!.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                print("data = " + state.entity!.entity![index].detail_produk.toString());
                // return const SizedBox();
                return CardListProduk(
                  entity: ProdukPenjualEntity(
                    id_produk: state.entity!.entity![index].id_produk,
                    nama_produk: state.entity!.entity![index].nama_produk,
                    detail_produk: state.entity!.entity![index].detail_produk,
                    harga_produk: state.entity!.entity![index].harga_produk,
                    id_kategori: state.entity!.entity![index].id_kategori,
                    id_user: state.entity!.entity![index].id_user,
                    kode_barcode: state.entity!.entity![index].kode_barcode,
                    path: state.entity!.entity![index].path,
                    size: state.entity!.entity![index].size,
                    stok: state.entity!.entity![index].stok,
                    created_at: state.entity!.entity![index].created_at,
                    updated_at: state.entity!.entity![index].updated_at,
                  ),
                );
              },
            ),
          );
        }
        if(state is ErrorGetListProdukBerandaPenjualState){
          return Container(
            margin: EdgeInsets.only(top: 70),
            child: Center(
              child: Text(
                "Maaf,belum ada produk"
              ),
            ),
          );
        }
        return const SizedBox();
      }, 
      listener: (context, state){
        // if(state is LoadingGetListProdukBerandaPenjualState){
        //   setState(() {
        //     isLoading = true;
        //   });
        // }
        // if(state is SuccessGetListProdukBerandaPenjualState){
        //   state.entity!.entity!.forEach((element) {
        //     listProduk!.add(
        //       ProdukPenjualEntity(
        //         id_produk: element.id_produk,
        //         nama_produk: element.nama_produk,
        //         stok: element.stok,
        //         id_kategori: element.id_kategori,
        //         kode_barcode: element.kode_barcode,
        //         id_user: element.id_user,
        //         path: element.path,
        //         size: element.size,
        //         created_at: element.created_at,
        //         updated_at: element.updated_at,
        //       )
        //     );
        //   });
        //   setState(() {
        //     isLoading = false;
        //   });
        // }
        // if(state is ErrorGetListProdukBerandaPenjualState){
        //   setState(() {
        //     isLoading = false;
        //   });
        // }
      }
    );
  }

  Widget _listFloating() {
    return AnimatedOpacity(
      opacity: showListFloating ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.18,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(RoutesName.addProdukPage);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ListColor().baseColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tambah Produk",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.11,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child: Icon(
                        Icons.add,
                        color: ListColor().baseColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(RoutesName.listProdukPage);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ListColor().baseColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Edit Produk",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.11,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child: Icon(
                        Icons.edit,
                        color: ListColor().baseColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CardHeaderBalance(
            fullname: widget.entity!.fullname,
            badge: widget.entity!.userKategori.toString(),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(top: 180),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    getListProduk()
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.08,
              margin: EdgeInsets.only(top: 150),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.08,
                    padding: const EdgeInsets.only(right: 32, left: 32),
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Saldo Rp 0"),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.11,
                          decoration: BoxDecoration(
                            color: ListColor().baseColor,
                            borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          child: Icon(
                            Icons.qr_code_scanner_outlined,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          showListFloating == true ?
          _listFloating()
          :
          SizedBox(height: 0,),
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            padding: EdgeInsets.all(8),
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: (){
                setState(() {
                  if(showListFloating){
                    showListFloating = false;
                  }else{
                    showListFloating = true;
                  }
                });
              }, 
              child: Icon(
                showListFloating ? Icons.arrow_downward : Icons.menu,
                color: Colors.white,
              ),
              backgroundColor: ListColor().baseColor,
            ),
          ),
        ],
      ),
    );
  }
}
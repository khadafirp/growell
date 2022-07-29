import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/color/list_color.dart';
import 'package:growell/data/models/list_keranjang_produk_penjual_model.dart';
import 'package:growell/data/models/list_produk_penjual_model.dart';
import 'package:growell/data/models/login_model.dart';
import 'package:growell/data/parameters/filter_edit_produk_dto.dart';
import 'package:growell/presentation/landing_page/penjual/beranda/bloc/beranda_penjual_bloc.dart';
import 'package:growell/presentation/landing_page/penjual/beranda/bloc/beranda_penjual_event.dart';
import 'package:growell/presentation/landing_page/penjual/beranda/bloc/beranda_penjual_state.dart';
import 'package:growell/presentation/landing_page/penjual/keranjang/bloc/keranjang_penjual_bloc.dart';
import 'package:growell/presentation/landing_page/penjual/keranjang/bloc/keranjang_penjual_event.dart';
import 'package:growell/presentation/landing_page/penjual/keranjang/bloc/keranjang_penjual_state.dart';
import 'package:growell/utils/preference.dart';
import 'package:growell/widget/card/card_list_produk.dart';
import 'package:growell/widget/header/card_header_balance.dart';

class BerandaPenjualPage extends StatefulWidget {
  BerandaPenjualPage({Key? key}) : super(key: key);

  @override
  _BerandaPenjualPageState createState() => _BerandaPenjualPageState();
}

class _BerandaPenjualPageState extends State<BerandaPenjualPage> {

  bool showListFloating = false;
  BerandaPenjualBloc? _berandaPenjualBloc;
  KeranjangPenjualBloc? _keranjangPenjualBloc;
  List<ProdukPenjualEntity>? listProduk;
  List<ListKeranjangProdukEntity>? listKeranjang = [];
  bool isLoading = false;
  String? idUser, idKategori, fullname;

  retrieveLocalStorage() async {
    var id_user = await Preference().getStringValue("id_user");
    var id_kategori = await Preference().getStringValue("id_kategori");
    var nama_lengkap = await Preference().getStringValue("fullname");

    setState(() {
      idUser = id_user;
      idKategori = id_kategori;
      fullname = nama_lengkap;
    });

    Future.delayed(const Duration(milliseconds: 100), (){
      _berandaPenjualBloc!.add(
        GetListProdukPenjualEvent(
          idUser: idUser!
        )
      );
      _keranjangPenjualBloc!.add(
        GetListKeranjangProdukPenjualEvent(
          idUser: idUser!
        )
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _berandaPenjualBloc = BlocProvider.of<BerandaPenjualBloc>(context);
    _keranjangPenjualBloc = BlocProvider.of<KeranjangPenjualBloc>(context);
    retrieveLocalStorage();
  }

  listener(){
    return BlocConsumer<KeranjangPenjualBloc, KeranjangPenjualState>(
      bloc: _keranjangPenjualBloc,
      builder: (context, state) {
        return const SizedBox();
      }, 
      listener: (context, state) {
        print("status state = " + state.toString());
        if(state is SuccessGetListKeranjangProdukPenjualState){
          listKeranjang!.clear();
          for (var item in state.entity!.entity!) {
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
          setState(() {});
        }
      },
    );
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
                return InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(
                      RoutesName.detailProdukPenjual, 
                      arguments: ProdukPenjualEntity(
                        created_at: state.entity!.entity![index].created_at,
                        detail_produk: state.entity!.entity![index].detail_produk,
                        harga_produk: state.entity!.entity![index].harga_produk,
                        id_kategori: state.entity!.entity![index].id_kategori,
                        id_produk: state.entity!.entity![index].id_produk,
                        id_user: state.entity!.entity![index].id_user,
                        kode_barcode: state.entity!.entity![index].kode_barcode,
                        nama_produk: state.entity!.entity![index].nama_produk,
                        path: state.entity!.entity![index].path,
                        size: state.entity!.entity![index].size,
                        stok: state.entity!.entity![index].stok,
                        updated_at: state.entity!.entity![index].updated_at
                      ),
                    );
                  },
                  child: CardListProduk(
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
                Navigator.of(context).pushNamed(RoutesName.addProdukPage, arguments: FilterEditProdukDTO(
                  filter: "tambah"
                ));
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
          listener(),
          CardHeaderBalance(
            fullname: fullname,
            badge: idKategori,
            listKeranjang: listKeranjang!,
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/data/models/list_keranjang_toko_model.dart';
import 'package:growell/data/models/list_user_model.dart';
import 'package:growell/data/parameters/filter_list_toko_dto.dart';
import 'package:growell/data/parameters/get_list_keranjang_produk_dto.dart';
import 'package:growell/presentation/landing_page/pembeli/beranda/bloc/beranda_pembeli_bloc.dart';
import 'package:growell/presentation/landing_page/pembeli/beranda/bloc/beranda_pembeli_event.dart';
import 'package:growell/presentation/landing_page/pembeli/beranda/bloc/beranda_pembeli_state.dart';
import 'package:growell/presentation/landing_page/pembeli/list_toko/bloc/list_toko_bloc.dart';
import 'package:growell/presentation/landing_page/pembeli/list_toko/bloc/list_toko_event.dart';
import 'package:growell/presentation/landing_page/pembeli/list_toko/bloc/list_toko_state.dart';
import 'package:growell/utils/preference.dart';
import 'package:growell/widget/card/card_produk_new.dart';
import 'package:growell/widget/child_page/custom_child_page.dart';

class ListTokoPage extends StatefulWidget {
  FilterListTokoDTO? params;
  ListTokoPage({Key? key, this.params}) : super(key: key);

  @override
  _ListTokoPageState createState() => _ListTokoPageState();
}

class _ListTokoPageState extends State<ListTokoPage> {

  ListTokoBloc? listTokoBloc;
  BerandaPembeliBloc? berandaPembeliBloc;
  List<UserEntity> dataUser = [];
  List<ListKeranjangPemilikTokoEntity> dataToko = [];
  var idUser = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listTokoBloc = BlocProvider.of<ListTokoBloc>(context);
    berandaPembeliBloc = BlocProvider.of<BerandaPembeliBloc>(context);
    getValueLocalStorage();
    if(widget.params!.filter != "keranjang"){
      listTokoBloc!.add(GetListTokoEvent());
    } else {
      berandaPembeliBloc!.add(GetListKeranjangTokoPembeliEvent());
    }
  }

  getValueLocalStorage() async {
    var id_user = await Preference().getStringValue("id_user");
    setState(() {
      idUser = id_user;
    });
  }

  Widget listener(){
    return BlocConsumer<ListTokoBloc, ListTokoState>(
      bloc: listTokoBloc,
      builder: (context, state){
        return const SizedBox();
      }, 
      listener: (context, state){
        if(state is SuccessGetListTokoState){
          dataUser.clear();
          state.entity!.forEach((element) {
            if(element.user_kategori == 1){
              dataUser.add(
                UserEntity(
                  alamat_toko: element.alamat_toko,
                  created_at: element.created_at,
                  desc_toko: element.desc_toko,
                  email: element.email,
                  file_size: element.file_size,
                  fullname: element.fullname,
                  id_user: element.id_user,
                  nama_toko: element.nama_toko,
                  no_telp: element.no_telp,
                  path: element.path,
                  updated_at: element.updated_at,
                  user_kategori: element.user_kategori
                )
              );
            }
          });
          setState(() {});
        }
      }
    );
  }

  Widget listenerListToko(){
    return BlocConsumer<BerandaPembeliBloc, BerandaPembeliState>(
      bloc: berandaPembeliBloc,
      builder: (context, state){
        return const SizedBox();
      }, 
      listener: (context, state){
        if(state is SuccessGetListTokoBerandaPembeliState){
          dataToko.clear();
          for (var item in state.entity!) {
            if(item.user_kategori == 1){
              dataToko.add(
                ListKeranjangPemilikTokoEntity(
                alamat_toko: item.alamat_toko,
                created_at: item.created_at,
                desc_toko: item.desc_toko,
                email: item.email,
                file_size: item.file_size,
                fullname: item.fullname,
                id_keranjang_toko: item.id_keranjang_toko,
                id_user: item.id_user,
                id_user_pembeli: item.id_user_pembeli,
                nama_toko: item.nama_toko,
                no_telp: item.no_telp,
                password: item.password,
                path: item.path,
                updated_at: item.updated_at,
                user_kategori: item.user_kategori,
                username: item.username
              ));
            }
          }
          setState(() {});
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomChildPage(
      child: Column(
        children: [
          widget.params!.filter != "keranjang" ?
          Column(
            children: [
              listener(),
              dataUser.isEmpty ?
              Center(
                child: Text(
                  "Maaf, belum ada toko"
                ),
              )
              :
              Container(
                height: MediaQuery.of(context).size.height * 0.79,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: dataUser.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardProdukNew(
                      function: (){
                        Navigator.of(context).pushNamed(RoutesName.listProdukTokoPage, arguments: dataUser[index].id_user);
                      },
                      entity: UserEntity(
                        alamat_toko: dataUser[index].alamat_toko,
                        created_at: dataUser[index].created_at,
                        desc_toko: dataUser[index].desc_toko,
                        email: dataUser[index].email,
                        file_size: dataUser[index].file_size,
                        fullname: dataUser[index].fullname,
                        id_user: dataUser[index].id_user,
                        nama_toko: dataUser[index].nama_toko,
                        no_telp: dataUser[index].no_telp,
                        path: dataUser[index].path,
                        updated_at: dataUser[index].updated_at,
                        user_kategori: dataUser[index].user_kategori
                      ),
                    );
                  }),
              ),
            ],
          )
          :
          Column(
            children: [
              listenerListToko(),
              dataToko.isEmpty ?
              Center(
                child: Text(
                  "Maaf, belum ada toko"
                ),
              )
              :
              Container(
                height: MediaQuery.of(context).size.height * 0.79,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: dataToko.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardProdukNew(
                      function: (){
                        Navigator.of(context).pushNamed(RoutesName.keranjangPenjual, arguments: GetListKeranjangProdukDTO(
                          id_keranjang_toko: dataToko[index].id_user,
                          id_user: idUser
                        ));
                      },
                      entity: UserEntity(
                        alamat_toko: dataToko[index].alamat_toko,
                        created_at: dataToko[index].created_at,
                        desc_toko: dataToko[index].desc_toko,
                        email: dataToko[index].email,
                        file_size: dataToko[index].file_size,
                        fullname: dataToko[index].fullname,
                        id_user: dataToko[index].id_user,
                        nama_toko: dataToko[index].nama_toko,
                        no_telp: dataToko[index].no_telp,
                        path: dataToko[index].path,
                        updated_at: dataToko[index].updated_at,
                        user_kategori: dataToko[index].user_kategori
                      ),
                    );
                  }),
              ),
            ],
          )
        ],
      ),
      title: widget.params!.filter != "keranjang" ? "Daftar Toko" : "Keranjang Toko",
    );
  }
}
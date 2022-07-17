import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/data/models/list_user_model.dart';
import 'package:growell/presentation/landing_page/pembeli/list_toko/bloc/list_toko_bloc.dart';
import 'package:growell/presentation/landing_page/pembeli/list_toko/bloc/list_toko_event.dart';
import 'package:growell/presentation/landing_page/pembeli/list_toko/bloc/list_toko_state.dart';
import 'package:growell/widget/card/card_produk_new.dart';
import 'package:growell/widget/child_page/custom_child_page.dart';

class ListTokoPage extends StatefulWidget {
  ListTokoPage({Key? key}) : super(key: key);

  @override
  _ListTokoPageState createState() => _ListTokoPageState();
}

class _ListTokoPageState extends State<ListTokoPage> {

  ListTokoBloc? listTokoBloc;
  List<UserEntity> dataUser = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    listTokoBloc = BlocProvider.of<ListTokoBloc>(context);
    listTokoBloc!.add(GetListTokoEvent());
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

  @override
  Widget build(BuildContext context) {
    return CustomChildPage(
      child: Column(
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
      ),
      title: "Daftar Toko",
    );
  }
}
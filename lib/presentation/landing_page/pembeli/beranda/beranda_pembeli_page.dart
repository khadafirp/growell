import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/data/models/list_keranjang_toko_model.dart';
import 'package:growell/data/models/login_model.dart';
import 'package:growell/presentation/landing_page/pembeli/beranda/bloc/beranda_pembeli_bloc.dart';
import 'package:growell/presentation/landing_page/pembeli/beranda/bloc/beranda_pembeli_event.dart';
import 'package:growell/presentation/landing_page/pembeli/beranda/bloc/beranda_pembeli_state.dart';
import 'package:growell/utils/preference.dart';
import 'package:growell/widget/header/card_header_pembeli.dart';

class BerandaPembeliPage extends StatefulWidget {
  BerandaPembeliPage({Key? key}) : super(key: key);

  @override
  _BerandaPembeliPageState createState() => _BerandaPembeliPageState();
}

class _BerandaPembeliPageState extends State<BerandaPembeliPage> {

  String? idUser, idKategori, fullname;
  BerandaPembeliBloc? berandaPembeliBloc;
  List<ListKeranjangPemilikTokoEntity> entity = [];

  retrieveLocalStorage() async {
    var id_user = await Preference().getStringValue("id_user");
    var id_kategori = await Preference().getStringValue("id_kategori");
    var nama_lengkap = await Preference().getStringValue("fullname");

    setState(() {
      idUser = id_user;
      idKategori = id_kategori;
      fullname = nama_lengkap;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    berandaPembeliBloc = BlocProvider.of<BerandaPembeliBloc>(context);
    berandaPembeliBloc!.add(
      GetListKeranjangTokoPembeliEvent()
    );
    retrieveLocalStorage();
  }
  
  listener(){
    return BlocConsumer<BerandaPembeliBloc, BerandaPembeliState>(
      bloc: berandaPembeliBloc,
      builder: (context, state) {
        return const SizedBox();
      }, 
      listener: (context, state) {
        if(state is SuccessGetListTokoBerandaPembeliState){
          entity.clear();
          for (var item in state.entity!) {
            entity!.add(
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
              )
            );
          }
          setState(() {});
        }  
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            listener(),
            CardHeaderPembeli(
              fullname: fullname,
              badge: idKategori,
              entity: entity,
            ),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(RoutesName.listTokoPage, arguments: "2"),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.72,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.12,
                      padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1)
                          )
                        ]
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          "assets/png/buyer.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 16),
                      child: Text(
                        "Belanja",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black
                        ),
                      )
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
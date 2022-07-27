import 'package:flutter/material.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/data/models/login_model.dart';
import 'package:growell/utils/preference.dart';
import 'package:growell/widget/header/card_header_pembeli.dart';

class BerandaPembeliPage extends StatefulWidget {
  BerandaPembeliPage({Key? key}) : super(key: key);

  @override
  _BerandaPembeliPageState createState() => _BerandaPembeliPageState();
}

class _BerandaPembeliPageState extends State<BerandaPembeliPage> {

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
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    retrieveLocalStorage();
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
            CardHeaderPembeli(
              fullname: fullname,
              badge: idKategori,
            ),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(RoutesName.listTokoPage),
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
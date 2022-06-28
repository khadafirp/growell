import 'package:flutter/material.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/data/models/login_model.dart';
import 'package:growell/widget/header/card_header_pembeli.dart';

class BerandaPembeliPage extends StatefulWidget {
  LoginEntity? entity;
  BerandaPembeliPage({Key? key, this.entity}) : super(key: key);

  @override
  _BerandaPembeliPageState createState() => _BerandaPembeliPageState();
}

class _BerandaPembeliPageState extends State<BerandaPembeliPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
              fullname: widget.entity!.fullname,
              badge: widget.entity!.userKategori.toString(),
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
                          "assets/jpg/scarlett.jpeg",
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
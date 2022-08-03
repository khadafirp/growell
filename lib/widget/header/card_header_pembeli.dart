import 'package:flutter/material.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/color/list_color.dart';
import 'package:growell/data/models/list_keranjang_toko_model.dart';

class CardHeaderPembeli extends StatelessWidget {
  String? fullname, badge;
  List<ListKeranjangPemilikTokoEntity>? entity;
  CardHeaderPembeli({Key? key, this.fullname, this.badge, this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.17,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        color: ListColor().baseColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Text(
                      fullname ?? "",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Text(
                      badge == "1" ? "Penjual" : "Pembeli",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed(RoutesName.listTokoPage, arguments: "2");
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.11,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart_rounded,
                                color: ListColor().baseColor,
                              ),

                              entity!.isEmpty ?
                              const SizedBox() :
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    color: Colors.red
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    entity!.length.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11
                                    ),
                                  ),
                                )
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.11,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child: Icon(
                          Icons.book,
                          color: ListColor().baseColor,
                        ),
                      )
                    ],
                  ),
                )
          ],
        )
      ),
    );
  }
}
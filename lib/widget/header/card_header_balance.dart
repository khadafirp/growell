import 'package:flutter/material.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/color/list_color.dart';
import 'package:growell/data/models/list_keranjang_produk_penjual_model.dart';

class CardHeaderBalance extends StatelessWidget {
  String? fullname, badge;
  List<ListKeranjangProdukEntity>? listKeranjang;
  CardHeaderBalance({Key? key, this.fullname, this.badge, this.listKeranjang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: 60, left: 16, right: 16),
      decoration: BoxDecoration(
        color: ListColor().baseColor,
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.60,
                  height: MediaQuery.of(context).size.height * 0.04,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 15, right: 15, top: 0),
                    child: TextFormField(
                      minLines: 1,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Cari",
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      )
                    )
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed(RoutesName.keranjangPenjual);
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

                              listKeranjang!.isEmpty ?
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
                                    listKeranjang!.length.toString(),
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
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  fullname ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white
                  )
                ),
              ),
              Text(
                badge == "1" ? "Penjual" : "Pembeli",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                )
              )
            ],
          )
        ],
      ),
    );
  }
}
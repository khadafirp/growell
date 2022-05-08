import 'package:flutter/material.dart';

class CardProdukNew extends StatelessWidget {
  const CardProdukNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(0, 1),
          )
        ]
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Image.asset(
                    "assets/jpg/scarlett.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: Text(
                          "Toko Makmur Sejahtera",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis
                          )
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: Text(
                          "Jl. Mampang Prapatan XX No 17, Pancoran, Jakarta Selatan",
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            overflow: TextOverflow.ellipsis
                          )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
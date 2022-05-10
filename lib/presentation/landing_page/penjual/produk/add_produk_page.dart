import 'package:flutter/material.dart';
import 'package:growell/widget/child_page/custom_child_page.dart';

class AddProdukPage extends StatefulWidget {
  AddProdukPage({Key? key}) : super(key: key);

  @override
  _AddProdukPageState createState() => _AddProdukPageState();
}

class _AddProdukPageState extends State<AddProdukPage> {
  @override
  Widget build(BuildContext context) {
    return CustomChildPage(
      title: "Tambah Produk",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama Produk",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  )
                ),
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Detail Produk",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  )
                ),
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Detail Produk",
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Harga Produk",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  )
                ),
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Harga Produk",
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Stok Produk",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  )
                ),
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Stok Produk",
                  ),
                )
              ],
            ),
          ),
                    Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Foto Produk",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  )
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.20,
                        height: MediaQuery.of(context).size.height * 0.04,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text("Pilih Foto"),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:growell/data/models/list_produk_penjual_model.dart';
import 'package:growell/utils/currency_formatter.dart';
import 'package:growell/widget/button/button_base_custom.dart';
import 'package:growell/widget/button/button_border_custom.dart';
import 'package:growell/widget/child_page/custom_child_page.dart';

class DetailProdukPembeli extends StatefulWidget {
  ProdukPenjualEntity? entity;
  DetailProdukPembeli({Key? key, this.entity}) : super(key: key);

  @override
  _DetailProdukPembeliState createState() => _DetailProdukPembeliState();
}

class _DetailProdukPembeliState extends State<DetailProdukPembeli> {
  @override
  Widget build(BuildContext context) {
    return CustomChildPage(
      title: "Detail Produk",
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: Image.network(
                    widget.entity!.path!,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.31,
                  ),
                ),
                const SizedBox(height: 16,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nama Produk",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                        ),
                      ),
                      const SizedBox(height: 2,),
                      Text(
                        widget.entity!.nama_produk!,
                        style: TextStyle(
                          fontSize: 14
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                        height: 1,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Harga Produk",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                        ),
                      ),
                      const SizedBox(height: 2,),
                      Text(
                        CurrencyFormatter.formatWithoutDecimal(double.parse(widget.entity!.harga_produk!)),
                        style: TextStyle(
                          fontSize: 14
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                        height: 1,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Detail Produk",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                        ),
                      ),
                      const SizedBox(height: 2,),
                      Text(
                        widget.entity!.detail_produk!,
                        style: TextStyle(
                          fontSize: 14
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                        height: 1,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ButtonBaseCustom(
                  function: (){},
                  text: "Beli",
                ),
                const SizedBox(height: 16,),
                ButtonBorderCustom(
                  function: (){},
                  text: "Masuk ke Keranjang",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
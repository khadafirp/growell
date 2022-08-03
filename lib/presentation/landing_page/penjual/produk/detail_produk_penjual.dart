import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/color/list_color.dart';
import 'package:growell/data/models/list_produk_penjual_model.dart';
import 'package:growell/data/parameters/add_keranjang_produk_dto.dart';
import 'package:growell/presentation/landing_page/penjual/keranjang/bloc/keranjang_penjual_bloc.dart';
import 'package:growell/presentation/landing_page/penjual/keranjang/bloc/keranjang_penjual_event.dart';
import 'package:growell/presentation/landing_page/penjual/keranjang/bloc/keranjang_penjual_state.dart';
import 'package:growell/utils/currency_formatter.dart';
import 'package:growell/widget/button/button_base_custom.dart';
import 'package:growell/widget/button/button_border_custom.dart';
import 'package:growell/widget/child_page/custom_child_page.dart';
import 'package:growell/widget/dialog/loading_dialog_view.dart';
import 'package:uuid/uuid.dart';

class DetailProdukPenjual extends StatefulWidget {
  ProdukPenjualEntity? entity;
  DetailProdukPenjual({Key? key, this.entity}) : super(key: key);

  @override
  _DetailProdukPenjualState createState() => _DetailProdukPenjualState();
}

class _DetailProdukPenjualState extends State<DetailProdukPenjual> {

  late KeranjangPenjualBloc keranjangPenjualBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    keranjangPenjualBloc = BlocProvider.of<KeranjangPenjualBloc>(context);
  }

  Widget listener() {
    return BlocConsumer<KeranjangPenjualBloc, KeranjangPenjualState>(
      bloc: keranjangPenjualBloc,
      builder: (context, state){
        return const SizedBox();
      }, 
      listener: (context, state){
        if(state is LoadingKeranjangPenjualState){
          showDialog(
            context: context,
            builder: (_) {
              return LoadingDialogView();
            }
          );
        }
        if(state is LoadedKeranjangPenjualState){
          Navigator.of(context).pop();
          Fluttertoast.showToast(
            msg: "Produk berhasil masuk keranjang.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ListColor().baseColor,
            textColor: Colors.white,
            fontSize: 16.0
          );
          Future.delayed(const Duration(seconds: 1), (){
            Navigator.of(context).pushNamedAndRemoveUntil(RoutesName.landingPage, (route) => false);
          });
        }
        if(state is ErrorKeranjangPenjualState){
          Navigator.of(context).pop();
          Fluttertoast.showToast(
            msg: state.message!,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
          );
        }
      }
    );
  }

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
                listener(),
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
                  function: (){
                    keranjangPenjualBloc.add(
                      AddKeranjangPenjualEvent(
                        params: AddKeranjangProdukDTO(
                          id_keranjang_produk: Uuid().v4(),
                          id_produk: widget.entity!.id_produk,
                          detail_produk: widget.entity!.detail_produk,
                          created_at: DateTime.now().toString(),
                          edited_at: DateTime.now().toString(),
                          harga_produk: widget.entity!.harga_produk,
                          id_keranjang_toko: widget.entity!.id_user,
                          id_user: widget.entity!.id_user,
                          jumlah_belanjaan: 1,
                          kode_barcode: widget.entity!.id_produk,
                          nama_produk: widget.entity!.nama_produk,
                          path: widget.entity!.path,
                          total_amount: widget.entity!.harga_produk,
                        )
                      )
                    );
                  },
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
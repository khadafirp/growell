import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/color/list_color.dart';
import 'package:growell/data/parameters/add_produk_dto.dart';
import 'package:growell/data/parameters/filter_edit_produk_dto.dart';
import 'package:growell/presentation/landing_page/penjual/produk/bloc/add_produk_bloc.dart';
import 'package:growell/presentation/landing_page/penjual/produk/bloc/add_produk_event.dart';
import 'package:growell/presentation/landing_page/penjual/produk/bloc/add_produk_state.dart';
import 'package:growell/utils/preference.dart';
import 'package:growell/widget/button/button_base_custom.dart';
import 'package:growell/widget/child_page/custom_child_page.dart';
import 'package:growell/widget/input/text_form_field_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AddProdukPage extends StatefulWidget {
  FilterEditProdukDTO? params;
  AddProdukPage({Key? key, this.params}) : super(key: key);

  @override
  _AddProdukPageState createState() => _AddProdukPageState();
}

class _AddProdukPageState extends State<AddProdukPage> {
  ImagePicker picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  TextEditingController namaProdukController = TextEditingController();
  TextEditingController detailProdukController = TextEditingController();
  TextEditingController hargaProdukController = TextEditingController();
  TextEditingController stokProdukController = TextEditingController();
  String path = "";
  AddProdukBloc? addProdukBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addProdukBloc = BlocProvider.of<AddProdukBloc>(context);

    setState(() {
      namaProdukController.text = widget.params!.entity == null ? "" : widget.params!.entity!.nama_produk!;
      detailProdukController.text = widget.params!.entity != null ? widget.params!.entity!.detail_produk! : "";
      hargaProdukController.text = widget.params!.entity != null ? widget.params!.entity!.harga_produk! : "";
      stokProdukController.text = widget.params!.entity != null ? widget.params!.entity!.stok!.toString() : "";
      path = widget.params!.entity != null ? "" : "";
    });
  }


  openCamera() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 200,
      maxHeight: 200,
      imageQuality: 70,
    );

    setState(() {
      path = image == null ? "" : image.path;
    });
  }

  openGalery() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 200,
      maxHeight: 200,
      imageQuality: 70,
    );
    setState(() {
      path = image == null ? "" : image.path;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      openGalery();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    openCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  onPress() async {
    var userKategori = await Preference().getStringValue("id_kategori");
    var idUser = await Preference().getStringValue("id_user");

    if(widget.params!.filter == "edit"){
      addProdukBloc!.add(
        EditProdukEvent(
          params: AddProdukDTO(
            id_produk: widget.params!.entity!.id_produk,
            nama_produk: namaProdukController.text,
            stok: int.parse(stokProdukController.text),
            id_kategori: userKategori,
            id_user: idUser,
            path: path,
            size: "",
            kode_barcode: Uuid().v4(),
            harga_produk: hargaProdukController.text,
            detail_produk: detailProdukController.text
          )
        )
      );
    } else {
      addProdukBloc!.add(
        TambahProdukEvent(
          params: AddProdukDTO(
            id_produk: Uuid().v4(),
            nama_produk: namaProdukController.text,
            stok: int.parse(stokProdukController.text),
            id_kategori: userKategori,
            id_user: idUser,
            path: path,
            size: "",
            kode_barcode: Uuid().v4(),
            harga_produk: hargaProdukController.text,
            detail_produk: detailProdukController.text
          )
        )
      );
    }
  }
  
  listener(){
    return BlocConsumer<AddProdukBloc, AddProdukState>(
      bloc: addProdukBloc,
      builder: (context, state){
        return const SizedBox();
      },
      listener: (context, state){
        if(state is LoadingAddProdukState){
          showDialog(
            context: context, 
            builder: (_){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          );
        }
        if(state is SuccessAddProdukState){
          Navigator.of(context).pop();
          Fluttertoast.showToast(
            msg: "Produk berhasil disimpan.",
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
        if(state is ErrorAddProdukState){
          Fluttertoast.showToast(
            msg: state.message,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ListColor().baseColor,
            textColor: Colors.white,
            fontSize: 16.0
          );
        }

        if(state is LoadingEditProdukState){
          showDialog(
            context: context, 
            builder: (_){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          );
        }
        if(state is SuccessEditProdukState){
          Navigator.of(context).pop();
          Fluttertoast.showToast(
            msg: "Produk berhasil disimpan.",
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
        if(state is ErrorEditProdukState){
          Fluttertoast.showToast(
            msg: state.message,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ListColor().baseColor,
            textColor: Colors.white,
            fontSize: 16.0
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomChildPage(
      title: widget.params!.filter == "tambah" ? "Tambah Produk" : "Edit Produk",
      child: Form(
        key: _formKey,
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
                  TextFormFieldWidget(
                    hintText: "Nama Produk",
                    controller: namaProdukController,
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
                    "Detail Produk",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextFormFieldWidget(
                    hintText: "Detail Produk",
                    controller: detailProdukController,
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
                    "Harga Produk",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextFormFieldWidget(
                    hintText: "Harga Produk",
                    controller: hargaProdukController,
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
                  TextFormFieldWidget(
                    hintText: "Stok Produk",
                    controller: stokProdukController,
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
                    "Foto Produk",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => _showPicker(context),
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(16),
                            margin: EdgeInsets.only(top: 16),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Text("Pilih Foto"),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          margin: EdgeInsets.only(left: 8),
                          child: Text(
                            path,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16,),
            listener(),
            ButtonBaseCustom(
              function: (){
                if(_formKey.currentState!.validate()){
                  if(path.isNotEmpty){
                    onPress();
                  }
                }
              },
              text: "Simpan",
            )
          ],
        ),
      )
    );
  }
}
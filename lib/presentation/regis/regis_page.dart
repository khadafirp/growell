import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_connect.dart';
import 'package:growell/color/list_color.dart';
import 'package:growell/data/parameters/add_user_dto.dart';
import 'package:growell/presentation/regis/bloc/regis_bloc.dart';
import 'package:growell/presentation/regis/bloc/regis_event.dart';
import 'package:growell/presentation/regis/bloc/regis_state.dart';
import 'package:growell/widget/button/button_base_custom.dart';
import 'package:growell/widget/input/text_form_field_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class RegisPage extends StatefulWidget {
  RegisPage({Key? key}) : super(key: key);

  @override
  _RegisPageState createState() => _RegisPageState();
}

class _RegisPageState extends State<RegisPage> {

  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController noHpController = TextEditingController();
  TextEditingController namaTokoController = TextEditingController();
  TextEditingController alamatTokoController = TextEditingController();
  TextEditingController deskripsiTokoController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  RegisBloc? regisBloc;

  String idKategori = "";
  String namaKategori = "";
  final _formKey = GlobalKey<FormState>();

  List<dynamic> items = [
    {
      "id": "1",
      "text": "Penjual"
    },
    {
      "id": "2",
      "text": "Pembeli"
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    regisBloc = BlocProvider.of<RegisBloc>(context);

    setState(() {
      idKategori = items[0]['id'];
      namaKategori = items[0]['text'];
    });
  }

  Widget listener(){
    return BlocConsumer<RegisBloc, RegisState>(
      bloc: regisBloc,
      builder: (context, state) {
        return const SizedBox();
      }, 
      listener: (context, state) {
        if(state is SuccessRegisState){
          Fluttertoast.showToast(
            msg: "Selamat, pendaftaran berhasil.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ListColor().baseColor,
            textColor: Colors.white,
            fontSize: 16.0
        );
        }
      }
    );
  }

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
    );
    if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        setState(() {
          imageController.text = imageFile.path;
        });
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            margin: EdgeInsets.only(right: 16, left: 16),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/png/growell_image.png",
                        width: MediaQuery.of(context).size.width * 0.6,
                      )
                    ),
                    SizedBox(height: 50,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Lengkap",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11
                          ),
                        ),
                        TextFormFieldWidget(
                          hintText: "Nama Lengkap",
                          controller: fullnameController,
                        ),
                      ],
                    ),

                    SizedBox(height: 32,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kategori",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: DropdownButton(
                            isExpanded: true,
                            items: items.map<DropdownMenuItem<String>>((dynamic data){
                              return DropdownMenuItem<String>(
                                value: data['id'],
                                child: Text(data['text'])
                              );
                            }).toList(), 
                            onChanged: (value){
                              setState(() {
                                idKategori = value.toString();
                              });
                            },
                            value: idKategori,
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 32,),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "E-Mail",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11
                          ),
                        ),
                        TextFormFieldWidget(
                          hintText: "E-Mail",
                          controller: emailController,
                        ),
                      ],
                    ),
                    SizedBox(height: 32,),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11
                          ),
                        ),
                        TextFormFieldWidget(
                          hintText: "Username",
                          controller: usernameController,
                        ),
                      ],
                    ),
                    SizedBox(height: 32,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11
                          ),
                        ),
                        TextFormFieldWidget(
                          hintText: "Password",
                          textInputType: TextInputType.visiblePassword,
                          obscureText: true,
                          controller: passwordController,
                        ),
                      ],
                    ),
                    SizedBox(height: 32,),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "No Handphone",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11
                          ),
                        ),
                        TextFormFieldWidget(
                          hintText: "No Handphone",
                          controller: noHpController,
                        ),
                      ],
                    ),
                    SizedBox(height: 32,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Foto " + (idKategori == "2" ? "Anda" : "Toko"),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            _getFromCamera();
                          },
                          child: TextFormFieldWidget(
                            hintText: "Foto " + (idKategori == "2" ? "Anda" : "Toko"),
                            controller: imageController,
                            enabled: false,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 32,),

                    idKategori == "2" ?
                    const SizedBox()
                    :
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nama Toko",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11
                              ),
                            ),
                            TextFormFieldWidget(
                              hintText: "Nama Toko",
                              controller: namaTokoController,
                            ),
                          ],
                        ),
                        SizedBox(height: 32,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Alamat Toko",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11
                              ),
                            ),
                            TextFormFieldWidget(
                              hintText: "Alamat Toko",
                              controller: alamatTokoController,
                            ),
                          ],
                        ),
                        SizedBox(height: 32,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Deskripsi Toko",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11
                              ),
                            ),
                            TextFormFieldWidget(
                              hintText: "Deskripsi Toko",
                              controller: deskripsiTokoController,
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 32,),

                    listener(),

                    ButtonBaseCustom(
                      text: "Daftar",
                      function: (){
                        if(_formKey.currentState!.validate()){
                          regisBloc!.add(
                            DaftarEvent(
                              entity: AddUserDTO(
                                idUser: Uuid().v4(),
                                fullname: fullnameController.text,
                                userKategori: int.parse(idKategori),
                                email: emailController.text,
                                username: usernameController.text,
                                password: passwordController.text,
                                noTelp: noHpController.text,
                                namaToko: namaTokoController.text,
                                alamatToko: alamatTokoController.text,
                                descToko: deskripsiTokoController.text,
                                path: imageController.text
                              )
                            )
                          );
                        }
                      }
                    ),
                    
                    SizedBox(height: 32,),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Belum punya akun ? "
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                            color: ListColor().baseColor
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
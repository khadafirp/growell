import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:growell/color/list_color.dart';
import 'package:growell/widget/button/button_base_custom.dart';
import 'package:growell/widget/input/text_form_field_widget.dart';

class RegisPage extends StatefulWidget {
  RegisPage({Key? key}) : super(key: key);

  @override
  _RegisPageState createState() => _RegisPageState();
}

class _RegisPageState extends State<RegisPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

  login(){
    print("tes");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            margin: EdgeInsets.only(right: 16, left: 16),
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
                      controller: usernameController,
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

                        },
                        value: items[0]['id'],
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

                ButtonBaseCustom(
                  text: "Masuk",
                  function: (){
                    login();
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
    );
  }
}
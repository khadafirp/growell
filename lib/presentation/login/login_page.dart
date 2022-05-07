import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/color/list_color.dart';
import 'package:growell/widget/button/button_base_custom.dart';
import 'package:growell/widget/input/text_form_field_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(){
    Navigator.of(context).pushNamedAndRemoveUntil(RoutesName.landingPage, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
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
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed(RoutesName.regisPage);
                      },
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                          color: ListColor().baseColor
                        ),
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
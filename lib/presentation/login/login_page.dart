import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:growell/base/routes_name.dart';
import 'package:growell/color/list_color.dart';
import 'package:growell/data/parameters/login_dto.dart';
import 'package:growell/presentation/login/bloc/login_bloc.dart';
import 'package:growell/presentation/login/bloc/login_event.dart';
import 'package:growell/presentation/login/bloc/login_state.dart';
import 'package:growell/utils/preference.dart';
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
  final _formKey = GlobalKey<FormState>();
  LoginBloc? loginBloc;

  login(){
    loginBloc!.add(
      MasukEvent(
        params: LoginDTO(
          username: usernameController.text,
          password: passwordController.text
        )
      )
    );
  }

  Widget listener(){
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: loginBloc,
      builder: (context, state){
        return const SizedBox();
      }, 
      listener: (context, state) async {
        if(state is SuccessLoginState){
          Fluttertoast.showToast(
            msg: "Selamat, login berhasil.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ListColor().baseColor,
            textColor: Colors.white,
            fontSize: 16.0
          );
          await Preference().setValue("username", state.data!.username);
          await Preference().setValue("password", state.data!.password);
          await Preference().setValue("id_user", state.data!.idUser);
          await Preference().setValue("id_kategori", state.data!.userKategori.toString());
          Future.delayed(const Duration(seconds: 2), (){
            Navigator.of(context).pushNamedAndRemoveUntil(RoutesName.landingPage, (route) => false, arguments: state.data!);
          });
        }
      }
    );
  }

  loginValidation() async {
    var username = await Preference().getStringValue("username");
    var password = await Preference().getStringValue("password");

    if(username.isNotEmpty){
      loginBloc!.add(
        MasukEvent(
          params: LoginDTO(
            username: username,
            password: password
          )
        )
      );
    }
  }

  @override
  void initState() { 
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
    loginValidation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            margin: EdgeInsets.only(right: 16, left: 16),
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

                  listener(),
                  ButtonBaseCustom(
                    text: "Masuk",
                    function: (){
                      if(_formKey.currentState!.validate()){
                        login();
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
      ),
    );
  }
}
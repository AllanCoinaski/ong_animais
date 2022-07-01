import 'package:flutter/material.dart';
import 'package:ong_animais/core/services/login_service.dart';
import 'package:ong_animais/routes/routes_model.dart';
import 'package:ong_animais/shared/utils/colors.dart';
import 'package:ong_animais/shared/utils/fonts.dart';
import 'package:ong_animais/shared/widgets/loading.dart';
import 'package:ong_animais/shared/widgets/text_field.dart';

///Tela de login do usuário.
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  var isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/images/background.jpeg"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding:
              EdgeInsets.fromLTRB(width * 0.1, height * 0.3, width * 0.1, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  AppTextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      fillColor: ColorsModel.white.withOpacity(0.6),
                      textColor: ColorsModel.black,
                      border: true,
                      borderColor: ColorsModel.grey,
                      label: "E-mail",
                      onChanged: (text) {
                        text = text;
                      }),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: !isLoading
                      ? GestureDetector(
                          child: SizedBox(
                            height: height * 0.1,
                            child: Stack(
                              children: [
                                Container(
                                  height: height * 0.088,
                                  width: width * 0.486,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: ColorsModel.grey),
                                      color: ColorsModel.blue,
                                      borderRadius: BorderRadius.circular(25)),
                                ),
                                Container(
                                  height: height * 0.080,
                                  width: width * 0.486,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ColorsModel.grey,
                                      ),
                                      color: ColorsModel.pink,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Center(
                                    child: Text('Entrar',
                                        style: FontsModel.defaultFont.copyWith(
                                            fontSize: height * 0.025)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () async {
                            if (emailController.text == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: ColorsModel.red,
                                      content: Text("Preencha seu e-mail.",
                                          textAlign: TextAlign.center,
                                          style: FontsModel.defaultFont
                                              .copyWith(
                                                  fontSize: height * 0.02,
                                                  color: ColorsModel.white))));
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              dynamic result = await LoginService()
                                  .authenticate(emailController.text);
                              if (result == false) {
                                setState(() {
                                  isLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    backgroundColor: ColorsModel.red,
                                    content: Text(
                                        "Credenciais inválidas, tente novamente ou entre em contato conosco.",
                                        textAlign: TextAlign.center,
                                        style: FontsModel.defaultFont.copyWith(
                                            color: ColorsModel.white,
                                            fontSize: height * 0.02))));
                              } else {
                                setState(() {
                                  emailController.text = '';
                                  isLoading = false;
                                });
                                navKey.currentState?.pushNamed(Routes.home);
                              }
                            }
                          },
                        )
                      : const LoadingWidget(
                          color: ColorsModel.pink,
                        ))
            ],
          ),
        ));
  }
}

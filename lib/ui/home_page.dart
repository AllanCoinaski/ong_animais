import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ong_animais/routes/routes_model.dart';
import 'package:ong_animais/shared/utils/colors.dart';
import 'package:ong_animais/shared/utils/fonts.dart';

///Tela principal.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
    return Stack(
      children: [
        Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/images/background.jpeg"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: height * 0.75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(height * 0.08),
                          topRight: Radius.circular(height * 0.08)),
                      color: ColorsModel.white.withOpacity(0.7)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        width * 0.1, height * 0.03, width * 0.1, 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Qual pet gostaria de adotar?",
                              style: FontsModel.defaultFont
                                  .copyWith(fontSize: width * 0.06),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            navKey.currentState
                                ?.pushNamed(Routes.adoption, arguments: 'cats');
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: height * 0.03),
                            child: SvgPicture.asset(
                                'lib/assets/images/cat_icon.svg',
                                height: height * 0.23),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            navKey.currentState
                                ?.pushNamed(Routes.adoption, arguments: 'dogs');
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: height * 0.03),
                            child: SvgPicture.asset(
                                'lib/assets/images/dog_icon.svg',
                                height: height * 0.23),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}

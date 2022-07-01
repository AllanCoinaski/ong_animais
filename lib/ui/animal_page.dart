import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ong_animais/shared/utils/colors.dart';
import 'package:ong_animais/shared/utils/fonts.dart';

///Tela de detalhes do animal.
class AnimalPage extends StatefulWidget {
  final List animal;
  const AnimalPage({Key? key, required this.animal}) : super(key: key);
  @override
  _AnimalPageState createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  //List breeds = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorsModel.white,
          elevation: 0,
          foregroundColor: ColorsModel.black),
      body: _buildBody(context),
      backgroundColor: ColorsModel.white,
    );
  }

  _buildBody(context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            right: width * 0.05,
            top: width * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(bottom: height * 0.025),
                child: Text(
                  "Detalhes do pet",
                  style: FontsModel.defaultFont.copyWith(fontSize: height * 0.03),
                ),
              ),
              widget.animal.isNotEmpty
                  ? Expanded(
                      child: ListView(
                        children: [
                          SizedBox(
                            height: height * 0.40,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              child: CachedNetworkImage(
                                imageUrl: widget.animal[0].url.toString(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.02),
                            child: Text(
                              "Raça: ${widget.animal[0].breeds[0].name}",
                              style: FontsModel.defaultFont.copyWith(fontSize: height * 0.025),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.02),
                            child: Text(
                              "Largura: ${widget.animal[0].breeds![0].weight!.metric} cm",
                              style: FontsModel.defaultFont.copyWith(fontSize: height * 0.025),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.03),
                            child: Center(
                              child: SizedBox(
                                height: height * 0.1,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: height * 0.088,
                                      width: width,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ColorsModel.grey,
                                          ),
                                          color: ColorsModel.blue,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                    Container(
                                      height: height * 0.080,
                                      width: width,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ColorsModel.grey,
                                          ),
                                          color: ColorsModel.pink,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Center(
                                        child: Text('Quero adotar',
                                            style: FontsModel.defaultFont.copyWith(fontSize: height * 0.025)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: SizedBox(
                        child: Center(
                          child: Text(
                            "Opss, parece que o pet não possui detalhes.",
                            textAlign: TextAlign.center,
                            style: FontsModel.defaultFont.copyWith(fontSize: height * 0.025),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        )
      ],
    );
  }
}

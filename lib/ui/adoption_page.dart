import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ong_animais/core/models/cats_model.dart';
import 'package:ong_animais/core/models/dogs_model.dart';
import 'package:ong_animais/core/repositories/cats_repository.dart';
import 'package:ong_animais/core/repositories/dogs_repository.dart';
import 'package:ong_animais/routes/routes_model.dart';
import 'package:ong_animais/shared/utils/colors.dart';
import 'package:ong_animais/shared/utils/fonts.dart';
import 'package:ong_animais/shared/widgets/loading.dart';

///Tela de adoção.
class AdoptionPage extends StatefulWidget {
  String type;
  AdoptionPage({Key? key, this.type = ""}) : super(key: key);
  @override
  AdoptionPageState createState() => AdoptionPageState();
}

class AdoptionPageState extends State<AdoptionPage> {
  List<CatsModel> cats = [];
  List<DogsModel> dogs = [];
  dynamic pets = [];
  final CatsRepository _catsRepository = CatsRepository();
  final DogsRepository _dogsRepository = DogsRepository();
  final controller = ScrollController();
  static const limit = 10;
  int page = 0;
  bool hasMore = true;
  bool isLoading = true;
  bool isDispose = false;
  late Color colorActive;
  @override
  void initState() {
    super.initState();
    fetch(widget.type);
    controller.addListener(() {
      //print(controller.position.maxScrollExtent);
      //print(controller.offset);
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch(widget.type);
      }
    });
  }

  fetch(type, {refresh = false}) async {
    if (refresh == true) {
      setState(() {
        isLoading = true;
        hasMore = true;
        page = 0;
        cats.clear();
        dogs.clear();
        pets.clear();
      });
    }
    var data;
    if (type == 'cats') {
      colorActive = ColorsModel.pink;
      data = await _catsRepository.fetchCats(limit, page);
      if (data != []) {
        setState(() {
          cats.addAll(data);
          pets = cats;
        });
      }
    } else {
      colorActive = ColorsModel.blue;
      data = await _dogsRepository.fetchDogs(limit, page);
      if (data != []) {
        setState(() {
          dogs.addAll(data);
          pets = dogs;
        });
      }
    }
    setState(() {
      if (data.length < limit) {
        hasMore = false;
      }
      isLoading = false;
      page++;
    });
  }

  @override
  void dispose() {
    isDispose = true;
    controller.dispose();
    super.dispose();
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
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorsModel.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: ColorsModel.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  height: height * 0.90,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.02),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: height * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      fetch('cats', refresh: true);
                                      setState(() {
                                        widget.type = 'cats';
                                      });
                                    },
                                    child: SvgPicture.asset(
                                      'lib/assets/images/cat_icon.svg',
                                      height: height * 0.08,
                                      color: ColorsModel.pink,
                                    ),
                                  ),
                                  widget.type == 'cats'
                                      ? Container(
                                          width: width * 0.10,
                                          height: 3,
                                          color: ColorsModel.pink,
                                        )
                                      : const SizedBox()
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      fetch('dogs', refresh: true);
                                      setState(() {
                                        widget.type = 'dogs';
                                      });
                                    },
                                    child: SvgPicture.asset(
                                      'lib/assets/images/dog_icon.svg',
                                      height: height * 0.08,
                                      color: ColorsModel.blue,
                                    ),
                                  ),
                                  widget.type == 'dogs'
                                      ? Container(
                                          width: width * 0.10,
                                          height: 3,
                                          color: ColorsModel.blue,
                                        )
                                      : const SizedBox()
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: CustomScrollView(
                          controller: controller,
                          shrinkWrap: true,
                          slivers: <Widget>[
                            SliverGrid(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: width * 0.5,
                                  childAspectRatio: 1,
                                ),
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    if (index < pets.length) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          border: index % 2 == 0
                                              ? Border(
                                                  right: BorderSide(
                                                      width: 0.5,
                                                      color: colorActive),
                                                  bottom: BorderSide(
                                                      width: 0.5,
                                                      color: colorActive))
                                              : Border(
                                                  left: BorderSide(
                                                      width: 0.5,
                                                      color: colorActive),
                                                  bottom: BorderSide(
                                                      width: 0.5,
                                                      color: colorActive)),
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: AspectRatio(
                                                aspectRatio: 1,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60.0),
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl: pets[index]
                                                          .url
                                                          .toString(),
                                                      progressIndicatorBuilder:
                                                          (_, url, download) {
                                                        if (download.progress !=
                                                            null) {
                                                          final progress = (download
                                                                      .progress! *
                                                                  100)
                                                              .toStringAsPrecision(
                                                                  3)
                                                              .replaceAll(
                                                                  ".", ",");
                                                          return Center(
                                                              child: Text(
                                                            "$progress%",
                                                            style: FontsModel
                                                                .defaultFont.copyWith(fontSize: height * 0.025),
                                                          ));
                                                        }
                                                        return const SizedBox();
                                                      },
                                                    )),
                                              ),
                                            )),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5, bottom: 5),
                                              child: GestureDetector(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: ColorsModel.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                  width: width * 0.3,
                                                  height: height * 0.03,
                                                  alignment: Alignment.center,
                                                  child: Text('Saiba mais',
                                                      style: FontsModel
                                                          .defaultFont
                                                          .copyWith(
                                                              color: ColorsModel
                                                                  .black, fontSize:height * 0.025 )),
                                                ),
                                                onTap: () {
                                                  navKey.currentState
                                                      ?.pushNamed(Routes.animal,
                                                          arguments:
                                                              pets[index]);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                    return null;
                                  },
                                  childCount: pets.length + 1,
                                )),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(
                                          top:
                                              50), //alterar por metade do tamanho da box
                                      child: isLoading
                                          ? Center(
                                              child: hasMore
                                                  ? LoadingWidget(
                                                      color: colorActive,
                                                    )
                                                  : Text("Não há mais itens.",
                                                      style: FontsModel
                                                          .defaultFont
                                                          .copyWith(
                                                              color: ColorsModel
                                                                  .grey,fontSize: height * 0.025)),
                                            )
                                          : Center(
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                  "Arraste para baixo para buscar outros pets.",
                                                  style: FontsModel.defaultFont
                                                      .copyWith(
                                                          color: ColorsModel
                                                              .grey,fontSize: height * 0.025)),
                                            ));
                                },
                                childCount: 1,
                              ),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ))
      ],
    );
  }
}

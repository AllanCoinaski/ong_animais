import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ong_animais/shared/utils/colors.dart';

///Classe para definir a fonte utilizada no projeto.
///
///Para realizar uma alteração no padrão(fontSize, color e fontWeight), basta usar o copyWith após chamar a classe com a fonte desejeda.
///
///Utilizado plugin GoogleFonts pela facilidade.
class FontsModel {
  static TextStyle defaultFont = GoogleFonts.ubuntu(
    fontSize: 16,
    color: ColorsModel.black,
    fontWeight: FontWeight.w500,
  );
}

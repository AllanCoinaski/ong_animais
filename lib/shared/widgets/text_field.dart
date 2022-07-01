import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ong_animais/shared/utils/colors.dart';

///Widget padrão para inputs
class AppTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String initialValue;
  final bool password;
  final controller;
  final Color textColor;
  final Function(String value) onChanged;
  final TextInputType keyboardType;
  final bool readOnly;
  final Color fillColor;
  final bool border;
  final Color borderColor;
  AppTextField(
      {this.initialValue = '',
      this.controller,
      this.label = '',
      this.textColor = ColorsModel.black,
      this.hint = '',
      required this.keyboardType,
      this.password = false,
      this.readOnly = false,
      this.fillColor = ColorsModel.white,
      this.border = false,
      this.borderColor = ColorsModel.pink,
      //required this.maskFormatter,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return TextFormField(
      //inputFormatters: [maskFormatter],
      readOnly: readOnly,
      initialValue: initialValue != '' ? initialValue : null,
      controller: initialValue != '' ? null : controller,
      onChanged: onChanged,
      cursorColor: ColorsModel.grey,
      obscureText: password,
      keyboardType: keyboardType,
      style: TextStyle(
          color: ColorsModel.black,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          fillColor: fillColor,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: borderColor, width: 2.5)),
          //contentPadding:const EdgeInsets.only(top: 14, right: 20, left: 20, bottom: 14),
          labelText: label,
          labelStyle: TextStyle(
            color: textColor,
            fontSize: height * 0.018,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: textColor,
            fontSize: height * 0.018,
          ),
          enabledBorder: !border
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: borderColor, width: 1)),
          errorStyle: const TextStyle(fontSize: 14)),
    );
  }
}

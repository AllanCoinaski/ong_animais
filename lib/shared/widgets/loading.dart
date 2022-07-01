import 'package:flutter/material.dart';
import 'package:ong_animais/shared/utils/colors.dart';

///Widget de Loading
class LoadingWidget extends StatelessWidget {
  final Color color;
   const LoadingWidget({Key? key, 
    this.color = ColorsModel.blue
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
    );
  }
}
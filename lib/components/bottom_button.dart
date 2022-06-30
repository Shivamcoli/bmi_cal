import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({  required this.buttontitle,required this.onTap });
  final VoidCallback? onTap;
  final String buttontitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(buttontitle ,style: kLargeButtonStyle,),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width:double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
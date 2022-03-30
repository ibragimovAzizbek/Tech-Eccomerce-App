import 'package:flutter/material.dart';
import 'package:onlineshop/core/constants/color_const.dart';
import 'package:onlineshop/size_config.dart';

class ElevatedButtonWidget extends StatelessWidget {
  String text;
  Color color;
  String path;

  ElevatedButtonWidget(
      {Key? key, required this.text, required this.color, required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          color: color == ColorConst.kPrimaryColor
              ? ColorConst.kWhiteColor
              : ColorConst.kPrimaryColor,
          fontSize: getWidth(20),
        ),
      ),
      style: ElevatedButton.styleFrom(
          fixedSize: Size(
            getWidth(290.0),
            MediaQuery.of(context).size.height * 0.09,
          ),
          primary: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(context, path, (route) => false);
      },
    );
  }
}

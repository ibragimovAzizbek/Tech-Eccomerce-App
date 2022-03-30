import 'package:flutter/material.dart';
import 'package:onlineshop/core/constants/color_const.dart';
import 'package:onlineshop/core/widgets/elevated_button.dart';
import 'package:onlineshop/size_config.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConst.backGroundColorSplash,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Find your Gadget",
                style: TextStyle(
                    fontSize: getWidth(65.0),
                    fontWeight: FontWeight.bold,
                    color: ColorConst.kWhiteColor),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: getHeight(486),
              width: getWidth(486),
              child: Image.asset('assets/images/1.png'),
            ),
            SizedBox(height: getHeight(20)),
            Center(
              child: ElevatedButtonWidget(
                text: "Get started",
                color: ColorConst.kWhiteColor,
                path: '/login',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

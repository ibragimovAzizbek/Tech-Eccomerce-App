import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop/core/constants/color_const.dart';
import 'package:onlineshop/providers/catigory_provider.dart';
import 'package:onlineshop/size_config.dart';
import 'package:onlineshop/views/info/info_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  int productIndex;
  CartPage({Key? key, required this.productIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConst.backGroundColorHome,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: SvgPicture.asset('assets/icons/ArrowLeft.svg'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Text(
                  "Basket",
                  style: TextStyle(
                    color: ColorConst.kBlack,
                    fontSize: getWidth(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                IconButton(
                  icon: SvgPicture.asset('assets/icons/Delete.svg'),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            remember(),
            Container(
              width: getWidth(314),
              height: getHeight(140),
              decoration: BoxDecoration(
                  color: ColorConst.kWhiteColor,
                  borderRadius: BorderRadius.circular(getWidth(10))),
              child: ListTile(
                leading: Image.network(InfoPage.box!.get(key)!.img.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container remember() {
    print("PATH::: "+InfoPage.box!.get(key)!.img.toString());
    return Container(
      height: getHeight(50),
      width: getWidth(256),
      decoration: BoxDecoration(
        color: ColorConst.rememberColor,
        borderRadius: BorderRadius.circular(
          getWidth(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset('assets/icons/Notification.svg'),
          Text(
            "Delivery for FREE until the end of the month",
            style: TextStyle(
                color: ColorConst.kBlack,
                fontSize: getWidth(10),
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

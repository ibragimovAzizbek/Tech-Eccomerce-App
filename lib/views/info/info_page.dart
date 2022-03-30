import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onlineshop/core/constants/color_const.dart';
import 'package:onlineshop/data/mock_data.dart';
import 'package:onlineshop/models/products_model.dart';
import 'package:onlineshop/providers/catigory_provider.dart';
import 'package:onlineshop/providers/color_provider.dart';
import 'package:onlineshop/size_config.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatelessWidget {
  int productIndex;
  InfoPage({Key? key, required this.productIndex}) : super(key: key);

  static List<List<ModelProducts>> datas = [
    MockData.wearabledata,
    MockData.laptopdata,
    MockData.phonedata,
    MockData.drondata
  ];

  List<String> colorName = ['Sky Blue', 'Rose Gold', 'Green'];

  static Box<ModelProducts>? box;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConst.backGroundColorHome,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: SvgPicture.asset('assets/icons/ArrowLeft.svg'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.6),
                IconButton(
                  icon: SvgPicture.asset('assets/icons/Like.svg'),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              width: getWidth(236.05),
              height: getHeight(291.74),
              child: Image.network(
                datas[context.watch<CatigoryProvider>().catigoryIndex]
                        [productIndex]
                    .img
                    .toString(),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.52,
              decoration: BoxDecoration(
                color: ColorConst.kWhiteColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    datas[context.watch<CatigoryProvider>().catigoryIndex]
                            [productIndex]
                        .name
                        .toString(),
                    style: TextStyle(
                      color: ColorConst.kBlack,
                      fontSize: getWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.7),
                    child: Text(
                      "Colors",
                      style: TextStyle(
                        color: ColorConst.kBlack,
                        fontSize: getWidth(18),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.03),
                  // ? COLOR CHOICE BUTTON
                  colorChoiceButton(context),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  // ? PRODUCT DESCRIPTION
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.08),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          datas[context.watch<CatigoryProvider>().catigoryIndex]
                                  [productIndex]
                              .description
                              .toString(),
                          style: TextStyle(
                            color: ColorConst.kBlack,
                            fontSize: getWidth(17),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: getWidth(10)),
                        Text(
                          datas[context.watch<CatigoryProvider>().catigoryIndex]
                                  [productIndex]
                              .description2
                              .toString(),
                        ),
                      ],
                    ),
                  ),
                  // ? FullDescriptionButton
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: Row(
                      children: [
                        TextButton(
                          child: Text(
                            'Full description',
                            style: TextStyle(
                              color: ColorConst.kPrimaryColor,
                              fontSize: getWidth(15),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            // ! OnPressed full description
                          },
                        ),
                        SvgPicture.asset('assets/icons/right.svg')
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Total", style: TextStyle(fontSize: getWidth(18))),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                      Text(
                        '\$ ' +
                            datas[context
                                    .watch<CatigoryProvider>()
                                    .catigoryIndex][productIndex]
                                .price
                                .toString(),
                        style: TextStyle(
                          color: ColorConst.kPrimaryColor,
                          fontSize: getWidth(22),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ElevatedButton(
                    child: Text(
                      "Add to basket",
                      style: TextStyle(
                        color: ColorConst.kWhiteColor,
                        fontSize: getWidth(20),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: ColorConst.kPrimaryColor,
                      fixedSize: Size(
                        getWidth(300),
                        getHeight(70),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      hiveOpen(context, 0);
                      Navigator.pushNamed(context, '/basket', arguments: productIndex);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void hiveOpen(BuildContext context, int index) async {
    box = await Hive.openBox<ModelProducts>('basket');
    box!.add(
        datas[context.watch<CatigoryProvider>().catigoryIndex][productIndex]);
  }

  Padding colorChoiceButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
      child: SizedBox(
        height: getHeight(50),
        width: getWidth(
          MediaQuery.of(context).size.width,
        ),
        child: ListView.builder(
          itemCount: colorName.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, __) => choiseColorProduct(__, context),
        ),
      ),
    );
  }

  InkWell choiseColorProduct(int __, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: getWidth(10)),
        height: getHeight(20),
        width: getWidth(104),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: context.watch<ColorProductProvider>().colorController == __
                ? ColorConst.darkSecondary
                : ColorConst.disabledProductColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: getWidth(8),
              backgroundColor: ColorConst.colors[__],
            ),
            Text(
              colorName[__],
              style: TextStyle(
                color: ColorConst.kBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        context.read<ColorProductProvider>().colorProductProvider(__);
      },
    );
  }
}

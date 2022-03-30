import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop/core/constants/color_const.dart';
import 'package:onlineshop/data/mock_data.dart';
import 'package:onlineshop/models/products_model.dart';
import 'package:onlineshop/providers/catigory_provider.dart';
import 'package:onlineshop/size_config.dart';
import 'package:onlineshop/views/home/home_sceens.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

TabController? tabController;

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  List<List<ModelProducts>> datas = [
    MockData.wearabledata,
    MockData.laptopdata,
    MockData.phonedata,
    MockData.drondata
  ];

  List<String> catigoryName = ['Wearable', 'Laptops', 'Phones', 'Drones'];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: SvgPicture.asset('assets/icons/Vector.svg'),
              onPressed: () {
                HomeScreen.scaffoldKey.currentState!.openDrawer();
              },
            ),
            SizedBox(
              width: getWidth(260),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(getWidth(16)),
                    child: SvgPicture.asset('assets/icons/Search.svg'),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      getWidth(30),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: getWidth(60), top: getHeight(20)),
          child: Text(
            "Order online\ncollect in store",
            style: TextStyle(
              color: ColorConst.kBlack,
              fontWeight: FontWeight.bold,
              fontSize: getWidth(40),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        // ? Catigory
        catigoryNames(context),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (_, __) => products(
              context,
              context.watch<CatigoryProvider>().catigoryIndex,
              __,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.65,
              top: MediaQuery.of(context).size.height * 0.01),
          child: TextButton(
            child: Row(
              children: [
                Text(
                  'see more  ',
                  style: TextStyle(
                      color: ColorConst.kPrimaryColor, fontSize: getWidth(16)),
                ),
                SvgPicture.asset('assets/icons/right.svg'),
              ],
            ),
            onPressed: () {
              // ? oNPRESSED
            },
          ),
        ),
      ],
    );
  }

  // ! METHODS |

  Padding catigoryNames(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getWidth(20)),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: catigoryName.length,
          itemBuilder: (_, __) => TextButton(
            child: Column(
              children: [
                textCatigory(catigoryName[__], __),
                SizedBox(
                  width: getWidth(70),
                  child: context.watch<CatigoryProvider>().catigoryIndex == __
                      ? Divider(
                          thickness: 2,
                          color: ColorConst.kPrimaryColor,
                        )
                      : const SizedBox(),
                ),
              ],
            ),
            onPressed: () {
              context.read<CatigoryProvider>().catigoryProvider(__);
            },
          ),
        ),
      ),
    );
  }

  Text textCatigory(String text, index) {
    return Text(
      text,
      style: TextStyle(
        fontSize: getWidth(15),
        fontWeight: FontWeight.bold,
        color: context.watch<CatigoryProvider>().catigoryIndex == index
            ? ColorConst.kPrimaryColor
            : ColorConst.nameDisabledColor,
      ),
    );
  }

  InkWell products(BuildContext context, int controllerData, int index) {
    return InkWell(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, top: 60),
            height: 270,
            width: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Text(
                  datas[controllerData][index].name.toString(),
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                Text(
                  datas[controllerData][index].description.toString(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: ColorConst.darkSecondary,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Text(
                  "\$ " + datas[controllerData][index].price.toString(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: ColorConst.kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 45,
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                datas[controllerData][index].img.toString(),
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, '/info', arguments: index);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop/core/constants/color_const.dart';
import 'package:onlineshop/providers/bottom_bar_provider.dart';
import 'package:onlineshop/size_config.dart';
import 'package:onlineshop/views/home/bodys/account_page.dart';
import 'package:onlineshop/views/home/bodys/cart.dart';
import 'package:onlineshop/views/home/bodys/favorite_page.dart';
import 'package:onlineshop/views/home/bodys/home_page.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<String> paths = [
    'assets/icons/person.svg',
    'assets/icons/Buy.svg',
    'assets/icons/Heart.svg',
    'assets/icons/Bag.svg',
    'assets/icons/Setting.svg'
  ];

  List<String> names = [
    'Profile',
    'My orders',
    'Favorites',
    'Delivery',
    'Settings'
  ];

  List bodys = [HomePage(), FavoritePage(), AccountPage(), CartPage()];

  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorConst.backGroundColorHome,
      drawer: drawer(context),
      body: SingleChildScrollView(
        child: SafeArea(
          child: bodys[context.watch<BottomBarProvider>().bottomIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: context.watch<BottomBarProvider>().bottomIndex,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset('assets/icons/Home.svg'),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset('assets/icons/Like.svg'),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset('assets/icons/account.svg'),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: ColorConst.kBlack54,
            ),
          ),
        ],
        onTap: (pageIndex) {
          context.read<BottomBarProvider>().bottomBarProvider(pageIndex);
        },
      ),
    );
  }

  SafeArea drawer(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: ColorConst.kPrimaryColor,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Positioned(
                  top: -55,
                  left: getWidth(150),
                  child: CircleAvatar(
                    radius: getWidth(60),
                    backgroundColor: ColorConst.drawerCircleColor,
                  ),
                ),
                Positioned(
                  right: 20,
                  top: getHeight(90),
                  child: SvgPicture.asset('assets/icons/small_ellipse.svg'),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                itemCount: paths.length,
                itemBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      InkWell(
                        child: Row(
                          children: [
                            SizedBox(
                              height: getWidth(24),
                              width: getWidth(24),
                              child: SvgPicture.asset(
                                paths[__],
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.05),
                            Text(
                              names[__],
                              style: TextStyle(
                                  color: ColorConst.kWhiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getWidth(17)),
                            )
                          ],
                        ),
                        onTap: () {
                          // TODO ONTAP catigory
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      __ != 4
                          ? Divider(
                              indent: getWidth(45),
                              color: ColorConst.kWhiteColor,
                              endIndent: getWidth(20),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  height: getHeight(100),
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                    top: getHeight(10),
                    right: getWidth(40),
                    child: SvgPicture.asset('assets/icons/small_ellipse.svg')),
                Positioned(
                  top: getHeight(20),
                  right: getWidth(160),
                  child: CircleAvatar(
                    radius: 37,
                    backgroundColor: ColorConst.drawerCircleColor,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.06,
                  top: getHeight(10)),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/Logout.svg'),
                  SizedBox(width: getWidth(10)),
                  TextButton(
                    child: Text(
                      "Sign out",
                      style: TextStyle(
                          color: ColorConst.kWhiteColor,
                          fontSize: getWidth(17),
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
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
}

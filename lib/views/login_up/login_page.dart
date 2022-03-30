import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop/core/constants/color_const.dart';
import 'package:onlineshop/core/widgets/elevated_button.dart';
import 'package:onlineshop/providers/show_pssword_provider.dart';
import 'package:onlineshop/size_config.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController psswdController = TextEditingController();

  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConst.kPrimaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: getHeight(99), left: getWidth(20.0)),
                    child: SizedBox(
                      height: getHeight(210),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Welcome back",
                        style: TextStyle(
                          color: ColorConst.kWhiteColor,
                          fontSize: getWidth(65),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: getHeight(26),
                    left: getWidth(69),
                    child: SvgPicture.asset('assets/icons/small_ellipse.svg'),
                  ),
                  Positioned(
                    top: getHeight(245),
                    right: getWidth(50),
                    child: SvgPicture.asset('assets/icons/ellipse.svg'),
                  ),
                  Positioned(
                    top: getHeight(-55),
                    left: getWidth(240),
                    child: CircleAvatar(
                      radius: getWidth(62.5),
                      backgroundColor: ColorConst.kCircleColor,
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: getHeight(476),
                decoration: BoxDecoration(
                  color: ColorConst.kWhiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.71,
                          top: getHeight(30),
                          bottom: getHeight(20),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: ColorConst.kBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: getWidth(18)),
                        ),
                      ),
                      inputForm(context),
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.5),
                        child: TextButton(
                          child: Text(
                            "Forgot passcode?",
                            style: TextStyle(
                              color: ColorConst.kPrimaryColor,
                              fontSize: getWidth(15),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      button(context),
                      TextButton(
                        child: Text(
                          "Create account",
                          style: TextStyle(
                            fontSize: getWidth(17),
                            color: ColorConst.kPrimaryColor,
                          ),
                        ),
                        onPressed: () {
                          // TODO onPressed Login
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton button(context) => ElevatedButton(
        child: Text(
          'Login',
          style: TextStyle(
            color: ColorConst.kWhiteColor,
            fontSize: getWidth(20),
          ),
        ),
        style: ElevatedButton.styleFrom(
            fixedSize: Size(
              getWidth(290.0),
              MediaQuery.of(context).size.height * 0.09,
            ),
            primary: ColorConst.kPrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
      );

  Form inputForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          iconTextinput(img: 'assets/icons/Message.svg', text: "Email"),
          SizedBox(
            width: getWidth(314),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              keyboardAppearance: Brightness.dark,
              decoration: const InputDecoration(hintText: "rosina@company.com"),
              validator: (email) {
                if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(email!)) {
                  return "Email kiriting";
                }
              },
            ),
          ),
          SizedBox(
            height: getHeight(50),
          ),
          iconTextinput(img: 'assets/icons/Lock.svg', text: "Password"),
          passwordInput(context),
        ],
      ),
    );
  }

  SizedBox passwordInput(BuildContext context) {
    return SizedBox(
      width: getWidth(314),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        controller: psswdController,
        obscureText: context.watch<ShowPsswdProvider>().isHiddin,
        decoration: InputDecoration(
          hintText: "****************",
          suffixIcon: TextButton(
            child: Text(
              context.watch<ShowPsswdProvider>().isHiddin == true
                  ? "Show"
                  : "Hiddin",
              style: TextStyle(
                  color: ColorConst.kPrimaryColor, fontSize: getWidth(15)),
            ),
            onPressed: () {
              context.read<ShowPsswdProvider>().showPsswd();
            },
          ),
        ),
        validator: (psswd) {
          if (psswd!.length < 6) {
            return "Password 6 ta belgidan kam bo'lmasin";
          }
        },
      ),
    );
  }

  Padding iconTextinput({required String img, required String text}) {
    return Padding(
      padding: EdgeInsets.only(left: getWidth(29)),
      child: Row(
        children: [
          SvgPicture.asset(img),
          SizedBox(width: getWidth(7)),
          Text(
            text,
            style: TextStyle(
                color: ColorConst.darkSecondary, fontSize: getWidth(16)),
          )
        ],
      ),
    );
  }
}

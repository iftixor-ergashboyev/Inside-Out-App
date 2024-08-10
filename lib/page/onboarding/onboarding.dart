import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:inside_out/consts/my_button.dart';
import 'package:inside_out/page/main_pages/main_page.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemPurple,
      body: Padding(
        padding: EdgeInsets.all(14.0),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 26),
                child: Image.asset('assets/icon/access_icon.png', width: 120, height: 80,),
              ),
              Gap(30),
              Image.asset('assets/images/onboarding_image.png', width: 700,),
              Gap(5),
              Text("Welcome", style: TextStyle(
                fontFamily: 'Inside Out', fontWeight: FontWeight.bold, color: CupertinoColors.white, fontSize: 50
              )),
              Text("Are you ready for a new emotional journey? Start making the world more colorful with our Inside Out Wallpaper App!", textAlign: TextAlign.center, style: TextStyle(
                  fontFamily: 'Inside Out', color: CupertinoColors.white, fontSize: 20
              )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyButton(
          text: "Start",
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                MainPage()), (Route<dynamic> route) => false);
            print("button tapped");
          }
      ),
    );
  }
}

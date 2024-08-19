import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:inside_out/consts/my_button.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              children: [
                Gap(20),
                Text("Inside Out App", style: TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: 'Inside Out', color: CupertinoColors.white,
                  fontSize: 40
                )),
                Gap(14),
                Text("This application Inside Out Wallpapers has the features of downloading images, installing"
                    " images directly on the desktop window. The application contains more than 200+ beautiful"
                    " pictures of each other. All pictures in the application are downloaded from some websites."
                    " Our application is equipped with a very convenient interface. All our colors are sure to"
                    " attract the user. Thank you for using our app.", style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Inside Out', color: CupertinoColors.white,
                    fontSize: 18
                )),
                Gap(14),
                Text("Support", style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Inside Out', color: CupertinoColors.white,
                    fontSize: 40
                )),
                Gap(14),
                Text("Sorry, no one has supported our application. Because this application"
                    "is created only for users. It is not used to make money or annoy the user.", style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Inside Out', color: CupertinoColors.white,
                    fontSize: 18
                )),
                Gap(14),
                Text("Devices", style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Inside Out', color: CupertinoColors.white,
                    fontSize: 40
                )),
                Gap(14),
                Text("Our application is designed for Android and iOS devices."
                    "We have used simple elements as much as possible so that "
                    "you can use our app easily. There is nothing to bother"
                    " the user in this application. For the user, we've made "
                    "things simple. We are sure that even a small child can use"
                    " this app.  Note: The design of our app may vary depending on the device.", style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Inside Out', color: CupertinoColors.white,
                    fontSize: 18
                )),
                Gap(14),
                Text("Contact", style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Inside Out', color: CupertinoColors.white,
                    fontSize: 40
                )),
                Gap(14),
                Text("Contacting us is very easy. If you want to partner with us,"
                    " or if you want to know more about our app, you can contact us."
                    " We will contact you within 24 hours. If you want to support our application,"
                    " our contact services are always open for you.", style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Inside Out', color: CupertinoColors.white,
                    fontSize: 18
                )),
                MyButton(text: "Telegram", onTap: () {
                  _launchTelegramChannel();
                }),
                MyButton(text: "Instagram", onTap: () {
                  _launchInstagram();
                }),
                Gap(14),
                Text("for Developers", style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Inside Out', color: CupertinoColors.white,
                    fontSize: 40
                )),
                Gap(14),
                Text("If you are a developer and you want to work with us, we would be very happy."
                    " It's great for us to work with any programmers, designers."
                    " Of course it will be good for you too. You can be the right person"
                    " for us, or we can be the right person for you. So, do not"
                    " hesitate to contact us right away. We will be more than happy.", style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Inside Out', color: CupertinoColors.white,
                    fontSize: 18
                )),
                MyButton(text: "GitHub", onTap: () {
                  _launchGitHub();
                }),
                Gap(14),
                Text("About Builder", style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Inside Out', color: CupertinoColors.white,
                    fontSize: 40
                )),
                Gap(14),
                Text("hello Yes it's me. I am the owner of this app. I faced a lot of difficulties in making this app. Let me introduce myself to you first!"
                    "My name is Iftikhar. I am 16-17 years old. I am from Uzbekistan. I have been living in this country since I was born. I have never been to foreign countries in my life. I live with my parents."
                    "I have been working in programming since October 2022. I studied programming in DAIGITAL CITY in our province. My programming language is Dart. So Flutter."
                    ""
                   "You have learned a lot about me, now let me tell you about the creation of this app!"
                    ""
                    "This app is built in Flutter. I got all the pictures "
                    "from different sites. The backend, colors and bottoms of the "
                    "app are designed in Cupertino, i.e. iOS. The app's bright colors"
                    " are an example of this. All the colors in Flutter are good, but the best is Cupertino Colors. "
                    ""
                    "Please subscribe to my telegram channel!", style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Inside Out', color: CupertinoColors.white,
                    fontSize: 18
                )),
                MyButton(text: "My channel", onTap: () {
                  _launchTelegramChannel();
                }),
                Gap(30),
                Text("2024©",)
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _launchTelegramChannel() async {
    const url = 'https://t.me/iftixor_ergashboyev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Telegram kanalini ochishda xatolik yuz berdi';
    }
  }
}
void _launchGitHub() async {
  const url = 'https://github.com/iftixor-ergashboyev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'GitHub kanalini ochishda xatolik yuz berdi';
  }
}
void _launchInstagram() async {
  const url = 'https://www.instagram.com/iftixor_ergashboyev?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Telegram kanalini ochishda xatolik yuz berdi';
  }
}


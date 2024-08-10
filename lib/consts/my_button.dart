import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const MyButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: CupertinoColors.white,
          ),
          child: Center(
            child: Text(
              text, style: TextStyle(fontFamily: 'Inside Out', color: CupertinoColors.black, fontSize: 20),
              // style: GoogleFonts.urbanist(
              //   color: CupertinoColors.black,
              //   fontSize: 20
              // )
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final String imagePath;

  const ImagePage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: Center(
        child: InkWell(
          onTap: () {
            showCupertinoModalPopup(context: context, builder: buildActionSheet);
          },
          child: Container(
            width: 360,
            height: 660,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ),
    );
  }
  Widget buildActionSheet(BuildContext context) => CupertinoActionSheet(
    actions: [
      CupertinoActionSheetAction(
          onPressed: () {},
          child: Text("Download image", style: TextStyle(color: CupertinoColors.activeOrange, fontFamily: 'Inside Out'),)
      ),
      CupertinoActionSheetAction(
          onPressed: () {},
          child: Text("Wallpaper", style: TextStyle(color: CupertinoColors.systemIndigo, fontFamily: 'Inside Out'),)
      ),
    ],
    cancelButton: CupertinoActionSheetAction(
      onPressed: () => Navigator.pop(context),
      child: Text("Cancel", style: TextStyle(color: CupertinoColors.systemRed, fontFamily: 'Inside Out', fontWeight: FontWeight.bold)),
    ),
  );
}

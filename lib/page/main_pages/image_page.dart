import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:gap/gap.dart';
import 'package:path_provider/path_provider.dart';

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
        ),
      ),
    );
  }

  Widget buildActionSheet(BuildContext context) => CupertinoActionSheet(
    actions: [
      CupertinoActionSheetAction(
        onPressed: () async {
          await _setLockScreenWallpaper(context, imagePath);
        },
        child: Text(
          "For LOCK SCREEN",
          style: TextStyle(
            color: CupertinoColors.activeOrange,
            fontFamily: 'Inside Out',
          ),
        ),
      ),
      CupertinoActionSheetAction(
        onPressed: () async {
          await _setHomeScreenWallpaper(context, imagePath);
        },
        child: Text(
          "For HOME SCREEN",
          style: TextStyle(
            color: CupertinoColors.systemIndigo,
            fontFamily: 'Inside Out',
          ),
        ),
      ),
    ],
    cancelButton: CupertinoActionSheetAction(
      onPressed: () => Navigator.pop(context),
      child: Text(
        "Cancel",
        style: TextStyle(
          color: CupertinoColors.systemRed,
          fontFamily: 'Inside Out',
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  Future<void> _setLockScreenWallpaper(BuildContext context, String path) async {
    try {
      final location = WallpaperManager.LOCK_SCREEN;
      final directory = await getTemporaryDirectory();
      final fileName = path.split('/').last;
      final tempFile = File('${directory.path}/$fileName');

      final assetData = await rootBundle.load(path);
      await tempFile.writeAsBytes(assetData.buffer.asUint8List());

      await WallpaperManager.setWallpaperFromFile(tempFile.path, location);
      _showAlertDialog(context, "Picture set for Lock!", "Done", CupertinoColors.activeGreen, 'assets/icon/checked.png');
    } catch (e) {
      _showAlertDialog(context, "Image not set for Lock! $e", "Error", CupertinoColors.systemRed, 'assets/icon/error.png');
    }
  }

  Future<void> _setHomeScreenWallpaper(BuildContext context, String path) async {
    try {
      final location = WallpaperManager.HOME_SCREEN;
      final directory = await getTemporaryDirectory();
      final fileName = path.split('/').last;
      final tempFile = File('${directory.path}/$fileName');

      final assetData = await rootBundle.load(path);
      await tempFile.writeAsBytes(assetData.buffer.asUint8List());

      await WallpaperManager.setWallpaperFromFile(tempFile.path, location);
      _showAlertDialog(context, "Picture set for Home!", "Done", CupertinoColors.activeGreen, 'assets/icon/checked.png');
    } catch (e) {
      _showAlertDialog(context, "Image not set for Home! $e", "Error", CupertinoColors.systemRed, 'assets/icon/close.png');
    }
  }

  void _showAlertDialog(BuildContext context, String message, String buttonText, Color textColor, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Dialog(
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CupertinoColors.white,
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gap(20),
                    Image.asset(imagePath, width: 100, height: 100,),
                    Gap(10),
                    Text(message, style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Inside Out',
                        color: textColor
                    )),
                    Gap(20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';

import 'category_page.dart';
import 'image_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imagePaths = [];

  @override
  void initState() {
    super.initState();
    _loadAssets();
  }

  Future<void> _loadAssets() async {
    final manifestJson = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = jsonDecode(manifestJson);
    final List<String> assetList = manifestMap.keys
        .where((String key) => key.contains('wallpapers/all/'))
        .toList();

    setState(() {
      imagePaths = assetList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Good day",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Inside Out',
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => CategoryPage(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/icon/category_icon.png',
                    width: 40,
                    height: 40,
                  ),
                )
              ],
            ),
            Expanded(
              child: MasonryGridView.builder(
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: imagePaths.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ImagePage(imagePath: imagePaths[index]),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imagePaths[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


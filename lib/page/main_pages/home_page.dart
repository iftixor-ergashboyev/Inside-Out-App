import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:inside_out/page/about_page.dart';

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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: CupertinoColors.white,
            title: InkWell(
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => AboutPage())
                );
              },
                child: Text('Good day', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Inside Out', fontSize: 30))),
            floating: true,
            snap: true,
            expandedHeight: 50.0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => CategoryPage())
                    );
                  },
                    child: Image.asset("assets/icon/category_icon.png", height: 40, width: 40)),
              )
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.all(12.0),
            sliver: SliverMasonryGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              childCount: imagePaths.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ImagePage(imagePath: imagePaths[index]),
                    ),
                  );
                },
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
        ],
      ),
    );
  }
}

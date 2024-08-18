import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../main_pages/image_page.dart';

class Sadness extends StatefulWidget {
  const Sadness({super.key});

  @override
  State<Sadness> createState() => _SadnessState();
}

class _SadnessState extends State<Sadness> {

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
        .where((String key) => key.contains('wallpapers/category/sadnes/'))
        .toList();

    setState(() {
      imagePaths = assetList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.activeBlue,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(CupertinoIcons.back, size: 30, color: Colors.white),
            ),
            backgroundColor: CupertinoColors.activeBlue,
            title: Text("Sadness's pictures", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Inside Out', fontSize: 30)),
            floating: true,
            snap: true,
            expandedHeight: 50.0,
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

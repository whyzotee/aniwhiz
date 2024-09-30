import 'dart:async';

import 'package:aniwhiz/app/data/dummy.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

import 'package:aniwhiz/app/core/app.theme.dart';
import 'package:aniwhiz/app/modules/home/widgets/home.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < (DummyData.dummyImage.length - 1)) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeWidget.customAppbar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeBanner(
              bannerCon: _pageController,
              images: DummyData.dummyImage,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text("🔥 Now popular", style: AppTheme.font16black),
            ),
            HomePopularSection(popularList: DummyData.dummyPopular),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: [
                  const Icon(FluentIcons.apps_24_regular),
                  const SizedBox(width: 5),
                  Text("Category", style: AppTheme.font16black),
                ],
              ),
            ),
            HomeCategory(category: DummyData.dummyCategory)
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

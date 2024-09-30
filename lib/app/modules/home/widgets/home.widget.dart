import 'package:aniwhiz/app/modules/home/widgets/toast.widget.dart';
import 'package:aniwhiz/app/modules/search/views/search.view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

import 'package:aniwhiz/app/core/app.theme.dart';

class HomeWidget {
  static AppBar customAppbar(c) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 0,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset("assets/svgs/logo.svg", height: 36),
          const SizedBox(width: 10),
          Text("Aniwhiz", style: AppTheme.font24black),
          const Spacer(),
          IconButton(
            onPressed: () => AppTheme.push(const SearchView(), c),
            icon: Icon(
              FluentIcons.search_24_regular,
              color: AppTheme.cBlack,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeBanner extends StatelessWidget {
  final PageController bannerCon;
  final List images;
  const HomeBanner({super.key, required this.bannerCon, required this.images});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.25,
      child: Stack(
        children: [
          PageView(
            controller: bannerCon,
            children: images.map((element) {
              return CachedNetworkImage(
                imageUrl: "${element["img"]}",
                imageBuilder: (context, imageProvider) => Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${element["name"]}",
                              style: AppTheme.font24White,
                            ),
                            Text(
                              "from ${element["from"]}",
                              style: AppTheme.font16White,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    enabled: true,
                    child: Container(),
                  );
                },
                errorWidget: (context, url, error) => const Icon(Icons.error),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                controller: bannerCon,
                count: images.length,
                effect: const ExpandingDotsEffect(
                  dotHeight: 6,
                  dotWidth: 6,
                  dotColor: Colors.white,
                  activeDotColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePopularSection extends StatelessWidget {
  final List popularList;
  const HomePopularSection({super.key, required this.popularList});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: popularList.map((element) {
          return Container(
            width: screenWidth * 0.375,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: screenHeight * 0.125,
                      decoration: BoxDecoration(
                        color: AppTheme.cBlack,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                      ),
                    ),
                    CachedNetworkImage(
                      imageUrl: "${element["img"]}",
                      imageBuilder: (context, imageProvider) => Container(
                        height: screenHeight * 0.125,
                        decoration: BoxDecoration(
                          color: AppTheme.cBlack,
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      placeholder: (context, url) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          enabled: true,
                          child: Container(),
                        );
                      },
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Align(
                      heightFactor: 0.8,
                      widthFactor: 0.6,
                      alignment: Alignment.topLeft,
                      child: CachedNetworkImage(
                        imageUrl: element["char"].toString(),
                        height: screenHeight * 0.25555,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppTheme.cBlack,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${element["name"]}",
                            style: AppTheme.font16White,
                          ),
                          const Icon(Icons.star, color: Colors.amber)
                        ],
                      ),
                      Text(
                        "Voice: ${element["voice"]}",
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.font12White,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class HomeCategory extends StatelessWidget {
  final List category;
  const HomeCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1.5,
      padding: const EdgeInsets.all(10),
      physics: const NeverScrollableScrollPhysics(),
      children: category.map((element) {
        if (element["img"] == null) {
          return GestureDetector(
            onTap: () => ToastBar.show(context),
            child: Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Text(
                    "${element["topic"]}",
                    style: AppTheme.font24White,
                  ),
                ],
              ),
            ),
          );
        }

        return GestureDetector(
          onTap: () => ToastBar.show(context),
          child: CachedNetworkImage(
            imageUrl: "${element["img"]}",
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Text(
                    "${element["topic"]}",
                    style: AppTheme.font24White,
                  ),
                ],
              ),
            ),
            placeholder: (context, url) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: Container(),
              );
            },
            errorWidget: (context, url, error) {
              return const Icon(Icons.error);
            },
          ),
        );
      }).toList(),
    );
  }
}

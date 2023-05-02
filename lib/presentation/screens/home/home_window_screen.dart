import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:techblog/extensions/extensions.dart';
import 'package:techblog/presentation/screens/profile/profile_screen.dart';
import 'package:techblog/presentation/screens/widgets/blog_item_view.dart';

class HomeWindowScreen extends StatefulWidget {
  const HomeWindowScreen({super.key});

  @override
  State<HomeWindowScreen> createState() => _HomeWindowScreenState();
}

class _HomeWindowScreenState extends State<HomeWindowScreen> {
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 900,
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: HomeWindowAppBar(
                        onTapSearch: () {
                          isSearch = true;
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FeatureBlogItemView(),
                    SizedBox(
                      height: 20,
                    ),
                    BlogListView()
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: SearchView(
                isSearch: isSearch,
                onTapCancel: () {
                  isSearch = false;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
    this.isSearch,
    required this.onTapCancel,
  });

  final bool? isSearch;
  final Function onTapCancel;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isSearch ?? false,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Column(
          children: [
            SizedBox(
              height: context.height * 0.2,
            ),
            Container(
              width: context.width * 0.4,
              //height: 100,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: "search posts, authers",
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 40,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20),
                    child: Icon(
                      Icons.search,
                      size: 26,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {
                        onTapCancel();
                      },
                      icon: Icon(
                        Icons.cancel_rounded,
                        size: 26,
                      ),
                    ),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogListView extends StatelessWidget {
  const BlogListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        mainAxisExtent: context.height * 0.6,
        childAspectRatio: 1 / 1,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      padding: const EdgeInsets.only(right: 20),
      itemBuilder: (context, index) {
        return BlogItemView(
          onTap: () {},
          onTapProfile: () {
            context.toNextScreen(ProfileScreen());
          },
        );
      },
    );
  }
}

class FeatureBlogItemView extends StatelessWidget {
  const FeatureBlogItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.7,
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(right: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: context.height * 0.7,
                width: 500,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  "assets/images/chat_gpt.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          context.toNextScreen(ProfileScreen());
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                "assets/images/profile.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Saw Yan Lin Oo",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "The Movie DB Application",
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "MovieLab is an open source and a cross-platform mobile app where you can find movies, series, seasons, episodes, movie recommendation and actors from the largest movie database IMDB. With this spp, you can also find season and movie ratings to make a solid decision on what to watch next.",
                      maxLines: 6,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Oct 11 2023 . 23 view",
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeWindowAppBar extends StatelessWidget {
  const HomeWindowAppBar({
    super.key,
    required this.onTapSearch,
  });

  final Function onTapSearch;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Text(
              "Teach Blog",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Text(
              "Home",
              style: TextStyle(),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Resourse",
              style: TextStyle(),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Favouries",
              style: TextStyle(),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Setting",
              style: TextStyle(),
            ),
          ],
        ),
        Spacer(),
        Row(
          children: [
            IconButton(
              onPressed: () {
                onTapSearch();
              },
              icon: Icon(
                Icons.search,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text("Sign in"),
            SizedBox(
              width: 20,
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(100),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8.0,
                ),
                child: Text(
                  "Subscribe",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

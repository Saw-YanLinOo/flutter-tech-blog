import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techblog/extensions/extensions.dart';
import 'package:techblog/presentation/bloc/profile/profile_bloc.dart';
import 'package:techblog/presentation/bloc/profile/profile_event.dart';
import 'package:techblog/presentation/screens/login/login_screen.dart';
import 'package:techblog/presentation/screens/profile/profile_screen.dart';
import 'package:techblog/presentation/screens/item_views/blog_item_view.dart';
import 'package:techblog/presentation/screens/widgets/signin_button_view.dart';
import 'package:techblog/presentation/screens/widgets/theme_button_view.dart';

import '../../bloc/blog/blog_bloc.dart';
import '../../bloc/blog/blog_state.dart';
import '../widgets/custom_loading_view.dart';

class HomeMobileScreen extends StatefulWidget {
  const HomeMobileScreen({super.key});

  @override
  State<HomeMobileScreen> createState() => _HomeMobileScreenState();
}

class _HomeMobileScreenState extends State<HomeMobileScreen> {
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: HomeMobileAppBar(
                  onTapSearch: () {
                    isSearch = true;
                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: BlogListSection(),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: HomeBottomNavigationBar(),
          ),
          Positioned.fill(
            child: SearchMobileView(
              isSearch: isSearch,
              onTapCancel: () {
                isSearch = false;
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BlogListSection extends StatelessWidget {
  const BlogListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (context, state) {
        if (state is GetAllBlogSuccessState) {
          var list = state.blogList;
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              crossAxisCount: context.width < 460 ? 1 : 2,
              childAspectRatio: 1,
              mainAxisExtent: context.width < 460
                  ? context.height * 0.5
                  : context.height * 0.6,
            ),
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              var item = list[index];

              return BlogItemView(
                blog: item,
                onTap: () {
                  item.link?.launchURL();
                },
                onTapProfile: () {
                  context
                      .read<ProfileBloc>()
                      .add(GetUserBlogEvent(item.userId ?? ""));
                  context.toNextScreen(ProfileScreen());
                },
              );
            },
          );
        } else if (state is GetAllBlogFailStae) {
          return Center(
            child: Text("${state.e}"),
          );
        } else {
          return Center(
            child: CustomLoadingView(),
          );
        }
      },
    );
  }
}

class SearchMobileView extends StatelessWidget {
  const SearchMobileView({
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
              height: context.height * 0.05,
            ),
            Container(
              width: context.width * 0.7,
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

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 260,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Home",
                  style: TextStyle(),
                ),
                Text(
                  "Resourse",
                  style: TextStyle(),
                ),
                Text(
                  "Favouries",
                  style: TextStyle(),
                ),
                Text(
                  "Setting",
                  style: TextStyle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeMobileAppBar extends StatelessWidget {
  const HomeMobileAppBar({
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
            // SizedBox(
            //   width: 40,
            // ),
            // Text(
            //   "Home",
            //   style: TextStyle(),
            // ),
            // SizedBox(
            //   width: 20,
            // ),
            // Text(
            //   "Resourse",
            //   style: TextStyle(),
            // ),
            // SizedBox(
            //   width: 20,
            // ),
            // Text(
            //   "Favouries",
            //   style: TextStyle(),
            // ),
            // SizedBox(
            //   width: 20,
            // ),
            // Text(
            //   "Setting",
            //   style: TextStyle(),
            // ),
          ],
        ),
        Spacer(),
        Row(
          children: [
            InkWell(
              onTap: () {
                onTapSearch();
              },
              child: Icon(
                Icons.search,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            ThemeButtonView(),
            SizedBox(
              width: 20,
            ),
            SingInButtonView(
              onTapSingIn: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      shape: kIsWeb
                          ? RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            )
                          : null,
                      content: LoginScree(),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

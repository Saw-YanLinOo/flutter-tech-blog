import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:techblog/extensions/extensions.dart';
import 'package:techblog/presentation/bloc/blog/blog_bloc.dart';
import 'package:techblog/presentation/bloc/blog/blog_state.dart';
import 'package:techblog/presentation/bloc/profile/profile_bloc.dart';
import 'package:techblog/presentation/bloc/profile/profile_event.dart';
import 'package:techblog/presentation/bloc/theme/theme_bloc.dart';
import 'package:techblog/presentation/bloc/theme/theme_event.dart';
import 'package:techblog/presentation/bloc/theme/theme_state.dart';
import 'package:techblog/presentation/screens/login/login_screen.dart';
import 'package:techblog/presentation/screens/profile/profile_screen.dart';
import 'package:techblog/presentation/screens/item_views/blog_item_view.dart';

import '../widgets/custom_loading_view.dart';

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
                    BlogListView(),
                    SizedBox(
                      height: 20,
                    ),
                    WindowFooterSection(),
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

class WindowFooterSection extends StatelessWidget {
  const WindowFooterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.width * 0.12,
      color: Theme.of(context).shadowColor,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "YanYan Tech Blog",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      " © 2023",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Power by Flutter",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text("                                      "),
              ],
            ),
          ),
        ],
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
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                onTapCancel();
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withOpacity(0.5),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: context.height * 0.15),
              child: Container(
                width: context.width * 0.4,
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
                    filled: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
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

class BlogListView extends StatelessWidget {
  const BlogListView({
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
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              mainAxisExtent: context.height * 0.6,
              childAspectRatio: 1 / 1,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            padding: const EdgeInsets.only(right: 20),
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

class FeatureBlogItemView extends StatelessWidget {
  const FeatureBlogItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (context, state) {
        if (state is GetAllBlogSuccessState) {
          var blog =
              state.blogList.firstWhere((element) => element.feature == 1);

          return GestureDetector(
            onTap: () {
              blog.link?.launchURL();
            },
            child: Container(
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
                        child: CachedNetworkImage(
                          imageUrl: "${blog.url}",
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
                                  context
                                      .read<ProfileBloc>()
                                      .add(GetUserBlogEvent(blog.userId ?? ""));
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
                                      child: CachedNetworkImage(
                                        imageUrl: "${blog.userAvatorUrl}",
                                        errorWidget: (context, url, error) {
                                          return Image.asset(
                                            "assets/images/chat_gpt.jpg",
                                            fit: BoxFit.cover,
                                          );
                                        },
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "${blog.userName ?? "Sayar"}",
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
                              "${blog.title}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            AutoSizeText(
                              "${blog.description}",
                              maxLines: 6,
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${DateFormat('MMM d y').format(blog.date ?? DateTime.now())} . ${blog.view} view",
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
            ),
          );
        } else if (state is GetAllBlogFailStae) {
          return SizedBox(
            height: context.height * 0.7,
            width: double.infinity,
            child: Center(
              child: Text("${state.e}"),
            ),
          );
        } else {
          return Container(
            height: context.height * 0.7,
            width: double.infinity,
            child: Center(
              child: CustomLoadingView(),
            ),
          );
        }
      },
    );
  }
}

class HomeWindowAppBar extends StatefulWidget {
  const HomeWindowAppBar({
    super.key,
    required this.onTapSearch,
  });

  final Function onTapSearch;

  @override
  State<HomeWindowAppBar> createState() => _HomeWindowAppBarState();
}

class _HomeWindowAppBarState extends State<HomeWindowAppBar> {
  bool onHoverHome = false;
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
            WindowNavItemView(
              title: "Home",
              onTap: () {
                print("home");
              },
            ),
            SizedBox(
              width: 20,
            ),
            WindowNavItemView(
              title: "Resourse",
              onTap: () {},
            ),
            SizedBox(
              width: 20,
            ),
            WindowNavItemView(
              title: "Favouries",
              onTap: () {},
            ),
            SizedBox(
              width: 20,
            ),
            WindowNavItemView(
              title: "Setting",
              onTap: () {},
            ),
          ],
        ),
        Spacer(),
        Row(
          children: [
            IconButton(
              onPressed: () {
                widget.onTapSearch();
              },
              icon: Icon(
                Icons.search,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                if (state is GetThemeState) {
                  var themeMode = state.themeMode;

                  if (themeMode == ThemeMode.dark) {
                    return InkWell(
                      onTap: () {
                        context
                            .read<ThemeBloc>()
                            .add(ChangeThemeEvent(themeMode: ThemeMode.light));
                      },
                      child: Icon(
                        Icons.dark_mode,
                      ),
                    );
                  } else {
                    return InkWell(
                      onTap: () {
                        context
                            .read<ThemeBloc>()
                            .add(ChangeThemeEvent(themeMode: ThemeMode.dark));
                      },
                      child: Icon(
                        Icons.light_mode,
                      ),
                    );
                  }
                } else {
                  return SizedBox();
                }
              },
            ),
            SizedBox(
              width: 20,
            ),
            // Text("Sign in"),
            // SizedBox(
            //   width: 20,
            // ),
            SingInButtonView(
              onTapSingIn: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: LoginScree(),
                    );
                  },
                );
              },
            )
          ],
        ),
      ],
    );
  }
}

class SingInButtonView extends StatelessWidget {
  const SingInButtonView({
    super.key,
    required this.onTapSingIn,
  });

  final Function onTapSingIn;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: MaterialStateMouseCursor.clickable,
      child: GestureDetector(
        onTap: () {
          onTapSingIn();
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Theme.of(context).focusColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8.0,
            ),
            child: Text(
              "Sign In",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WindowNavItemView extends StatefulWidget {
  const WindowNavItemView({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final Function onTap;
  @override
  State<WindowNavItemView> createState() => _WindowNavItemViewState();
}

class _WindowNavItemViewState extends State<WindowNavItemView> {
  bool onHover = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          onHover = true;
          setState(() {});
        },
        onExit: (event) {
          onHover = false;
          setState(() {});
        },
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: onHover ? 18 : 14,
          ),
        ),
      ),
    );
  }
}

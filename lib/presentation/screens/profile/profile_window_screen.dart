import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techblog/domain/models/blog.dart';
import 'package:techblog/extensions/extensions.dart';
import 'package:techblog/presentation/bloc/profile/profile_bloc.dart';
import 'package:techblog/presentation/bloc/profile/profile_state.dart';
import 'package:techblog/presentation/screens/item_views/blog_item_view.dart';
import 'package:techblog/presentation/screens/widgets/custom_loading_view.dart';

class ProfileWindowScreen extends StatelessWidget {
  const ProfileWindowScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 900,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PersonalInformationView(),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: OverAllView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OverAllView extends StatelessWidget {
  const OverAllView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Card(
          //  color: Theme.of(context).cardColor.withAlpha(0),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: context.width * 0.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          AutoSizeText(
                            "Portfolio",
                            maxLines: 1,
                            minFontSize: 30,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: 30,
                            height: 5,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Colors.grey.withAlpha(20),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "About",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Resume",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Portfolio",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Blog",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Contact",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                  if (state is GetUserBlogSuccess) {
                    var blogList = state.list;
                    return ProfileWindowBlogView(blogList: blogList);
                  } else if (state is GetUserBlogFail) {
                    return Center(
                      child: Text("${state.object}"),
                    );
                  } else {
                    return const Center(
                      child: CustomLoadingView(),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileWindowBlogView extends StatelessWidget {
  const ProfileWindowBlogView({
    super.key,
    required this.blogList,
  });

  final List<Blog> blogList;

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
      itemCount: blogList.length,
      padding: const EdgeInsets.only(right: 20),
      itemBuilder: (context, index) {
        var blog = blogList[index];
        return BlogItemView(
          blog: blog,
          onTap: () {
            blog.link?.launchURL();
          },
          onTapProfile: () {},
        );
      },
    );
  }
}

class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print("personal :: ${context.width * 0.22}");
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Card(
            elevation: 1,
            //   color: Theme.of(context).cardColor.withAlpha(0),
            child: Container(
              width: context.width * 0.22,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              constraints: BoxConstraints(
                maxWidth: 200,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/profile.jpg",
                      width: 80,
                      height: 80,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Saw Yan Lin Oo",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: Theme.of(context).cardColor,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText(
                        "Full Stack Developer",
                        maxLines: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ProfileWindowItemView(
                    icon: Icons.email,
                    title: "EMAIL",
                    desc: "yly80103@gmail.com",
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ProfileWindowItemView(
                    icon: Icons.phone,
                    title: "PHONE",
                    desc: "+95 9781043781",
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ProfileWindowItemView(
                    icon: Icons.calendar_month,
                    title: "BIRTHDAY",
                    desc: "May 20, 2001",
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ProfileWindowItemView(
                    icon: Icons.location_on,
                    title: "LOCATION",
                    desc: "Yangon, Myanmar",
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.github,
                        size: 14,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        FontAwesomeIcons.instagram,
                        size: 14,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        FontAwesomeIcons.linkedin,
                        size: 14,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        FontAwesomeIcons.twitter,
                        size: 14,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        FontAwesomeIcons.whatsapp,
                        size: 14,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileWindowItemView extends StatelessWidget {
  const ProfileWindowItemView({
    super.key,
    required this.icon,
    this.title,
    this.desc,
  });

  final IconData icon;
  final String? title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              size: 20,
            ),
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? "",
                style: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              AutoSizeText(
                desc ?? "",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

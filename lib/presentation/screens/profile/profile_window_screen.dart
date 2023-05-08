import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:techblog/extensions/extensions.dart';
import 'package:techblog/presentation/screens/item_views/blog_item_view.dart';

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
                GridView.builder(
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
                      onTapProfile: () {},
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ],
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
    return Column(
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
                Row(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.email,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "EMAIL",
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          AutoSizeText(
                            "yly80103@gmail.com",
                            maxLines: 1,
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_city,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.facebook,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.g_mobiledata_sharp,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

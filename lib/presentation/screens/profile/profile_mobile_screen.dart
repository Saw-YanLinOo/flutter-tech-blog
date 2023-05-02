import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:techblog/extensions/extensions.dart';
import 'package:techblog/presentation/screens/profile/profile_screen.dart';
import 'package:techblog/presentation/screens/widgets/blog_item_view.dart';

class ProfileMobileScreen extends StatelessWidget {
  const ProfileMobileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PersonalInformationView(),
                SizedBox(
                  width: 10,
                ),
                OverAllView(),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomNavigationBar(),
        )
      ],
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: context.width,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
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
    );
  }
}

class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      // color: Theme.of(context).cardColor.withAlpha(0),
      child: Container(
        height: context.height * 0.15,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Row(
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
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Saw Yan Lin Oo",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Card(
                  color: Theme.of(context).cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      "Full Stack Developer",
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
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
    print("mobile widht ::: ${context.width}");
    return Card(
      // color: Theme.of(context).cardColor.withAlpha(0),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: context.width,
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Portfolio",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
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
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  crossAxisCount: context.width < 460 ? 1 : 2,
                  childAspectRatio: 1,
                  mainAxisExtent: context.height * 0.6,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                padding: const EdgeInsets.only(right: 10),
                itemBuilder: (context, index) {
                  return BlogItemView(
                    onTap: () {},
                    onTapProfile: (){},
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

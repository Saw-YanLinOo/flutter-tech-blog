import 'package:flutter/material.dart';
import 'package:techblog/extensions/extensions.dart';

class BlogItemView extends StatelessWidget {
  const BlogItemView({
    super.key,
    required this.onTap,
    required this.onTapProfile,
  });

  final Function onTap;
  final Function onTapProfile;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(context.isTablet ? 20 : 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  "assets/images/chat_gpt.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          onTapProfile();
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 28,
                              height: 28,
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
                      "The Movie DB",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: Text(
                        "MovieLab is an open source and a cross-platform mobile app where you can find movies, series, seasons, episodes, movie recommendation and actors from the largest movie database IMDB. With this spp, you can also find season and movie ratings to make a solid decision on what to watch next.",
                        // maxLines: 4,
                        style: TextStyle(
                          fontSize: 13,
                        ),
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

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:techblog/domain/models/blog.dart';
import 'package:techblog/extensions/extensions.dart';

class ArticleDetail extends StatelessWidget {
  const ArticleDetail({
    super.key,
    this.blogItem,
  });

  final Blog? blogItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Article Information",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                "${blogItem?.imageUrl}",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Center(
              child: Text(
                "${blogItem?.title}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Center(
              child: Text(
                "${blogItem?.userName}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DescriptionView(blogItem: blogItem),
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Article Description",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "${blogItem?.description ?? ""}",
                style: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: Theme.of(context).disabledColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  (blogItem?.link ?? "").launchURL();
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Launch to see More Detail",
                            style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Transform.rotate(
                            angle: -340,
                            child: Icon(
                              Icons.forward_sharp,
                              color: Theme.of(context).scaffoldBackgroundColor,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionView extends StatelessWidget {
  const DescriptionView({
    super.key,
    required this.blogItem,
  });

  final Blog? blogItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DescriptionItemView(
          icon: Icons.person,
          title: "Publisher Information -  ",
          desc: "${blogItem?.userEmail ?? ""}",
        ),
        SizedBox(
          height: 22,
        ),
        DescriptionItemView(
          icon: Icons.alarm,
          title: "Published Date -  ",
          desc:
              "${DateFormat('MMM d y').format(blogItem?.date ?? DateTime.now())}",
        ),
        SizedBox(
          height: 22,
        ),
        DescriptionTagItemView(
          icon: Icons.table_chart_sharp,
          title: "Tags -  ",
          desc: blogItem?.tag,
        ),
      ],
    );
  }
}

class DescriptionItemView extends StatelessWidget {
  const DescriptionItemView({
    super.key,
    this.title,
    this.desc,
    this.icon,
  });

  final IconData? icon;
  final String? title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
        ),
        SizedBox(
          width: 8,
        ),
        Text(title ?? ""),
        Expanded(
          child: Text(
            "${desc ?? ""}",
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}

class DescriptionTagItemView extends StatelessWidget {
  const DescriptionTagItemView({
    super.key,
    this.title,
    this.desc,
    this.icon,
  });

  final IconData? icon;
  final String? title;
  final List<dynamic>? desc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
        ),
        SizedBox(
          width: 8,
        ),
        Text(title ?? ""),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...desc?.map((value) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: Theme.of(context).disabledColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            child: Text(
                              "${value ?? ""}",
                            ),
                          ),
                        ),
                      );
                    }).toList() ??
                    [],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techblog/core/remote/remote_constant.dart';
import 'package:techblog/domain/models/user_model.dart';
import 'package:techblog/presentation/bloc/home/user_bloc.dart';

class SingInButtonView extends StatelessWidget {
  const SingInButtonView({
    super.key,
    required this.onTapSingIn,
  });

  final Function onTapSingIn;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserModel?>(
      buildWhen: (previous, current) => previous?.id != current?.id,
      builder: (context, user) {
        if (user?.id != null) {
          return Container(
            width: 40,
            height: 40,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: user?.avatorUrl != null
                ? CachedNetworkImage(
                    imageUrl: user?.avatorUrl ?? "",
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) {
                      return Image.network(
                        defaultImageURL,
                        fit: BoxFit.cover,
                      );
                    },
                  )
                : Image.network(
                    defaultImageURL,
                    fit: BoxFit.cover,
                  ),
          );
        } else {
          return MouseRegion(
            cursor: MaterialStateMouseCursor.clickable,
            child: GestureDetector(
              onTap: () {
                onTapSingIn();
              },
              child: Card(
                shape: RoundedRectangleBorder(
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
      },
    );
  }
}

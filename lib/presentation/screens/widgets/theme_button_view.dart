import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techblog/presentation/bloc/theme/theme_bloc.dart';
import 'package:techblog/presentation/bloc/theme/theme_event.dart';
import 'package:techblog/presentation/bloc/theme/theme_state.dart';

class ThemeButtonView extends StatelessWidget {
  const ThemeButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
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
    );
  }
}
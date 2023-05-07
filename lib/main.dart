import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techblog/core/local/my_share_perference.dart';
import 'package:techblog/presentation/bloc/theme/theme_bloc.dart';
import 'package:techblog/presentation/bloc/theme/theme_state.dart';
import 'package:techblog/presentation/screens/home/home_screen.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  await MySharePerference().init();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, bloc) {
          return MaterialApp(
            title: 'YanYan Teach Blog',
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            themeMode: bloc.themeMode ?? ThemeMode.system,
            theme: ThemeData.light(
              useMaterial3: true,
            ),
            darkTheme: ThemeData.dark(
            
              useMaterial3: true,
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:techblog/core/local/my_share_perference.dart';
import 'package:techblog/presentation/bloc/blog/blog_bloc.dart';
import 'package:techblog/presentation/bloc/blog/blog_event.dart';
import 'package:techblog/presentation/bloc/home/user_bloc.dart';
import 'package:techblog/presentation/bloc/login/login_bloc.dart';
import 'package:techblog/presentation/bloc/profile/profile_bloc.dart';
import 'package:techblog/presentation/bloc/theme/theme_bloc.dart';
import 'package:techblog/presentation/bloc/theme/theme_event.dart';
import 'package:techblog/presentation/bloc/theme/theme_state.dart';
import 'package:techblog/presentation/screens/home/home_screen.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider/path_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  await MySharePerference().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const InitBloc(),
  );
}

class InitBloc extends StatelessWidget {
  const InitBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => BlogBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => UserBloc()),
        BlocProvider(create: (context) => LoginBloc()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context.read<ThemeBloc>().add(GetThemeEvent());
    context.read<BlogBloc>().add(GetAllBlogEvent());
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, bloc) {
        return MaterialApp(
          title: 'YanYan Teach Blog',
          debugShowCheckedModeBanner: false,
          themeMode: bloc.themeMode ?? ThemeMode.system,
          scrollBehavior: kIsWeb
              ? const ScrollBehavior().copyWith(scrollbars: false)
              : null,
          theme: ThemeData(
            useMaterial3: true,
            scrollbarTheme: kIsWeb
                ? const ScrollbarThemeData(showTrackOnHover: false)
                : null,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
            scrollbarTheme: ScrollbarThemeData(
              showTrackOnHover: false,
            ),
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}

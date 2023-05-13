import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:techblog/core/local/my_share_perference.dart';
import 'package:techblog/presentation/bloc/home/blog_bloc.dart';
import 'package:techblog/presentation/bloc/theme/theme_bloc.dart';
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
    const MyApp(),
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
        BlocProvider(create: (context) => BlogBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, bloc) {
          return MaterialApp(
            title: 'YanYan Teach Blog',
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

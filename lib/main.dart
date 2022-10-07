import 'package:fit/data/data_source/local/entity/category/cloth_category_entity.dart';
import 'package:fit/data/data_source/local/entity/cloth/bottom_entity.dart';
import 'package:fit/data/data_source/local/entity/cloth/other_entity.dart';
import 'package:fit/data/data_source/local/entity/cloth/outer_entity.dart';
import 'package:fit/data/data_source/local/entity/cloth/top_entity.dart';
import 'package:fit/di/di_setup.dart';
import 'package:fit/domain/model/util/count_set.dart';
import 'package:fit/presentation/first_category/first_category_screen.dart';
import 'package:fit/presentation/home/home_screen.dart';
import 'package:fit/util/colors.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(TopEntityAdapter());
  Hive.registerAdapter(BottomEntityAdapter());
  Hive.registerAdapter(OuterEntityAdapter());
  Hive.registerAdapter(OtherEntityAdapter());
  Hive.registerAdapter(ClothCategoryEntityAdapter());
  Hive.registerAdapter(CountSetAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FIT',
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
          iconSize: 48,
        ),
        appBarTheme: const AppBarTheme(
          toolbarHeight: 68,
          backgroundColor: CustomColor.lightGrey,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24
          ),
        ),
        scaffoldBackgroundColor: CustomColor.lightGrey,
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return HomeScreen();
        },
      ),
      GoRoute(
        path: '/first/:clothType',
        builder: (BuildContext context, GoRouterState state) {
          return FirstCategoryScreen(clothType: state.params['clothType']!.toClothType());
        },
      ),
    ],
  );
}

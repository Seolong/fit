import 'package:fit/data/data_source/local/entity/category/cloth_category_entity.dart';
import 'package:fit/data/data_source/local/entity/cloth/bottom_entity.dart';
import 'package:fit/data/data_source/local/entity/cloth/other_entity.dart';
import 'package:fit/data/data_source/local/entity/cloth/outer_entity.dart';
import 'package:fit/data/data_source/local/entity/cloth/top_entity.dart';
import 'package:fit/di/di_setup.dart';
import 'package:fit/domain/model/util/count_set.dart';
import 'package:fit/presentation/add_cloth/add_cloth_screen.dart';
import 'package:fit/presentation/bottom_list/bottom_list_screen.dart';
import 'package:fit/presentation/cloth_detail/cloth_detail_screen.dart';
import 'package:fit/presentation/first_category/first_category_screen.dart';
import 'package:fit/presentation/home/home_screen.dart';
import 'package:fit/presentation/other_list/other_list_screen.dart';
import 'package:fit/presentation/outer_list/outer_list_screen.dart';
import 'package:fit/presentation/top_list/top_list_screen.dart';
import 'package:fit/routes/app_routes.dart';
import 'package:fit/util/colors.dart';
import 'package:fit/util/size_value.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);

    return MaterialApp.router(
      title: 'FIT',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Pretendard",
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: CustomColor.mainGreen,
          iconSize: 48,
          elevation: 3.5,
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: CustomColor.lightGrey,
            statusBarColor: CustomColor.lightGrey,
            statusBarIconBrightness: Brightness.dark,
            // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          toolbarHeight: SizeValue.appBarHeight,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 24),
        ),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: AppRoutes.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: '${AppRoutes.first}/:clothType',
        builder: (BuildContext context, GoRouterState state) {
          return FirstCategoryScreen(
              clothType: state.pathParameters['clothType']!.toClothType());
        },
      ),
      GoRoute(
        path: '${AppRoutes.topList}/:categoryId',
        builder: (BuildContext context, GoRouterState state) {
          return TopListScreen(
              categoryId: int.parse(state.pathParameters['categoryId']!));
        },
      ),
      GoRoute(
        path: '${AppRoutes.bottomList}/:categoryId',
        builder: (BuildContext context, GoRouterState state) {
          return BottomListScreen(
              categoryId: int.parse(state.pathParameters['categoryId']!));
        },
      ),
      GoRoute(
        path: '${AppRoutes.outerList}/:categoryId',
        builder: (BuildContext context, GoRouterState state) {
          return OuterListScreen(
              categoryId: int.parse(state.pathParameters['categoryId']!));
        },
      ),
      GoRoute(
        path: '${AppRoutes.otherList}/:categoryId',
        builder: (BuildContext context, GoRouterState state) {
          return OtherListScreen(
              categoryId: int.parse(state.pathParameters['categoryId']!));
        },
      ),
      GoRoute(
        path:
            '${AppRoutes.addClothScreen}/:categoryId/:clothType/:categoryTitle',
        builder: (BuildContext context, GoRouterState state) {
          return AddClothScreen(
            categoryId: int.parse(state.pathParameters['categoryId']!),
            clothType: state.pathParameters['clothType']!.toClothType(),
            categoryTitle: state.pathParameters['categoryTitle']!,
          );
        },
      ),
      GoRoute(
        path:
        '${AppRoutes.clothDetailScreen}/:clothType/:id',
        builder: (BuildContext context, GoRouterState state) {
          return ClothDetailScreen(
            clothType: state.pathParameters['clothType']!.toClothType(),
            id: int.parse(state.pathParameters['id']!),
          );
        },
      ),
    ],
  );
}

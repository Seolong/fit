import 'package:fit/presentation/home/components/to_cloth_category_route_button.dart';
import 'package:fit/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../util/type/cloth_type.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ToClothCategoryRouteButton> buttonList = [
      ToClothCategoryRouteButton(
        name: 'Top',
        onTap: () {
          context.push('${AppRoutes.first}/${ClothType.top.name}');
        },
      ),
      ToClothCategoryRouteButton(
        name: 'Bottom',
        onTap: () {
          context.push('${AppRoutes.first}/${ClothType.bottom.name}');
        },
      ),
      ToClothCategoryRouteButton(
        name: 'Outer',
        onTap: () {
          context.push('${AppRoutes.first}/${ClothType.outer.name}');
        },
      ),
      ToClothCategoryRouteButton(
        name: 'Other',
        onTap: () {
          context.push('${AppRoutes.first}/${ClothType.other.name}');
        },
      ),
    ];
    return Scaffold(
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 125),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Center(child: buttonList[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 100,
            );
          },
        ),
      ),
    );
  }
}

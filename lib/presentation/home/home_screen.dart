import 'package:fit/presentation/home/components/search_text_field.dart';
import 'package:fit/presentation/home/components/to_route_button.dart';
import 'package:fit/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../util/type/cloth_type.dart';

class HomeScreen extends StatelessWidget {
  final double horizontalEdgeInset = 30;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ToRouteButton> buttonList = [
      ToRouteButton(
        name: 'Top',
        onTap: () {
          context.push('${AppRoutes.first}/${ClothType.top.name}');
        },
      ),
      ToRouteButton(
        name: 'Bottom',
        onTap: () {
          context.push('${AppRoutes.first}/${ClothType.bottom.name}');
        },
      ),
      ToRouteButton(
        name: 'Outer',
        onTap: () {
          context.push('${AppRoutes.first}/${ClothType.outer.name}');
        },
      ),
      ToRouteButton(
        name: 'Other',
        onTap: () {
          context.push('${AppRoutes.first}/${ClothType.other.name}');
        },
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalEdgeInset),
              child: SearchTextField(),
            ),
            Flexible(
              child: GridView.builder(
                physics: const RangeMaintainingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 75, horizontal: 30),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return buttonList[index];
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:fit/domain/model/category/cloth_category.dart';
import 'package:fit/presentation/first_category/components/add_category_dialog.dart';
import 'package:fit/presentation/first_category/components/to_cloth_list_screen_route_button.dart';
import 'package:fit/presentation/first_category/first_category_view_model.dart';
import 'package:fit/presentation/global_components/add_fab.dart';
import 'package:fit/routes/app_routes.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';

import '../../di/di_setup.dart';
import '../global_components/swap_button.dart';

class FirstCategoryScreen extends StatelessWidget {
  const FirstCategoryScreen({Key? key, required this.clothType})
      : super(key: key);

  final ClothType clothType;

  String toUpperCaseOnlyFirstLetter(String string) {
    String firstLetter = string[0];
    firstLetter = firstLetter.toUpperCase();

    return string.replaceFirst(string[0], firstLetter);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FirstCategoryViewModel>(
        create: (_) => getIt<FirstCategoryViewModel>(),
        builder: (context, _) {
          final viewModel = context.read<FirstCategoryViewModel>();
          viewModel.loadClothCategories(clothType);
          return SafeArea(
            child: Scaffold(
              floatingActionButton: AddFAB(onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AddCategoryDialog(
                        pageClothType: clothType,
                        firstCategoryViewModel: viewModel,
                      );
                    });
              }),
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
                title: Text(
                  toUpperCaseOnlyFirstLetter(clothType.name),
                ),
                actions: [
                  Consumer<FirstCategoryViewModel>(
                    builder: (context, provider, _) {
                      return SwapButton(
                        onTap: () {
                          provider.enableReorder = !provider.enableReorder;
                        },
                        text: provider.enableReorder ? 'On' : 'Off',
                      );
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Consumer<FirstCategoryViewModel>(
                  builder: (context, provider, child) => SizedBox.expand(
                    child: ReorderableWrap(
                      buildDraggableFeedback: (BuildContext context,
                              BoxConstraints constraints, Widget child) =>
                          Material(
                        elevation: 6.0,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.zero,
                        child: child,
                      ),
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                      alignment: WrapAlignment.spaceBetween,
                      runSpacing: 30,
                      enableReorder: provider.enableReorder,
                      onReorder: (oldIndex, newIndex) =>
                          viewModel.reorderClothCategory(oldIndex, newIndex),
                      children: _getRouteButtons(context, viewModel),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  List<ToClothListScreenRouteButton> _getRouteButtons(
      BuildContext context, FirstCategoryViewModel viewModel) {
    List<ToClothListScreenRouteButton> buttonList = [];

    for (var category in viewModel.categories) {
      buttonList.add(
        ToClothListScreenRouteButton(
          onTap: () {
            int categoryId = category.id;
            switch (clothType) {
              case ClothType.top:
                context.push('${AppRoutes.topList}/$categoryId');
                break;
              case ClothType.bottom:
                context.push('${AppRoutes.bottomList}/$categoryId');
                break;
              case ClothType.outer:
                context.push('${AppRoutes.outerList}/$categoryId');
                break;
              case ClothType.other:
                context.push('${AppRoutes.otherList}/$categoryId');
                break;
            }
          },
          onLongPress: !viewModel.enableReorder
              ? () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return _getLongPressDialog(context, viewModel, category);
                    },
                  );
                }
              : null,
          child: Text(
            category.title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      );
    }

    return buttonList;
  }

  AlertDialog _getLongPressDialog(BuildContext context,
      FirstCategoryViewModel provider, ClothCategory category) {
    return AlertDialog(
      content: Row(
        children: [
          CupertinoButton(
            child: const Text('?????? ??????'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AddCategoryDialog(
                      pageClothType: clothType,
                      firstCategoryViewModel: provider,
                      isEditMode: true,
                      clothCategory: category,
                    );
                  });
            },
          ),
          CupertinoButton(
            child: const Text('??????'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return _getDeleteDialog(context, provider, category);
                  });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('??????'),
        ),
      ],
    );
  }

  AlertDialog _getDeleteDialog(BuildContext context,
      FirstCategoryViewModel provider, ClothCategory category) {
    return AlertDialog(
      content: Text('${category.title} ????????? ???????????? ?????? ???????????????. ?????????????????????????'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            '??????',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        TextButton(
          onPressed: () {
            provider.deleteClothCategory(category);
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          child: const Text(
            '??????',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}

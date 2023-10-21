import 'package:fit/domain/model/category/cloth_category.dart';
import 'package:fit/presentation/first_category/components/add_category_dialog.dart';
import 'package:fit/presentation/first_category/first_category_view_model.dart';
import 'package:fit/presentation/global_components/add_fab.dart';
import 'package:fit/presentation/global_components/gradient_app_bar.dart';
import 'package:fit/presentation/home/components/to_route_button.dart';
import 'package:fit/routes/app_routes.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';

import '../../di/di_setup.dart';
import '../global_components/swap_button.dart';
import '../global_components/swap_snack_bar.dart';

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
          return Scaffold(
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
            body: Consumer<FirstCategoryViewModel>(
              builder: (context, provider, child) => SizedBox.expand(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom),
                  child: Column(
                    children: [
                      GradientAppBar(
                        center: Text(
                          toUpperCaseOnlyFirstLetter(clothType.name),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        end: Consumer<FirstCategoryViewModel>(
                          builder: (context, provider, _) {
                            return SwapButton(
                              onTap: () {
                                provider.enableReorder =
                                    !provider.enableReorder;
                                SwapSnackBar.showSnackBar(
                                    context, provider.enableReorder);
                              },
                              reorder: provider.enableReorder,
                            );
                          },
                        ),
                      ),
                      ReorderableWrap(
                        buildDraggableFeedback: (BuildContext context,
                                BoxConstraints constraints, Widget child) =>
                            Material(
                          elevation: 6.0,
                          color: Colors.transparent,
                          borderRadius: BorderRadius.zero,
                          child: child,
                        ),
                        padding: const EdgeInsets.all(30),
                        spacing: 20,
                        runSpacing: 20,
                        enableReorder: provider.enableReorder,
                        onReorder: (oldIndex, newIndex) =>
                            viewModel.reorderClothCategory(oldIndex, newIndex),
                        children: _getRouteButtons(context, viewModel),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  List<Widget> _getRouteButtons(
      BuildContext context, FirstCategoryViewModel viewModel) {
    List<Widget> buttonList = [];

    for (var category in viewModel.categories) {
      buttonList.add(
        SizedBox(
          width: 125,
          height: 125,
          child: ToRouteButton(
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
                        return _getLongPressDialog(
                            context, viewModel, category);
                      },
                    );
                  }
                : null,
            name: category.title,
            center: const SizedBox.shrink(),
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
            child: const Text('이름 수정'),
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
            child: const Text('삭제'),
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
          child: const Text('닫기'),
        ),
      ],
    );
  }

  AlertDialog _getDeleteDialog(BuildContext context,
      FirstCategoryViewModel provider, ClothCategory category) {
    return AlertDialog(
      content: Text('${category.title} 내부의 데이터도 같이 삭제됩니다. 삭제하시겠습니까?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            '취소',
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
            '삭제',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}

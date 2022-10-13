import 'package:fit/presentation/first_category/components/add_category_dialog.dart';
import 'package:fit/presentation/first_category/components/to_cloth_list_screen_route_button.dart';
import 'package:fit/presentation/first_category/first_category_view_model.dart';
import 'package:fit/routes/app_routes.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../di/di_setup.dart';

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
              floatingActionButton: SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AddCategoryDialog(
                            pageClothType: clothType,
                            firstCategoryViewModel: viewModel,
                          );
                        });
                  },
                  child: const Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
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
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Consumer<FirstCategoryViewModel>(
                  builder: (context, provider, child) => GridView.builder(
                    itemCount: provider.categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: ToClothListScreenRouteButton(
                          onTap: () {
                            int categoryId = provider.categories[index].id;
                            context.push('${AppRoutes.topList}/$categoryId');
                          },
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return _getLongPressDialog(
                                    context, provider, index);
                              },
                            );
                          },
                          child: Text(
                            provider.categories[index].title,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200),
                  ),
                ),
              ),
            ),
          );
        });
  }

  AlertDialog _getLongPressDialog(
      BuildContext context, FirstCategoryViewModel provider, int index) {
    return AlertDialog(
      content: Row(
        children: [
          CupertinoButton(
            child: Text('이름 수정'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AddCategoryDialog(
                      pageClothType: clothType,
                      firstCategoryViewModel: provider,
                      isEditMode: true,
                      clothCategory: provider.categories[index],
                    );
                  });
            },
          ),
          CupertinoButton(
            child: Text('삭제'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return _getDeleteDialog(context, provider, index);
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
          child: Text('닫기'),
        ),
      ],
    );
  }

  AlertDialog _getDeleteDialog(
      BuildContext context, FirstCategoryViewModel provider, int index) {
    return AlertDialog(
      content: Text(
          '${provider.categories[index].title} 내부의 데이터도 같이 삭제됩니다. 삭제하시겠습니까?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            '취소',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        TextButton(
          onPressed: () {
            provider.deleteClothCategory(provider.categories[index]);
            // TODO: 내부 데이터도 싹 다 삭제
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          child: Text(
            '삭제',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}

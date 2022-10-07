import 'package:fit/presentation/first_category/components/add_category_dialog.dart';
import 'package:fit/presentation/first_category/components/to_table_screen_route_button.dart';
import 'package:fit/presentation/first_category/first_category_view_model.dart';
import 'package:fit/util/type/cloth_type.dart';
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
                            clothType: clothType,
                            viewModel: viewModel,
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
                  builder: (context, provider, child) => ListView.separated(
                    itemCount: provider.categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: ToTableScreenRouteButton(
                          child: Text(provider.categories[index].title),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 50,);
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }
}

import 'package:fit/di/di_setup.dart';
import 'package:fit/presentation/global_components/add_fab.dart';
import 'package:fit/presentation/global_components/cloth_table_header.dart';
import 'package:fit/presentation/global_components/swap_button.dart';
import 'package:fit/presentation/outer_list/outer_list_view_model.dart';
import 'package:fit/util/size_value.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../routes/app_routes.dart';
import '../../util/type/cloth_type.dart';
import '../global_components/delete_mode_snack_bar.dart';
import '../global_components/gradient_app_bar.dart';
import '../global_components/swap_snack_bar.dart';
import 'compoenets/add_outer_dialog.dart';
import 'compoenets/outer_item.dart';

class OuterListScreen extends StatelessWidget {
  const OuterListScreen({Key? key, required this.categoryId}) : super(key: key);

  final int categoryId;
  static const double _tablePadding = 4;
  static const double _tableFontSize = 16;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<OuterListViewModel>(),
      builder: (context, __) {
        final viewModel = context.read<OuterListViewModel>();
        viewModel.loadOuters(categoryId);
        return Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: false,
              floatingActionButton: AddFAB(
                onPressed: () async {
                  final String categoryTitle =
                      await viewModel.getCategoryTitle(categoryId);
                  if (context.mounted) {
                    context.push(
                        '${AppRoutes.addClothScreen}/$categoryId/${ClothType.outer.name}/$categoryTitle/null');
                  }
                },
              ),
              body: Consumer<OuterListViewModel>(
                builder: (context, provider, _) => Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom),
                  child: Column(
                    children: [
                      GradientAppBar(
                        center: FutureBuilder<String>(
                          future: context
                              .read<OuterListViewModel>()
                              .getCategoryTitle(categoryId),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              );
                            } else {
                              return const Text('');
                            }
                          },
                        ),
                        end: Consumer<OuterListViewModel>(
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
                      _getTableHeader(),
                      Flexible(
                        child: ReorderableListView(
                          buildDefaultDragHandles: provider.enableReorder,
                          onReorder: (oldIndex, newIndex) =>
                              provider.reorderOuter(oldIndex, newIndex),
                          children: _getOuterItems(context, provider),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Consumer<OuterListViewModel>(
              builder: (context, provider, _) => DeleteModeSnackBar(
                onTap: provider.isLongPressed
                    ? () {
                        provider.isLongPressed = false;
                      }
                    : null,
                height: !provider.isLongPressed ? 0 : SizeValue.appBarHeight,
                transform: Matrix4.translationValues(
                    0, provider.isLongPressed ? 0 : SizeValue.appBarHeight, 0),
                text: '삭제 모드 해제',
                textColor:
                    provider.isLongPressed ? Colors.black : Colors.transparent,
              ),
            ),
          ],
        );
      },
    );
  }

  List<OuterItem> _getOuterItems(
      BuildContext context, OuterListViewModel viewModel) {
    List<OuterItem> outerItemList = [];

    for (int i = 0; i < viewModel.outers.length; i++) {
      outerItemList.add(
        OuterItem(
          key: ValueKey(i),
          outer: viewModel.outers[i],
          index: i,
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => AddOuterDialog(
                outerListViewModel: viewModel,
                categoryId: categoryId,
                isEditMode: true,
                outer: viewModel.outers[i],
              ),
            );
          },
          onLongPress: !viewModel.enableReorder
              ? () {
                  viewModel.isLongPressed = true;
                }
              : null,
        ),
      );
    }

    return outerItemList;
  }

  Widget _getTableHeader() {
    return const ClothTableHeader(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 3,
            child: ClothTableHeaderText(
              fontSize: _tableFontSize,
              text: "이름",
            ),
          ),
          ClothTableHeaderDivider(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(_tablePadding),
              child: ClothTableHeaderText(
                fontSize: _tableFontSize,
                text: "총장",
              ),
            ),
          ),
          ClothTableHeaderDivider(),
          Expanded(
            child: ClothTableHeaderText(
              fontSize: _tableFontSize,
              text: "어깨\n너비",
            ),
          ),
          ClothTableHeaderDivider(),
          Expanded(
            child: ClothTableHeaderText(
              fontSize: _tableFontSize,
              text: "가슴\n단면",
            ),
          ),
          ClothTableHeaderDivider(),
          Expanded(
            child: ClothTableHeaderText(
              fontSize: _tableFontSize,
              text: "소매\n길이",
            ),
          ),
          SizedBox(
            width: 7.5,
          ),
        ],
      ),
    );
  }
}

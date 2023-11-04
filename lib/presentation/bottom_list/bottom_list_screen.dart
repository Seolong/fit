import 'package:fit/di/di_setup.dart';
import 'package:fit/presentation/global_components/add_fab.dart';
import 'package:fit/presentation/global_components/cloth_table_header.dart';
import 'package:fit/presentation/global_components/swap_button.dart';
import 'package:fit/presentation/global_components/delete_mode_snack_bar.dart';
import 'package:fit/presentation/global_components/swap_snack_bar.dart';
import 'package:fit/util/size_value.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../routes/app_routes.dart';
import '../../util/type/cloth_type.dart';
import '../global_components/gradient_app_bar.dart';
import 'bottom_list_view_model.dart';
import 'components/add_bottom_dialog.dart';
import 'components/bottom_item.dart';

class BottomListScreen extends StatelessWidget {
  const BottomListScreen({Key? key, required this.categoryId})
      : super(key: key);

  final int categoryId;
  static const double _tablePadding = 4;
  static const double _tableFontSize = 13.5;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<BottomListViewModel>(),
      builder: (context, __) {
        final viewModel = context.read<BottomListViewModel>();
        viewModel.loadBottoms(categoryId);
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
                        '${AppRoutes.addClothScreen}/$categoryId/${ClothType.bottom.name}/$categoryTitle/null');
                  }
                },
              ),
              body: Consumer<BottomListViewModel>(
                builder: (context, provider, _) => Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom),
                  child: Column(
                    children: [
                      GradientAppBar(
                        center: FutureBuilder<String>(
                          future: context
                              .read<BottomListViewModel>()
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
                        end: Consumer<BottomListViewModel>(
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
                              provider.reorderBottom(oldIndex, newIndex),
                          children: _getBottomItems(context, provider),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Consumer<BottomListViewModel>(
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

  List<BottomItem> _getBottomItems(
      BuildContext context, BottomListViewModel viewModel) {
    List<BottomItem> bottomItemList = [];

    for (int i = 0; i < viewModel.bottoms.length; i++) {
      bottomItemList.add(
        BottomItem(
          key: ValueKey(i),
          bottom: viewModel.bottoms[i],
          index: i,
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => AddBottomDialog(
                bottomListViewModel: viewModel,
                categoryId: categoryId,
                isEditMode: true,
                bottom: viewModel.bottoms[i],
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

    return bottomItemList;
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
              text: '이름',
            ),
          ),
          ClothTableHeaderDivider(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(_tablePadding),
              child: ClothTableHeaderText(
                fontSize: _tableFontSize,
                text: '총장',
              ),
            ),
          ),
          ClothTableHeaderDivider(),
          Expanded(
            child: ClothTableHeaderText(
              fontSize: _tableFontSize,
              text: '허리\n단면',
            ),
          ),
          ClothTableHeaderDivider(),
          Expanded(
            child: ClothTableHeaderText(
              fontSize: _tableFontSize,
              text: '허벅지\n단면',
            ),
          ),
          ClothTableHeaderDivider(),
          Expanded(
            child: ClothTableHeaderText(
              fontSize: _tableFontSize,
              text: '밑위',
            ),
          ),
          ClothTableHeaderDivider(),
          Expanded(
            child: ClothTableHeaderText(
              fontSize: _tableFontSize,
              text: '밑단',
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

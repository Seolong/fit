import 'package:fit/di/di_setup.dart';
import 'package:fit/presentation/global_components/add_fab.dart';
import 'package:fit/presentation/global_components/swap_button.dart';
import 'package:fit/presentation/global_components/top_snack_bar.dart';
import 'package:fit/util/size_value.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'bottom_list_view_model.dart';
import 'components/add_bottom_dialog.dart';
import 'components/bottom_item.dart';

class BottomListScreen extends StatelessWidget {
  const BottomListScreen({Key? key, required this.categoryId})
      : super(key: key);

  final int categoryId;
  static const double _tablePadding = 4;
  static const double _tableFontSize = 12;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<BottomListViewModel>(),
      builder: (context, __) {
        final viewModel = context.read<BottomListViewModel>();
        viewModel.loadBottoms(categoryId);
        return Stack(
          children: [
            SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                floatingActionButton: AddFAB(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AddBottomDialog(
                        bottomListViewModel: viewModel,
                        categoryId: categoryId,
                      ),
                    );
                  },
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
                  title: FutureBuilder<String>(
                    future: context
                        .read<BottomListViewModel>()
                        .getCategoryTitle(categoryId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data!);
                      } else {
                        return const Text('');
                      }
                    },
                  ),
                  actions: [
                    Consumer<BottomListViewModel>(
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
                body: Consumer<BottomListViewModel>(
                  builder: (context, provider, _) => Column(
                    children: [
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
              builder: (context, provider, _) => TopSnackBar(
                onTap: provider.isLongPressed
                    ? () {
                        provider.isLongPressed = false;
                      }
                    : null,
                height: !provider.isLongPressed ? 0 : SizeValue.appBarHeight,
                transform: Matrix4.translationValues(
                    0, provider.isLongPressed ? 0 : -SizeValue.appBarHeight, 0),
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

  Container _getTableHeader() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.grey[100],
          border: const Border(bottom: BorderSide(width: 0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Expanded(
              flex: 3,
              child: Text(
                '이름',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: _tableFontSize),
              )),
          VerticalDivider(
            color: Colors.black,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(_tablePadding),
              child: Text(
                '총장',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: _tableFontSize),
              ),
            ),
          ),
          VerticalDivider(
            color: Colors.black,
          ),
          Expanded(
            child: Text(
              '허리\n단면',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: _tableFontSize),
            ),
          ),
          VerticalDivider(
            color: Colors.black,
          ),
          Expanded(
            child: Text(
              '허벅지\n단면',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: _tableFontSize),
            ),
          ),
          VerticalDivider(
            color: Colors.black,
          ),
          Expanded(
            child: Text(
              '밑위',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: _tableFontSize),
            ),
          ),
          VerticalDivider(
            color: Colors.black,
          ),
          Expanded(
            child: Text(
              '밑단',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: _tableFontSize),
            ),
          ),
        ],
      ),
    );
  }
}

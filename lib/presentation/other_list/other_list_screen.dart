import 'package:fit/di/di_setup.dart';
import 'package:fit/presentation/global_components/add_fab.dart';
import 'package:fit/presentation/global_components/swap_button.dart';
import 'package:fit/presentation/other_list/components/add_other_dialog.dart';
import 'package:fit/presentation/other_list/components/other_item.dart';
import 'package:fit/presentation/other_list/other_list_view_model.dart';
import 'package:fit/util/size_value.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../global_components/top_snack_bar.dart';

class OtherListScreen extends StatelessWidget {
  const OtherListScreen({Key? key, required this.categoryId}) : super(key: key);

  final int categoryId;
  static const double _tablePadding = 4;
  static const double _tableFontSize = 12;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<OtherListViewModel>(),
      builder: (context, __) {
        final viewModel = context.read<OtherListViewModel>();
        viewModel.loadOthers(categoryId);
        return Stack(
          children: [
            SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                floatingActionButton: AddFAB(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AddOtherDialog(
                        otherListViewModel: viewModel,
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
                        .read<OtherListViewModel>()
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
                    Consumer<OtherListViewModel>(
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
                body: Consumer<OtherListViewModel>(
                  builder: (context, provider, _) => Column(
                    children: [
                      _getTableHeader(),
                      Flexible(
                        child: ReorderableListView(
                          buildDefaultDragHandles: provider.enableReorder,
                          onReorder: (oldIndex, newIndex) =>
                              provider.reorderOther(oldIndex, newIndex),
                          children: _getOtherItems(context, provider),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Consumer<OtherListViewModel>(
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

  List<OtherItem> _getOtherItems(
      BuildContext context, OtherListViewModel viewModel) {
    List<OtherItem> otherItemList = [];

    for (int i = 0; i < viewModel.others.length; i++) {
      otherItemList.add(
        OtherItem(
          key: ValueKey(i),
          other: viewModel.others[i],
          index: i,
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => AddOtherDialog(
                otherListViewModel: viewModel,
                categoryId: categoryId,
                isEditMode: true,
                other: viewModel.others[i],
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

    return otherItemList;
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
              flex: 2,
              child: Text(
                '이름',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: _tableFontSize),
              )),
          VerticalDivider(
            color: Colors.black,
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(_tablePadding),
              child: Text(
                '세부사항',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: _tableFontSize),
              ),
            ),
          ),
          SizedBox(width: 7.5,),
        ],
      ),
    );
  }
}

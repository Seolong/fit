import 'package:fit/di/di_setup.dart';
import 'package:fit/presentation/global_components/add_fab.dart';
import 'package:fit/presentation/global_components/swap_button.dart';
import 'package:fit/presentation/global_components/top_snack_bar.dart';
import 'package:fit/presentation/top_list/components/add_top_dialog.dart';
import 'package:fit/presentation/top_list/components/top_item.dart';
import 'package:fit/presentation/top_list/top_list_view_model.dart';
import 'package:fit/util/size_value.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TopListScreen extends StatelessWidget {
  const TopListScreen({Key? key, required this.categoryId}) : super(key: key);

  final int categoryId;
  static const double _tablePadding = 4;
  static const double _tableFontSize = 12;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<TopListViewModel>(),
      builder: (context, __) {
        final viewModel = context.read<TopListViewModel>();
        viewModel.loadTops(categoryId);
        return Stack(
          children: [
            SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                floatingActionButton: AddFAB(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AddTopDialog(
                        topListViewModel: viewModel,
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
                        .read<TopListViewModel>()
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
                    Consumer<TopListViewModel>(
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
                body: Consumer<TopListViewModel>(
                  builder: (context, provider, _) => Column(
                    children: [
                      _getTableHeader(),
                      Flexible(
                        child: ReorderableListView(
                          buildDefaultDragHandles: provider.enableReorder,
                          onReorder: (oldIndex, newIndex) =>
                              provider.reorderTop(oldIndex, newIndex),
                          children: _getTopItems(context, provider),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Consumer<TopListViewModel>(
              builder: (context, provider, _) => TopSnackBar(
                onTap: provider.isLongPressed
                    ? () {
                        provider.isLongPressed = false;
                      }
                    : null,
                height: !provider.isLongPressed ? 0 : SizeValue.appBarHeight,
                transform: Matrix4.translationValues(
                    0, provider.isLongPressed ? 0 : -SizeValue.appBarHeight, 0),
                text: '?????? ?????? ??????',
                textColor:
                    provider.isLongPressed ? Colors.black : Colors.transparent,
              ),
            ),
          ],
        );
      },
    );
  }

  List<TopItem> _getTopItems(BuildContext context, TopListViewModel viewModel) {
    List<TopItem> topItemList = [];

    for (int i = 0; i < viewModel.tops.length; i++) {
      topItemList.add(
        TopItem(
          key: ValueKey(i),
          top: viewModel.tops[i],
          index: i,
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => AddTopDialog(
                topListViewModel: viewModel,
                categoryId: categoryId,
                isEditMode: true,
                top: viewModel.tops[i],
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

    return topItemList;
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
                '??????',
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
                '??????',
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
              '????????????',
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: _tableFontSize),
            ),
          ),
          VerticalDivider(
            color: Colors.black,
          ),
          Expanded(
            child: Text(
              '????????????',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: _tableFontSize),
            ),
          ),
          VerticalDivider(
            color: Colors.black,
          ),
          Expanded(
            child: Text(
              '????????????',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: _tableFontSize),
            ),
          ),
          SizedBox(width: 7.5,),
        ],
      ),
    );
  }
}

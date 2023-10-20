import 'dart:ui';

import 'package:fit/di/di_setup.dart';
import 'package:fit/presentation/global_components/gradient_app_bar.dart';
import 'package:fit/presentation/global_components/add_fab.dart';
import 'package:fit/presentation/global_components/swap_button.dart';
import 'package:fit/presentation/other_list/components/add_other_dialog.dart';
import 'package:fit/presentation/other_list/components/other_item.dart';
import 'package:fit/presentation/other_list/other_list_view_model.dart';
import 'package:fit/routes/app_routes.dart';
import 'package:fit/util/colors.dart';
import 'package:fit/util/size_value.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../global_components/delete_mode_snack_bar.dart';

class OtherListScreen extends StatelessWidget {
  const OtherListScreen({Key? key, required this.categoryId}) : super(key: key);

  final int categoryId;
  static const double _tablePadding = 4;
  static const double _tableFontSize = 16;
  static const Color _tableTextColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<OtherListViewModel>(),
      builder: (context, __) {
        final viewModel = context.read<OtherListViewModel>();
        viewModel.loadOthers(categoryId);
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
                        '${AppRoutes.addClothScreen}/$categoryId/${ClothType.other.name}/$categoryTitle');
                  }
                },
              ),
              body: Consumer<OtherListViewModel>(
                builder: (context, provider, _) => Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom),
                  child: Column(
                    children: [
                      GradientAppBar(
                        center: FutureBuilder<String>(
                          future: context
                              .read<OtherListViewModel>()
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
                        end: Consumer<OtherListViewModel>(
                          builder: (context, provider, _) {
                            return SwapButton(
                              onTap: () {
                                provider.enableReorder =
                                    !provider.enableReorder;
                              },
                              reorder: provider.enableReorder,
                            );
                          },
                        ),
                      ),
                      _createTableHeader(),
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

  List<OtherItem> _getOtherItems(
      BuildContext context, OtherListViewModel viewModel) {
    List<OtherItem> otherItemList = [];

    for (int i = 0; i < viewModel.others.length; i++) {
      otherItemList.add(
        OtherItem(
          key: ValueKey(i),
          other: viewModel.others[i],
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

  Widget _createTableHeader() {
    return Stack(
      children: [
        Container(
          height: 60,
          decoration: const BoxDecoration(
            color: CustomColor.skyBlue,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  flex: 2,
                  child: Text(
                    '이름',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: _tableFontSize,
                        color: _tableTextColor,
                        fontWeight: FontWeight.bold),
                  )),
              VerticalDivider(
                color: Colors.white,
                thickness: 1.5,
                indent: 18,
                endIndent: 18,
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(_tablePadding),
                  child: Text(
                    '세부사항',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: _tableFontSize,
                        color: _tableTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: 7.5,
              ),
            ],
          ),
        ),
        Positioned(
            child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              height: 10,
              width: double.infinity,
              color: Colors.black.withOpacity(0),
            ),
          ),
        ))
      ],
    );
  }
}

import 'package:fit/domain/model/cloth/top.dart';
import 'package:fit/presentation/cloth_detail/components/delete_dialog.dart';
import 'package:fit/presentation/cloth_detail/components/detail_content/detail_content.dart';
import 'package:fit/presentation/cloth_detail/components/detail_content/view_model/top_detail_view_model.dart';
import 'package:fit/presentation/cloth_detail/components/fab_column.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../di/di_setup.dart';
import '../../../../routes/app_routes.dart';
import '../../../../util/type/cloth_type.dart';
import '../detail_row.dart';
import '../item_column.dart';

class TopDetailContent implements DetailContent {
  @override
  Widget buildNameText(BuildContext context, int id) {
    return ChangeNotifierProvider(
        create: (_) => getIt<TopDetailViewModel>(),
        builder: (context, __) {
          final viewModel = context.watch<TopDetailViewModel>();
          return FutureBuilder<Top>(
              future: viewModel.getTop(id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              });
        });
  }

  @override
  Widget buildSizeContent(BuildContext context, int id) {
    return ChangeNotifierProvider(
        create: (_) => getIt<TopDetailViewModel>(),
        builder: (context, __) {
          final viewModel = context.watch<TopDetailViewModel>();
          return FutureBuilder<Top>(
              future: viewModel.getTop(id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      DetailRow(children: [
                        ItemColumn(
                            name: '총장', size: snapshot.data!.totalLength),
                        ItemColumn(
                            name: '어깨너비', size: snapshot.data!.shoulderWidth),
                      ]),
                      DetailRow(children: [
                        ItemColumn(
                            name: '가슴단면', size: snapshot.data!.chestWidth),
                        ItemColumn(
                            name: '소매길이', size: snapshot.data!.sleeveLength),
                      ])
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              });
        });
  }

  @override
  Widget buildFabColumn(BuildContext context, int id) {
    return ChangeNotifierProvider(
      create: (_) => getIt<TopDetailViewModel>(),
      builder: (context, __) {
        final viewModel = context.read<TopDetailViewModel>();
        return FabColumn(
          deletePressed: () async {
            final String? callBack = await showDialog(
                context: context,
                builder: (BuildContext context) => const DeleteDialog());
            if (callBack == 'delete') {
              await viewModel.deleteTopById(id);
              if (context.mounted) {
                context.pop();
              }
            }
          },
          editPressed: () async {
            //TODO
            final Top top = await viewModel.getTop(id);
            if(context.mounted) {
              context.push(
                  '${AppRoutes.addClothScreen}/${top.categoryId}/${ClothType.top
                      .name}/${top.name} 수정/$id');
            }
          },
        );
      },
    );
  }
}

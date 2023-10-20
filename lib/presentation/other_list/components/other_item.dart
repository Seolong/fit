import 'package:fit/presentation/global_components/cloth_table_row_content.dart';
import 'package:fit/presentation/global_components/trash_can_button.dart';
import 'package:fit/presentation/other_list/other_list_view_model.dart';
import 'package:fit/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/cloth/other.dart';

class OtherItem extends StatelessWidget {
  static const double _tablePadding = 4;
  static const double _tableFontSize = 14;

  final Other other;

  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  late final String name;
  late final String details;

  OtherItem({
    required this.other,
    required this.onTap,
    required this.onLongPress,
    Key? key,
  }) : super(key: key) {
    name = other.name;
    details = other.details;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TrashCanButton(onTap: () {
          context.read<OtherListViewModel>().deleteOther(other);
        }),
        ClothTableRowContent(
            onTap: onTap,
            onLongPress: onLongPress,
            isLongPressed: context.read<OtherListViewModel>().isLongPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    flex: 2,
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: _tableFontSize,
                          fontWeight: FontWeight.w700,
                          color: CustomColor.mainBlue),
                    )),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(_tablePadding),
                    child: Text(
                      details,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: _tableFontSize),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 7.5,
                ),
              ],
            )),
      ],
    );
  }
}

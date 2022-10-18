import 'package:fit/presentation/top_list/top_list_view_model.dart';
import 'package:fit/util/string_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/cloth/top.dart';

class TopItem extends StatelessWidget {
  static const double _tablePadding = 4;
  static const double _tableFontSize = 12;

  final Top top;
  final int index;
  final VoidCallback onTap;
  late final String name;
  late final double total;
  late final double shoulder;
  late final double chest;
  late final double sleeve;

  TopItem({
    required this.top,
    required this.index,
    required this.onTap,
    super.key,
  }) {
    name = top.name;
    total = top.totalLength;
    shoulder = top.shoulderWidth;
    chest = top.chestWidth;
    sleeve = top.sleeveLength;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            context.read<TopListViewModel>().deleteTop(top);
          },
          child: const SizedBox(
            width: 60,
            height: 60,
            child: Icon(
              Icons.delete,
              size: 36,
              color: Colors.red,
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          onLongPress: () {
            context.read<TopListViewModel>().isLongPressed = true;
          },
          child: AnimatedContainer(
            height: 60,
            color: index % 2 == 0 ? Colors.white : Colors.grey[100],
            duration: const Duration(milliseconds: 500),
            transform: Matrix4.translationValues(
                context.read<TopListViewModel>().isLongPressed ? 65 : 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    flex: 3,
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: _tableFontSize),
                    )),
                const VerticalDivider(
                  color: Colors.black,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(_tablePadding),
                    child: Text(
                      total.toNoDotZeroNumString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: _tableFontSize),
                    ),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.black,
                ),
                Expanded(
                  child: Text(
                    shoulder.toNoDotZeroNumString(),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: _tableFontSize),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.black,
                ),
                Expanded(
                  child: Text(
                    chest.toNoDotZeroNumString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: _tableFontSize),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.black,
                ),
                Expanded(
                  child: Text(
                    sleeve.toNoDotZeroNumString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: _tableFontSize),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

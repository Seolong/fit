import 'package:fit/util/string_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/cloth/bottom.dart';
import '../bottom_list_view_model.dart';

class BottomItem extends StatelessWidget {
  static const double _tablePadding = 4;
  static const double _tableFontSize = 12;

  final Bottom bottom;
  /// 테이블 열 색 구분용
  final int index;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  late final String name;
  late final double total;
  late final double waist;
  late final double thigh;
  late final double rise;
  late final double legOpening;

  BottomItem({
    required this.bottom,
    required this.index,
    required this.onTap,
    required this.onLongPress,
    Key? key,
  }) : super(key: key){
    name = bottom.name;
    total = bottom.totalLength;
    waist = bottom.waist;
    thigh = bottom.thigh;
    rise = bottom.rise;
    legOpening = bottom.legOpening;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            context.read<BottomListViewModel>().deleteBottom(bottom);
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
          onLongPress: onLongPress,
          child: AnimatedContainer(
            height: 60,
            color: index % 2 == 0 ? Colors.white : Colors.grey[100],
            duration: const Duration(milliseconds: 500),
            transform: Matrix4.translationValues(
                context.read<BottomListViewModel>().isLongPressed ? 65 : 0, 0, 0),
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
                    waist.toNoDotZeroNumString(),
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
                    thigh.toNoDotZeroNumString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: _tableFontSize),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.black,
                ),
                Expanded(
                  child: Text(
                    rise.toNoDotZeroNumString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: _tableFontSize),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.black,
                ),
                Expanded(
                  child: Text(
                    legOpening.toNoDotZeroNumString(),
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

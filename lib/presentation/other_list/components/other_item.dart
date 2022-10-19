import 'package:fit/presentation/other_list/other_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/cloth/other.dart';

class OtherItem extends StatelessWidget {
  static const double _tablePadding = 4;
  static const double _tableFontSize = 12;

  final Other other;
  /// 테이블 열 색 구분용
  final int index;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  late final String name;
  late final String details;

  OtherItem({
    required this.other,
    required this.index,
    required this.onTap,
    required this.onLongPress,
    Key? key,
  }) : super(key: key){
    name = other.name;
    details = other.details;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            context.read<OtherListViewModel>().deleteOther(other);
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
                context.read<OtherListViewModel>().isLongPressed ? 65 : 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    flex: 2,
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: _tableFontSize),
                    )),
                const VerticalDivider(
                  color: Colors.black,
                ),
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}

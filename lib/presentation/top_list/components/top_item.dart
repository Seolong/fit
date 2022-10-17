import 'package:flutter/material.dart';

import '../../../domain/model/cloth/top.dart';

class TopItem extends StatelessWidget {
  static const double _tablePadding = 4;
  static const double _tableFontSize = 12;

  final Top top;
  final int index;
  late final String name;
  late final double total;
  late final double shoulder;
  late final double chest;
  late final double sleeve;

  TopItem(this.top, this.index, {super.key}){
    name = top.name;
    total = top.totalLength;
    shoulder = top.shoulderWidth;
    chest = top.chestWidth;
    sleeve = top.sleeveLength;
  }

  bool isDotZeroNumber(double value) {
    int toCompareValue = value.ceil();
    if(value == toCompareValue){
      return true;
    }
    return false;
  }

  String getNoDotZeroNumber(double value){
    if(isDotZeroNumber(value)){
      return '${value.ceil()}';
    }
    return '$value';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: index%2 == 0 ? Colors.white: Colors.grey[100],
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
                getNoDotZeroNumber(total),
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
              getNoDotZeroNumber(shoulder),
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
              getNoDotZeroNumber(chest),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: _tableFontSize),
            ),
          ),
          const VerticalDivider(
            color: Colors.black,
          ),
          Expanded(
            child: Text(
              getNoDotZeroNumber(sleeve),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: _tableFontSize),
            ),
          ),
        ],
      ),
    );
  }
}

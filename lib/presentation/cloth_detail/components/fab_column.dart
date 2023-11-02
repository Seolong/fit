import 'package:flutter/material.dart';

import '../../../util/size_value.dart';

class FabColumn extends StatelessWidget {
  const FabColumn({Key? key, required this.deletePressed, required this.editPressed}) : super(key: key);
  final VoidCallback deletePressed;
  final VoidCallback editPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: ButtonSize.medium,
          height: ButtonSize.medium,
          child: FloatingActionButton(
            heroTag: 'delete',
            backgroundColor: Colors.grey[400],
            onPressed: deletePressed,
            child: const Icon(
              Icons.delete_rounded,
              color: Colors.white,
              size: ButtonSize.small,
            ),
          ),
        ),
        const SizedBox(height: 14,),
        SizedBox(
          width: ButtonSize.medium,
          height: ButtonSize.medium,
          child: FloatingActionButton(
            heroTag: 'edit',
            onPressed: editPressed,
            child: const Icon(
              Icons.edit_rounded,
              color: Colors.white,
              size: ButtonSize.small,
            ),
          ),
        ),
      ],
    );
  }
}

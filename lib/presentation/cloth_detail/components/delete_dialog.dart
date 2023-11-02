import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(20),
      actionsPadding: const EdgeInsets.only(right: 12),
      content: const Text('정말 삭제하시겠습니까?', style: TextStyle(fontSize: 14),),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'cancel'),
          child: const Text('취소'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'delete'),
          child: const Text('삭제'),
        ),
      ],
    );
  }
}

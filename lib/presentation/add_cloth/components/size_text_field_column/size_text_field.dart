import 'package:fit/util/colors.dart';
import 'package:flutter/material.dart';

class SizeTextField extends StatefulWidget {
  const SizeTextField({
    Key? key,
    required this.title,
    required this.textEditingController,
    this.isLast = false,
  }) : super(key: key);

  final String title;
  final TextEditingController textEditingController;
  final bool isLast;

  @override
  State<SizeTextField> createState() => _SizeTextFieldState();
}

class _SizeTextFieldState extends State<SizeTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, bottom: 5, top: 5),
          child: Text(
            widget.title,
            style: const TextStyle(color: CustomColor.mainBlue, fontSize: 16),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey[350]!,
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: const Offset(0.0, 3), // shadow direction: bottom right
            )
          ]),
          child: TextField(
            textInputAction: widget.isLast ? TextInputAction.done: TextInputAction.next,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(width: 1, color: CustomColor.mainBlue),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(width: 1, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

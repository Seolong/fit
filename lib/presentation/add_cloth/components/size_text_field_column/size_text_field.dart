import 'package:fit/util/colors.dart';
import 'package:flutter/material.dart';

class SizeTextField extends StatefulWidget {
  const SizeTextField({
    Key? key,
    required this.title,
    required this.textEditingController,
    this.isLast = false,
    this.inputType = TextInputType.text,
    this.initialValue,
  }) : super(key: key);

  final String title;
  final TextEditingController textEditingController;
  final bool isLast;
  final TextInputType inputType;
  final String? initialValue;

  @override
  State<SizeTextField> createState() => _SizeTextFieldState();
}

class _SizeTextFieldState extends State<SizeTextField> {
  Widget? suffixIcon;
  late Widget clearButton;

  @override
  void initState() {
    super.initState();
    clearButton = IconButton(
      icon: const Icon(
        Icons.clear,
        color: Colors.grey,
      ),
      onPressed: () {
        widget.textEditingController.clear();
        setState(() {
          suffixIcon = null;
        });
      },
    );
    if (widget.initialValue != null) {
      widget.textEditingController.text = widget.initialValue!;
      suffixIcon = clearButton;
    }
  }

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
            controller: widget.textEditingController,
            textInputAction:
                widget.isLast ? TextInputAction.done : TextInputAction.next,
            keyboardType: widget.inputType,
            onChanged: (text) {
              if (text.isNotEmpty) {
                if (suffixIcon == null) {
                  setState(() {
                    suffixIcon = clearButton;
                  });
                }
              } else {
                setState(() {
                  suffixIcon = null;
                });
              }
            },
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 1, color: CustomColor.mainBlue),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 1, color: Colors.white),
                ),
                suffixIcon: suffixIcon),
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../Theme/colors.dart';

class SearchTextFiled extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const SearchTextFiled({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  _SearchTextFiledState createState() => _SearchTextFiledState();
}

class _SearchTextFiledState extends State<SearchTextFiled> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
          focusNode: focusNode,
          cursorColor: AppColor.primaryColor,
          style: const TextStyle(
              color: Colors.grey, fontSize: 15, fontFamily: "Onest"),
          onChanged: (value) {
            widget.onChanged(value);
          },
          decoration: InputDecoration(
              isCollapsed: true,
              // suffixIcon: ,
              prefixIcon: const Padding(
                padding: EdgeInsets.all(15),
                child: ImageIcon(AssetImage('assets/icons/icon.png'), size: 10),
              ),
              suffixIcon: const Padding(
                padding: EdgeInsets.all(15),
                child: ImageIcon(AssetImage('assets/icons/filter.png')),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: AppColor.skyL),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: AppColor.skyL),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: AppColor.skyL),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: AppColor.red),
              ),
              filled: true,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontFamily: "Lato",
              ),
              hintText: "Search",
              fillColor: const Color(0xFFF6F8FE),
              contentPadding: const EdgeInsets.only(
                  left: 25, top: 20, bottom: 20, right: 0))),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

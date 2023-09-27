// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../AppText/AppTextView.dart';
import '../Theme/colors.dart';

class PrimaryTextField extends StatefulWidget {
  final bool isPass;
  final bool isEmail;
  final bool isPadding;
  final bool isPhone;
  final String hintText;
  final String headingText;
  final String errorText;
  final double width;
  bool isName;
  bool readOnly;
  bool isOptional;
  int maxLine;
  VoidCallback? callback;

  Function(String?)? validation;
  double borderRadius;

  final Function(String value) onChange;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final String isSuffix;
  TextCapitalization textCapitalization;
  PrimaryTextField({
    Key? key,
    required this.isPass,
    required this.onChange,
    this.isPadding = true,
    this.keyBoardType = TextInputType.text,
    this.isPhone = false,
    this.isEmail = false,
    this.readOnly = false,
    this.isOptional = false,
    this.isName = false,
    required this.hintText,
    required this.errorText,
    required this.width,
    required this.controller,
    this.callback,
    required this.headingText,
    this.borderRadius = 24,
    this.maxLine = 1,
    this.isSuffix = "",
    this.validation,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  _PrimaryTextFieldState createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    if (widget.isPass) {
      _showPassword = true;
    }
  }

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.headingText.isEmpty
              ? const SizedBox.shrink()
              : CustomText(
                  title: widget.headingText,
                  color: AppColor.black,
                  alignment: TextAlign.center,
                  fontWeight: FontWeights.regular,
                  size: 14),
          widget.headingText.isEmpty
              ? const SizedBox.shrink()
              : const SizedBox(
                  height: 10,
                ),
          TextFormField(
              textCapitalization: widget.textCapitalization,
              readOnly: widget.readOnly,
              maxLines: widget.maxLine,
              controller: widget.controller,
              obscureText: _showPassword,
              keyboardType: widget.keyBoardType,
              focusNode:
                  widget.readOnly ? AlwaysDisabledFocusNode() : focusNode,
              cursorColor: AppColor.primaryColor,
              style: const TextStyle(
                  color: AppColor.darkText,
                  fontSize: 15,
                  fontFamily: "PlusJakartaSans"),
              validator: widget.isOptional
                  ? widget.validation as String? Function(String?)
                  : (value) {
                      if (widget.isEmail) {
                        if (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                .hasMatch(value)) {
                          return "Please enter valid Email";
                        }
                      } else if (widget.isPhone) {
                        if (value == null || value.isEmpty || value[0] != "+") {
                          return "Please enter valid mobile number";
                        }
                      } else if (value == null || value.isEmpty) {
                        return widget.errorText;
                      }

                      return null;
                    },
              onChanged: (value) {
                widget.onChange(value);
              },
              onTap: widget.callback,
              decoration: InputDecoration(
                  isCollapsed: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: const BorderSide(color: AppColor.skyL),
                  ),
                  suffixIcon: widget.isPass
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              focusNode.unfocus();
                              focusNode.canRequestFocus = false;
                              _showPassword = !_showPassword;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 20, left: 10, bottom: 5, top: 5),
                            child: Image(
                              height: 10,
                              width: 20,
                              color: Colors.grey,
                              image: !_showPassword
                                  ? const AssetImage(
                                      "assets/icons/view.png",
                                    )
                                  : const AssetImage("assets/icons/hidden.png"),
                            ),
                          ))
                      : widget.isSuffix.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(20),
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: Image(
                                  height: 20,
                                  width: 20,
                                  // color: AppColor.black,
                                  image: AssetImage(
                                    widget.isSuffix,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: const BorderSide(color: AppColor.skyL),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: const BorderSide(color: AppColor.skyL),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: const BorderSide(color: AppColor.red),
                  ),
                  filled: true,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: "PlusJakartaSans",
                  ),
                  hintText: widget.hintText,
                  fillColor: const Color(0xFFF6F8FE),
                  contentPadding: const EdgeInsets.only(
                      left: 25, top: 20, bottom: 20, right: 0))),
        ],
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

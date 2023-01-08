import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:styled_widget/styled_widget.dart';

enum BorderStyle { underline, circular }

class AppTextField extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final TextInputType textInputType;
  final EdgeInsets contentPadding;
  final String? hintText;
  final String? labelText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool obscureText;
  final bool isDense;
  final int maxLength;
  final maxLine;
  final key1;
  final bool digitsOnly;
  final Color? labelColor;
  final String prefixText;
  final bool readOnly;
  final TextInputAction textInputAction;
  final bool enableFocusBorder;
  final ValueChanged<String>? onChanged;
  final TextCapitalization textCapitalization;
  final TextEditingController? controller;
  final Color? textColor;
  final Function()? onTap;
  final String? initialValue;

  const AppTextField({
    Key? key,
    this.validator,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.digitsOnly = false,
    this.controller,
    this.textInputType = TextInputType.text,
    this.contentPadding = const EdgeInsets.all(20.0),
    this.prefixWidget,
    this.suffixWidget,
    this.hintText = '',
    this.textInputAction = TextInputAction.next,
    this.maxLength = 50,
    this.enableFocusBorder = true,
    this.onChanged,
    this.textColor,
    this.prefixText = "",
    this.labelColor,
    this.labelText,
    this.readOnly = false,
    this.maxLine = 1,
    this.key1,
    this.onTap,
    this.initialValue,
    this.isDense = false,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool isPasswordInVisible;

  @override
  void initState() {
    isPasswordInVisible = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            autofocus: false,
            key: widget.key1,
            readOnly: widget.readOnly,
            cursorColor: widget.textColor,
            validator: widget.validator,
            obscureText: isPasswordInVisible,
            textCapitalization: widget.textCapitalization,
            textInputAction: widget.textInputAction,
            controller: widget.controller,
            onChanged: widget.onChanged,
            initialValue: widget.initialValue,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLines: widget.maxLine,
            onTap: widget.onTap,
            inputFormatters: widget.digitsOnly
                ? <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(widget.maxLength)
                  ]
                : [],
            keyboardType: widget.textInputType,
            decoration: InputDecoration(
                isDense: widget.isDense,
                border: const UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.red)),
                suffixIcon: widget.suffixWidget ??
                    (widget.obscureText
                        ? (isPasswordInVisible
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPasswordInVisible = false;
                                  });
                                },
                                icon: const Icon(
                                  Icons.visibility_off,
                                  color: Colors.red,
                                ))
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPasswordInVisible = true;
                                  });
                                },
                                icon: const Icon(Icons.visibility)))
                        : const SizedBox()),
                prefixIcon: widget.prefixWidget,
                filled: true,
                prefixText: widget.prefixText,
                fillColor: const Color(0xffF6F6F6),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                errorStyle: const TextStyle(fontSize: 12),
                labelStyle: TextStyle(color: widget.labelColor, fontSize: 16),
                contentPadding: widget.contentPadding,
                labelText: widget.labelText,
                hintText: widget.hintText,
                hintStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)))
        .padding(bottom: 12);
  }
}

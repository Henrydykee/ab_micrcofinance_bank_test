import 'package:ab_micrcofinance_bank_test/core/components/text_holder.dart';
import 'package:ab_micrcofinance_bank_test/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldComponent extends StatelessWidget {

  final String? hinttitle;
  final bool showTitle;
  final String? title;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final int? maxLength;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;
  final Color? cursorColor;
  final Color? fillColor;
  final bool? readOnly;
  final double? fontSize;
  final String? value;
  final bool? obscureText;
  final Function()? onTap;
  final int? maxLines;
  final String? Function(String?)? validator;
  final Function(String)? onChange;
  final double radius;
  final Color? borderColor;



  const TextFormFieldComponent(
      {super.key, this.onTap,
        this.maxLength,
        this.showTitle = false,
        this.obscureText = false,
        this.hinttitle,
        this.controller,
        this.keyboardType,
        this.prefix,
        this.maxLines,
        this.suffixIcon,
        this.borderColor,
        this.inputFormatters,
        this.currentFocusNode,
        this.nextFocusNode,
        this.cursorColor,
        this.readOnly = false,
        this.fontSize,
        this.onChange,
        this.title,
        this.radius = 8.0,
        this.fillColor,
        this.value,
        this.prefixIcon,
        this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
       showTitle == true ? TextHolder(title: title,fontWeight: FontWeight.w800,size: 15,) : const SizedBox(),
        showTitle == true ?  const SizedBox(height: 10,) : const SizedBox(),
        TextFormField(
          onTap: onTap,
          obscureText: obscureText ?? false,
          readOnly: readOnly ?? false,
          autofocus: false,
          obscuringCharacter: "*",
          onChanged: onChange,
          controller: controller,
          maxLength: maxLength,
          validator: validator,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: keyboardType ?? TextInputType.text,
          cursorColor: cursorColor ?? Colors.black,
          focusNode: currentFocusNode,
          inputFormatters: inputFormatters,
          maxLines: maxLines ?? 1,
          onEditingComplete: () {
            FocusScope.of(context).requestFocus(nextFocusNode ?? FocusNode());
          },
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(nextFocusNode ?? FocusNode());
          },
          decoration: InputDecoration(
              suffixIcon: suffixIcon,
              counterText: "",
              fillColor: fillColor ?? TestColor.lightBlue,
              filled: true,
              prefixIcon: prefixIcon,
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.all(Radius.circular(radius)),
                borderSide: BorderSide(color: borderColor ?? TestColor.lightBlue),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.all(Radius.circular(radius)),
                borderSide: BorderSide(color: borderColor ?? TestColor.lightBlue,),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.all(Radius.circular(radius)),
                borderSide: BorderSide(color: borderColor ?? TestColor.lightBlue,),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.all(Radius.circular(radius)),
                borderSide: BorderSide(color: borderColor ??  TestColor.lightBlue,),
              ),
              hintText: hinttitle,
              helperStyle:
              TextStyle(color: Colors.black, fontSize: fontSize ?? 14)),
        ),
      ],
    );
  }
}




import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoneyTextHolder extends StatelessWidget {
  final int? amount;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? align;
  final Function()? onTap;
  final TextStyle? style;
  final double? fontHeight;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final String? currencySymbol;
  final bool? showDecimal;

  const MoneyTextHolder({
    super.key,
    @required this.amount,
    this.color,
    this.size,
    this.fontWeight,
    this.align,
    this.overflow,
    this.onTap,
    this.maxLines,
    this.fontHeight,
    this.decoration,
    this.style,
    this.currencySymbol = '₦',
    this.showDecimal = true,
  });

  @override
  Widget build(BuildContext context) {

    final formatter = NumberFormat.currency(
      symbol: currencySymbol,
      decimalDigits: showDecimal == true ? 2 : 0,
    );

    final formattedAmount = formatter.format(
        (amount ?? 0) / 100.0
    );

    return GestureDetector(
      onTap: onTap,
      child: Text(
        formattedAmount,
        textAlign: align,
        maxLines: maxLines,
        overflow: overflow,
        style: style ??
            TextStyle(
              color: color ?? Colors.black,
              fontSize: size ?? 13,
              height: fontHeight,
              fontWeight: fontWeight ?? FontWeight.w300,
              decoration: decoration,
            ),
      ),
    );
  }
}
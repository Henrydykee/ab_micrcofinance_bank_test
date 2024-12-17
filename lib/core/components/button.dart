
import 'package:ab_micrcofinance_bank_test/core/components/text_holder.dart';
import 'package:ab_micrcofinance_bank_test/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: TestColor.blue,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 14),
        child: Center(
          child: TextHolder(
            title: "Invest Now",
            size: 15,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


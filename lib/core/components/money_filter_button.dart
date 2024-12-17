
import 'package:ab_micrcofinance_bank_test/core/components/money_text_holder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/color.dart';

class MoneyFilterButton extends StatelessWidget {

  final int amount;
  final bool isSelected;
  final VoidCallback onTap;

  const MoneyFilterButton({
    required this.amount,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isSelected ? TestColor.darkBlue : TestColor.lightBlue
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical:  14),
          child: MoneyTextHolder(amount: amount, color: isSelected ? Colors.white : TestColor.darkBlue,fontWeight: FontWeight.w800,),
        ),
      ),
    );
  }
}




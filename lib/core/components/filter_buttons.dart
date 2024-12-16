
import 'package:ab_micrcofinance_bank_test/core/components/text_holder.dart';
import 'package:flutter/material.dart';

import '../constant/color.dart';

class FilterButtons extends StatelessWidget {
  final String title;
  const FilterButtons({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: TestColor.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
          child: TextHolder(title: title,size: 15,fontWeight: FontWeight.w800,),
        ),
      ),
    );
  }
}

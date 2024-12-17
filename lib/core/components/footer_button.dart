
import 'package:ab_micrcofinance_bank_test/core/components/text_holder.dart';
import 'package:ab_micrcofinance_bank_test/core/constant/color.dart';
import 'package:ab_micrcofinance_bank_test/core/constant/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FooterButton extends StatelessWidget {
  const FooterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextHolder(title: TestStrings.learnInvestment,color: TestColor.blue,size: 17,fontWeight: FontWeight.w600,),
        const SizedBox(width: 4,),
        Icon(Icons.chevron_right,color: TestColor.blue,)
      ],
    );
  }
}

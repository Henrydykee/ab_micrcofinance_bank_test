

import 'package:ab_micrcofinance_bank_test/core/constant/strings.dart';
import 'package:ab_micrcofinance_bank_test/features/home/data/model/investment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/components/button.dart';
import '../../../../core/components/footer_button.dart';
import '../../../../core/components/money_filter_button.dart';
import '../../../../core/components/text_form_field.dart';
import '../../../../core/components/text_holder.dart';
import '../../../../core/constant/color.dart';

void showInvestmentModalBottomSheet(BuildContext context, InvestmentModel investment) {
  int? selectedAmount;
  TextEditingController amountController = TextEditingController();

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(investment.image),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextHolder(
                              title: investment.yield,
                              color: TestColor.green,
                              size: 13,
                              fontWeight: FontWeight.w300,
                            ),
                            TextHolder(
                              title: TestStrings.returnsDuration,
                              color: TestColor.darkBlue,
                              size: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    TextHolder(
                      title: investment.name,
                      color: TestColor.darkBlue,
                      fontWeight: FontWeight.w800,
                      size: 15,
                    ),
                    const SizedBox(height: 14),
                    TextHolder(
                      title: TestStrings.companyHolder,
                      color: TestColor.darkBlue,
                      size: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(height: 40),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MoneyFilterButton(
                          amount: 500000,
                          isSelected: selectedAmount == 500000,
                          onTap: () {
                            setState(() {
                              selectedAmount = 500000;
                              amountController.text = selectedAmount.toString();
                            });
                          },
                        ),
                        MoneyFilterButton(
                          amount: 1000000,
                          isSelected: selectedAmount == 1000000,
                          onTap: () {
                            setState(() {
                              selectedAmount = 1000000;
                              amountController.text = selectedAmount.toString();
                            });
                          },
                        ),
                        MoneyFilterButton(
                          amount: 2000000,
                          isSelected: selectedAmount == 2000000,
                          onTap: () {
                            setState(() {
                              selectedAmount = 2000000;
                              amountController.text = selectedAmount.toString();
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),

                    // Custom Amount Input
                    Row(
                      children: [
                        MoneyFilterButton(
                          amount: 5000000,
                          isSelected: selectedAmount == 5000000,
                          onTap: () {
                            setState(() {
                              selectedAmount = 5000000;
                              amountController.text = selectedAmount.toString();
                            });
                          },
                        ),
                        const SizedBox(width: 22),
                        Flexible(
                          child: TextFormFieldComponent(
                            hinttitle: TestStrings.enterOtherAmount,
                            radius: 30,
                            keyboardType: TextInputType.number,
                            controller: amountController,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 45),
                    TextFormFieldComponent(
                      title: TestStrings.phoneNumber,
                      borderColor: TestColor.grey,
                      fillColor: Colors.white,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      showTitle: true,
                    ),
                    const SizedBox(height: 16),
                    TextFormFieldComponent(
                      title: TestStrings.customerName,
                      showTitle: true,
                      borderColor: TestColor.grey,
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    TextFormFieldComponent(
                      title: TestStrings.pin,
                      obscureText: true,
                      showTitle: true,
                      borderColor: TestColor.grey,
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 45),
                    const Button(),
                    const SizedBox(height: 30),
                    const FooterButton(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

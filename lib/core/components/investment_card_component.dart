import 'package:ab_micrcofinance_bank_test/core/components/text_holder.dart';
import 'package:ab_micrcofinance_bank_test/core/constant/color.dart';
import 'package:ab_micrcofinance_bank_test/features/home/data/model/investment_model.dart';
import 'package:flutter/material.dart';

import '../../features/home/pages/presenation/invetsment_model_buttom_sheet.dart';
import 'money_text_holder.dart';

Widget buildInvestmentCard(BuildContext context, InvestmentModel investment) {
  return Padding(
    padding: const EdgeInsets.only(right: 30,bottom: 30),
    child: GestureDetector(
      onTap: () => showInvestmentModalBottomSheet(context,investment),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: TestColor.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCardHeader(investment),
              const SizedBox(height: 35),
              _buildInvestmentDetails(investment),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildCardHeader(InvestmentModel investment) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Image.asset(investment.image),
      Column(
        children: [
          TextHolder(
            title: investment.yield,
            color: TestColor.green,
            size: 13,
            fontWeight: FontWeight.w300,
          ),
          TextHolder(
            title: "Returns in 9 months",
            color: TestColor.darkBlue,
            size: 13,
            fontWeight: FontWeight.w300,
          ),
        ],
      )
    ],
  );
}

Widget _buildInvestmentDetails(InvestmentModel investment) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextHolder(
        title: investment.name,
        color: TestColor.darkBlue,
        size: 15,
        fontWeight: FontWeight.w600,
      ),
      const SizedBox(height: 8),
      _buildFooter(investment),
    ],
  );
}

Widget _buildFooter(InvestmentModel investment) {
  final isStillSelling = investment.status == "still selling";

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      _buildPriceInfo(investment),
      _buildStatusBadge(investment, isStillSelling),
    ],
  );
}

Widget _buildPriceInfo(InvestmentModel investment) {
  return Column(
    children: [
      MoneyTextHolder(
        amount: investment.pricePerUnit,
        color: TestColor.darkBlue,
        size: 15,
        fontWeight: FontWeight.w500,
      ),
      TextHolder(
        title: "per unit",
        color: TestColor.darkBlue,
        size: 15,
        fontWeight: FontWeight.w400,
      ),
    ],
  );
}

Widget _buildStatusBadge(InvestmentModel investment, bool isStillSelling) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: isStillSelling ? TestColor.lightGreen : TestColor.lightRed,
    ),
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
    child: TextHolder(
      title: isStillSelling ? "Still Selling" : "Sold Out",
      color: isStillSelling ? TestColor.green : TestColor.red,
      size: 13,
      fontWeight: FontWeight.w400,
    ),
  );
}

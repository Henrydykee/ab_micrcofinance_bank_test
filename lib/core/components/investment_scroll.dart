


import 'package:ab_micrcofinance_bank_test/features/home/data/model/investment_model.dart';
import 'package:flutter/material.dart';

import 'investment_card_component.dart';

class InvestmentScrollView extends StatelessWidget {
  final List<List<InvestmentModel>> investmentGroups;

  const InvestmentScrollView({
    Key? key,
    required this.investmentGroups,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          3,
              (index) => _buildInvestmentSection(
            investments: investmentGroups[index],
            isLastSection: index == investmentGroups.length - 1,
          ),
        ),
      ),
    );
  }

  Widget _buildInvestmentSection({

    required List<InvestmentModel> investments,
    bool isLastSection = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: investments.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final investment = investments[index];
              return buildInvestmentCard(context, investment);
            },
          ),
        ),
        if (!isLastSection) const SizedBox(height: 30),
      ],
    );
  }
}
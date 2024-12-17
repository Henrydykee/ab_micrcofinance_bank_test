import 'package:ab_micrcofinance_bank_test/core/components/text_holder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/app_bar.dart';
import '../../../../core/components/filter_buttons.dart';
import '../../../../core/components/investment_card_component.dart';
import '../../../../core/components/text_form_field.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/strings.dart';
import '../state/investment_state.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<InvestmentProvider>(context, listen: false).fetchInvestments();
    });
  }

  final List<String> _filters = [
    TestStrings.realEstate,
    TestStrings.agriculture,
    TestStrings.gold,
    TestStrings.transportation,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(),
      backgroundColor: Colors.white,
      body: Consumer<InvestmentProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.error != null) {
            return _buildError(provider.error!);
          }
          return _buildContent(provider);
        },
      ),
    );
  }

  Widget _buildError(String error) {
    return Center(
      child: TextHolder(
        style: const TextStyle(color: Colors.red, fontSize: 16), title: error,
      ),
    );
  }

  Widget _buildContent(InvestmentProvider provider) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          _buildFilterButtons(provider),
          const SizedBox(height: 30),
          _buildInvestmentsList(provider),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          TextHolder(
            title: TestStrings.choosePlatform,
            size: 30,
            color: TestColor.darkBlue.withOpacity(0.5),
          ),
          const SizedBox(height: 14),
          RichText(
            text: TextSpan(
              children: [
                _buildRichTextSpan(TestStrings.notSure, TestColor.darkBlue),
                _buildRichTextSpan(TestStrings.inn, TestColor.darkBlue),
                _buildRichTextSpan(TestStrings.seeRecommendations, TestColor.green),
              ],
            ),
          ),
          const SizedBox(height: 30),
          TextFormFieldComponent(
            hinttitle: TestStrings.searchInvestment,
            onChange: (val) => Provider.of<InvestmentProvider>(context, listen: false)
                .searchInvestments(val),
            prefixIcon: Icon(Icons.search, color: TestColor.grey100),
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }

  TextSpan _buildRichTextSpan(String text, Color color) {
    return TextSpan(
      text: text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
    );
  }

  Widget _buildFilterButtons(InvestmentProvider provider) {
    return SizedBox(
      height: 34,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _filters.length,
        padding: const EdgeInsets.only(left: 16),
        itemBuilder: (context, index) {
          final isSelected = provider.selectedFilter == _filters[index];
          return FilterButtons(
            title: _filters[index],
            isSelected: isSelected,
            onTap: () {
              isSelected ? provider.clearFilter() : provider.filterInvestments(_filters[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildInvestmentsList(InvestmentProvider provider) {
    if (provider.investments.isEmpty) {
      return const Center(
        child: TextHolder(title: TestStrings.noResultFound),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: List.generate(3, (_) {
          return SizedBox(
            height: 209,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: provider.investments.length,
              padding: const EdgeInsets.only(left: 16),
              itemBuilder: (context, index) {
                return buildInvestmentCard(context, provider.investments[index]);
              },
            ),
          );
        }),
      ),
    );
  }
}


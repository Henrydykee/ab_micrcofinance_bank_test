import 'package:ab_micrcofinance_bank_test/core/components/text_holder.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/app_bar.dart';
import '../../../../core/components/filter_buttons.dart';
import '../../../../core/components/text_form_field.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/strings.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  final List<String> _filter = [
    "Real Estate",
    "Agriculture",
    "Gold",
    "Transportation"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                TextHolder(title: TestStrings.choosePlatform,size: 30,color: TestColor.darkBlue.withOpacity(0.5),),
                const SizedBox(height: 14,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Not sure what you want to invest\n',
                          style: TextStyle(
                            color: TestColor.darkBlue,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        TextSpan(
                          text: 'in?',
                          style: TextStyle(
                            color: TestColor.darkBlue,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        TextSpan(
                          text: ' See recommendations.',
                          style: TextStyle(
                            color: TestColor.green,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                TextFormFieldComponent(
                  hinttitle: TestStrings.searchInvestment,
                  prefixIcon: Icon(Icons.search,color: TestColor.grey100,),
                ),
                const SizedBox(height: 14,),
              ],
            ),
          ),
        SizedBox(
          height: 34, // Height for the horizontal list
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _filter.length,
            padding: const EdgeInsets.only(left: 16),
            itemBuilder: (context, index) {
              return FilterButtons(title: _filter[index]);
            },
          ),
        ),
        ],
      ),
    );
  }
}
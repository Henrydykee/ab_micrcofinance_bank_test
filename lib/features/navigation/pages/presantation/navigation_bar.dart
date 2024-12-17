import 'package:ab_micrcofinance_bank_test/core/constant/color.dart';
import 'package:ab_micrcofinance_bank_test/core/constant/icon_path.dart';
import 'package:ab_micrcofinance_bank_test/core/constant/strings.dart';
import 'package:ab_micrcofinance_bank_test/features/home/pages/presenation/home_tab.dart';
import 'package:ab_micrcofinance_bank_test/features/portfolio/pages/presentation/portfolio_tab.dart';
import 'package:ab_micrcofinance_bank_test/features/rewards/pages/presentation/rewards_tab.dart';
import 'package:ab_micrcofinance_bank_test/features/save/pages/presentation/save_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/components/text_holder.dart';
import '../../../account/pages/presentation/account_tab.dart';


class NavigationBarComponent extends StatefulWidget {
  bool isFirstTime;
  NavigationBarComponent({super.key, this.isFirstTime = false});
  @override
  _NavigationBarComponentState createState() => _NavigationBarComponentState();
}

class _NavigationBarComponentState extends State<NavigationBarComponent>
    with WidgetsBindingObserver {
  int selectedTab = 0;

  void _selectedTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: FABBottomAppBar(
          notchedShape: const CircularNotchedRectangle(),
          selectedColor: TestColor.blue,
          color: Colors.grey,
          onTabSelected: _selectedTab,
          items: [
            FABBottomAppBarItem(
                iconName: IconPath.homeIcon,
                name: TestStrings.home,
                ignoreAction: null),
            FABBottomAppBarItem(
                iconName: IconPath.saveIcon,
                name: TestStrings.save,
                ignoreAction: null),
            FABBottomAppBarItem(
                iconName: IconPath.portfolioIcon,
                name: TestStrings.portfolio,
                ignoreAction: null),
            FABBottomAppBarItem(
                iconName: IconPath.rewardsIcon,
                name: TestStrings.rewards,
                ignoreAction: null),
            FABBottomAppBarItem(
                iconName: IconPath.accountIcon,
                name: TestStrings.account,
                ignoreAction: null),
          ],
          backgroundColor: null,
        ),
        body: IndexedStack(
          index: selectedTab,
          children: const [
            HomeTab(),
            SaveTab(),
            PortfolioTab(),
            RewardsTab(),
            AccountTab()
          ],
        ));
  }
}

class FABBottomAppBarItem {
  FABBottomAppBarItem(
      {required this.iconName,
      required this.name,
      this.ignoreActiveColor = false,
      required this.ignoreAction});
  String iconName;
  String name;
  bool ignoreActiveColor;
  Function? ignoreAction;
}

class FABBottomAppBar extends StatefulWidget {

  FABBottomAppBar({
    required this.items,
     this.centerItemText,
    this.height = 60.0,
    this.iconSize = 24.0,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    required this.notchedShape,
    required this.onTabSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 5);
  }

  final List<FABBottomAppBarItem> items;
  final String? centerItemText;
  final double height;
  final double iconSize;
  final Color? backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: BottomAppBar(
        shape: widget.notchedShape,
        color: widget.backgroundColor,
        elevation: 8,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items,
        ),
      ),
    );
  }

  Widget _buildTabItem({
    FABBottomAppBarItem? item,
    int? index,
    ValueChanged<int>? onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              onPressed!(item!.ignoreActiveColor ? _selectedIndex : index!);
              if (item.ignoreActiveColor && item.ignoreAction != null) {
                item.ignoreAction!();
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  item!.iconName,
                  height: 30,
                  width: 30,
                  color: color ,
                ),
                const SizedBox(
                  height: 2,
                ),
                TextHolder(
                  title: item.name,
                  color: color,
                  fontWeight: FontWeight.w300,
                  size: 13,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

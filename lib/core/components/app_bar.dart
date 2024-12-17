

import 'package:ab_micrcofinance_bank_test/core/components/text_holder.dart';
import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSize {
  const AppBarComponent({
    this.title,
    this.actionOnTap,
    this.image,
    this.bottom,
    this.color,
    this.textColor,
    this.backbuttonTap,
    this.allowPop = true,
    this.leading,
    this.searchOnTap,
    this.actionWidget,
    this.style,
    this.enableSearchIcon = false,
    super.key,
  });

  final String? title;
  final String? image;
  final Color? color;
  final Function()? actionOnTap;
  final Function()? searchOnTap;
  final Widget? bottom;
  final Color? textColor;
  final bool? allowPop;
  final bool? enableSearchIcon;
  final Function()? backbuttonTap;
  final Widget? leading;
  final Widget? actionWidget;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color ?? Colors.white,
      elevation: 0.0,
      centerTitle: true,
      bottom: bottom != null && bottom is PreferredSizeWidget ? bottom as PreferredSizeWidget : null,
      leading: Visibility(
        visible: allowPop ?? false,
        child: GestureDetector(
        //  onTap: backbuttonTap ?? () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          TextHolder(
            title: title ?? "",
            color: textColor ?? Colors.white,
            size: 16,
            style: style,
          ),
          const SizedBox(
            width: 20,
          ),
          const Spacer(),
          if (leading==null)
            GestureDetector(
                onTap: actionOnTap,
                child:image ==  null ? const SizedBox() :Image.asset(
                  image ?? "",
                  color: Colors.white,
                )) else leading!,
        ],
      ),
      actions: [
        if(actionWidget == null) const SizedBox() else actionWidget!,
        enableSearchIcon == true ?  GestureDetector(
          onTap: searchOnTap,
          child: const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.search,color: Colors.white,),
          ),
        ) : const SizedBox()
      ],
    );
  }

  @override
// TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(25, 50);
}
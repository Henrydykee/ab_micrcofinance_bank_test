import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'features/navigation/pages/presantation/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Karla',
            useMaterial3: false,
            appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light)),
        home:   NavigationBarComponent(),
      ),
    );
  }
}
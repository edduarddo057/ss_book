import 'package:flutter/material.dart';
import 'package:ss_book/pages/home.dart';

void main() {
  runApp(const SSbook());
}

class SSbook extends StatelessWidget {
  const SSbook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(160, 118, 242, 1)),
          useMaterial3: true,
        ),
        home: Container(
          decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(32))),
          child: const HomePage(title: 'SSBOOK'),
        ));
  }
}

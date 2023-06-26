import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.errorText});

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          size: 60,
          color: Colors.red,
        ),
        Title(color: const Color(0xFF555555), child: Text(errorText)),
      ],
    ));
  }
}

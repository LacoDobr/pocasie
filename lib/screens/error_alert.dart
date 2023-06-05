import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Alerts extends StatelessWidget {
  final String? errorInfo;

  const Alerts({super.key, required this.errorInfo});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Error message'),
      content: Text('$errorInfo'),
      actions: <Widget>[
        TextButton(
          onPressed: () =>
              SystemChannels.platform.invokeListMethod('SystemNavigator.pop'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}

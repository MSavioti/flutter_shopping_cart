import 'package:flutter/material.dart';

class ButtonHome extends StatelessWidget {
  const ButtonHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: IconButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/');
        },
        icon: const Icon(Icons.home),
      ),
    );
  }
}

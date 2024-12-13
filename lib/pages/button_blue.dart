import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {
  final String label;
  final void Function()? onTap;

  const ButtonBlue({super.key, required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: Colors.blue,
            shape: const StadiumBorder()),
        child: Container(
          width: double.infinity,
          height: 55,
          child:
              Center(child: Text(label, style: TextStyle(color: Colors.white))),
        ));
  }
}

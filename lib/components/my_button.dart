import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final Function()? onTap;
  final String text;

  const MyButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  MyButtonState createState() => MyButtonState();
}

class MyButtonState extends State<MyButton> {
  Color backgroundColor = const Color.fromARGB(255, 248, 58, 44);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (e) {
        setState(() { 
          backgroundColor =  Colors.red.shade400;
        });
      },
      onTapUp: (_) {
        setState(() {
          backgroundColor = const Color.fromARGB(255, 248, 58, 44);
        });
      },
      onTapCancel: () {
        setState(() {
          backgroundColor = const Color.fromARGB(255, 248, 58, 44);
        });
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
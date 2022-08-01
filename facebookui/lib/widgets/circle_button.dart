import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
   const CircleButton(
      {Key? key,
       this.icon,
      required this.iconSize,
       this.onPressed})
      : super(key: key);
  final IconData? icon;
  final double iconSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.all(6.0),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
      child: IconButton(
        icon: Icon(icon),
        iconSize: iconSize,
        color: Colors.black,
        onPressed: onPressed,
      ),
    );
  }
}

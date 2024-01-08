import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key,required this.onTap,required this.icon});
  final void Function()? onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 35,
        width: 35,
        child: Icon(icon,color: Colors.white,),
      ),
    );
  }
}
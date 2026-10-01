import 'package:flutter/material.dart';
import 'package:shopping_app/core/utils/app_styles.dart';


class BuildMenuItem extends StatelessWidget {
  IconData icon;
  String title;
  VoidCallback onPressed;
  BuildMenuItem({
    required this.icon ,
    required this.title,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
                title,
                style:AppStyles.medium18Black
            ),
          ),
          IconButton(
            onPressed: onPressed
            ,icon:Icon(Icons.arrow_forward_ios, size: 18),)
        ],
      ),
    );
  }
}
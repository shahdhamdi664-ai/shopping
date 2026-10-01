import 'package:flutter/material.dart';

class BuildPriceRow extends StatelessWidget {
  final String title;
  final String value;
  final Color valueColor;
  final bool isBold;

  const BuildPriceRow({
    super.key,
    required this.title,
    required this.value,
    this.valueColor = Colors.black,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight:
            isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
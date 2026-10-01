import 'package:flutter/material.dart';
import '../../../../../../../core/utils/app_colors.dart';
class CounterRow extends StatefulWidget {
  const CounterRow({super.key});

  @override
  State<CounterRow> createState() => _CounterRowState();
}

class _CounterRowState extends State<CounterRow> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width  = MediaQuery.of(context).size.width;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          mini: true,
          backgroundColor: AppColors.babyPinkColor,
          onPressed: (){
            if (count > 1) {
              setState(() {
                count--;
              });
            }
          },
          child: Icon(
            Icons.remove_circle_outline,
            color: AppColors.whiteColor,
            size: 18,
          ),
        ),

        SizedBox(width: width * 0.02),

        Text(
          '$count',
          style:TextStyle(
            color: AppColors.blackColor,
          ),
        ),

        SizedBox(width: width * 0.02),
        FloatingActionButton(
          mini: true,
          backgroundColor: AppColors.pinkColor,
          onPressed: (){
            setState(() {
              count++;
            });
          },
          child: Icon(
            Icons.add_circle_outline,
            color: AppColors.whiteColor,
            size: 18,
          ),
        ),
      ],
    );
  }
}
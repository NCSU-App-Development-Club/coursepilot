import 'package:coursepilot/theme/color_theme.dart';
import 'package:flutter/material.dart';

class MySchedules extends StatelessWidget {
  const MySchedules({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColorsDark.primary,
          ),
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "My Schedules",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30
                    )
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(), 
                  icon: Icon(
                    Icons.close,
                    size: 40,
                  )
                )
              )
            ]
          )
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
                Text('Schedule 1', style: TextStyle(fontSize: 20),),
                Text('Schedule 2', style: TextStyle(fontSize: 20),),
                Text('Schedule 3', style: TextStyle(fontSize: 20),)
              ],
          )
        )
      ]
    );
  }
}
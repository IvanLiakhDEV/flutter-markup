import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app-style.dart';
import 'package:flutter_markup/widgets/app_day_tile.dart';
import 'package:flutter_markup/widgets/shedule/daily_schedule_card.dart';

class AppSchedule extends StatelessWidget {
  const AppSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.surfaceBackground),

      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppDayTile(day: "9", weekday: 'MON', onTap: () => {}),
              AppDayTile(day: "10", weekday: 'TUE', onTap: () => {}),
              AppDayTile(
                day: "11",
                weekday: 'WED',
                onTap: () => {},
                isSelected: true,
              ),
              AppDayTile(day: "12", weekday: 'THU', onTap: () => {}),
              AppDayTile(
                day: "13",
                weekday: 'FRI',
                onTap: () => {},
                isSelected: true,
              ),
              AppDayTile(
                day: "14",
                weekday: 'SAT',
                onTap: () => {},
                isSelected: true,
              ),
            ],
          ),
          SizedBox(height: 9),
          DailyScheduleCard(),
        ],
      ),
    );
  }
}

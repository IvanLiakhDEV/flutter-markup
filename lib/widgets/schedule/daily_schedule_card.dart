import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';

import 'appointment_item.dart';

class DailyScheduleCard extends StatelessWidget {
  const DailyScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "11 Wednesday - Today",
              style: AppTextStyles.sm.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTimeRow("9 AM"),
                    _buildTimeRow("10 AM"),
                    _buildTimeRow("11 AM"),
                    _buildTimeRow("12 AM"),
                  ],
                ),
                const Positioned(
                  top: 22,
                  left: 40,
                  right: 0,
                  child: AppointmentItem(
                    doctorName: "Dr. Olivia Turner, M.D.",
                    description:
                        "Treatment and prevention of skin and photodermatitis.",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeRow(String time) {
    return Row(
      children: [
        // Час
        SizedBox(
          width: 40,
          child: Text(
            time,
            style: AppTextStyles.xsm.copyWith(color: AppColors.textPrimary),
          ),
        ),
        Expanded(
          child: Text(
            "-" * 100,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: AppColors.textPrimary,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}

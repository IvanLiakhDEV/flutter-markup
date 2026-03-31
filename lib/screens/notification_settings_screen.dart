import 'package:flutter/material.dart';
import 'package:flutter_markup/widgets/app_appbar.dart';
import 'package:flutter_markup/widgets/app_switch_item.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool _generalNotification = true;
  bool _sound = true;
  bool _soundCall = true;
  bool _vibrate = false;
  bool _specialOffers = false;
  bool _payments = true;
  bool _promoAndDiscount = false;
  bool _cashback = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Notification setting'),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 17),
        child: Column(
          spacing: 16,
          children: [
            AppSwitchItem(
              text: 'General Notification',
              isOn: _generalNotification,
              onChanged: (val) => setState(() => _generalNotification = val),
            ),
            AppSwitchItem(
              text: 'Sound',
              isOn: _sound,
              onChanged: (val) => setState(() => _sound = val),
            ),
            AppSwitchItem(
              text: 'Sound Call',
              isOn: _soundCall,
              onChanged: (val) => setState(() => _soundCall = val),
            ),
            AppSwitchItem(
              text: 'Vibrate',
              isOn: _vibrate,
              onChanged: (val) => setState(() => _vibrate = val),
            ),
            AppSwitchItem(
              text: 'Special Offers',
              isOn: _specialOffers,
              onChanged: (val) => setState(() => _specialOffers = val),
            ),
            AppSwitchItem(
              text: 'Payments',
              isOn: _payments,
              onChanged: (val) => setState(() => _payments = val),
            ),
            AppSwitchItem(
              text: 'Promo And Discount',
              isOn: _promoAndDiscount,
              onChanged: (val) => setState(() => _promoAndDiscount = val),
            ),
            AppSwitchItem(
              text: 'Cashback',
              isOn: _cashback,
              onChanged: (val) => setState(() => _cashback = val),
            ),
          ],
        ),
      ),
    );
  }
}

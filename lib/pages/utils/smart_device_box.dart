import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SmartDeviceBox__ extends StatelessWidget {
  const SmartDeviceBox__({
    super.key,
    required this.DeviceName,
    required this.DevicePath,
    required this.onChanged,
    required this.DeviceStatus,
  });

  final String DeviceName;
  final String DevicePath;
  final void Function(bool) onChanged;
  final bool DeviceStatus;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: Container(
        decoration: BoxDecoration(
          color: DeviceStatus ? Colors.grey[850] : Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Image.asset(
                DevicePath,
                height: screenWidth * 0.15,
                color: DeviceStatus ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      DeviceName,
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                        color: DeviceStatus ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                      value: DeviceStatus,
                      onChanged: onChanged,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

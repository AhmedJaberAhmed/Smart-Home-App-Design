import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthome/pages/utils/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List mySmartDevices = [
    ["Smart Light", "lib/smartHome/appliance.png", true],
    ["Smart Wash", "lib/smartHome/smart-door.png", false],
    ["Smart Cook", "lib/smartHome/smart-lighting.png", false],
    ["Smart TV", "lib/smartHome/smart-tv.png", false],
  ];

  void triggerPower(bool val, int index) {
    setState(() {
      mySmartDevices[index][2] = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double horizontalPadding = size.width * 0.08;
    final double verticalSpacing = size.height * 0.02;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalSpacing),
              child: const Row(
                children: [
                  Icon(Icons.menu_outlined, size: 30, color: Colors.black),
                  Spacer(),
                  Icon(Icons.person, size: 30, color: Colors.black),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Home,", style: TextStyle(fontSize: size.width * 0.05, color: Colors.grey[700])),
                  Text("Ahmed Jaber", style: GoogleFonts.bebasNeue(fontSize: size.width * 0.15)),
                ],
              ),
            ),

            SizedBox(height: verticalSpacing),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(color: Colors.grey[400]),
            ),

            SizedBox(height: verticalSpacing),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                "Smart Devices",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.06,
                    color: Colors.grey[800]),
              ),
            ),

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(size.width * 0.05),
                itemCount: mySmartDevices.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: size.width < 600 ? 2 : 4,
                  crossAxisSpacing: size.width * 0.04,
                  mainAxisSpacing: size.width * 0.04,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox__(
                    onChanged: (value) => triggerPower(value, index),
                    DeviceName: mySmartDevices[index][0],
                    DevicePath: mySmartDevices[index][1],
                    DeviceStatus: mySmartDevices[index][2],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

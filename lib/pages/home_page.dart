import 'package:flutter/material.dart';

import '../widgets/home_app_bar.dart';
import '../widgets/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final double horizontalPadding = 40;
final double verticalPadding = 25;

List mySmartDevices = [
  ["Smart Light", "./assets/icons/light-bulb.png", true],
  ["Smart AC", "./assets/icons/air-conditioner.png", false],
  ["Smart TV", "./assets/icons/smart-tv.png", false],
  ["Smart Fan", "./assets/icons/fan.png", false],
];

class _HomePageState extends State<HomePage> {
  void onChangeThePowerMode(String name) {
    for (var i = 0; i < mySmartDevices.length; i++) {
      if (mySmartDevices[i][0] == name) {
        setState(() {
          mySmartDevices[i][2] = !mySmartDevices[i][2];
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          width: double.infinity,
          child: Text("sdadasdsadsdaadsdsa"),
        ),
        backgroundColor: Colors.grey[300],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeAppBar(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Home"),
                  Text(
                    "MITCH KOKO",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                "Smart Decices",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(),
            ),
            Expanded(
              child: GridView.builder(
                padding:
                    EdgeInsets.only(top: 0, left: 25, right: 25, bottom: 25),
                itemBuilder: (context, i) {
                  return SmartDeviceBox(
                    deviceName: mySmartDevices[i][0],
                    iconPath: mySmartDevices[i][1],
                    powerOn: mySmartDevices[i][2],
                    onChangePower: onChangeThePowerMode,
                  );
                },
                itemCount: mySmartDevices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
              ),
            ),
            // )
          ],
        ),
      ),
    );
  }
}

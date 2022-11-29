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
          margin: EdgeInsets.only(bottom: 20, left: 25, right: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(54),
          ),
          padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 5),
          // color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.person,
                size: 35,
              ),
              Icon(
                Icons.electric_meter,
                size: 35,
              ),
              Icon(
                Icons.electrical_services_rounded,
                size: 35,
              ),
              Icon(
                Icons.electric_car,
                size: 35,
              ),
              Icon(
                Icons.energy_savings_leaf_outlined,
                size: 35,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[300],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeAppBar(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
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
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Text(
                "Smart Decices",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Divider(),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(
                    top: 0, left: 25, right: 25, bottom: 25),
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

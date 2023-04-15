import 'package:being/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          Expanded(
            child: SizedBox(),
          ),
          Container(
            height: 80,
            width: size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [dark, primary, dark])),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 79.1,
                width: size.width,
                decoration: BoxDecoration(color: dark),
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    navBarOptions(
                      id: 0,
                      name: "discomforts",
                      asset: "assets/icons/discomforts.svg",
                    ),
                    navBarOptions(
                      id: 1,
                      name: "therapy",
                      asset: "assets/icons/therapy.svg",
                    ),
                    navBarOptions(
                      id: 2,
                      name: "progress",
                      asset: "assets/icons/progress.svg",
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget navBarOptions(
      {required int id, required String name, required String asset}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
        SvgPicture.asset(
          asset,
          width: 30,
          height: 30,
          color: light,
        ),
        SizedBox(height: 5),
        Text(
          name,
          style: TextStyle(color: light, fontSize: 12),
        )
      ],
    );
  }
}

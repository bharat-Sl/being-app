import 'package:being/constants/colors.dart';
import 'package:being/providers/discomforts_provider.dart';
import 'package:being/screens/discomforts_screen.dart';
import 'package:being/screens/progress_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<DiscomfortsProvider>(context, listen: false).getAll();
  }

  @override
  Widget build(BuildContext context) {
    var discomfortsProvider = Provider.of<DiscomfortsProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          Expanded(
            child: [
              DiscomfortsScreen(),
              SizedBox(),
              ProgressScreen()
            ][selectedIndex],
          ),
          if (discomfortsProvider.selectedDs.length == 0)
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
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
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
            )
          else
            Container(
                height: 80,
                width: size.width,
                decoration: BoxDecoration(color: primary),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${discomfortsProvider.selectedDs.length} of 3 priority Ds selected",
                      style: TextStyle(
                          color: dark,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    SizedBox(width: 8),
                    SvgPicture.asset(
                      "assets/icons/next-arrow.svg",
                      width: 15,
                      height: 15,
                      color: Colors.black,
                    ),
                  ],
                )),
        ],
      ),
    );
  }

  Widget navBarOptions(
      {required int id, required String name, required String asset}) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = id;
        });
      },
      child: Container(
        height: 80,
        width: 100,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (selectedIndex == id)
              Positioned(
                  top: -14,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: primary.withOpacity(0.6), blurRadius: 25),
                        ]),
                  )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                SvgPicture.asset(
                  asset,
                  width: 30,
                  height: 30,
                  color: selectedIndex == id ? primary : light,
                ),
                SizedBox(height: 5),
                Text(
                  name,
                  style: TextStyle(
                      color: selectedIndex == id ? primary : light,
                      fontSize: 12),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:being/components/discomforts_card.dart';
import 'package:being/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiscomfortsScreen extends StatefulWidget {
  const DiscomfortsScreen({Key? key}) : super(key: key);

  @override
  State<DiscomfortsScreen> createState() => _DiscomfortsScreenState();
}

class _DiscomfortsScreenState extends State<DiscomfortsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top + 40),
            Text(
              "KNOW YOURSELF",
              style: TextStyle(
                  color: light,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            ),
            SizedBox(height: 10),
            Text(
              "identify Ds (Discomforts)\nyou relate to",
              style: TextStyle(
                  letterSpacing: 0.2,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 25),
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: -32,
                  right: -65,
                  child: Container(
                    width: 223,
                    height: 223,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          coolblue.withOpacity(0.40),
                          coolblue.withOpacity(0)
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -126,
                  left: -57,
                  child: Container(
                    width: 356,
                    height: 329,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          primary.withOpacity(0.20),
                          coolblue.withOpacity(0)
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.10),
                      ]),
                      border: Border.all(
                          color: Colors.white.withOpacity(0.15), width: 1),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.6),
                          blurRadius: 16,
                          offset: Offset(0, 6),
                        )
                      ]),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                "You can now share any Ds (discomforts) with us",
                                style: TextStyle(
                                    letterSpacing: 0.2,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Image.asset(
                            "assets/images/share-discomforts-1.png",
                            width: 96,
                            height: 96,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.20),
                              blurRadius: 24,
                              offset: Offset(0, 10),
                            )
                          ],
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "share your discomforts",
                                style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 0.2,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 8),
                              SvgPicture.asset(
                                "assets/icons/next-arrow.svg",
                                width: 15,
                                height: 15,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
            //Divider
            Container(
              width: size.width,
              height: 1,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 0,
                    left: -50,
                    child: Container(
                      width: size.width + 50,
                      height: 1,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            Text(
              "Tap on the cards to prioritize up to 3 Ds (Discomforts) right now",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.4),
            ),
            SizedBox(height: 30),
            Text(
              "FRIDAY, 23 APR",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.3),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            ),
            SizedBox(height: 7.5),
            DiscomfortsCard(
              onchange: (val) {
                print(val);
              },
            ),
          ],
        ),
      ),
    );
  }
}

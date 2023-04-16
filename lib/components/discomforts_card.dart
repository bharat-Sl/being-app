import 'package:being/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiscomfortsCard extends StatefulWidget {
  Function? onchange;
  DiscomfortsCard({Key? key, this.onchange}) : super(key: key);

  @override
  State<DiscomfortsCard> createState() => _DiscomfortsCardState();
}

class _DiscomfortsCardState extends State<DiscomfortsCard> {
  bool show = false;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 17.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Color(0xff111826),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 15,
                offset: Offset(0, 4))
          ]),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xff808080).withOpacity(0.1),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  height: 27,
                  child: Stack(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    children: [
                      Positioned(
                        left: 0,
                        child: ShaderMask(
                          shaderCallback: (rect) {
                            return LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.black, Colors.transparent],
                            ).createShader(Rect.fromLTRB(
                                rect.width * 0.6, 0, rect.width, rect.height));
                          },
                          blendMode: BlendMode.dstIn,
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                    color: coolblue.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.white.withOpacity(0.1))),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/diamond.svg",
                                      width: 10,
                                      height: 10,
                                      color: coolblue,
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      "avoidant attachment",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 7),
                              SvgPicture.asset(
                                "assets/icons/tree.svg",
                                width: 18,
                                height: 18,
                                color: Colors.white.withOpacity(0.3),
                              ),
                              SizedBox(width: 7),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                    color: pumpkinorange.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.white.withOpacity(0.1))),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/diamond.svg",
                                      width: 10,
                                      height: 10,
                                      color: pumpkinorange,
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      "childhood flasdasdasd",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
                SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected ? null : Colors.white.withOpacity(0.75),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: selected
                        ? SizedBox()
                        : Center(
                            child: SvgPicture.asset(
                              "assets/icons/check.svg",
                              width: 6,
                              height: 6,
                              color: Colors.black,
                            ),
                          ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "I find it uncomfortable when my family does not understand the increased demands of my college",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          InkWell(
            onTap: () {
              setState(() {
                show = !show;
              });
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xff808080).withOpacity(0.1),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Objectives of this discomfort",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    width: 20,
                    height: 20,
                    child: Center(
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation((show ? 180 : 0) / 360),
                        child: SvgPicture.asset(
                          "assets/icons/arrow-down.svg",
                          width: 6,
                          height: 6,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

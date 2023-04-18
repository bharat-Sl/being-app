import 'package:being/constants/colors.dart';
import 'package:being/models/discomfort_model.dart';
import 'package:being/providers/discomforts_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DiscomfortsCard extends StatefulWidget {
  Function? onchange;
  Discomfort discomfort;
  DiscomfortsCard({Key? key, this.onchange, required this.discomfort})
      : super(key: key);

  @override
  State<DiscomfortsCard> createState() => _DiscomfortsCardState();
}

class _DiscomfortsCardState extends State<DiscomfortsCard>
    with SingleTickerProviderStateMixin {
  bool show = false;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 17.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: selected ? coolblue : Color(0xff111826),
          gradient: selected
              ? null
              : LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    primary.withOpacity(0.15),
                  ],
                ),
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
              color: selected
                  ? Colors.black.withOpacity(0.4)
                  : Color(0xff808080).withOpacity(0.1),
              image: DecorationImage(
                  image: AssetImage("assets/images/cracks.png"),
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerLeft),
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
                              colors: [
                                Colors.black,
                                Colors.transparent,
                                Colors.transparent
                              ],
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
                                      widget.discomfort.parentType,
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
                                width: 24,
                                height: 24,
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
                                      widget.discomfort.childType,
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
                    if (Provider.of<DiscomfortsProvider>(context, listen: false)
                            .selectedDs
                            .length <
                        3) {
                      setState(() {
                        selected = !selected;
                        Provider.of<DiscomfortsProvider>(context, listen: false)
                            .select(widget.discomfort);
                      });
                    }
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected ? Colors.white.withOpacity(0.75) : null,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: selected
                        ? Center(
                            child: SvgPicture.asset(
                              "assets/icons/check.svg",
                              width: 6,
                              height: 6,
                              color: Colors.black,
                            ),
                          )
                        : SizedBox(),
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
                    widget.discomfort.discomfort,
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
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: selected
                      ? Colors.black.withOpacity(0.15)
                      : Color(0xff808080).withOpacity(0.1),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(24),
                  ),
                ),
                child: ExpansionPanelList(
                  expandedHeaderPadding: EdgeInsets.zero,
                  elevation: 0,
                  animationDuration: Duration(milliseconds: 500),
                  children: [
                    ExpansionPanel(
                        backgroundColor: Colors.transparent,
                        isExpanded: show,
                        headerBuilder: (context, isOpen) {
                          return Row(
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
                                    turns: AlwaysStoppedAnimation(
                                        (show ? 180 : 0) / 360),
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
                          );
                        },
                        body: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 1,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                Colors.white.withOpacity(0.02),
                                Colors.white.withOpacity(0.2),
                                Colors.white.withOpacity(0.02),
                              ])),
                            ),
                            SizedBox(height: 15),
                            ...widget.discomfort.objectives.map(
                              (e) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 2),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 3),
                                      child: SvgPicture.asset(
                                        "assets/icons/diamond.svg",
                                        width: 10,
                                        height: 10,
                                        color: Colors.white.withOpacity(0.4),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                          ],
                        )),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

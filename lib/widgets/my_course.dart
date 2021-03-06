import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentor_mentee_connecting/Constant/route_constraint.dart';
import 'package:mentor_mentee_connecting/Model/DTO/CourseDTO.dart';
import 'package:mentor_mentee_connecting/Theme/color.dart';
import 'package:mentor_mentee_connecting/Utils/data.dart';
import 'package:mentor_mentee_connecting/View/course_detail.dart';
import 'package:mentor_mentee_connecting/widgets/custom_image.dart';

class MyCourseItem extends StatelessWidget {
  MyCourseItem({Key? key, required this.data, this.onTap}) : super(key: key);
  CourseDTO data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteHandler.COURSE_DETAILS, arguments: data);
      },
      child: Container(
          padding: EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              CustomImage(
                data.imageUrl ?? "",
                radius: 15,
                height: 90,
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.62,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name ?? "Name",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    buildProgress(
                        progress: 50.toDouble(),
                        activeColor: primary,
                        inactiveColor: inActiveColor,
                        width: MediaQuery.of(context).size.width * 0.5),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        // Icon(
                        //   Icons.schedule_rounded,
                        //   color: labelColor,
                        //   size: 14,
                        // ),
                        // SizedBox(
                        //   width: 2,
                        // ),
                        // Text(
                        //   data["duration"],
                        //   style: TextStyle(fontSize: 12, color: labelColor),
                        // ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "5/10 lessions",
                          style: TextStyle(fontSize: 12, color: labelColor),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: orange,
                          size: 14,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          data.totalRating.toString(),
                          style: TextStyle(fontSize: 12, color: labelColor),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget buildProgress(
      {Color? activeColor,
      Color? inactiveColor,
      double progress = 1,
      double? height,
      double width = 100}) {
    if (inactiveColor == null) {
      inactiveColor = Colors.grey;
    }
    if (height == null) {
      height = 4;
    }
    if (progress > 1) {
      progress /= 100;
    }
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: inactiveColor,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Stack(
        children: <Widget>[
          Container(
            width: width * progress,
            height: height,
            decoration: BoxDecoration(
                color: activeColor,
                borderRadius: BorderRadius.all(Radius.circular(4))),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/utils/colors_manager.dart';
import 'package:quran_app/core/widgets/titles_text_widgte.dart';

class TopicWidget extends StatelessWidget {
  const TopicWidget({super.key, required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          color: ColorManager.textMainColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitlesTextWidget(
                label: title.split(' ').take(7).join(' '),
                color: Colors.white,
                fontSize: 16.sp,
                maxLines: 1,
    
              ),
              // Text(
              //   maxLines: 2,
              //   overflow: TextOverflow.ellipsis,
              //   title,
              //   style:  TextStyle(color: Colors.white, fontSize: 18.sp),
              // ),
              //Spacer(),
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.shade100),
                  onPressed: onPressed,
                  child: Text(
                    "تصفح",
                    style: TextStyle(color: ColorManager.textMainColor),
                  )),
            ],
          ),
        ));
  }
}

class TopicWidget2 extends StatelessWidget {
  const TopicWidget2({super.key, required this.title, required this.onPressed});
  final dynamic title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          color: ColorManager.textMainColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                title,
                style: TextStyle(color: Colors.white, fontSize: 22.sp),
              ),
              //Spacer(),
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.shade100),
                  onPressed: onPressed,
                  child: Text(
                    "تصفح",
                    style: TextStyle(color: ColorManager.textMainColor),
                  )),
            ],
          ),
        ));
  }
}

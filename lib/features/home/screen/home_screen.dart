import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/features/Quran/presentation/screen/quran_home.dart';
import 'package:quran_app/features/adhkar/peresentation/screen/adhkar_screen.dart';
import 'package:quran_app/features/prophet_stories/peresentation/screens/prophet_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF230E4E),
        title: const Text(
          'الشاشة الرئيسية',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: buildMainScreen(context),
    );
  }
}

Widget buildMainScreen(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Expanded(
                  child: _buildCard(
                      context,
                      const Color(0xFFE57373),
                      const Color(0xFFFFCDD2),
                      'assets/animation/quran.json',
                      ' القرأن الكريم',
                      '/conversation_screen', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Directionality(
                                textDirection: TextDirection.rtl,
                                child:  QuranHome())));
                  }),
                ),
              ),
               SizedBox(width: 16.w), // مسافة بين البطاقات
              Padding(
                padding: const EdgeInsets.all(5),
                child: Expanded(
                  child: _buildCard(
                      context,
                      const Color(0xFF81C784),
                      const Color(0xFFC8E6C9),
                      'assets/animation/store.json',
                      'قصص الأنبياء',
                      '/stories_screen', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Directionality(
                                textDirection: TextDirection.rtl,
                                child:  ProphetScreenList())));
                  }),
                ),
              ),

            ],
          ),
        ),
         SizedBox(height: 16.h), // مسافة بين الصفوف
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Padding(
              //   padding: const EdgeInsets.all(5),
              //   // child: Expanded(
              //   //   child: _buildCard(
              //   //       context,
              //   //       const Color(0xFF64B5F6),
              //   //       const Color(0xFFBBDEFB),
              //   //       'assets/animation/read.json',
              //   //       'دروس تعليمية',
              //   //       '/tutorials_screen',
              //   //       () {}),
              //   // ),
              // ),
               SizedBox(width: 16.w), // مسافة بين البطاقات
              Padding(
                padding: const EdgeInsets.all(5),
                child: Expanded(
                  child: _buildCard(
                      context,
                      const Color(0xFFFFD54F),
                      const Color(0xFFFFF9C4),
                      'assets/animation/ee.json',
                      'الأذكار الاسلامية',
                      '/remembrance_screen', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Directionality(
                                textDirection: TextDirection.rtl,
                                child: const AdhkarsScreen())));
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildCard(
    BuildContext context,
    Color borderColor,
    Color bgColor,
    String animationPath,
    String cardTitle,
    String routeName,
    VoidCallback onPresed) {
  return InkWell(
    onTap: () {
      onPresed();
    },
    child: Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
      child: Column(
        children: <Widget>[
          Lottie.asset(animationPath, width: 150.w, height: 150.h),
           SizedBox(height: 10.h),
          Text(cardTitle,
              style:
                   TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

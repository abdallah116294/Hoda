import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/features/Quran/presentation/cubit/quran_cubit.dart';
import 'package:quran_app/features/Quran/presentation/screen/ayahs_screen.dart';

import '../widgets/item_widget.dart';
import 'package:quran_app/injection_container.dart' as di;

class QuranHome extends StatefulWidget {
  const QuranHome({super.key});

  @override
  State<QuranHome> createState() => _QuranHomeState();
}

class _QuranHomeState extends State<QuranHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        leading: const SizedBox(),
        actions: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:const  Icon(Icons.arrow_back_rounded,color: Colors.white,)
                ),
          )
        ],
        title: const Center(
            child: Text(
          "القران الكريم",
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: const Color(0xFF230E4E),
        elevation: 0.0,
      ),
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text(
        //     "القرأن الكريم",
        //     style: TextStyle(color: const Color(0xff672CBC), fontSize: 28.sp),
        //     textAlign: TextAlign.left,
        //   ),
        //   elevation: 0.0,
        //   backgroundColor: Colors.white,
        // ),
        body: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: BlocProvider(
            create: (context) => di.sl<QuranCubit>()..getSurah(),
            child:
                BlocBuilder<QuranCubit, QuranState>(builder: (context, state) {
              if (state is SurahasStateIsloading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SurahaStateLoadeed) {
                return ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AyahsScreen(
                                          ayahs: state.quranModdel.data!
                                              .surahs[index].ayahs,
                                          englishName: state.quranModdel.data!
                                              .surahs[index].englishName
                                              .toString(),
                                          englishNameTranslation: state
                                              .quranModdel
                                              .data!
                                              .surahs[index]
                                              .englishNameTranslation
                                              .toString(),
                                          revelationType: state
                                              .quranModdel
                                              .data!
                                              .surahs[index]
                                              .revelationType
                                              .toString(),
                                        )));
                          },
                          child: SurahaItemWidget(
                            numberOfAyahs: state.quranModdel.data!.surahs[index].ayahs.length,
                            englishName: state
                                .quranModdel.data!.surahs[index].englishName!
                                .toString(),
                            name: state.quranModdel.data!.surahs[index].name!
                                .toString(),
                            number: state
                                .quranModdel.data!.surahs[index].number!
                                .toInt(),
                            revelationType: state.quranModdel.data!
                                .surahs[index].revelationType!
                                .toString(),
                          ));
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.quranModdel.data!.surahs.length);
              } else if (state is SurahaStateError) {
                return Text(state.error.toString());
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff672CBC),
                ),
              );
            }),
          ),
        ));
  }
}

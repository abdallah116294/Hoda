import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/features/Quran/presentation/widgets/ayah_widget.dart';
import 'package:quran_app/features/Quran/presentation/widgets/surah_conainer_widget.dart';
import 'package:share_plus/share_plus.dart';

class AyahsScreen extends StatelessWidget {
  AyahsScreen({
    super.key,required this.ayahs, required this.englishName, required this.englishNameTranslation, required this.revelationType,

  });
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
final  List ayahs;
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SurahContainerWidget(
          numberofAyahs: ayahs.length,
          
          englishName:
              englishName,
          englishNameTranslation: englishNameTranslation,
          revelationType:revelationType,
        ),
        Expanded(
          child: ListView.builder(
              controller: _controller,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 20.r, right: 20.r),
                  child: AyahWidget(
                    url: ayahs[index].audio,
                    number: ayahs[index].numberInSurah,
                    text: ayahs[index].text.toString(),
                    onPressed1: () async {
                      await Share.share(ayahs[index].text.toString());
                    },
                    onPressed2: () {
                      Clipboard.setData(ClipboardData(
                              text: ayahs[index].text.toString()))
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("تم نسخ النص بنجاح ")));
                      });
                    },
                  ),
                );
              },
              itemCount:
                  ayahs.length),
        )
      ],
    ));
  }
}
//#DF98FA, #9055FF
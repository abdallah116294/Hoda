import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
class AyahWidget extends StatefulWidget {
  AyahWidget(
      {super.key,
      required this.number,
      required this.text,
      required this.onPressed1,
      required this.onPressed2,
      required this.url});
  int? number;
  String? text;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;
  final String url;

  @override
  State<AyahWidget> createState() => _AyahWidgetState();
}

class _AyahWidgetState extends State<AyahWidget> {
  bool isPlay = true;
  //final player=di.sl.call<AudioPlayer>;
  final player = AudioPlayer();
  Future<void> playAudio({required String url}) async {
    // final player = AudioPlayer();
    final duration =
        await player.setAudioSource(AudioSource.uri(Uri.parse(url)));
    //player.setAudioSource(AudioSource.uri(Uri.parse(url )
    await player.play();
  }

  void pause() {
    player.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 327.w,
          height: 47.h,
          decoration: ShapeDecoration(
              color: const Color(0x0C121931),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r))),
          child: Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: widget.onPressed1,
                    icon: const Icon(Icons.share)),
                IconButton(
                    onPressed: widget.onPressed2, icon: const Icon(Icons.copy)),
                Container(
                  width: 42,
                  height: 42,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF230E4E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.50),
                    ),
                  ),
                  child: Center(
                      child: TextButton(
                    child: isPlay
                        ? const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.pause,
                            color: Colors.white,
                          ),
                    onPressed: () {
                      if (isPlay) {
                        // log(widget.audoi);
                        playAudio(url: widget.url);
                        setState(() {
                          isPlay = false;
                        });
                        // BlocProvider.of<GetAdhkarCubit>(context)
                        //     .playAssetsAudio(path: widget.audoi);
                      } else {
                        pause();
                        // GetAdhkarCubit.get(context).pauseAssetsAudio();
                        setState(() {
                          isPlay = true;
                        });
                      }
                    },
                  )),
                ),
                Container(
                  width: 42.h,
                  height: 42.w,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF230E4E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.50.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widget.number.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          widget.text!,
          style: TextStyle(
            color: const Color(0xFF230E4E),
            fontSize: 18.sp,
            fontFamily: 'Amiri',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        )
      ],
    );
  }
}

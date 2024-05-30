import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/features/adhkar/data/repo/get_adhkar_repo.dart';
import 'package:quran_app/features/adhkar/peresentation/cubit/get_adhkar_state.dart';

class GetAdhkarCubit extends Cubit<GetAdhkarState> {
  GetAdhkarCubit({
    required this.getAdhkarRepo,
    required this.player,
    required this.assetsAudioPlayer,
  }) : super(GetAdhkarInitial());
  static GetAdhkarCubit get(context) => BlocProvider.of(context);
  GetAdhkarRepo getAdhkarRepo;
  AudioPlayer player;
  AssetsAudioPlayer assetsAudioPlayer;


  Future<void> getAdhkar() async {
    emit(GetAdhkarStateIsLoading());
    try {
      var response = await getAdhkarRepo.getAdhkar();
      emit(GetAdhkarStateLoaded(adhkar: response));
    } catch (error) {
      debugPrint(error.toString());
      emit(GetAdhkarStateError(error: error.toString()));
    }
  }

  Future<void> playAudio({required String url}) async {
    // final player = AudioPlayer();
    final duration = await player.setAsset(url);
    await player.play();
  }

  Future<void> playAssetsAudio({required String path}) async {
    await assetsAudioPlayer.open(
        autoStart: true, Audio("assets/audio/1.mp3"), showNotification: true);
  }

  Future<void> pauseAssetsAudio() async {
    assetsAudioPlayer.pause();
  }

  void pause() {
    player.pause();
  }

  // String _mapFailureToMsg(Failure failure) {
  //   switch (failure.runtimeType) {
  //     case ServerFailure:
  //       return "ServerFailure";
  //     case CacheFailure:
  //       return "CacheFailure";

  //     default:
  //       return "unexpectedError";
  //   }
  // }

}

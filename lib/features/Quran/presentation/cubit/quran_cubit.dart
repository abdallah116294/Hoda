import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/features/Quran/data/models/quran_model.dart';
import 'package:quran_app/features/Quran/data/repo/get_quran_repo.dart';
part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit({
    required this.getQuranRepo,
    required this.player,
  }) : super(QuranInitial());
  static QuranCubit get(context) => BlocProvider.of(context);
//  GetQuranUseCase quranUseCase;
  // GetSuwarsUseCaes getSuwarsUseCaes;
  AudioPlayer player;
  GetQuranRepo getQuranRepo;

  Future<void> getSurah() async {
    emit(SurahasStateIsloading());
    try {
      final quran = await getQuranRepo.getQuarn();

      ///  var quranModel = QuranModel.fromJson(quran);
      log( quran.toString());
      emit(SurahaStateLoadeed(quranModdel: quran));
    } catch (error) {
      debugPrint(error.toString());
      emit(SurahaStateError(error: error.toString()));
    }
  }

  // Future<void> getAyahs(int number) async {
  //   emit(AyahsStateIsLoading());
  //   try {
  //     Either<Failure, AyahsHeaderEntity> ahays = await getAyahsUscase(number);
  //     emit(ahays.fold(
  //         (failure) => AyahsStateError(msg: _mapFailureToMsg(failure)),
  //         (ayahs) => AyahsStateLoaded(quranEntity2: ayahs)));
  //   } catch (error) {
  //     debugPrint(error.toString());
  //     emit(AyahsStateError(msg: error.toString()));
  //   }
  // }

  Future<void> playAudio({required String url}) async {
    // final player = AudioPlayer();
    final duration = await player.setUrl(url);
    await player.play();
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

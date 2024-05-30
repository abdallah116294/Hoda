import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/features/Quran/data/repo/get_quran_repo.dart';
import 'package:quran_app/features/Quran/data/repo/get_quran_repo_impl.dart';
import 'package:quran_app/features/Quran/presentation/cubit/quran_cubit.dart';
import 'package:quran_app/features/Quran/presentation/cubit/quran_cubit.dart';
import 'package:quran_app/features/adhkar/data/repo/get_adhkar_repo.dart';
import 'package:quran_app/features/adhkar/data/repo/get_adhkar_repo_impl.dart';
import 'package:quran_app/features/adhkar/peresentation/cubit/get_adhkar_cubit.dart';
import 'package:quran_app/features/prophet_stories/data/repo/get_prophet_repo.dart';
import 'package:quran_app/features/prophet_stories/data/repo/get_prophet_repo_impl.dart';
import 'package:quran_app/features/prophet_stories/peresentation/cubit/get_prophet_stories_cubit.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //Adhkar
  //cubit
  sl.registerFactory<GetAdhkarCubit>(() => GetAdhkarCubit(
      getAdhkarRepo: sl(), player: sl(), assetsAudioPlayer: sl()));
  //repo
  sl.registerLazySingleton<GetAdhkarRepo>(() => GetAdhkarRepoImpl());
  //prophet
  sl.registerFactory<GetProphetStoriesCubit>(
      () => GetProphetStoriesCubit(getProphetRepo: sl()));
  //repo
  sl.registerLazySingleton<GetProphetRepo>(() => GetProphetRpoImpl());
  //Quran
  //cubit
  sl.registerFactory<QuranCubit>(
      () => QuranCubit(getQuranRepo: sl(), player: sl()));
  //repo
  sl.registerLazySingleton<GetQuranRepo>(() => GetQuranRepoImpl());

  //audio
  sl.registerLazySingleton<AudioPlayer>(() => AudioPlayer());
  sl.registerLazySingleton<AssetsAudioPlayer>(() => AssetsAudioPlayer());
}

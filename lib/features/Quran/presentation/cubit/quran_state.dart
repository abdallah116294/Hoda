part of 'quran_cubit.dart';

sealed class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object> get props => [];
}

final class QuranInitial extends QuranState {}

final class SurahasStateIsloading extends QuranState {}

final class SurahaStateLoadeed extends QuranState {
  final QuranModel quranModdel;
  const SurahaStateLoadeed({required this.quranModdel});
}
final class SurahaStateError extends QuranState {
  final String error;
  const SurahaStateError({required this.error});
}


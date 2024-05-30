import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/prophet_stories/data/repo/get_prophet_repo.dart';

part 'get_prophet_stories_state.dart';

class GetProphetStoriesCubit extends Cubit<GetProphetStoriesState> {
  GetProphetStoriesCubit({required this.getProphetRepo})
      : super(GetProphetStoriesInitial());
  GetProphetRepo getProphetRepo;
  Future<void> getProphetStories() async {
    emit(GetProphetStoriesLoadingState());
    try {
      var prophets = await getProphetRepo.getProphet();
      emit(GetProphetStoriesLoadedState(prophetStories: prophets));
    } catch (error) {
      emit(GetProphetStoriesErrorState());
    }
  }
}

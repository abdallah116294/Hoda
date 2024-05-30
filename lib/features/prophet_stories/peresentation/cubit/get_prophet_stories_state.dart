part of 'get_prophet_stories_cubit.dart';

sealed class GetProphetStoriesState extends Equatable {
  const GetProphetStoriesState();

  @override
  List<Object> get props => [];
}

final class GetProphetStoriesInitial extends GetProphetStoriesState {}

final class GetProphetStoriesLoadingState extends GetProphetStoriesState {}

final class GetProphetStoriesLoadedState extends GetProphetStoriesState {
  List prophetStories;
  GetProphetStoriesLoadedState({required this.prophetStories});
}
final class GetProphetStoriesErrorState extends GetProphetStoriesState{}
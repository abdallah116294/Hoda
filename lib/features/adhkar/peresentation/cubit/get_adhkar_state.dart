import 'package:equatable/equatable.dart';
sealed class GetAdhkarState extends Equatable {
  const GetAdhkarState();

  @override
  List<Object> get props => [];
}

final class GetAdhkarInitial extends GetAdhkarState {}

final class GetAdhkarStateIsLoading extends GetAdhkarState {}

final class GetAdhkarStateLoaded extends GetAdhkarState {
  List adhkar;
  GetAdhkarStateLoaded({required this.adhkar});
}

final class GetAdhkarStateError extends GetAdhkarState {
  String error;
  GetAdhkarStateError({required this.error});
}


import 'package:equatable/equatable.dart';

class UpdateContactState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdateContactInit extends UpdateContactState {}

class LoadingUpdateContact extends UpdateContactState {}

class ErrorUpdateState extends UpdateContactState {
  final String error;

  ErrorUpdateState({required this.error});
}

class UpdateSuccess extends UpdateContactState {
  final bool? isUpdating;

  UpdateSuccess({required this.isUpdating});
}

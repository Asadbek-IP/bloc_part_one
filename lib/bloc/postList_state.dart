import 'package:bloc_part_one/model/contact_model.dart';
import 'package:equatable/equatable.dart';

abstract class ContactListState extends Equatable {
  @override
  // TODO: implement props
  List<Contact> get props => [];
}

class ContactListInit extends ContactListState {}

class LoadingState extends ContactListState {}

class LoadedState extends ContactListState {
  List<Contact> contacts;
  LoadedState({required this.contacts});
  @override
  // TODO: implement props
  List<Contact> get props => contacts;
}

class ErrorState extends ContactListState {
  final error;
  ErrorState({required this.error});
}

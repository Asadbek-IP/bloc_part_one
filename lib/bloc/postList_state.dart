import 'package:bloc_part_one/model/post_model.dart';
import 'package:equatable/equatable.dart';

abstract class PostListState extends Equatable {
  @override
  // TODO: implement props
  List<Post> get props => [];
}

class PostListInit extends PostListState {}

class LoadingState extends PostListState {}

class LoadedState extends PostListState {
  List<Post> posts;
  LoadedState({required this.posts});
  @override
  // TODO: implement props
  List<Post> get props => posts;
}

class ErrorState extends PostListState {
  final error;
  ErrorState({required this.error});
}

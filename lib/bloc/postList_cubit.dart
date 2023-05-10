import 'package:bloc_part_one/bloc/postList_state.dart';
import 'package:bloc_part_one/model/post_model.dart';
import 'package:bloc_part_one/service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostListCubit extends Cubit<PostListState> {
  PostListCubit() : super(PostListInit());

  Future<void> getApi() async {
    emit(LoadingState());
    try {
      List<Post>? res = await ApiService.getListPost();
      emit(LoadedState(posts: res ?? []));
    } catch (e) {
      emit(ErrorState(error: e));
    }
  }
}

import 'package:bloc_part_one/bloc/postList_state.dart';
import 'package:bloc_part_one/model/contact_model.dart';
import 'package:bloc_part_one/service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactListCubit extends Cubit<ContactListState> {
  ContactListCubit() : super(ContactListInit());

  Future<void> getApi() async {
    emit(LoadingState());
    try {
      List<Contact>? res = await ApiService.getListPost();
      emit(LoadedState(contacts: res ?? []));
    } catch (e) {
      emit(ErrorState(error: e));
    }
  }

  Future<void> delete(String id) async {
    emit(LoadingState());
    try {
      ApiService.deleteContact(id).then((value) {
        getApi();
      });
    } catch (e) {
      emit(ErrorState(error: e));
    }
  }
}

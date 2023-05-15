import 'package:bloc_part_one/bloc/update_contact_state.dart';
import 'package:bloc_part_one/model/contact_model.dart';
import 'package:bloc_part_one/service/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCubit extends Cubit<UpdateContactState> {
  UpdateCubit() : super(UpdateContactInit());

  Future<void> updateContact(Contact contact, BuildContext context) async {
    emit(LoadingUpdateContact());

    try {
      bool isUpdating = await ApiService.updateContact(contact);
      emit(UpdateSuccess(isUpdating: isUpdating));
      if (isUpdating) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context, isUpdating);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Success is Update")));
        });
      }
    } catch (e) {
      emit(ErrorUpdateState(error: e.toString()));
    }
  }
}

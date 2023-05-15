import 'package:bloc_part_one/bloc/update_contact_state.dart';
import 'package:bloc_part_one/bloc/update_cubit.dart';
import 'package:bloc_part_one/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPage extends StatefulWidget {
  final Contact contact;
  const EditPage({required this.contact});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nameController.text = widget.contact.name;
    phoneNumberController.text = widget.contact.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateCubit(),
      child: Scaffold(
        body: Center(child: BlocBuilder<UpdateCubit, UpdateContactState>(
            builder: (BuildContext context, UpdateContactState state) {
          if (state is LoadingUpdateContact) {
            return CircularProgressIndicator();
          } else if (state is ErrorUpdateState) {
            return Text(state.error);
          } else {
            return Container(
              margin: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: phoneNumberController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Contact newcontact = Contact(
                            name: nameController.text,
                            avatar:
                                "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80",
                            phoneNumber: phoneNumberController.text,
                            id: widget.contact.id);

                        context
                            .read<UpdateCubit>()
                            .updateContact(newcontact, context);
                      },
                      child: Text("Updating")),
                ],
              ),
            );
          }
        })),
      ),
    );
  }
}

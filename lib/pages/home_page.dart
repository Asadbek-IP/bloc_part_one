import 'dart:ui';

import 'package:bloc_part_one/bloc/postList_cubit.dart';
import 'package:bloc_part_one/bloc/postList_state.dart';
import 'package:bloc_part_one/pages/edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/contact_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ContactListCubit>(context).getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BLoC One Part"),
      ),
      body: BlocBuilder<ContactListCubit, ContactListState>(
        builder: (context, state) {
          if (state is LoadingState || state is ContactListInit) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            List<Contact> contacts = state.props;
            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: ((context, index) => SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Slidable(
                      key: const ValueKey(0),
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(onDismissed: () {
                          print("ishladi");
                        }),
                        children: [
                          SlidableAction(
                            onPressed: (c) {
                              context
                                  .read<ContactListCubit>()
                                  .delete(contacts[index].id);
                            },
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            flex: 2,
                            onPressed: (c) {
                              //Navigator
                              EditPage(
                                name: contacts[index].name,
                                phoneNumber: contacts[index].phoneNumber,
                                id: contacts[index].id,
                              );
                            },
                            backgroundColor: Color(0xFF7BC043),
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: 'Edit',
                          ),
                        ],
                      ),
                      child: Container(
                        margin: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              backgroundImage:
                                  NetworkImage(contacts[index].avatar),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      contacts[index].name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      contacts[index].phoneNumber,
                                      style: TextStyle(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            );
          }
        },
      ),
    );
  }
}

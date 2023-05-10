import 'dart:ui';

import 'package:bloc_part_one/bloc/postList_cubit.dart';
import 'package:bloc_part_one/bloc/postList_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/post_model.dart';

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
    BlocProvider.of<PostListCubit>(context).getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BLoC One Part"),
      ),
      body: BlocBuilder<PostListCubit, PostListState>(
        builder: (context, state) {
          if (state is LoadingState || state is PostListInit) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            List<Post> postlar = state.props;
            return ListView.builder(
              itemCount: postlar.length,
              itemBuilder: ((context, index) => Container(
                    margin: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(color: Colors.white),
                          ),
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
                                  postlar[index].title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  postlar[index].body,
                                  style: TextStyle(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          }
        },
      ),
    );
  }
}

import 'package:bloc_part_one/bloc/postList_cubit.dart';
import 'package:bloc_part_one/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostListCubit(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

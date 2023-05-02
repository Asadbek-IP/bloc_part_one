import 'package:bloc_part_one/pages/homepage/bloc/counter_cubit.dart';
import 'package:bloc_part_one/pages/homepage/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: BlocBuilder<CounterCubit, CounterInit>(
        builder: (context, state) => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.counterValue.toString()),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterCubit>().kamayish();
                        },
                        child: Text("-")),
                    SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterCubit>().oshirish();
                        },
                        child: Text("+")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

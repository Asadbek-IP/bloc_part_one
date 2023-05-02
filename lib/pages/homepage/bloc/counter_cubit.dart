import 'package:bloc_part_one/pages/homepage/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterInit> {
  CounterCubit() : super(CounterInit(counterValue: 0));

  void oshirish() {
    emit(CounterInit(counterValue: state.counterValue + 1));
  }

  void kamayish() {
    emit(CounterInit(counterValue: state.counterValue - 1));
  }
}

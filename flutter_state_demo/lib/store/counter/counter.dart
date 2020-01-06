import 'package:mobx/mobx.dart';
part 'counter.g.dart';

class Counter = CounterMobx with _$Counter;

abstract class CounterMobx with Store {
  @observable
  int value = 222;

  @action
  void increment() {
    value++;
  }

  @action
  void minus() {
    value--;
  }
}

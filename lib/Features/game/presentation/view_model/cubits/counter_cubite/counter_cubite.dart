import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  List<String> selectedRoles = [];

  List<String> selectedRolesF(String roleName) {
    selectedRoles.add(roleName);
    return selectedRoles;
  }

  List<String> selectedRolesFF() {
    selectedRoles.removeAt(0);
    return selectedRoles;
  }

  void increment() => emit(state + 1);

  void decrement() => emit(state < 1 ? 0 : state - 1);
}

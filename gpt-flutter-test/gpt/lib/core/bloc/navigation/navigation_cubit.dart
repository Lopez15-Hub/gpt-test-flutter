import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  void goToChat(NavigatorState navigator) {
    navigator.pushReplacementNamed("chat");
  }
}

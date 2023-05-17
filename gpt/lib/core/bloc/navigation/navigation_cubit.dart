import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'navigation_state.dart';
/// 
/// Cubir for manage the navigation of app.
/// 
class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

/// Go to chat page.
/// [navigator] State of Navigator
/// 
  void goToChat(NavigatorState navigator) {
    navigator.pushReplacementNamed("chat");
  }
}

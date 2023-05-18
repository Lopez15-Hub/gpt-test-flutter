import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'navigation_state.dart';

///
/// Cubir for manage the navigation of app.
///
class NavigationCubit extends Cubit<NavigationState> {
  late NavigatorState navigator;
  NavigationCubit() : super(NavigationInitial());

  /// Go to chat page.
  /// [navigator] State of Navigator
  ///
  void goToChat(BuildContext context) {
    navigator = Navigator.of(context);

    navigator.pushReplacementNamed("chat");
  }
}

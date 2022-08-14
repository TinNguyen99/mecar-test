import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'themes_event.dart';
part 'themes_state.dart';

class ThemesBloc extends Bloc<ThemesEvent, ThemesState> {
  ThemesBloc() : super(const ThemesState(themeMode: ThemeMode.light)) {
    on<ThemesEvent>(_onToggleTheme);
  }

  _onToggleTheme(ThemesEvent event, Emitter<ThemesState> emit) {
    if (state.themeMode == ThemeMode.dark) {
      emit(state.update(themeMode: ThemeMode.light));
    } else {
      emit(state.update(themeMode: ThemeMode.dark));
    }
  }
}

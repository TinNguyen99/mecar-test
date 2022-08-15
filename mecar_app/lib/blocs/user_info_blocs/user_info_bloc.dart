import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc() : super(const UserInfoState(phoneNumber: '')) {
    on<UpdatePhoneNumberEvent>(onUpdatePhoneNumber);
  }

  onUpdatePhoneNumber(UpdatePhoneNumberEvent event, Emitter<UserInfoState> emit) {
    emit(state.update(phoneNumber: event.phoneNumber));
  }
}

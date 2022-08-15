part of 'user_info_bloc.dart';

@immutable
abstract class UserInfoEvent {}

class UpdatePhoneNumberEvent extends UserInfoEvent {
  final String phoneNumber;

  UpdatePhoneNumberEvent(this.phoneNumber);
}

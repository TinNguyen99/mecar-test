part of 'user_info_bloc.dart';

class UserInfoState extends Equatable {
  final String phoneNumber;

  const UserInfoState({
    this.phoneNumber = "",
  });

  UserInfoState update({String? phoneNumber}) {
    return UserInfoState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object> get props => [
        phoneNumber,
      ];
}

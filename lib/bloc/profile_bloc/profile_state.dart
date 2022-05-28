part of 'profile_bloc.dart';

@immutable
abstract class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final List<Profile> profiles;
  final List<User> users;
  ProfileLoaded(this.profiles, this.users);
  @override
  List<Object> get props => [profiles, users];
}

class UnLoadedProfile extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileError extends ProfileState {
  final String error;

  ProfileError(this.error);

  @override
  List<Object> get props => [error];
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/data/models/profile.dart';
import 'package:to_do_list/data/repositories/profile_repository.dart/project_repository.dart';

import '../../data/models/user.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;
  ProfileBloc({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository,
        super(ProfileLoading()) {
    on<LoadProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        List<Profile> profiles = await _profileRepository.getAllProfile();
        List<User> users = await _profileRepository.getAllUser();
        emit(ProfileLoaded(profiles, users));
      } catch (e) {
        emit(UnLoadedProfile());
        emit(ProfileError(e.toString()));
      }
    });
  }
}

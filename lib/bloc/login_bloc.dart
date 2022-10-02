import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news2_0/data/remote/repository.dart';

import '../data/model/well.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  //final Repository newsRepository;
  //final String qWord;
  LoginBloc() : super(NewsInitial()) {
    final Repository newsRepository=Repository();

    on<OutputNewsEvent>((event, emit) async{
      try {
        emit(NewsLoadingInitial());
        final loadedUserList = await newsRepository.getNewsRepositoryTwo("");
        print("проверка newsLoadingInitial ${loadedUserList}");
        emit(NewsLoadedInitial(loadedUserList));
      } catch (e) {
        emit(NewsErrorInitial());
      }

    });
  }


}

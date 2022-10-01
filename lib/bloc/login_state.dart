part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable{
  const LoginState();

  @override
  List<Object> get props => [];
}


//данные отсутствуют, не загружены, первоначальное состояние
class NewsInitial extends LoginState {}

//данные в состоянии загрузки
class NewsLoadingInitial extends LoginState {}

//данные загружены
class NewsLoadedInitial extends LoginState {
  final Well well;
  const NewsLoadedInitial(this.well);
  /*dynamic loadedNews;
  NewsLoadedInitial({required this.loadedNews}):assert(loadedNews != null);*/
}

class NewsErrorInitial extends LoginState{

}









































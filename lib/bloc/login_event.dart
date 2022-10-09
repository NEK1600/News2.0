part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
  String qWord="";
}
class SearchNewsEvent extends LoginEvent {
  final String qWord;
  SearchNewsEvent(this.qWord);
}
class OutputNewsEvent extends LoginEvent {}

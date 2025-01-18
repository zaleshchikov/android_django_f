part of 'particular_stat_bloc.dart';

class ParticularStatEvent {}

class GetDate extends ParticularStatEvent{
  List<String> pattern;

  GetDate(this.pattern);
}
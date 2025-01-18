part of 'general_stat_bloc.dart';

@immutable
class GeneralStatState {

  StatisticModel? salary;
  StatisticModel? salaryCity;
  StatisticModel? count;
  StatisticModel? ratio;
  StatisticModel? skills;
  bool isLoading;

  GeneralStatState(this.salary, this.salaryCity, this.count, this.ratio,
      this.skills, {this.isLoading = true});
}


import 'package:android_django/bloc/last_vacanceis/last_vacanceis_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:intl/intl.dart";

class LastVacancies extends StatelessWidget {
  const LastVacancies({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return BlocProvider(
      create: (context) => LastVacanceisBloc()..add(GetData()),
      child: Builder(builder: (context) {
        return BlocBuilder<LastVacanceisBloc, LastVacanceisState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(size.height / 100),
                child: state.isLoading
                    ? Column(
                        children: [
                          Text('Данные о последних вакансиях',
                              style: theme.textTheme.titleLarge!
                                  .copyWith(color: Colors.black87)),
                          Container(height: size.height / 4),
                          Container(
                            height: size.height / 4,
                            width: size.height / 4,
                            child: CircularProgressIndicator(
                                color: Colors.black87),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          Text('Данные о последних вакансиях',
                              style: theme.textTheme.titleLarge!
                                  .copyWith(color: Colors.black87)),
                          Container(height: size.height / 50),
                          ...List.generate(
                              state.vacancies.length,
                              (index) => Container(
                                    padding: EdgeInsets.all(size.height / 100),
                                    margin: EdgeInsets.symmetric(
                                        vertical: size.height / 100),
                                    height: size.height / 3,
                                    width: size.width * 0.7,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text('Название вакансии:',
                                                style: theme
                                                    .textTheme.bodyMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w900)),
                                            Container(width: size.width / 100),
                                            Text(state.vacancies[index].title),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('Описание вакансии:',
                                                style: theme
                                                    .textTheme.bodyMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w900)),
                                            Container(width: size.width / 100),
                                            Container(
                                                width: size.width * 0.5,
                                                height: size.height / 10,
                                                child: Text(
                                                    state.vacancies[index]
                                                        .description,
                                                    style: theme
                                                        .textTheme.labelMedium!
                                                        .copyWith(
                                                            color: Colors
                                                                .black87))),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('Навыки:',
                                                style: theme
                                                    .textTheme.bodyMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w900)),
                                            Container(width: size.width / 100),
                                            Text(state.vacancies[index].skills),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('Название компании:',
                                                style: theme
                                                    .textTheme.bodyMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w900)),
                                            Container(width: size.width / 100),
                                            Text(
                                                state.vacancies[index].company),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('Вилка зарплаты:',
                                                style: theme
                                                    .textTheme.bodyMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w900)),
                                            Container(width: size.width / 100),
                                            Text(state.vacancies[index].salary
                                                    .isEmpty
                                                ? 'Нет данных'
                                                : '${state.vacancies[index].salary[0]} - ${state.vacancies[index].salary.length > 1 ? state.vacancies[index].salary[1] : '...'}'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('Место:',
                                                style: theme
                                                    .textTheme.bodyMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w900)),
                                            Container(width: size.width / 100),
                                            Text(state.vacancies[index].area),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('Дата публикации:',
                                                style: theme
                                                    .textTheme.bodyMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w900)),
                                            Container(width: size.width / 100),
                                            Text(
                                                DateFormat('yyyy-MM-dd – kk:mm')
                                                    .format(state
                                                        .vacancies[index]
                                                        .publishedAt)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('Название вакансии:',
                                                style: theme
                                                    .textTheme.bodyMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w900)),
                                            Container(width: size.width / 100),
                                            Text(state.vacancies[index].title),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ))
                        ],
                      ),
              ),
            );
          },
        );
      }),
    );
  }
}

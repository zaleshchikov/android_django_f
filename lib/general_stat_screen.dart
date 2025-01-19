import 'package:android_django/bloc/general_stat/general_stat_bloc.dart';
import 'package:android_django/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class GeneralStatScreen extends StatelessWidget {
  const GeneralStatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var theme = Theme.of(context);

    return BlocProvider(
      create: (context) =>
      GeneralStatBloc()
        ..add(GetData()),
      child: Builder(
          builder: (context) {
            return BlocBuilder<GeneralStatBloc, GeneralStatState>(
              builder: (context, state) {
                return state.isLoading ? Center(
                  child: Container(
                      height: size.height/4,
                      width: size.height/4,
                      child: CircularProgressIndicator(color: Colors.black87,)),
                ) : Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(width: size.width/100),
                            Text('1) Зарплата по годам:', style: theme.textTheme.titleMedium,)
                          ],
                        ),
                        Container(height: size.height/100),
                        Container(
                          height: size.height,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(size.height/100),
                                  height: size.height * 0.65,
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(color: Colors.black87),
                                      borderRadius: BorderRadius.circular(40)
                                  ),
                                  child: Container(
                                    height: size.height * 0.55,
                                    width: size.width * 0.3,
                                    foregroundDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40)
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(image: NetworkImage(
                                          state.salary!.generalURL,
                                        ), fit: BoxFit.contain)
                                    ),
                                  )),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(size.height/100),
                                    height: size.height*0.5,
                                    width: size.width*0.5,
                                    child: buildHtmlTable(state.salary!.GeneralHTML),
                                  ),
                                ],
                              )

                              // HtmlWidget(
                              //   state.salary!.GeneralHTML,
                              // ),

                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(width: size.width/100),
                            Text('2) Количество вакансий по годам:', style: theme.textTheme.titleMedium,)
                          ],
                        ),
                        Container(height: size.height/100),
                        Container(
                          height: size.height,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(size.height/100),
                                  height: size.height * 0.65,
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(color: Colors.black87),
                                      borderRadius: BorderRadius.circular(40)
                                  ),
                                  child: Container(
                                    height: size.height * 0.55,
                                    width: size.width * 0.3,
                                    foregroundDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40)
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(image: NetworkImage(
                                          state.count!.generalURL,
                                        ), fit: BoxFit.contain)
                                    ),
                                  )),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(size.height/100),
                                    height: size.height*0.5,
                                    width: size.width*0.5,
                                    child: buildHtmlTable(state.count!.GeneralHTML),
                                  ),
                                ],
                              )

                              // HtmlWidget(
                              //   state.count!.GeneralHTML,
                              // ),

                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(width: size.width/100),
                            Text('3) Зарплата по городам:', style: theme.textTheme.titleMedium,)
                          ],
                        ),
                        Container(height: size.height/100),
                        Container(
                          height: size.height*0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(size.height/100),
                                  height: size.height * 0.65,
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(color: Colors.black87),
                                      borderRadius: BorderRadius.circular(40)
                                  ),
                                  child: Container(
                                    height: size.height * 0.55,
                                    width: size.width * 0.3,
                                    foregroundDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40)
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(image: NetworkImage(
                                          state.salaryCity!.generalURL,
                                        ), fit: BoxFit.contain)
                                    ),
                                  )),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(size.height/100),
                                    height: size.height*0.5,
                                    width: size.width*0.5,
                                    child: buildHtmlTable(state.salaryCity!.GeneralHTML),
                                  ),
                                ],
                              )

                              // HtmlWidget(
                              //   state.salaryCity!.GeneralHTML,
                              // ),

                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(width: size.width/100),
                            Text('4) Доля вакансий по городам:', style: theme.textTheme.titleMedium,)
                          ],
                        ),
                        Container(height: size.height/100),
                        Container(
                          height: size.height*0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(size.height/100),
                                  height: size.height * 0.65,
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(color: Colors.black87),
                                      borderRadius: BorderRadius.circular(40)
                                  ),
                                  child: Container(
                                    height: size.height * 0.55,
                                    width: size.width * 0.3,
                                    foregroundDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40)
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(image: NetworkImage(
                                          state.ratio!.generalURL,
                                        ), fit: BoxFit.contain)
                                    ),
                                  )),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(size.height/100),
                                    height: size.height*0.5,
                                    width: size.width*0.5,
                                    child: buildHtmlTable(state.ratio!.GeneralHTML),
                                  ),
                                ],
                              )

                              // HtmlWidget(
                              //   state.ratio!.GeneralHTML,
                              // ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(width: size.width/100),
                            Text('5) ТОП-20 навыков:', style: theme.textTheme.titleMedium,)
                          ],
                        ),
                        Container(height: size.height/100),
                        Container(
                          height: size.height*1.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(size.height/100),
                                  height: size.height * 0.65,
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(color: Colors.black87),
                                      borderRadius: BorderRadius.circular(40)
                                  ),
                                  child: Container(
                                    height: size.height * 0.55,
                                    width: size.width * 0.3,
                                    foregroundDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40)
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(image: NetworkImage(
                                          state.skills!.generalURL,
                                        ), fit: BoxFit.contain)
                                    ),
                                  )),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(size.height/100),
                                    height: size.height*0.5,
                                    width: size.width*0.5,
                                    child: buildHtmlTable(state.skills!.GeneralHTML),
                                  ),
                                ],
                              )

                              // HtmlWidget(
                              //   state.skills!.GeneralHTML,
                              // ),

                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                );
              },
            );
          }
      ),
    );
  }
}

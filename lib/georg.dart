import 'package:android_django/bloc/general_stat/general_stat_bloc.dart';
import 'package:android_django/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class GeogrScreen extends StatelessWidget {
  String screenName;
  List<String>  param;

  GeogrScreen(this.screenName, this.param);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return BlocProvider(
      create: (context) => GeneralStatBloc()..add(GetData()),
      child: Builder(builder: (context) {
        return BlocBuilder<GeneralStatBloc, GeneralStatState>(
          builder: (context, state) {
            return state.isLoading
                ? Center(
              child: Container(
                  height: size.height / 4,
                  width: size.height / 4,
                  child: CircularProgressIndicator(
                    color: Colors.black87,
                  )),
            )
                : SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(width: size.width / 100),
                      Text(
                        screenName,
                        style: theme.textTheme.titleMedium,
                      )
                    ],
                  ),
                  Container(height: size.height / 100),
                  Container(
                    height: size.height*0.6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            padding: EdgeInsets.all(size.height / 100),
                            height: size.height * 0.65,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.black87),
                                borderRadius: BorderRadius.circular(40)),
                            child: Container(
                              height: size.height * 0.55,
                              width: size.width * 0.3,
                              foregroundDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        state.ratio!.professionURL,
                                      ),
                                      fit: BoxFit.contain)),
                            )),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(size.height/100),
                              height: size.height*0.5,
                              width: size.width*0.5,
                              child: buildHtmlTable(state.ratio!.professionHTML),
                            ),
                          ],
                        )
                        // HtmlWidget(
                        //   state.ratio!.professionHTML,
                        // ),
                      ],
                    ),
                  ),
                  Container(height: size.height / 100),
                  Container(
                    height: size.height*0.6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            padding: EdgeInsets.all(size.height / 100),
                            height: size.height * 0.65,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.black87),
                                borderRadius: BorderRadius.circular(40)),
                            child: Container(
                              height: size.height * 0.55,
                              width: size.width * 0.3,
                              foregroundDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        state.salaryCity!.professionURL,
                                      ),
                                      fit: BoxFit.contain)),
                            )),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(size.height/100),
                              height: size.height*0.5,
                              width: size.width*0.5,
                              child: buildHtmlTable(state.salaryCity!.professionHTML),
                            ),
                          ],
                        )


                        // HtmlWidget(
                        //   state.salaryCity!.professionHTML,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

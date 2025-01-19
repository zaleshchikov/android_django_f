import 'package:android_django/bloc/user_data/user_data_bloc.dart';
import 'package:android_django/description_screen.dart';
import 'package:android_django/general_stat_screen.dart';
import 'package:android_django/georg.dart';
import 'package:android_django/last_vacancies.dart';
import 'package:android_django/stat_screen.dart';
import 'package:android_django/vost.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart' as html_parser;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController pageController = PageController();
  late List items;
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    items = [
      SideMenuItem(
        title: 'Основная информация',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: Icon(Icons.data_object),
      ),
      SideMenuItem(
        title: 'Общая статистика',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: Icon(Icons.bar_chart),
      ),
      SideMenuItem(
        title: 'Востребованность',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: Icon(Icons.campaign_outlined),
      ),
      SideMenuItem(
        title: 'География',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: Icon(Icons.place_outlined),
      ),
      SideMenuItem(
        title: 'Навыки',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: Icon(Icons.laptop),
      ),
      SideMenuItem(
        title: 'Последние вакансии',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: Icon(Icons.access_time_outlined),
      ),
    ];

    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final fontHeight = height / 852;

    var size = MediaQuery.of(context).size;
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: TextTheme(
            labelLarge: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w500,
                fontSize: fontHeight * 13,
                color: Colors.black54),
            labelMedium: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w500,
                fontSize: fontHeight * 13,
                color: Color(0xffDADEE9)),
            bodyMedium: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w500,
                fontSize: fontHeight * 16,
                color: Color(0xff333333)),
            bodyLarge: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w500,
                fontSize: fontHeight * 18,
                color: Color(0xff333377)),
            titleSmall: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w700,
                fontSize: fontHeight * 20,
                color: Color(0xffffffff)),
            titleLarge: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w700,
                fontSize: fontHeight * 25,
                color: Color(0xff333333)),
            titleMedium: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w700,
                fontSize: fontHeight * 30,
                color: Color(0xff333333)),
          ),
        ),
        home: BlocProvider(
          create: (context) => UserDataBloc()..add(GetDate()),
          child: Builder(
            builder: (context) {
              return Container(
                height: size.height,
                width: size.width,
                child: Scaffold(
                  body: Row(
                    children: [
                      BlocBuilder<UserDataBloc, UserDataState>(
                  builder: (context, state) {
                    return SideMenu(
                        style: SideMenuStyle(
                          displayMode: SideMenuDisplayMode.auto,
                          decoration: BoxDecoration(),
                          openSideMenuWidth: size.width*0.15,
                          compactSideMenuWidth: 100,
                          hoverColor: Colors.grey[100],
                          selectedColor: Colors.black,
                          selectedIconColor: Colors.white,
                          unselectedIconColor: Colors.black54,
                          backgroundColor: Colors.white,
                          selectedTitleTextStyle: TextStyle(color: Colors.white),
                          unselectedTitleTextStyle: TextStyle(color: Colors.black54),
                          iconSize: 50,
                          itemBorderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          showTooltip: true,
                          showHamburger: true,
                          itemHeight: 100.0,
                          itemInnerSpacing: 8.0,
                          itemOuterPadding: const EdgeInsets.symmetric(
                              horizontal: 5.0),
                          toggleColor: Colors.black54,

                          // Additional properties for expandable items
                          selectedTitleTextStyleExpandable:
                          TextStyle(color: Colors.white),
                          // Adjust the style as needed
                          unselectedTitleTextStyleExpandable:
                          TextStyle(color: Colors.black54),
                          // Adjust the style as needed
                          selectedIconColorExpandable: Colors.white,
                          unselectedIconColorExpandable: Colors.black54,
                          arrowCollapse: Colors.green,
                          arrowOpen: Colors.lightBlueAccent,
                          iconSizeExpandable: 24.0, // Adjust the size as needed
                        ),
                        controller: sideMenu,
                        title: Container(
                          height: size.height/7,
                          child: Column(
                            children: [
                              Center(
                                  child: Image.asset(
                                    'assets/logo.png',
                                    height: 100,
                                  )),
                            ],
                          ),
                        ),
                        onDisplayModeChanged: (mode) {
                          print(mode);
                        },
                        items: items,
                      );
                  },
                ),
                      Expanded(

                        //height: size.height,
                       // width: size.width*0.85,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocBuilder<UserDataBloc, UserDataState>(
                              builder: (context, state) {
                                return PreferredSize(
                                  preferredSize: Size(size.width*0.85, size.height*0.15),
                                  child: state.isLoading ? CircularProgressIndicator(color: Colors.white) :  AppBar(
                                    centerTitle: true,
                                    backgroundColor: Colors.black87,
                                    title: Text(state.projectName, style: Theme.of(context).textTheme.titleSmall,),
                                  ),
                                );
                              },
                            ),
                            Container(
                              height: size.height*0.85,
                              width: size.width*0.85,
                              child: PageView(
                                controller: pageController,
                                children: [
                                  DescriptionScreen(),
                                  GeneralStatScreen(),
                                  VostScreen('Востребованность для профессии\nAndroid-разработчик', ['salary', 'count']),
                                  GeogrScreen('География для профессии\nAndroid-разработчик', ['salary_city', 'ratio']),
                                  SkillsScreen('Навыки для профессии\nAndroid-разработчик', ['salary_city', 'ratio']),
                                  LastVacancies()
                                ],
                              ),
                            ),
                            BlocBuilder<UserDataBloc, UserDataState>(
                              builder: (context, state) {
                                return PreferredSize(
                                  preferredSize: Size(size.width*0.85, size.height*0.15),
                                  child: AppBar(
                                    centerTitle: true,
                                    backgroundColor: Colors.black87,
                                    title: state.isLoading ? CircularProgressIndicator(color: Colors.white) : Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: size.width*0.1,),
                                        Text(state.name, style: Theme.of(context).textTheme.titleSmall,),
                                        Text(state.group, style: Theme.of(context).textTheme.titleSmall,),
                                        Container(width: size.width*0.15,),

                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          ),
        ));
  }
}

Widget buildHtmlTable(String htmlString) {
  // Парсим HTML
  final document = html_parser.parse(htmlString);

  // Получаем элементы таблицы
  final table = document.getElementsByTagName('table').first;
  final rows = table.getElementsByTagName('tr');

  // Создаем список виджетов для строк таблицы
  List<TableRow> tableRows = [];

  for (var row in rows) {
    final cells = row.getElementsByTagName('th').isNotEmpty
        ? row.getElementsByTagName('th') // Заголовки
        : row.getElementsByTagName('td'); // Обычные ячейки

    List<Widget> cellWidgets = cells.map((cell) {
      return Container(
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          cell.text,
          style: TextStyle(
            fontWeight: cells.first == cell ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );
    }).toList();

    tableRows.add(TableRow(children: cellWidgets));
  }

  return Container(
    height: 200,
    width: 200,
    child: Table(
      defaultColumnWidth: IntrinsicColumnWidth(),
      border: TableBorder.all(),
      children: tableRows,
    ),
  );
}

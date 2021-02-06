import 'package:animaciones_app/helpers/media_size.dart';
import 'package:animaciones_app/styles/colors.dart';
import 'package:animaciones_app/styles/fonts.dart';
import 'package:flutter/material.dart';

class TabbarViewPage extends StatefulWidget {
  @override
  _TabbarViewPageState createState() => _TabbarViewPageState();
}

class _TabbarViewPageState extends State<TabbarViewPage>
    with TickerProviderStateMixin {
  List<Widget> tabView = [
    Center(
      child: Icon(Icons.home),
    ),
    Center(
      child: Icon(Icons.list),
    ),
    Center(
      child: Icon(Icons.star_rate),
    ),
    Center(
      child: Icon(Icons.settings),
    ),
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    Size size = getMediaSize(context);
    return Theme(
      data: ThemeData(accentColor: yelloOrange, primaryColor: yelloOrange),
      child: Scaffold(
        backgroundColor: orangeYellowGrayola,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, -1.0),
                  blurRadius: 7,
                  spreadRadius: 0.1)
            ],
            color: yelloOrange,
          ),
          child: DefaultTabController(
            length: 4,
            child: TabBar(
              labelPadding: EdgeInsets.only(bottom: 0),
              controller: _tabController,
              unselectedLabelColor: black,
              labelColor: white,
              labelStyle: TextStyle(
                  fontSize: size.width * 0.025, fontFamily: Fonts.muliBold),
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 0, color: transparent)),
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: "Inicio",
                ),
                Tab(
                  icon: Icon(Icons.star_rate),
                  text: "Votos",
                ),
                Tab(
                  icon: Icon(Icons.list),
                  text: "Historial",
                ),
                Tab(
                  icon: Icon(Icons.settings),
                  text: "Preferencias",
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: yelloOrange,
          title: Text("Tab (navigationBar)"),
        ),
        body: TabBarView(
          controller: _tabController,
          children: tabView,
        ),
      ),
    );
  }
}

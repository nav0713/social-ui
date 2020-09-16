import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/widgets/follwing_user.dart';
import '../widgets/post_carousel.dart';
import '../widgets/costum_drawer.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  TabController _tabController;
  PageController _pageController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    _pageController = PageController(viewportFraction: .8, initialPage: 2 );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "FRENZY",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 10.0,
          ),
        ),
        bottom:TabBar(
          unselectedLabelStyle: TextStyle(
            fontSize: 18.0
          ),
          labelColor: Theme.of(context).primaryColor,
          indicatorWeight: 3.0,
          labelStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ) ,
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: "Trending",),
            Tab(text: "Latest",)
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: <Widget>[
        FollowingUser(),
          PostCarousel(pageController: _pageController, title:"Posts",posts: posts ),
        ],
      ),
    );
  }
}

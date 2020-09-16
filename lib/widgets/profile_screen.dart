import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/user_model.dart';
import 'package:flutter_social_ui/widgets/costum_drawer.dart';
import 'package:flutter_social_ui/widgets/post_carousel.dart';
import 'package:flutter_social_ui/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  PageController ownPostController;
  PageController favoritePostController;
@override
  void initState() {
   ownPostController = PageController(viewportFraction: 0.8, initialPage: 0);
   favoritePostController = PageController(viewportFraction: 0.8, initialPage: 0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
           children: <Widget>[
             Stack(
               alignment: Alignment.center,
               children: <Widget>[
                 ClipPath(
                   clipper: ProfileClipper(),
                   child: Image(
                     height: 300,
                     width: double.infinity,
                     image: AssetImage(
                       widget.user.backgroundImageUrl
                     ),
                     fit: BoxFit.cover,
                   ),
                 ),
                 Positioned(
                   top: 50,
                   left: 20,
                   child: IconButton(
                     icon: Icon(Icons.menu),
                     color: Theme.of(context).primaryColor,
                     iconSize: 28,
                     onPressed: (){
                       _scaffoldState.currentState.openDrawer();
                     },
                   ),
                 ),
                 Positioned(
     bottom: 0,
                   child: Container(
                     width: 120,
                     height: 120.0,
                     decoration: BoxDecoration(
                       boxShadow: [BoxShadow(color: Colors.black45,offset: Offset(0,2),blurRadius: 6.0)],
                       shape: BoxShape.circle,
                       color: Colors.red
                     ),
                     child: ClipOval(
                       child: Image(
                         image: AssetImage(
                           widget.user.profileImageUrl,
                         ),
                         fit: BoxFit.cover,
                       ),
                     ),
                   ),

                 )
               ],
             ),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Text(widget.user.name,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: <Widget>[
                 Column(
                   children: <Widget>[
                     Text("Following",style: TextStyle(fontSize: 18),),
                     SizedBox(height: 8.0,),
                     Text(widget.user.following.toString(),style: TextStyle(fontSize: 18),),
                   ],
                 ),
                 Column(
                   children: <Widget>[
                     Text("Followers",style: TextStyle(fontSize: 18),),
                     SizedBox(height: 8.0,),
                     Text(widget.user.followers.toString(),style: TextStyle(fontSize: 18),),
                   ],
                 )
               ],
             ),
             PostCarousel(pageController: ownPostController , title: "Your Posts" , posts: widget.user.posts),
        PostCarousel(pageController: favoritePostController , title: "Favorites" , posts: widget.user.favorites),
           ],
        ),
      ),
    );
  }
}

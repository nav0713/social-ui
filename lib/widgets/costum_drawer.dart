import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/models/user_model.dart';
import 'package:flutter_social_ui/screens/home_screen.dart';
import 'package:flutter_social_ui/screens/login_screen.dart';
import 'package:flutter_social_ui/widgets/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    currentUser.backgroundImageUrl
                  ),fit: BoxFit.fill
                )
              ),
              currentAccountPicture:CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(currentUser.profileImageUrl),
              ),
accountName: Text(currentUser.name),
            ),
          ),
          menuItem("Home", Icons.home, (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
          }),
          Divider(),
          menuItem("Charts", Icons.insert_chart, (){}),
          Divider(),
          menuItem("Map", Icons.map, (){}),
          Divider(),
          menuItem("Your Profile", Icons.person, (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => ProfileScreen(user: currentUser,)));
          }),
          Divider(),
          menuItem("Settings", Icons.settings, (){}),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomLeft,
              child:  menuItem("Logout", Icons.wifi_tethering, (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
              }),
            ),
          )
        ],
      ),
    );
  }
}

Widget menuItem(
String label, IconData icon, Function onTap,
){
  return ListTile(
    leading: Icon(icon),
    title: Text(label),
    onTap: onTap,
  );
}


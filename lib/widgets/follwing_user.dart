import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/models/user_model.dart';


class FollowingUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return           Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20,20,10),
          child: Text("Following", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,letterSpacing: 3.0),),
        ),
        Container(
          height: 60.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (BuildContext context, index){
                User user = users[index];
                return GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Theme.of(context).primaryColor),
                      shape: BoxShape.circle, //change the shape of the container to circle
                      boxShadow: [
                        BoxShadow(color: Colors.black26, offset: Offset(0,2), blurRadius: 6.0),
                      ],
                    ),
                    child: ClipOval( // change the shape of the image to circle
                      child: Image(
                        image: AssetImage(
                            user.profileImageUrl
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );

  }
}

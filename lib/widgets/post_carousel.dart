import 'package:flutter/material.dart';
import '../models/post_model.dart';
class PostCarousel extends StatelessWidget {
  PageController pageController;
  String title;
  List<Post> posts;

  PostCarousel({this.pageController, this.title, this.posts});
 _buildPost(int index, BuildContext context){
   Post post = posts[index];
   return AnimatedBuilder(
     animation: pageController,
     builder: (BuildContext context , Widget widget){
       double value = 1;
       if(pageController.position.haveDimensions){
         value = pageController.page - index;
         value = (1-(value.abs() * 0.25)).clamp(0.0, 1.0);
       }
       return Center(
         child: SizedBox(
           height: Curves.easeInOut.transform(value) * 400.0,
           child: widget,
         ),
       );

     },
     child: Stack(
       children: <Widget>[
         Container(
           height: 400,
           width: 400,
           margin: EdgeInsets.all(10.0),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15.0),
             boxShadow: [
               BoxShadow(
                 color: Colors.black26,
                 offset: Offset(0,2),
                 blurRadius: 6.0,
               )
             ]
           ),
           child: ClipRRect(
             borderRadius: BorderRadius.circular(15),
             child: Image(
               image: AssetImage(
                 post.imageUrl
               ),fit: BoxFit.cover,
             ),
           ),
         ),
         Positioned(
           left: 10,
           right: 10,
           bottom: 10,
           child: Container(
             height: 120,
             decoration: BoxDecoration(
               color: Colors.white54,
             ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text(post.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                   Text(post.location, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[Icon(Icons.favorite,color: Colors.red,),
                            SizedBox(width: 10.0,),
                          Text(post.likes.toString(),style: TextStyle(fontSize: 18),),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[Icon(Icons.comment,color: Theme.of(context).primaryColor,),
                            SizedBox(width: 10.0,),
                            Text(post.comments.toString(),style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      )

                    ],
                  )
                 ],
               ),
             ),
           ),
         )
       ],
     ),
   );
 }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20,20,10),
          child: Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,letterSpacing: 3.0),),
        ),
        Container(
          height: 400,
          child: PageView.builder(
              itemCount: posts.length,
              controller: pageController,
              itemBuilder:(BuildContext context, index){
                return _buildPost(index,context);
              }),
        )
      ],
    );
  }
}

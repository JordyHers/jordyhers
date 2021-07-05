import 'package:flutter/material.dart';


class BlogPage extends StatelessWidget {
  const BlogPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text("Jordy",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                Text("Hers.com",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.purpleAccent))
              ],
            ),     Row(
              children: [
                FlatButton(onPressed: (){}, child: Text("Discover")),
                FlatButton(onPressed: (){}, child: Text("Our Blog")),
                FlatButton(onPressed: (){}, child: Text("Services")),
                FlatButton(onPressed: (){}, child: Text("About US")),
              ],
            ),


          ],
        ),
      ),
    );
  }
}

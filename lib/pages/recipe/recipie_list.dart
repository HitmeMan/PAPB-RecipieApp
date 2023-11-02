import 'package:flutter/material.dart';

class recipieList extends StatelessWidget {
  const recipieList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 202, 193, 177),
      appBar: AppBar(
        title: Text('Recipe List'),
        backgroundColor: Color.fromARGB(255, 214, 153, 40),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 150,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('image/sayurbox.jpg'), fit: BoxFit.cover),
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Container(
                  color: Colors.black.withOpacity(0.5),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'FOOD#1',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
            ),
          ),
          Container(
            height: 150,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('image/steak.jpg'), fit: BoxFit.cover),
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Container(
                  color: Colors.black.withOpacity(0.5),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'FOOD#2',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

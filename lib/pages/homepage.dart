import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testflutter_application_1/pages/login/login.dart';
import 'package:testflutter_application_1/pages/recipe/recipie_Detail.dart';
import 'package:testflutter_application_1/pages/recipe/recipie_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 214, 153, 40),
              ),
              child: Text(
                'ReciAPP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('List'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => recipieList()));
              },
            ),
            ListTile(
              title: Text('Log Out'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xff392A27),
      body: ListView(
        children: <Widget>[
          searchfield(),
          SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(),
                child: Text(
                  'Category',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    // Item 1
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                              image: AssetImage('image/foods.jpg'),
                              fit: BoxFit.cover)),
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Container(
                            color: Colors.black.withOpacity(0.5),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'FOOD',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            )),
                      ),
                    ),

                    // Item 2
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          image: DecorationImage(
                              image: AssetImage('image/Drinks.jpg'),
                              fit: BoxFit.cover)),
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Container(
                            color: Colors.black.withOpacity(0.5),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Drink',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RecipeDetailPage(
                          recipeName: 'Food#1',
                          cookTime: '60 Menit',
                          ingredients: ['bahan1', 'bahan2', 'bahan3'],
                          steps: ['step1', 'step2', 'step3'],
                        ),
                      ));
                    },
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('image/sayurbox.jpg'),
                            fit: BoxFit.cover),
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Container(
                            color: Colors.black.withOpacity(0.5),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'FOOD#1',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RecipeDetailPage(
                          recipeName: 'Food#2',
                          cookTime: '60 Menit',
                          ingredients: ['bahan1', 'bahan2', 'bahan3'],
                          steps: ['step1', 'step2', 'step3'],
                        ),
                      ));
                    },
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('image/steak.jpg'),
                            fit: BoxFit.cover),
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Container(
                            color: Colors.black.withOpacity(0.5),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'FOOD#2',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RecipeDetailPage(
                          recipeName: 'Food#3',
                          cookTime: '60 Menit',
                          ingredients: ['bahan1', 'bahan2', 'bahan3'],
                          steps: ['step1', 'step2', 'step3'],
                        ),
                      ));
                    },
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('image/ayam.jpeg'),
                            fit: BoxFit.cover),
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Container(
                            color: Colors.black.withOpacity(0.5),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'FOOD#3',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container searchfield() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(15),
            hintText: 'search text',
            hintStyle:
                TextStyle(color: Color.fromARGB(255, 71, 69, 69), fontSize: 14),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Food',
        style: TextStyle(
            fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 214, 153, 40),
      elevation: 0.0,
      leading: Builder(
        builder: (context) => IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Menu.svg',
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
    );
  }
}

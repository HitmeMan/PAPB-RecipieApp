import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testflutter_application_1/pages/login/login.dart';
import 'package:testflutter_application_1/pages/recipe/recipie_Detail.dart';
import 'package:testflutter_application_1/pages/recipe/recipie_list.dart';
import 'package:testflutter_application_1/pages/model/recipe.dart';

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
                      MaterialPageRoute(builder: (context) => RecipieList()));
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
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.9,
              ),
              items: [
                Image.asset('image/culinary.jpeg', fit: BoxFit.cover),
                Image.asset('image/foods.jpg', fit: BoxFit.cover),
                Image.asset('image/ayam.jpeg', fit: BoxFit.cover),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Discover Culinary Delights\nFrom Around the World',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(),
                child: Text(
                  'Recommended',
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
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('foodlist')
                      .limit(3)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

                    // Convert QueryDocumentSnapshot to List<Food>
                    List<Food> foods = documents.map((doc) {
                      return Food.fromMap(
                          doc.data() as Map<String, dynamic>, doc.reference);
                    }).toList();

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: foods.length,
                      itemBuilder: (context, index) {
                        var food = foods[index];

                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RecipeDetailPage(
                                recipeName: food.foodName,
                                cookTime: food.time.toString(),
                                imageUrl: food.imageUrl,
                                ingredients: food.ingredients,
                                steps: food.steps,
                                documentReference: food.documentReference,
                              ),
                            ));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              image: DecorationImage(
                                image: NetworkImage(food.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Container(
                                color: Colors.black.withOpacity(0.5),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  food.foodName,
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => RecipieList()),
              );
            },
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                color: Colors.orange, // Sesuaikan dengan warna yang diinginkan
                child: Center(
                  child: Text(
                    'Menu List',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ),
          SizedBox(height: 15),
          // TODO: isilist favorite disini
        ]));
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

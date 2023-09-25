import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testflutter_application_1/pages/recipe/recipie_Detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
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
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    // Item 1
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          'Food',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    // Item 2
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          'Drink',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Column(
                children: <Widget>[
                  Container(
                    height: 150,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text('FOOD#1'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RecipeDetailPage(
                              recipeName: 'Food#1',
                              cookTime: '60 Menit',
                              ingredients: ['bahan1', 'bahan2', 'bahan3'],
                              steps: ['step1', 'step2', 'step3'],
                            ),
                          ));
                        },
                        style: ElevatedButton.styleFrom(),
                        child: Text('Lihat Detail'),
                      ),
                    ],
                  ),
                  Container(
                    height: 150,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text('FOOD#2'),
                    ),
                  ),
                  Container(
                    height: 150,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text('FOOD#3'),
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
      leading: Container(
        // alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 223, 178, 82),
            borderRadius: BorderRadius.circular(10)),
        child: SvgPicture.asset(
          'assets/icons/Menu.svg',
          // width: 20,
          // height: 20,
        ),
      ),
    );
  }
}

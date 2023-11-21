import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testflutter_application_1/pages/model/recipe.dart';
import 'package:testflutter_application_1/pages/recipe/add_recipie.dart';
import 'package:testflutter_application_1/pages/recipe/recipie_Detail.dart'; // Sesuaikan dengan path Anda

class RecipieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 202, 193, 177),
      appBar: AppBar(
        title: Text('Recipe List'),
        backgroundColor: Color.fromARGB(255, 214, 153, 40),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('foodlist').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData) {
            return Text('No data available.');
          }

          final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

          // Convert QueryDocumentSnapshot to List<Food>
          List<Food> foods = documents.map((doc) {
            return Food.fromMap(
                doc.data() as Map<String, dynamic>, doc.reference);
          }).toList();

          return ListView.builder(
            itemCount: foods.length,
            itemBuilder: (context, index) {
              final Food food = foods[index];

              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RecipeDetailPage(
                        recipeName: food.foodName,
                        cookTime: food.time.toString(),
                        imageUrl: food.imageUrl,
                        ingredients: food.ingredients,
                        steps: food.steps,
                        documentReference: food.documentReference,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 150,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(food.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.foodName,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Rating: ${food.rating}',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Text(
                          'Time: ${food.time} minutes',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddRecipePage()));
        },
        backgroundColor:
            Colors.orange, // Sesuaikan dengan warna yang diinginkan
        child: Icon(Icons.add),
      ),
    );
  }
}

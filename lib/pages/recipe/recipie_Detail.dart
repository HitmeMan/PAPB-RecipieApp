import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  final String recipeName;
  final String cookTime;
  final List<String> ingredients;
  final List<String> steps;

  RecipeDetailPage({
    required this.recipeName,
    required this.cookTime,
    required this.ingredients,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Resep'),
        backgroundColor: Color.fromARGB(255, 214, 153, 40),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset(
              'image/sayurbox.jpg',
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),

            Text(
              recipeName,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Match your color
              ),
            ),
            SizedBox(height: 8.0),

            // Lama pengerjaan
            Text(
              '$cookTime',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),

            Text(
              'Bahan-Bahan:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Match your color
              ),
            ),
            SizedBox(height: 8.0),

            // Daftar bahan-bahan
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ingredients.map((ingredient) {
                return Text(
                  '- $ingredient',
                  style: TextStyle(
                    color: Colors.black, // Match your color
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),

            // Langkah-langkah
            Text(
              'Langkah-Langkah:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Match your color
              ),
            ),
            SizedBox(height: 8.0),

            // Daftar langkah-langkah
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: steps.asMap().entries.map((entry) {
                int index = entry.key + 1;
                String step = entry.value;
                return Text(
                  '$index. $step',
                  style: TextStyle(
                    color: Colors.black, // Match your color
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

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
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'image/lake.jpg',
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),

            // Nama makanan
            Text(
              recipeName,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),

            // Lama pengerjaan
            Text(
              'Lama Pengerjaan: $cookTime',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),

            // Bahan-bahan
            Text(
              'Bahan-Bahan:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),

            // Daftar bahan-bahan
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ingredients.map((ingredient) {
                return Text('- $ingredient');
              }).toList(),
            ),
            SizedBox(height: 16.0),

            // Langkah-langkah
            Text(
              'Langkah-Langkah:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),

            // Daftar langkah-langkah
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: steps.asMap().entries.map((entry) {
                int index = entry.key + 1;
                String step = entry.value;
                return Text('$index. $step');
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

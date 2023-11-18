import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  final String recipeName;
  final String cookTime;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;

  RecipeDetailPage({
    required this.recipeName,
    required this.cookTime,
    required this.ingredients,
    required this.steps,
    required this.imageUrl,
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
            Image.network(
              imageUrl,
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
                color: Colors.black, // Sesuaikan warna Anda
              ),
            ),
            SizedBox(height: 8.0),

            // Lama pengerjaan
            Text(
              '$cookTime menit',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),

            // Bahan-Bahan
            Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.grey[300], // Warna latar belakang untuk bahan
              child: Text(
                'Bahan-Bahan:',
                style: TextStyle(
                  fontSize: 20.0, // Teks lebih besar
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Sesuaikan warna Anda
                ),
              ),
            ),
            SizedBox(height: 8.0),

            // Daftar bahan-bahan
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ingredients.map((ingredient) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '- $ingredient',
                    style: TextStyle(
                      fontSize: 16.0, // Teks lebih besar
                      color: Colors.black, // Sesuaikan warna Anda
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),

            // Langkah-langkah
            Container(
              padding: EdgeInsets.all(8.0),
              color: Colors
                  .grey[300], // Warna latar belakang untuk langkah-langkah
              child: Text(
                'Langkah-Langkah:',
                style: TextStyle(
                  fontSize: 20.0, // Teks lebih besar
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Sesuaikan warna Anda
                ),
              ),
            ),
            SizedBox(height: 8.0),

            // Daftar langkah-langkah
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: steps.asMap().entries.map((entry) {
                int index = entry.key + 1;
                String step = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '$index. $step',
                    style: TextStyle(
                      fontSize: 16.0, // Teks lebih besar
                      color: Colors.black, // Sesuaikan warna Anda
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: fungsi
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Resep ditambahkan ke favorit!'),
            ),
          );
        },
        backgroundColor:
            Colors.orange, // Sesuaikan dengan warna yang diinginkan
        child: Icon(Icons.favorite),
      ),
    );
  }
}

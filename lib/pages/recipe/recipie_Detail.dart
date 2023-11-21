import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  final String recipeName;
  final String cookTime;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final DocumentReference documentReference;

  RecipeDetailPage({
    required this.documentReference,
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
                color: Colors.black,
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
              color: Colors.grey[300],
              child: Text(
                'Bahan-Bahan:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
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
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),

            // Langkah-langkah
            Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.grey[300],
              child: Text(
                'Langkah-Langkah:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
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
                      fontSize: 16.0,
                      color: Colors.black,
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
          _deleteRecipe(context);
        },
        backgroundColor: Colors.red, // Sesuaikan dengan warna yang diinginkan
        child: Icon(Icons.delete),
      ),
    );
  }

  void _deleteRecipe(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Penghapusan'),
          content: Text('Apakah Anda yakin ingin menghapus resep ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                // Hapus resep menggunakan DocumentReference
                documentReference.delete().then((value) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Resep dihapus!'),
                    ),
                  );
                  // Setelah penghapusan, Anda mungkin ingin kembali ke layar sebelumnya.
                  Navigator.of(context).pop();
                }).catchError((error) {
                  print('Error deleting recipe: $error');
                });
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
  }
}

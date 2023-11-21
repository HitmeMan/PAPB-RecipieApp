import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testflutter_application_1/pages/model/recipe.dart';

class AddRecipePage extends StatefulWidget {
  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
  final TextEditingController stepsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Resep Makanan'),
        backgroundColor: Color.fromARGB(255, 214, 153, 40),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: foodNameController,
                decoration: InputDecoration(labelText: 'Nama Makanan'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: ratingController,
                decoration: InputDecoration(labelText: 'Rating'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: timeController,
                decoration: InputDecoration(labelText: 'Waktu Masak (menit)'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: imageUrlController,
                decoration: InputDecoration(labelText: 'URL Gambar'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: ingredientsController,
                maxLines: null,
                decoration: InputDecoration(
                    labelText: 'Bahan-Bahan (pisahkan dengan koma)'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: stepsController,
                maxLines: null,
                decoration: InputDecoration(
                    labelText: 'Langkah-Langkah (pisahkan dengan koma)'),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_isformValid()) {
                    _addRecipe();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('berhasil di tambahkan'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Silakan isi semua kolom form'),
                      ),
                    );
                  }
                },
                child: Text('Tambah Resep'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isformValid() {
    return foodNameController.text.isNotEmpty &&
        ratingController.text.isNotEmpty &&
        timeController.text.isNotEmpty &&
        imageUrlController.text.isNotEmpty &&
        ingredientsController.text.isNotEmpty &&
        stepsController.text.isNotEmpty;
  }

  void _addRecipe() {
    // Mendapatkan nilai dari input pengguna
    String foodName = foodNameController.text;
    double rating = double.parse(ratingController.text);
    int time = int.parse(timeController.text);
    String imageUrl = imageUrlController.text;
    List<String> ingredients = ingredientsController.text.split(',');
    List<String> steps = stepsController.text.split(',');
    void _resetForm() {
      foodNameController.clear();
      ratingController.clear();
      timeController.clear();
      imageUrlController.clear();
      ingredientsController.clear();
      stepsController.clear();
    }

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('foodlist').doc();

    Food newFood = Food(
      foodName: foodName,
      rating: rating,
      time: time,
      imageUrl: imageUrl,
      ingredients: ingredients,
      steps: steps,
      documentReference: documentReference,
    );

    // Menambahkan data ke Firestore
    // Menambahkan data ke Firestore dan mendapatkan referensi dokument
    documentReference.set({
      'foodname': newFood.foodName,
      'rating': newFood.rating,
      'time': newFood.time,
      'imageurl': newFood.imageUrl,
      'ingredients': newFood.ingredients,
      'steps': newFood.steps,
    }).then((value) {
      print('Resep berhasil ditambahkan!');
      _resetForm();
    }).catchError((error) {
      print('Error: $error');
    });
  }
}

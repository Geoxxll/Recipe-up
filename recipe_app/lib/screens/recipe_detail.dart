import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  final Map<String, String> recipe;

  // Constructor to recieve the recipe data
  const RecipeDetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // recipe image
            Image.network(
              recipe['image']!,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),

            // recipe title
            SizedBox(
              height: 10,
            ),
            Text(
              recipe['title']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            // recipe Description
            SizedBox(
              height: 10,
            ),
            Text(
              recipe['description']!,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),

            // Recipe Instructions
            SizedBox(
              height: 10,
            ),
            Text(
              'Recipe Instructions: ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '1. Boil the pasta.\n2. Fry the bacon.\n3. Mix together with the sauce.\n4. Serve and enjoy!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// recipe_detail.dart
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:recipe_app/widget/add_recipe_form.dart';
import 'recipe_detail.dart';

class RecipeListPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  final List<Map<String, String>> recipes = [
    {
      'image':
          'https://www.sipandfeast.com/wp-content/uploads/2022/09/spaghetti-carbonara-recipe-6.jpg',
      'title': 'Spaghetti Carbonara',
      'description': 'A classic Italian pasta dish.',
    },
    {
      'image':
          'https://www.foodandwine.com/thmb/f4uf4WXHz-waXLB_oqG-U1p4Y7A=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/spicy-chicken-curry-FT-RECIPE0321-58f84fdf7b484e7f86894203eb7834e7.jpg',
      'title': 'Chicken Curry',
      'description': 'A flavorful and spicy chicken dish.',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Recipe'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailPage(recipe: recipe),
                ),
              );
            },
            child: Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.network(
                    recipe['image']!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(recipe['title']!),
                  subtitle: Text(recipe['description']!),
                )),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newRecipe = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddRecipeForm()),
          );
          if (newRecipe != null && newRecipe is Map<String, String>) {
            setState(() {
              recipes.add(newRecipe);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Add a new recipe!')),
            );
          }
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}

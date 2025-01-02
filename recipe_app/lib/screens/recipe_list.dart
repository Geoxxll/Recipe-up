import 'package:flutter/material.dart';
import 'recipe_detail.dart';
import 'package:recipe_app/widget/add_recipe_form.dart';

class RecipeListPage extends StatefulWidget {
  @override
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
    },
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

          return Dismissible(
            key: Key(recipe['title']!),
            direction: DismissDirection.endToStart,
            confirmDismiss: (direction) async {
              // Show the delete confirmation dialog
              return _showDeleteConfirmation(context, recipe, index);
            },
            background: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 25),
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: InkWell(
              onTap: () {
                // Navigate to RecipeDetailPage when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailPage(recipe: recipe),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.all(10),
                child: Container(
                  width: double.infinity, // Stretch to full width
                  height: 110, // Set desired height
                  padding: EdgeInsets.all(10), // Add padding inside the card
                  child: Row(
                    children: [
                      // Leading Image
                      Container(
                        width: 105, // Set image width
                        height: 105,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(recipe['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 30), // Spacing between image and text
                      // Title and Description
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  recipe['title']!,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Flexible(
                                child: Text(
                                  recipe['description']!,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[700]),
                                  maxLines: 2,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
              SnackBar(content: Text('Recipe Added!')),
            );
          }
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }

  Future<bool?> _showDeleteConfirmation(
      BuildContext context, Map<String, String> recipe, int index) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Recipe'),
          content:
              Text('Are you sure you want to delete "${recipe['title']}"?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  recipes.removeAt(index);
                });
                Navigator.pop(context, true);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Recipe deleted successfully!')),
                );
              },
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}

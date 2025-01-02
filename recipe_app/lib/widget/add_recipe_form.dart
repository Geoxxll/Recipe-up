import 'package:flutter/material.dart';
import 'package:recipe_app/widget/add_btn.dart';

class AddRecipeForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  AddRecipeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Recipe Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a recipe title';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a recipe description';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: imageUrlController,
                decoration: InputDecoration(
                  labelText: 'Image URL',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid image URL';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: AddBtn(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final newRecipe = {
                        'title': titleController.text,
                        'description': descriptionController.text,
                        'image': imageUrlController.text,
                      };

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Recipe Added!')),
                      );

                      Navigator.pop(context, newRecipe);
                    }
                  },
                  label: 'Submit',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tickoyako/presentation/features/home_screen/data/models/category_model.dart';

class CategoryList extends StatefulWidget {
  final List<Category> categories;

  const CategoryList({Key? key, required this.categories}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  late PageController _pageController;
  double currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: 0.7); // Show a portion of neighboring cards
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Set the height to 100
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.categories.length,
        physics: const BouncingScrollPhysics(), // Adds a nice bounce effect
        itemBuilder: (context, index) {
          final category = widget.categories[index];

          // Calculate scale based on page position
          double scale = (1 - (currentPage - index).abs()).clamp(0.8, 1.0);
          double elevation =
              (1 - (currentPage - index).abs()).clamp(0, 1.0) * 10;

          return Transform.scale(
            scale: scale, // Scale the widget
            child: Card(
              elevation: elevation, // Elevate the centered card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  // The image taking the whole size of the container
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          15), // Make the image fit within rounded borders
                      child: Image.network(
                        category.imageUrl,
                        fit: BoxFit
                            .cover, // Ensure the image covers the container
                      ),
                    ),
                  ),
                  // The text positioned at the bottom of the container
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors
                          .black54, // Optional: Add a semi-transparent background for better text visibility
                      padding: const EdgeInsets.all(4.0), // Adjusted padding
                      child: Text(
                        category.name,
                        style: const TextStyle(
                          color: Colors.white, // Make the text color white
                          fontSize: 12, // Adjust font size for better fit
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign:
                            TextAlign.center, // Center the text horizontally
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

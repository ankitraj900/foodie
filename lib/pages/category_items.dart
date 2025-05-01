import 'package:flutter/material.dart';
import 'package:foodiiee/service/widget_support.dart';
import 'package:foodiiee/pages/detail.dart';

class CategoryItems extends StatefulWidget {
  final String categoryName;
  final String categoryIcon;

  const CategoryItems({
    super.key,
    required this.categoryName,
    required this.categoryIcon,
  });

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  List<Map<String, dynamic>> _getItemsForCategory() {
    switch (widget.categoryName.toLowerCase()) {
      case 'burger':
        return [
          {
            'name': 'Classic Burger',
            'image': 'assets/images/burger1.jpg',
            'price': 299,
            'rating': 4.5,
            'description': 'Juicy beef patty with fresh lettuce, tomato, and special sauce',
          },
          {
            'name': 'Cheese Burger',
            'image': 'assets/images/burger2.jpg',
            'price': 349,
            'rating': 4.7,
            'description': 'Double cheese with crispy bacon and caramelized onions',
          },
          {
            'name': 'Veggie Burger',
            'image': 'assets/images/burger3.jpg',
            'price': 249,
            'rating': 4.3,
            'description': 'Plant-based patty with fresh vegetables and vegan mayo',
          },
        ];
      case 'pizza':
        return [
          {
            'name': 'Margherita Pizza',
            'image': 'assets/images/pizza1.jpg',
            'price': 499,
            'rating': 4.7,
            'description': 'Classic tomato sauce with fresh mozzarella and basil',
          },
          {
            'name': 'Pepperoni Pizza',
            'image': 'assets/images/pizza2.jpg',
            'price': 599,
            'rating': 4.8,
            'description': 'Spicy pepperoni with extra cheese and herbs',
          },
          {
            'name': 'Veggie Pizza',
            'image': 'assets/images/pizza3.jpg',
            'price': 449,
            'rating': 4.5,
            'description': 'Loaded with fresh vegetables and mozzarella cheese',
          },
        ];
      case 'biryani':
        return [
          {
            'name': 'Chicken Biryani',
            'image': 'assets/images/briyani.png',
            'price': 399,
            'rating': 4.8,
            'description': 'Fragrant basmati rice with tender chicken pieces',
          },
          {
            'name': 'Veg Biryani',
            'image': 'assets/images/vegbiryani.jpg',
            'price': 299,
            'rating': 4.5,
            'description': 'Mixed vegetables with aromatic spices and basmati rice',
          },
          {
            'name': 'Mutton Biryani',
            'image': 'assets/images/muttonbiryani.jpg',
            'price': 499,
            'rating': 4.9,
            'description': 'Tender mutton pieces with long grain basmati rice',
          },
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = _getItemsForCategory();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.categoryName),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(
                    _getCategoryIcon(),
                    size: 40,
                    color: const Color.fromARGB(255, 247, 115, 14),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    widget.categoryName,
                    style: AppWidget.headlineTextFieldStyle().copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detail(item: item),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 10,
                            spreadRadius: 3,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              item['image'],
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 80,
                                  height: 80,
                                  color: Colors.grey.shade200,
                                  child: const Icon(Icons.fastfood),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  item['name'],
                                  style: AppWidget.headlineTextFieldStyle().copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      item['rating'].toString(),
                                      style: AppWidget.simpleTextFieldStyle().copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '₹${item['price']}',
                                  style: AppWidget.headlineTextFieldStyle().copyWith(
                                    color: const Color.fromARGB(255, 247, 115, 14),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon() {
    switch (widget.categoryName.toLowerCase()) {
      case 'burger':
        return Icons.lunch_dining;
      case 'pizza':
        return Icons.local_pizza;
      case 'biryani':
        return Icons.rice_bowl;
      default:
        return Icons.fastfood;
    }
  }
} 
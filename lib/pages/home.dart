import 'package:flutter/material.dart';
import 'package:foodiiee/pages/detail.dart';
import 'package:foodiiee/service/widget_support.dart';
import 'package:foodiiee/pages/cart.dart';
import 'package:foodiiee/pages/category_items.dart';
import 'package:foodiiee/pages/wallet.dart';
import 'package:foodiiee/pages/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userName = 'User';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? 'User';
    });
  }

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Burger', 'image': 'assets/images/burger.png', 'icon': Icons.lunch_dining},
    {'name': 'Pizza', 'image': 'assets/images/pizza.png', 'icon': Icons.local_pizza},
    {'name': 'Biryani', 'image': 'assets/images/briyani.png', 'icon': Icons.rice_bowl},
    {'name': 'Ice Cream', 'image': 'assets/images/icecream.png', 'icon': Icons.icecream},
    {'name': 'Cake', 'image': 'assets/images/cake.png', 'icon': Icons.cake},
  ];

  final List<Map<String, dynamic>> _popularItems = [
    {
      'name': 'Classic Burger',
      'image': 'assets/images/burger1.jpg',
      'price': 299,
      'rating': 4.5,
    },
    {
      'name': 'Margherita Pizza',
      'image': 'assets/images/pizza1.jpg',
      'price': 499,
      'rating': 4.7,
    },
    {
      'name': 'Chicken Biryani',
      'image': 'assets/images/briyani.png',
      'price': 399,
      'rating': 4.8,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, $userName',
                          style: AppWidget.headlineTextFieldStyle().copyWith(
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'What would you like to eat?',
                          style: AppWidget.simpleTextFieldStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search food...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Categories',
                  style: AppWidget.headlineTextFieldStyle().copyWith(fontSize: 20),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryItems(
                                categoryName: _categories[index]['name'],
                                categoryIcon: _categories[index]['image'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          width: 80,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  _categories[index]['icon'],
                                  size: 30,
                                  color: const Color.fromARGB(255, 247, 115, 14),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                _categories[index]['name'],
                                style: AppWidget.simpleTextFieldStyle(),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Popular Items',
                  style: AppWidget.headlineTextFieldStyle().copyWith(fontSize: 20),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _popularItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail(
                              item: _popularItems[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
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
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                _popularItems[index]['image'],
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _popularItems[index]['name'],
                                    style: AppWidget.headlineTextFieldStyle().copyWith(
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        _popularItems[index]['rating'].toString(),
                                        style: AppWidget.simpleTextFieldStyle(),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '₹${_popularItems[index]['price'].toString()}',
                                    style: AppWidget.headlineTextFieldStyle().copyWith(
                                      color: const Color.fromARGB(255, 247, 115, 14),
                                      fontSize: 18,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

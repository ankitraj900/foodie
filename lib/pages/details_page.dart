import 'package:flutter/material.dart';
import 'package:foodiiee/service/widget_support.dart';

class DetailsPage extends StatefulWidget {
  final String image, name, price;
  DetailsPage({required this.image, required this.name, required this.price});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int quantity = 0, totalPrice = 0;

  @override
  void initState() {
    super.initState();
    totalPrice = int.parse(widget.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xffef2b39),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.arrow_back, size: 30.0, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: Image.asset(
                    widget.image,
                    height: MediaQuery.of(context).size.height / 3,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: Column(
                    children: [
                      Text(widget.name, style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                      Text("Total: \$${totalPrice.toString()}", style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "We've established that most cheeses will melt when baked atop pizza. But which will not only melt but stretch into those gooey, messy strands that can make pizza eating such a delightfully challenging endeavor?",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20.0),
                Text(
                  "Quantity",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (quantity > 1) {
                            quantity--;
                            totalPrice -= int.parse(widget.price);
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xffef2b39),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.remove, color: Colors.white, size: 30.0),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      "$quantity",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(width: 20.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          quantity++;
                          totalPrice += int.parse(widget.price);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xffef2b39),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.add, color: Colors.white, size: 30.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 60,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Color(0xffef2b39),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text("Total: \$${totalPrice.toString()}", style: AppWidget.headlineTextFieldStyle()),
                        ),
                      ),
                    ),
                    SizedBox(width: 30.0),
                    Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 60,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Color(0xffef2b39),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text("Order", style: AppWidget.headlineTextFieldStyle()),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

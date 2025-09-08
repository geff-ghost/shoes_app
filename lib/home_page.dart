import 'package:flutter/material.dart';
import 'package:shoes_app/global_variables.dart';
import 'package:shoes_app/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const ['All', 'Jordans', 'Puma', 'Nike', 'Bata', 'Sneakers', 'Ashion', 'Fila', 'Casual'];
  late String selectedFilter;

  //sets the initial filter when the page is loaded
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.circular(50),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //heading of the app
              Text(
                'Shoes Collection',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),

              SizedBox(height: 20),

              //the Texfield area
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: border,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
              ),

              //ListView builder containing the chips
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                        child: Chip(
                          backgroundColor: selectedFilter == filter
                              ? Theme.of(context).colorScheme.primary
                              : Color.fromRGBO(245, 247, 249, 1),
                          side: BorderSide(
                            color: const Color.fromRGBO(425, 247, 249, 1),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          label: Text(filter),
                          labelStyle: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  },
                ),
              ),

              //ListView builder of the products
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] as String,
                      backroungColor: index.isEven 
                        ? Color.fromRGBO(216, 240, 253, 1)
                        : const Color.fromRGBO(245, 247, 249, 1),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

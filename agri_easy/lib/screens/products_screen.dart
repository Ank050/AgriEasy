import 'dart:convert';
import 'package:agri_easy/model/products_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Color.fromARGB(255, 0, 100, 3)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
        title: const Text(
          "Products",
          style: TextStyle(
              fontFamily: "Lobster",
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: readJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<ProductDataModel>;
            return Center(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                      color: const Color.fromARGB(255, 219, 245, 219),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[index].name.toString(),
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 1, 67, 10),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    items[index].type.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: items[index].category.toString() ==
                                              "Fertilizer"
                                          ? const Color.fromARGB(255, 1, 150, 6)
                                          : items[index].category.toString() ==
                                                  "Pesticide"
                                              ? Colors.red
                                              : Colors.grey,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: Text(
                                      items[index].category.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    items[index].desc.toString(),
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 69, 69, 69),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 70,
                              left: 10,
                              right: 10,
                            ),
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  items[index].imageURL.toString(),
                                  fit: BoxFit.cover,
                                ),
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
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Future<List<ProductDataModel>> readJsonData() async {
  final jsondata = await rootBundle.loadString('jsonfile/productlist.json');
  final list = json.decode(jsondata) as List<dynamic>;
  return list.map((e) => ProductDataModel.fromJson(e)).toList();
}

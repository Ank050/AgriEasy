import 'package:agri_easy/providers/chats_provider.dart';
import 'package:agri_easy/providers/models_provider.dart';
import 'package:agri_easy/screens/chat_screen.dart';
import 'package:agri_easy/screens/home_screen.dart';
import 'package:agri_easy/screens/homepage.dart';
import 'package:agri_easy/screens/img_upload.dart';
import 'package:agri_easy/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      // theme: ThemeData(
      //   fontFamily: "Lobster",
      // ),
      home: MyStatefulWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int index = 0;

  final screens = [
    const Homepage(),
    const HomeScreen(),
    const ImageUpload(),
    const ChatScreen(),
    const ProductScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final items = [
      const Icon(Icons.home, size: 30),
      const Icon(Icons.cloud, size: 30),
      const Icon(Icons.camera, size: 30),
      const Icon(Icons.chat, size: 30),
      const Icon(Icons.shopping_cart, size: 30),
    ];
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.lightGreen,
        extendBody: true,
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   title: const Text('BottomNavigation Sample'),
        //   centerTitle: true,
        //   backgroundColor: Colors.transparent,
        //   elevation: 0.0,
        // ),
        bottomNavigationBar: CurvedNavigationBar(
          animationDuration: const Duration(milliseconds: 300),
          height: 50,
          backgroundColor: Colors.transparent,
          index: index,
          items: items,
          color: const Color.fromARGB(
              255, 227, 227, 227), // Set the color to dark green
          buttonBackgroundColor: const Color.fromARGB(255, 211, 251,
              211), // Set the button background color to dark green
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
        ),
        body: screens[index],
      ),
    );
  }
}

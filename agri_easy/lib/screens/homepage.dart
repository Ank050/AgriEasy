import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/main1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: Text(
                    "Agri - Easy",
                    style: TextStyle(
                      color: Color.fromARGB(255, 33, 50, 0),
                      fontSize: 55,
                      fontFamily: 'Lobster',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Agriculture made easy",
                    style: TextStyle(
                      fontFamily: 'Lobster',
                      color: Color.fromARGB(255, 220, 246, 160),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0, top: 40),
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/images/sprout1.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "The agricultural industry is a critical component of our global economy, and farmers face numerous challenges, including crop diseases that can lead to significant losses. To help farmers manage these challenges more effectively, we've developed a new app that uses AI and machine learning to predict crop diseases and provide other important information that farmers need.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'roboto',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 220, 246, 160),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceEvenly, // Align images evenly in a row
                        children: [
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset(
                              'assets/images/camera1.png', // Replace with the path to your first image
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset(
                              'assets/images/pests.png', // Replace with the path to your second image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                        height: 10), // Add spacing between the images and text
                    const Center(
                      child: Text(
                        "Our app utilizes a powerful ML model trained with a vast dataset of plant disease images, allowing users to simply take a photo and receive instant, accurate disease diagnosis. A valuable tool for farmers and plant enthusiasts, helping to identify and manage diseases early for better crop health.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 220, 246, 160),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        'assets/images/cloudy.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        "Our app provides farmers with accurate weather information for their current location and future forecasts. With up-to-date weather data, farmers can make informed decisions about planting, irrigation, and crop management, maximizing their yields and minimizing risks. A valuable tool for farmers to optimize their farming practices and leverage weather information for better crop outcomes.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 220, 246, 160),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 5,
                  right: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          fit: FlexFit
                              .loose, // Use FlexFit.loose for flexible children
                          child: Column(
                            children: [
                              SizedBox(
                                height: 130,
                                width: 130,
                                child: Image.asset(
                                  'assets/images/chat.png', // Replace with the path to your first image
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Our inbuilt chat bot is a smart agricultural assistant that provides quick and accurate answers to farmers' questions about farming practices, crop management, weather, pests, and more.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'roboto',
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 220, 246, 160),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          fit: FlexFit
                              .loose, // Use FlexFit.loose for flexible children
                          child: Column(
                            children: [
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: Image.asset(
                                  'assets/images/shopping-cart.png', // Replace with the path to your second image
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Our products page offers a curated selection of top-quality pesticides and fertilizers for farmers. With a focus on effectiveness and sustainability, our products help farmers protect and nourish their crops for optimal growth and yield.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'roboto',
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 220, 246, 160),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ],
      ),
    );
  }
}

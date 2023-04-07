// import 'dart:convert';
// import 'dart:io';
// import 'package:ankchatbot/flash_msg_screen.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// class UploadImageScreen extends StatefulWidget {
//   const UploadImageScreen({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _UploadImageScreenState createState() => _UploadImageScreenState();
// }

// class _UploadImageScreenState extends State<UploadImageScreen> {
//   File? image;
//   final _picker = ImagePicker();
//   bool showSpinner = false;

//   String? info;

//   Future getImageGal() async {
//     final pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

//     if (pickedFile != null) {
//       image = File(pickedFile.path);
//       setState(() {});
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Container(
//             padding: const EdgeInsets.all(16),
//             height: 90,
//             decoration: const BoxDecoration(
//               color: Color.fromARGB(255, 253, 6, 2),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(20),
//               ),
//             ),
//             child: const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "ERROR",
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   "No image selected",
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.white,
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),
//           behavior: SnackBarBehavior.floating,
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//       );
//     }
//   }

//   Future getImageCam() async {
//     final pickedFile =
//         await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);

//     if (pickedFile != null) {
//       image = File(pickedFile.path);
//       setState(() {});
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Container(
//             padding: const EdgeInsets.all(16),
//             height: 90,
//             decoration: const BoxDecoration(
//               color: Color.fromARGB(255, 253, 6, 2),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(20),
//               ),
//             ),
//             child: const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "ERROR",
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   "No image selected",
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.white,
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),
//           behavior: SnackBarBehavior.floating,
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//       );
//     }
//   }

//   Future<String> uploadImage() async {
//     setState(() {
//       showSpinner = true;
//     });
//     print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
//     var uri = Uri.parse(
//         'https://asia-south1-plant-disease-ml.cloudfunctions.net/predict');

//     var request = http.MultipartRequest("POST", uri);
//     print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
//     // Pass the image file as 'file_name' parameter
//     var multipartFile = http.MultipartFile(
//       'file_name',
//       image!.readAsBytes().asStream(),
//       image!.lengthSync(),
//       filename: 'image.jpg',
//     );
//     print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
//     request.files.add(multipartFile);
//     print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
//     var response = await request.send();
//     var responseBody = await response.stream.bytesToString();

//     setState(() {
//       showSpinner = false;
//     });

//     var responseJson = json.decode(responseBody);
//     String diseaseClass = responseJson['class'];
//     String confidence = responseJson['confidence'];
//     String text = diseaseClass + confidence;
//     print(text);
//     return text;
//   }

//   void _showPicker(context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext bc) {
//         return SafeArea(
//           child: Wrap(
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.photo_library),
//                 title: const Text("Gallery"),
//                 onTap: () {
//                   getImageGal();
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.camera_alt),
//                 title: const Text("Camera"),
//                 onTap: () {
//                   getImageCam();
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ModalProgressHUD(
//       inAsyncCall: showSpinner,
//       child: Scaffold(
//         ImageUploadBar: ImageUploadBar(
//           title: const Text('Upload Image'),
//         ),
//         body: Builder(
//           builder: (BuildContext context) {
//             return SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       _showPicker(context);
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 100),
//                       child: Center(
//                         child: Container(
//                           height: 275,
//                           width: 270,
//                           decoration: BoxDecoration(
//                             border: Border.all(),
//                             borderRadius: const BorderRadius.all(
//                               Radius.circular(10),
//                             ),
//                             color: const Color.fromARGB(255, 214, 254, 215),
//                           ),
//                           child: image == null
//                               ? const Center(
//                                   child: Center(
//                                     child: Text(
//                                       'Pick Image',
//                                       style: TextStyle(
//                                         fontFamily: "roboto",
//                                         fontSize: 30,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : Center(
//                                   child: Image.file(
//                                     File(image!.path).absolute,
//                                     height: 250,
//                                     width: 250,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       if (image == null) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Container(
//                               padding: const EdgeInsets.all(16),
//                               height: 90,
//                               decoration: const BoxDecoration(
//                                 color: Color.fromARGB(255, 255, 7, 7),
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(20),
//                                 ),
//                               ),
//                               child: const Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Oops",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   Text(
//                                     "No image selected",
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.white,
//                                     ),
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             behavior: SnackBarBehavior.floating,
//                             backgroundColor: Colors.transparent,
//                             elevation: 0,
//                           ),
//                         );
//                       } else {
//                         uploadImage();
//                       }
//                     },
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         final String newinfo = await uploadImage();
//                         setState(
//                           () {
//                             info = newinfo;
//                           },
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 50, vertical: 25),
//                         backgroundColor: Color.fromARGB(255, 5, 197, 15),
//                         textStyle: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       child: const Text(
//                         'Upload',
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 0, 0, 0),
//                         ),
//                       ),
//                     ),
//                   ),
//                   if (info != null)
//                     Center(
//                       child: Padding(
//                         padding: const EdgeInsets.only(bottom: 50),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 30, right: 30),
//                           child: Container(
//                             decoration: const BoxDecoration(
//                               color: Color.fromARGB(255, 223, 248, 217),
//                             ),
//                             margin: const EdgeInsets.only(top: 70),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 info!,
//                                 style: const TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                     fontFamily: "Roboto",
//                                     fontWeight: FontWeight.w500),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

Future<http.Response> getPrediction(File imageFile) async {
  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://asia-south1-plant-disease-ml.cloudfunctions.net/predict'));
  request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));
  var res = await request.send();
  return await http.Response.fromStream(res);
}

class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key});

  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? _image;
  String _result = '';
  String _label = '';
  String _solve = '';
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        _getImageResult(File(pickedFile.path));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Container(
            padding: const EdgeInsets.all(16),
            height: 90,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 7, 7),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Oops",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "No image selected",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    }
  }

  Future<void> _getImageResult(File imageFile) async {
    setState(() {
      _result = '';
      _label = 'Predicting...';
      _solve = '...';
    });
    final res = await getPrediction(imageFile);
    if (res.statusCode == 200) {
      final responseJson = json.decode(res.body);
      setState(() {
        _image = imageFile;
        _result = responseJson['class'] ?? 'Failed to predict';
        _label = responseJson['confidence'] != null
            ? 'Confidence: ${responseJson['confidence'].toStringAsFixed(2)}%'
            : 'Failed to predict';
        _solve = responseJson['solve'] ?? 'Failed to predict';
      });
    } else {
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(16),
          height: 90,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 7, 7),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Oops",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                "No image selected",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      );
      setState(
        () {
          _image = null;
          _result = '';
          _label = 'Failed to predict';
          _solve = '';
        },
      );
    }
  }

  void _clearOutput() {
    setState(() {
      _image = null;
      _result = '';
      _label = '';
      _solve = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TITTLE',
      home: Scaffold(
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
          title: const Text(
            'Detector',
            style: TextStyle(
                fontFamily: "Lobster",
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _image == null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Container(
                          height: 275,
                          width: 275,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: const Color.fromARGB(255, 172, 255, 186)
                                  .withOpacity(0.7),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: const Color.fromARGB(255, 236, 251, 238),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 18, 97, 0)
                                    .withOpacity(0.7),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'No image selected',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 93, 93, 93),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Container(
                          height: 275,
                          width: 275,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 236, 251, 236),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 1, 64, 3)
                                    .withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Image.file(
                            _image!,
                            height: 200,
                            width: 200,
                          ),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8,
                    left: 95,
                    right: 95,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 1, 64, 3)
                                    .withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              onTap: () => _getImage(ImageSource.camera),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.camera_alt,
                                      color: Color.fromARGB(255, 0, 128, 4),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Take a Photo',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 7, 84, 1)
                                    .withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              onTap: () => _getImage(ImageSource.gallery),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.photo_library,
                                      color: Color.fromARGB(255, 0, 128, 4),
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'Choose from Gallery',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 50, right: 50, top: 0, bottom: 0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 7, 84, 1)
                                      .withOpacity(0.8),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              clipBehavior: Clip.antiAlias,
                              child: InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: IconButton(
                                          icon: const Icon(Icons.refresh_sharp),
                                          iconSize: 30,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          onPressed: _clearOutput,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  _result,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 40,
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.grey.withOpacity(0.3),
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  _label,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    _solve,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      letterSpacing: 1.2,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.grey.withOpacity(0.3),
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CloudStorage extends StatefulWidget {
  const CloudStorage({super.key});

  @override
  State<CloudStorage> createState() => _CloudStorageState();
}

class _CloudStorageState extends State<CloudStorage> {
   File? image;

  void pickImage()async{
    final ImagePicker _imagePicker = ImagePicker();
    final XFile? pickedImage = await  _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         image!= null? Center(
           child: Expanded(
              child: Center(
                child: Image.file(image!),
              ),
            ),
         ) : const Center(child: Text('no image')), const SizedBox(
            height: 20,
          ), 
          ElevatedButton(onPressed: pickImage, child: const Text('Pick Image'))
        ],
      ),
    );
  }
}
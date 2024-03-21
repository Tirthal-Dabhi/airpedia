import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePhotoBottomSheet extends StatefulWidget {
  const EditProfilePhotoBottomSheet({Key? key}) : super(key: key);

  @override
  State<EditProfilePhotoBottomSheet> createState() => _EditProfilePhotoBottomSheetState();

  void onSubmit(String text) {}
}

class _EditProfilePhotoBottomSheetState extends State<EditProfilePhotoBottomSheet> {

  final String _error = 'No Error Dectected';
  List<XFile>? imageFileList = [];
  List<String> downloadUrls = [];

  final storageRef = FirebaseStorage.instance.ref();

  showAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'upload image',
              style: TextStyle(color: Colors.deepPurple),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () async {
                    final List<XFile>? selectedImages =
                    await ImagePicker().pickMultiImage();
                    if (selectedImages!.isNotEmpty) {
                      imageFileList!.addAll(selectedImages);
                    }
                    setState(() {});
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.image_outlined,
                    color: Colors.deepPurple,
                    size: 35,
                  ),
                  title: const Text(
                    'Gallery',
                    style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final fireStore = FirebaseFirestore.instance.collection('locationdata');
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'upload profile picture',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 27, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      showAlertBox();
                    },
                    child: const CircleAvatar(
                      radius: 35,
                      child: Icon(
                        Icons.image,
                        size: 35,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Text('Images Upload',
                        //   style: TextStyle(fontSize: 20,color: Colors.deepPurple),)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  }


  Future<String> uploadFile(File file) async {
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref = storageRef
        .child('${DateTime.now().microsecondsSinceEpoch}.jpg');
    final uploadTask = ref.putFile(file);

    final taskSnapshot = await uploadTask.whenComplete(() => null);
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }


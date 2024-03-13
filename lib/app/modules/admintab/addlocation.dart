import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class addlocation extends StatefulWidget {
  const addlocation({Key? key}) : super(key: key);

  @override
  State<addlocation> createState() => _addlocationState();

  void onSubmit(String text) {}
}

class _addlocationState extends State<addlocation> {
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController aboutcontroller = TextEditingController();
  TextEditingController attractionc1 = TextEditingController();
  TextEditingController attractionc2 = TextEditingController();
  TextEditingController attractionc3 = TextEditingController();
  TextEditingController attractionc4 = TextEditingController();
  File? pickedImage;
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
              'Add Location',
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
          'Add Location',
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
                        Icons.place_outlined,
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
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 50,
                    width: 280,
                    child: TextField(
                      controller: locationcontroller,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.deepPurpleAccent),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                        hintText: '',
                        labelText: "Location Name",
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SizedBox(
                          height: 50,
                          width: 280,
                          child: TextField(
                            
                            controller: aboutcontroller,
                            keyboardType: TextInputType.text,
                            style:
                                const TextStyle(color: Colors.deepPurpleAccent),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9)),
                              hintText: '',
                              labelText: "Aboutus",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 130,
                        child: TextFormField(
                          controller: attractionc1,
                          keyboardType: TextInputType.text,
                          style:
                              const TextStyle(color: Colors.deepPurpleAccent),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9)),
                            hintText: 'Attraction1',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 17,
                      ),
                      SizedBox(
                        height: 50,
                        width: 130,
                        child: TextField(
                          controller: attractionc2,
                          keyboardType: TextInputType.text,
                          style:
                              const TextStyle(color: Colors.deepPurpleAccent),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9)),
                            hintText: 'Attraction2',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 130,
                          child: TextField(
                            controller: attractionc3,
                            keyboardType: TextInputType.text,
                            style:
                                const TextStyle(color: Colors.deepPurpleAccent),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9)),
                              hintText: 'Attraction3',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 17,
                        ),
                        SizedBox(
                          height: 50,
                          width: 130,
                          child: TextField(
                            controller: attractionc4,
                            keyboardType: TextInputType.text,
                            style:
                                const TextStyle(color: Colors.deepPurpleAccent),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9)),
                              hintText: 'Attraction4',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  imageFileList != null
                      ? Container(
                          height: 200,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: GridView.builder(
                            itemCount: imageFileList!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 150,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 10,
                                    crossAxisCount: 3),
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                     fit: BoxFit.cover,
                                     image: FileImage(File(imageFileList![index].path))
                                  )
                                ),
                              );
                            },
                          ))
                      : const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 90,
                          child: ElevatedButton(
                            child: const Text(
                              'Add',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              elevation: 1,
                            ),
                            onPressed:  () async {
                              setState(() {
                                loading = true;
                              });
                              for (int i = 0; i < imageFileList!.length; i++) {
                                String url = await uploadFile(File(imageFileList![i].path));
                                downloadUrls.add(url);
                              }
                              String location = DateTime.now()
                                  .microsecondsSinceEpoch
                                  .toString();
                              fireStore.doc(location).set({
                                'Locationname':
                                    locationcontroller.text.toString(),
                                'Aboutus': aboutcontroller.text.toString(),
                                'Attraction1': attractionc1.text.toString(),
                                'Attraction2': attractionc2.text.toString(),
                                'Attraction3': attractionc3.text.toString(),
                                'Attraction4': attractionc4.text.toString(),
                                "imagesUrl": downloadUrls
                              }).then((value) {
                                final snackBar = SnackBar(
                                  content: const Text(
                                      'Location Upload Successfully'),
                                  action: SnackBarAction(
                                      label: '', onPressed: () {}),
                                );
                                locationcontroller.text = "";
                                aboutcontroller.text = "";
                                attractionc1.text = "";
                                attractionc2.text = "";
                                attractionc3.text = "";
                                attractionc4.text = "";
                                downloadUrls.clear();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }).onError((error, stackTrace) {
                                //Utils().toastMessage(error.toString());
                              });
                            },
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
      ),
    );
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
}

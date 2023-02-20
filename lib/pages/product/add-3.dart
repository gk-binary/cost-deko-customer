import 'dart:io';

import 'package:costdeko/management/mutations.dart';
import 'package:costdeko/management/store.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class AddProduct3 extends StatefulWidget {
  const AddProduct3({Key? key}) : super(key: key);

  @override
  State<AddProduct3> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct3> {
  @override
  void initState() {
    super.initState();
    GetFeatures();
  }

  AppStore store = VxState.store as AppStore;
  String categoryId = "";
  bool positive = false;
  bool isWarrantyDetailsActive = true;
  bool isFreeServiceActive = true;
  final formkey = GlobalKey<FormState>();

  final picker = ImagePicker();
  final List<File> _images = [];

  void _deleteImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  void _openCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
    Navigator.pop(context);
  }

  void _openGallery() async {
    final pickedFiles = await picker.getMultiImage();
    if (pickedFiles != null) {
      setState(() {
        _images.addAll(pickedFiles.map((file) => File(file.path)).toList());
      });
    }
    Navigator.pop(context);
  }

  void _openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              5.heightBox,
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a photo'),
                onTap: _openCamera,
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Choose from gallery'),
                onTap: _openGallery,
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddProduct]);
    return Scaffold(
      appBar: AppBar(
        title: "Add Item".text.make(),
      ),
      body: Stack(
        children: [
          Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  GridView.builder(
                    itemCount: _images.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            color: Vx.red900,
                            child: Image.file(
                              _images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Vx.gray500,
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                onPressed: () => _deleteImage(index),
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  10.heightBox,
                  ElevatedButton(
                      onPressed: () {
                        _openBottomSheet();
                      },
                      child: "Add Image".text.make()),
                  10.heightBox,
                  Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          final isValid = formkey.currentState!.validate();

                          if (isValid) {
                            formkey.currentState?.save();
                            store.addItemResult["images"] = _images;
                            AddProduct(
                                product: store.addItemResult, context: context);
                          }
                        },
                        child: "Finish".text.xl.bold.make(),
                      ))
                ],
              ),
            ),
          ),
          (store.addProductLoading == "LOADING")
              ? const Center(child: CircularProgressIndicator())
              : Container(),
          (store.addProductLoading == "ERROR")
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.red))
              : Container()
        ],
      ),
    );
  }
}



import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class StorageScreen extends StatefulWidget {
  @override
  State<StorageScreen> createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {
  final storageRef = FirebaseStorage.instance.ref();

  String _downloadImageUrl = '';

  @override
  Widget build(BuildContext context) {

    User? firebaseUser =  FirebaseAuth.instance.currentUser;

    String? email = firebaseUser?.email;

    print('Email: $email');

    return Scaffold(
      appBar: AppBar(
        title: Text('Storage Screen'),
      ),
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final imageRef = storageRef.child("flutter18/photos/banner_2022_flutter.jpg");

                  _downloadImageUrl = await imageRef.getDownloadURL();

                  print(_downloadImageUrl);

                  setState(() {});
                },
                child: Text('Download File'),
              ),
              ElevatedButton(
                onPressed: () async {

                  // chon file trong bo nho thiet bij

                  String testFilePath = "/storage/emulated/0/Download/banner_2022_flutter.jpg";

                  if (await Permission.storage.request().isGranted) {
                    upLoadImageFileFromAndroidStorage(testFilePath);

                    return;
                  }

// You can request multiple permissions at once.
                  Map<Permission, PermissionStatus> statuses = await [
                    Permission.storage,
                  ].request();

                  if (statuses[Permission.storage] == PermissionStatus.granted) {
                    upLoadImageFileFromAndroidStorage(testFilePath);
                  }

                },
                child: Text('Upload File'),
              ),
              if (_downloadImageUrl != '') Image.network(_downloadImageUrl),
            ],
          )),
    );

  }

  void upLoadImageFileFromAndroidStorage (String _filePath) {
    //final appDocDir = await getExternalStorageDirectory();
    String filePath = _filePath;
    final file = File(filePath);

    //
// Create the file metadata
    //final metadata = SettableMetadata(contentType: "image/png");

// Upload file and metadata to the path 'images/mountains.jpg'
    final uploadTask = storageRef
        .child("anh/flutter/anh_up_len3.jpeg")
        .putFile(file);

// Listen for state changes, errors, and completion of the upload.
    uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
      switch (taskSnapshot.state) {
        case TaskState.running:
          final progress = 100.0 *
              (taskSnapshot.bytesTransferred /
                  taskSnapshot.totalBytes);
          print("Upload is $progress% complete.");
          break;
        case TaskState.paused:
          print("Upload is paused.");
          break;
        case TaskState.canceled:
          print("Upload was canceled");
          break;
        case TaskState.error:
        // Handle unsuccessful uploads
          break;
        case TaskState.success:
        // Handle successful uploads on complete
        // ...
          break;
      }
    });
  }
}
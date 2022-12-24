import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _Picker = ImagePicker();
  String? ImgUrl = "";

  void checkProfileImage() async {
    final storageRef = FirebaseStorage.instance.ref();
    final folderName = FirebaseAuth.instance.currentUser!.uid;
    var UpLink =
        await storageRef.child("$folderName/profile.png").getDownloadURL();
    setState(() {
      ImgUrl = UpLink;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    try {
      checkProfileImage();
    } catch (e) {
      ImgUrl =
          "https://th.bing.com/th/id/R.37d5969ca70eafd5eef2cef9d5dceb8a?rik=ovmjS2eZwVFIXA&pid=ImgRaw&r=0";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: double.infinity,
      color: const Color(0xFFDFBF9),
      child: Column(
        children: [
          Stack(children: [
            CircleAvatar(
              backgroundImage: NetworkImage(ImgUrl!),
              radius: 100,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () async {
                  XFile? img =
                      await _Picker.pickImage(source: ImageSource.gallery);
                  File file = File(img!.path);
                  uploadToCloud(file);
                },
                child: const Icon(Icons.photo_camera),
              ),
            ),
          ]),
          Text(FirebaseAuth.instance.currentUser!.email as String),
          ElevatedButton(
            onPressed: LogOut,
            child: const Text("LogOut"),
          ),
          ElevatedButton(
            onPressed: deleteAccount,
            child: const Text("Delete Account"),
          ),
        ],
      ),
    );
  }

  void uploadToCloud(File file) async {
    final storageRef = FirebaseStorage.instance.ref();
    final folderName = FirebaseAuth.instance.currentUser!.uid;
    final userref = storageRef.child("$folderName");
    final fileref = userref.child("profile.png");
    try {
      await fileref.putFile(file);
      var upURL =
          await storageRef.child("$folderName/profile.png").getDownloadURL();
      setState(() {
        ImgUrl = upURL;
      });
    } catch (e) {
      print(e);
    }
  }

  void addProfilePic() async {}

  Future LogOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future deleteAccount() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
}

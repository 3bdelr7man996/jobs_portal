import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:job_search/view/widgets/edit_profile/ProfileInfoEditWidget.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  File? _profileImage;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!)
                    : AssetImage('assets/images/default_avatar.png') as ImageProvider,
                child: Icon(Icons.camera_alt, size: 32, color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            ProfileInfoEditWidget(
              label: 'First Name',
              hint: 'Enter your first name',
              controller: firstNameController,
            ),
            ProfileInfoEditWidget(
              label: 'Last Name',
              hint: 'Enter your last name',
              controller: lastNameController,
            ),
            ProfileInfoEditWidget(
              label: 'Father\'s Name',
              hint: 'Enter your father\'s name',
              controller: fatherNameController,
            ),
            ProfileInfoEditWidget(
              label: 'Email',
              hint: 'Enter your email address',
              controller: emailController,
            ),
            ProfileInfoEditWidget(
              label: 'City',
              hint: 'Enter your city',
              controller: cityController,
            ),
            ProfileInfoEditWidget(
              label: 'Phone Number',
              hint: 'Enter your phone number',
              controller: phoneController,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement save functionality
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

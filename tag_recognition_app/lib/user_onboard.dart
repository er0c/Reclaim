import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'preferences_page.dart';
import 'welcome_page.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  DateTime? _selectedBirthday;
  int _currentPageIndex = 1; // Index for navigation dots
  File? _profileImage; // To store the selected profile image

  final ImagePicker _picker = ImagePicker();

  void _pickBirthday() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedBirthday) {
      setState(() {
        _selectedBirthday = pickedDate;
      });
    }
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _takePhoto() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text;
      final email = _emailController.text;
      final bio = _bioController.text;
      final birthday = _selectedBirthday != null
          ? "${_selectedBirthday!.year}-${_selectedBirthday!.month}-${_selectedBirthday!.day}"
          : "Not selected";

      // Navigate to the next page (PreferencesPage)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PreferencesPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reclaim"),
        backgroundColor: Colors.green[400],
        elevation: 0,
      ),
      body: Container(
        color: Colors.green[400], // Green background
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Create Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Profile Picture
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: _profileImage != null
                              ? FileImage(_profileImage!)
                              : const AssetImage('assets/default_profile.png') as ImageProvider,
                          backgroundColor: Colors.grey[300],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: _pickImage,
                              icon: const Icon(Icons.photo),
                              label: const Text("Upload"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[600],
                              ),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton.icon(
                              onPressed: _takePhoto,
                              icon: const Icon(Icons.camera_alt),
                              label: const Text("Take Photo"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Username
                  const Text(
                    "Username",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 12.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a username";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Bio
                  const Text(
                    "Bio",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _bioController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 12.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a bio";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 100), // Added space above the button
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[600],
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 40,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: _submitForm,
                      child: const Text(
                        "Create Profile",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Navigation Dots
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDot(0),
                        _buildDot(1),
                        _buildDot(2),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100), // Spacer to extend the gradient to the bottom
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPageIndex == index ? Colors.white : Colors.white.withOpacity(0.5),
      ),
    );
  }
}
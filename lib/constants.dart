import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/controllers/authController.dart';
import 'package:tiktok_clone/views/screens/home/add_video_screen.dart';
import 'package:tiktok_clone/views/screens/home/profile_screen.dart';
import 'package:tiktok_clone/views/screens/home/search_screen.dart';
import 'package:tiktok_clone/views/screens/home/video_Screen.dart';

// PAGES
var pages = [
  VideoScreen(),
  SearchScreen(),
  AddVideoScreen(),
  Text('Message Screen'),
  ProfileScreen(id: authController.user!.uid),
];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLERS
var authController = AuthController.instance;

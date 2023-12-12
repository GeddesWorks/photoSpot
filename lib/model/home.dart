import 'package:flutter/material.dart';
import 'package:photospot/model/gallery.dart';
import 'package:photospot/view/home_screen.dart';

class HomeModel {
  bool inProgress = false;
  bool displaySingle = false;
  Widget shopScreen = HomeScreen();
  double screenWidth = 0;
  int crossAxisCount = 0;

  List<GalleryModel> galleryModels = [];
}

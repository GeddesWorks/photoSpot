import 'package:photospot/model/gallery.dart';

class GalleryViewModel {
  GalleryModel gallery = GalleryModel(
      id: '',
      name: 'Loading...',
      email: '',
      private: false,
      refName: '',
      imageUrls: []);
  int crossAxisCount = 0;
  double screenWidth = 0;
}

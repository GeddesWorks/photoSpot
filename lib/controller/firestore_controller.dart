import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:photospot/model/gallery.dart';
import 'package:photospot/view/home_screen.dart';

class FirestoreController {
  HomeScreenState state;
  FirestoreController(this.state);

  Future<void> getGalleryList() async {
    var result = <GalleryModel>[];

    await FirebaseFirestore.instance
        .collection("gallery")
        .orderBy("created", descending: true)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        result.add(
          GalleryModel(
            id: element.id,
            name: element['name'],
            email: element['email'],
            private: element['private'],
            refName: element['refName'],
            imageUrls: List.from(
              element['imageUrls'],
            ),
            videoUrls: List.from(
              element['videoUrls'],
            ),
          ),
        );
      });
    });

    state.callSetState(() {
      state.model.galleryModels = result;
    });
  }
}

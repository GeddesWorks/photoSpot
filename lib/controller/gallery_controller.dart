import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:photospot/model/gallery.dart';
import 'package:photospot/view/gallery_view.dart';

class GalleryController {
  GalleryViewState state;
  GalleryController(this.state);

  Future<void> getGallerByRefName({required String refName}) async {
    GalleryModel result = GalleryModel(
      id: '',
      name: 'Error Occurred',
      email: '',
      private: false,
      refName: refName,
      imageUrls: [],
      videoUrls: [],
    );
    try {
      await FirebaseFirestore.instance
          .collection("gallery")
          .where("refName", isEqualTo: refName)
          .get()
          .then((value) {
        var element = value.docs.first;
        result = GalleryModel(
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
        );
      });
      state.callSetState(() {
        state.model.gallery = result;
      });
    } catch (e) {
      print(e);
      state.callSetState(() {
        state.model.gallery = GalleryModel(
          id: '',
          name: 'Error Occurred',
          email: '',
          private: false,
          refName: refName,
          imageUrls: [],
          videoUrls: [],
        );
      });
    }
  }
}

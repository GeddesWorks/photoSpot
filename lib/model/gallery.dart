class GalleryModel {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? notes;
  final bool private;
  final DateTime? created;
  final String refName;
  final List<String> imageUrls;
  final List<String> videoUrls;

  GalleryModel({
    required this.id,
    required this.name,
    required this.email,
    required this.private,
    required this.refName,
    required this.imageUrls,
    required this.videoUrls,
    this.phone,
    this.notes,
    this.created,
  });

  factory GalleryModel.fromFirestoreDoc({
    required Map<String, dynamic> doc,
    required String docId,
  }) {
    return GalleryModel(
      id: docId,
      refName: doc["refName"] ?? '',
      name: doc["name"] ?? '',
      email: doc["email"] ?? '',
      private: doc["private"] ?? '',
      imageUrls: doc["imageUrls"] ?? '',
      videoUrls: doc["videoUrls"] ?? '',
      phone: doc["phone"] ?? '',
      notes: doc["notes"] ?? [],
      created: doc["created"] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              doc["created"].millisecondsSinceEpoch,
            )
          : null,
    );
  }
}

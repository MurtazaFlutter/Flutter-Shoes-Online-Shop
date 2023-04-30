class MenShoesModel {
  String id;
  String name;
  String category;
  List<String> imageUrl;
  String oldPrice;
  //List<dynamic> sizes;
  String price;
  String description;
  String title;

  MenShoesModel({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.oldPrice,
    //required this.sizes,
    required this.price,
    required this.description,
    required this.title,
  });

  factory MenShoesModel.fromJson(Map<dynamic, dynamic> json) {
    // List<dynamic> sizesJson = json['sizes'];
    // List<dynamic> sizes =
    //     sizesJson.map((sizeJson) => dyna.fromJson(sizeJson)).toList();

    return MenShoesModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      imageUrl: List<String>.from(json['imageUrl']),
      oldPrice: json['oldPrice'],
      // sizes: sizes,
      price: json['price'],
      description: json['description'],
      title: json['title'],
    );
  }
}

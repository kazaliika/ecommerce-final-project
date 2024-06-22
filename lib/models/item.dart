class Item {
  int id;
  String title;
  double price;
  String category;
  String description;
  String image;
  double rate;
  int review;

  Item({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.rate,
    required this.review
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      category: json['category'],
      description: json['description'],
      image: json['image'],
      rate: json['rating']['rate'].toDouble(),
      review: json['rating']['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'category': category,
      'description': description,
      'image': image,
      'rate': rate,
      'review': review,
    };
  }
}
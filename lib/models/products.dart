class Products {
  final String name;
  final String photo;
  final String description;
  bool isFavorite;
  final String price;
  final String installmentPrice;


  Products({
    required this.name,
    required this.photo,
    required this.description,
    required this.price,
    required this.installmentPrice,
    this.isFavorite = false,
  });
}

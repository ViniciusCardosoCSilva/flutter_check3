class Item {
  final String title;
  final String description;
  final String imageUrl;
  bool isFavorite;

  Item({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
  });
}

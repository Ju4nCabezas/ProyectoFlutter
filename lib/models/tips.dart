class Tips {
  final String id;
  final String title;
  final String description;
  final String category;

  Tips({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
  });

  factory Tips.fromJson(Map<String, dynamic> json) {
    return Tips(
      id: json['ID_Tip']?.toString() ?? json['id']?.toString() ?? '',
      title: json['Titulo'] ?? json['title'] ?? '',
      description: json['Descripcion'] ?? json['description'] ?? '',
      category: json['Categoria'] ?? json['category'] ?? '',
    );
  }
}

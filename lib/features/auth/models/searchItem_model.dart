class SearchItem {
  final int id;
  final String name;

  SearchItem({required this.id, required this.name});

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(id: json['id'], name: json['name']);
  }
}

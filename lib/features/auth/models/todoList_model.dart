class TodoItem {
  final String title;
  final String subtitle;
  final String status;
  final String icon;

  TodoItem({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.icon,
  });

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
      title: json['title'] ?? 'Default Title', // Handle null case
      subtitle: json['subtile'] ?? 'Default Subitle',
      status: json['status'] ?? 'Pending',
      icon: json['icon'] ?? 'default_icon.png',
    );
  }
}

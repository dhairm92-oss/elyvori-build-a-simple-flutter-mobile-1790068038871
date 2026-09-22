class TestItem {
  final String id;
  final String title;
  final String description;
  bool isCompleted;

  TestItem({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
}

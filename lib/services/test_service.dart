import '../models/test_item.dart';

class TestService {
  final List<TestItem> _items = [
    TestItem(
      id: '1',
      title: 'Unit Test Suite',
      description: 'Run core business logic and model unit tests.',
      isCompleted: true,
    ),
    TestItem(
      id: '2',
      title: 'Widget Integration',
      description: 'Verify UI components render correctly across screen sizes.',
      isCompleted: false,
    ),
    TestItem(
      id: '3',
      title: 'Network Simulation',
      description: 'Test API connectivity and offline fallback states.',
      isCompleted: false,
    ),
    TestItem(
      id: '4',
      title: 'Performance Benchmark',
      description: 'Analyze frame rates and memory usage during heavy loads.',
      isCompleted: false,
    ),
  ];

  List<TestItem> getItems() {
    return _items;
  }

  void toggleItemCompletion(String id) {
    final item = _items.firstWhere((i) => i.id == id);
    item.isCompleted = !item.isCompleted;
  }

  void addItem(String title, String description) {
    final newItem = TestItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      isCompleted: false,
    );
    _items.add(newItem);
  }
}

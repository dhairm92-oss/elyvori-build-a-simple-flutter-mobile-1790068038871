import 'package:flutter/material.dart';
import '../models/test_item.dart';
import '../services/test_service.dart';
import '../widgets/test_item_tile.dart';
import 'add_test_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TestService _testService = TestService();
  late List<TestItem> _items;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() {
    setState(() {
      _items = _testService.getItems();
    });
  }

  void _toggleItem(String id) {
    setState(() {
      _testService.toggleItemCompletion(id);
    });
  }

  void _navigateToAddTest() async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(builder: (context) => const AddTestScreen()),
    );

    if (result != null && result['title'] != null && result['description'] != null) {
      setState(() {
        _testService.addItem(result['title']!, result['description']!);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Test added successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int completedCount = _items.where((i) => i.isCompleted).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SuccessTest'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue.shade50,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Testing Dashboard',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Completed: $completedCount of ${_items.length} tests',
                  style: const TextStyle(fontSize: 16,
                  color: Colors.black54),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: _items.isEmpty ? 0 : completedCount / _items.length,
                  backgroundColor: Colors.blue.shade100,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ],
            ),
          ),
          Expanded(
            child: _items.isEmpty
                ? const Center(
                    child: Text(
                      'No tests available. Add one using the + button.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return TestItemTile(
                        item: _items[index],
                        onToggle: _toggleItem,
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddTest,
        tooltip: 'Add Test',
        child: const Icon(Icons.add),
      ),
    );
  }
}

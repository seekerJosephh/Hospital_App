import 'package:flutter_test/flutter_test.dart';
import 'package:hospital/features/auth/models/todoList_model.dart';
import 'package:hospital/services/todoList_service.dart';

void main() {
  // Initialize the binding
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TodoService Tests', () {
    test('fetchTodoItems returns a list of TodoItems', () async {
      final service = TodoService();

      // Simulate fetching the items
      final items = await service.fetchTodoItems();

      // expect actual & matching 
      expect(items, isA<List<TodoItem>>());
      expect(items.isNotEmpty, true);
    });
  });
}

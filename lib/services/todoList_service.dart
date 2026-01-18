import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hospital/features/auth/models/todoList_model.dart';

class TodoService {
  Future<List<TodoItem>> fetchTodoItems() async {
    final String response =
        await rootBundle.loadString('lib/assets/jsons/todoList_data.json');

    final List<dynamic> data = json.decode(response);
    return data.map((json) => TodoItem.fromJson(json)).toList();
  }
}

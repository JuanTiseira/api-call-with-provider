import 'package:api_call_using_provider/model/todo.dart';
import 'package:api_call_using_provider/services/todo_services.dart';
import 'package:flutter/cupertino.dart';

class TodoProvider extends ChangeNotifier{
  TodoService _service = TodoService();
  bool isLoading =  false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _todos =  response;
    isLoading = false;
  }
}
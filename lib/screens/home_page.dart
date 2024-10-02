import 'package:api_call_using_provider/provider/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Consumer<TodoProvider>(
          builder: (context, value, child) {
            /*if(value.isLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }*/
            final todos = value.todos;
            return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index){
                  final todo = todos[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(todo.id.toString()),
                    ),
                    title: Text(todo.title),
                  );
                });
          }),
    );
  }
}

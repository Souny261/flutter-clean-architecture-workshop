import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/todos_notifier.dart';

class SavedTodoListPage extends ConsumerWidget {
  const SavedTodoListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Todo"),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final todoState = ref.watch(todoNotifier);
          final todoAction = ref.read(todoNotifier.notifier);
          return ListView.builder(
            itemCount: todoState.savedTodosList!.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(todoState.savedTodosList![index].title!),
                  trailing: IconButton(
                      onPressed: () {
                        todoAction.removeTodo(todoState.savedTodosList![index]);
                      },
                      icon: const Icon(Icons.remove)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

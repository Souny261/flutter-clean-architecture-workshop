import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/routes/route_utils.dart';
import '../controller/todos_notifier.dart';

class TodosIndex extends StatelessWidget {
  const TodosIndex({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final todoState = ref.watch(todoNotifier);
          final todoAction = ref.read(todoNotifier.notifier);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Todo Index"),
              actions: [
                IconButton(
                    onPressed: () {
                      todoAction.fecthTodoSaved().whenComplete(() =>
                          AppRouter.router.push(PAGES.savedTodo.screenPath));
                    },
                    icon: const Icon(
                      Icons.bookmark,
                    ))
              ],
            ),
            body: ListView.builder(
              itemCount: todoState.todos!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          todoAction.savedTodo(todoState.todos![index]);
                        },
                        icon: const Icon(
                          Icons.bookmark_add_outlined,
                          color: Colors.blue,
                        )),
                    title: Text(todoState.todos![index].title!),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// class TodosIndex extends StatelessWidget {
//   const TodosIndex({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Todos Data"),
//       ),
//       body: BlocBuilder<TodosCubit, TodosState>(
//         builder: (context, state) {
//           if (state.status == TodosStateStatus.loading) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (state.status == TodosStateStatus.error) {
//             return Center(
//                 child: Text(
//               state.errorStateMessage!,
//               style: const TextStyle(
//                   color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
//             ));
//           }
//           return ListView.builder(
//             itemCount: state.todos!.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 child: ListTile(
//                   title: Text(state.todos![index].title!),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/todos_cubit.dart';

class TodosIndex extends StatelessWidget {
  const TodosIndex({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos Data"),
      ),
      body: BlocBuilder<TodosCubit, TodosState>(
        builder: (context, state) {
          if (state.status == TodosStateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == TodosStateStatus.error) {
            return Center(
                child: Text(
              state.errorStateMessage!,
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
            ));
          }
          return ListView.builder(
            itemCount: state.todos!.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(state.todos![index].title!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

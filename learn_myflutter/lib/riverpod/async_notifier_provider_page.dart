import 'dart:math';

import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'entities/todo.dart';
import 'util/util.dart';

final asyncTodoListProvider = AsyncNotifierProvider<AsyncTodoList, List<Todo>>(
  AsyncTodoList.new,
);


// Provider example.
// By adding the `@riverpod` annotation and extending `_$ClassName`,
// `asyncTodoListProvider` can be generated.
// `ref.watch(asyncTodoListProvider)` gets the `state(List<Todo>)`.
// `ref.watch(asyncTodoListProvider.notifier)` gets the
// `AsyncTodoList(Notifier)`.
class AsyncTodoList extends AsyncNotifier<List<Todo>> {

  Future<List<Todo>> _fetchTodo() async {
    // Process to fetch Todo list through Web API, etc.
    final r = await ref
        .read(dioProvider)
        .get<List<Map<String, Object?>>>('https://example.com/api/todo');
    return r.data.map(Todo.fromJson).toList();
  }


}
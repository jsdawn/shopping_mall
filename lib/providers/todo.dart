// The state of our StateNotifier should be immutable.
// We could also use packages like Freezed to help with the implementation.
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_riverpod/flutter_riverpod.dart';

// use
// Todo _todo = ref.watch(todoProvider);
// ref.read(todoProvider.notifier).setTodo();
// ref.read(todoProvider.notifier).setTodo(_todo.copyWith(id: val));

@immutable
class Todo {
  const Todo(
      {required this.id, required this.description, required this.completed});

  // All properties should be `final` on our class.
  final String id;
  final String description;
  final bool completed;

  // Since Todo is immutable, we implement a method that allows cloning the
  // Todo with slightly different content.
  Todo copyWith({String? id, String? description, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}

// The StateNotifier class that will be passed to our StateNotifierProvider.
// This class should not expose state outside of its "state" property, which means
// no public getters/properties!
// The public methods on this class will be what allow the UI to modify the state.
class TodoNotifier extends StateNotifier<Todo> {
  // We initialize the list of todos to an empty list
  TodoNotifier(Todo todo) : super(todo);

  void setTodo(Todo todo) {
    // Since our state is immutable, we are not allowed to do `state.add(todo)`.
    // Instead, we should create a new list of todos which contains the previous
    // items and the new one.
    // Using Dart's spread operator here is helpful!
    state = todo;
    // No need to call "notifyListeners" or anything similar. Calling "state ="
    // will automatically rebuild the UI when necessary.
  }
}

// Finally, we are using StateNotifierProvider to allow the UI to interact with
// our TodosNotifier class.
final todoProvider = StateNotifierProvider<TodoNotifier, Todo>((ref) {
  return TodoNotifier(
      const Todo(completed: false, id: '0', description: 'todo'));
});

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class TodoAppRoute {
  static const todoPage = '/task_page';
  static const createPage = '/create_page';
}


class TodoTask {
  int index;
  String title;
  bool done;

  TodoTask({
    required this.index,
    required this.title,
    required this.done,
  });
}


class TodoTaskStore {
  /* シングルトン */
  static final TodoTaskStore cache = TodoTaskStore.internal();
  TodoTaskStore.internal();

  factory TodoTaskStore() {
    return cache;
  }

  List<TodoTask> taskList = [];

  void submitTodo(String title) {
    if (title.isEmpty == false) {
      var task = TodoTask(index: taskList.length, title: title, done: false);
      taskList.add(task);
    }
  }

  void delete(int index) {
    taskList.removeWhere((element) => element.index == index);
  }

  void complete(int index) {
    taskList.firstWhere((element) => element.index == index).done = true;
  }

}


class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return MaterialApp(
      title: 'Todo Task App',
      routes: {
        TodoAppRoute.todoPage: (context) => const TodoTaskPage(),
        TodoAppRoute.createPage: (context) => const TodoCreatePage(),
      },
      home: const TodoTaskPage(),
    );
  }


// class TodoPage extends StatefulWidget {
//   const TodoPage({super.key});
//
//   @override
//   State<TodoPage> createState() => TodoPageState();
// }
//
//
// class TodoPageState extends State<TodoPage> {
//   final controller = TextEditingController();
//   List<String> todoList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     // controller.text = '初期値が入っています。';
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     // throw UnimplementedError();
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(165, 190, 215, 1.0),
//       appBar: AppBar(
//         title: const Text('TODO'),
//       ),
//       body: ListView.builder(
//         itemCount: todoList.length + 1,
//         itemBuilder: (BuildContext context, int index) {
//           if (index == todoList.length) {
//             // return createTextArea();
//             return TextInputArea(
//                 controller: controller,
//                 onPressedSubmitButton: submitTodo,
//                 onSubmitted: submitTodo,
//             );
//           } else {
//             var title = todoList[index];
//             // return createTodoCard(title, index);
//             return TodoCard(
//               title: title,
//               // index: index,
//               onPressedComplete: () {
//                 complete(index);
//               },
//               onPressedDelete: () {
//                 delete(index);
//               },
//             );
//           }
//         },
//       ),
//     );
//   }


  // Widget createTodoCard(String title, int index) {
  //   return Card(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.max,
  //       children: [
  //         ListTile(title: Text(title)),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           children: [
  //             ElevatedButton(
  //               onPressed: () {
  //                 complete(index);
  //               },
  //               child: const Text('完了'),
  //             ),
  //             const SizedBox(width: 10.0),
  //             ElevatedButton(
  //               onPressed: () {
  //                 delete(index);
  //               },
  //               child: const Text('削除'),
  //             ),
  //             const SizedBox(width: 10.0),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // void submitTodo(String title) {
  //   setState(() {
  //     if (title.isEmpty == false) {
  //       todoList.add(title);
  //       controller.clear();
  //     }
  //   });
  // }

  // void complete(int index) {
  //   setState(() {
  //     todoList.removeAt(index);
  //   });
  // }

  // void delete(int index) {
  //   setState(() {
  //     todoList.removeAt(index);
  //   });
  // }

  // Widget createTextArea() {
  //   return Card(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //           child: TextField(
  //             controller: controller,
  //             decoration: const InputDecoration(hintText: '入力してください'),
  //             onChanged: (String value) {
  //               print(value);
  //             },
  //             onSubmitted: submitTodo,
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
  //           child: ElevatedButton(
  //             onPressed: () {
  //               submitTodo(controller.text);
  //             },
  //             child: const Text('カードを追加する')
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}


class TodoTaskPage extends StatefulWidget {
  const TodoTaskPage({super.key});

  @override
  State<TodoTaskPage> createState() => TodoTaskPageState();
}


class TodoTaskPageState extends State<TodoTaskPage> {
  int selectedIndex = 0;
  List<bool> pageWidgets = [false, true];

  @override
  Widget build(BuildContext context) {
    var isDone = pageWidgets[selectedIndex];
    // 未完了(false), 完了(true)
    var todoList = TodoTaskStore().taskList.where((task) => task.done == isDone).toList();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(165, 190, 215, 1.0),
      appBar: AppBar(
        title: Text(isDone ? 'Done List' : 'Task List'),
        actions: <Widget>[
          Visibility(
            visible: Platform.isAndroid,
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                print("Android Visibility");
              },
            )
          )
        ],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          var title = todoList[index].title;
          var id = todoList[index].index;

          var todoCard = TodoCard(
            title: title,
            onPressedComplete: () => complete(id),
            onPressedDelete: () => delete(id),
          );

          var doneCard = DoneCard(
              title: title,
              onPressedDelete: () => delete(id),
          );

          return isDone ? doneCard : todoCard;
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed(TodoAppRoute.createPage),
          child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.folder_open), label: 'task'),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'done'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.orangeAccent,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        }
      ),
    );
  }

  void delete(int index) {
    setState(() {
      TodoTaskStore().delete(index);
    });
  }


  void complete(int index) {
    setState(() {
      TodoTaskStore().complete(index);
    });
  }
}


class TodoCard extends StatelessWidget {
  final String title;
  // final int index;
  final VoidCallback onPressedComplete;
  final VoidCallback onPressedDelete;

  const TodoCard({
    super.key,
    required this.title,
    // required this.index,
    required this.onPressedComplete,
    required this.onPressedDelete,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: 5.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListTile(title: Text(title)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: onPressedComplete,
                child: const Text('完了'),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: onPressedDelete,
                child: const Text('削除'),
              ),
              const SizedBox(width: 10.0),
            ],
          ),
        ],
      ),
    );
  }
}


class DoneCard extends StatelessWidget {
  final String title;
  final VoidCallback onPressedDelete;

  const DoneCard({
    super.key,
    required this.title,
    required this.onPressedDelete,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: 5.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListTile(title: Text(title)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: onPressedDelete,
                  child: const Text('削除'),
              ),
              const SizedBox(width: 10.0),
            ],
          ),
        ],
      ),
    );
  }
}


class TodoCreatePage extends StatefulWidget {
  const TodoCreatePage({super.key});

  @override
  State<TodoCreatePage> createState() => TodoCreatePageState();
}


class TodoCreatePageState extends State<TodoCreatePage> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void submitTodo(String title) {
    setState(() {
      TodoTaskStore().submitTodo(title);
      Navigator.popAndPushNamed(context, TodoAppRoute.todoPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(165, 190, 215, 1.0),
      appBar: AppBar(
        title: const Text('新規作成'),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: 5.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(hintText: '入力してください'),
                    onChanged: (String value) {
                      print(value);
                    },
                    onSubmitted: submitTodo,
                  )
                )
              ]
            )
          );
        },
      )
    );
  }
}

class TextInputArea extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onPressedSubmitButton;
  final Function(String) onSubmitted;

  const TextInputArea({
    super.key,
    required this.controller,
    required this.onPressedSubmitButton,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: 5.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: '入力してください'),
              onChanged: (String value) {
                print(value);
              },
              onSubmitted: onSubmitted,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: ElevatedButton(
                onPressed: () {
                  onPressedSubmitButton(controller.text);
                },
                child: const Text('カードを追加する')
            ),
          ),
        ],
      ),
    );
  }
}
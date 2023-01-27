import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation',
    home: TodoScreen(
      todos: List<Todo>.generate(20, (index) => Todo(
        title: 'TODO $index',
        description: 'description of TODO $index')
      )
    ),
    routes: {
      "/home": (context) => HomeScreen(),
    }
  ));
}

class Todo {
  final String title;
  final String description;

  Todo({ required this.title, required this.description });
}

class TodoScreen extends StatelessWidget {
  final List<Todo> _todos;
  const TodoScreen({Key? key, required List<Todo> todos })
      : assert(todos != null),
        _todos = todos,
        super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("TODO リスト")
    ),
    body: ListView.builder(
        itemCount:  _todos.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(_todos[index].title),
          onTap: () {
            /*move to Todo description page */
            /*
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailScreen(todo: _todos[index]))
            );
             */
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen())
            );
          }
        )),
  );
}

class DetailScreen extends StatelessWidget {
  final Todo _todo;

  const DetailScreen({ Key? key, required Todo todo })
    : _todo = todo,
      super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
        title: Text(_todo.title)
    ),
    body: Center(
      //padding: const EdgeInsets.all(16.0),
      child: Text(_todo.description),
    ),
  );
}








class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Demo"),
    ),
    body: Center(child: SelectionButton())
  );
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ElevatedButton(
    onPressed: () {
      _navigatedAndDisplaySelection(context);
    },
    child: Text('オプションを選択')
  );

  Future<void> _navigatedAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreeen()),
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
  }
}

class SelectionScreeen extends StatelessWidget {
  const SelectionScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Choose')
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                //選択肢１というデータとともに元の動画に戻る処理
                Navigator.pop(context, '選択肢1');
              },
              child: const Text('選択１'),
            )
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  //選択肢2というデータとともに元の動画に戻る処理
                  Navigator.pop(context, '選択肢2');
                },
                child: const Text('選択2'),
              )
          ),

        ],
      )
    )
  );
}
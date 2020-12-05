import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipe_version001/PostComment.dart';
import 'package:recipe_version001/PostScreen.dart';

import 'PostScreen.dart';

// class Todo {
//   final String title;
//   final String description;
//   //List<String> Comment = [];
//   //Todo(this.title, this.description, this.Comment);
//   Todo(this.title, this.description);
// }

// void main() {
//   runApp(MaterialApp(
//     title: 'Passing Data',
//     home: TodosScreen(
//       todos: List.generate(
//         20,
//         (i) => Todo(
//           'Todo $i',
//           'A description of what needs to be done for Todo $i',
//         ),
//       ),
//     ),
//   ));
// }
// class pushTodo {
//    List<Todo> _todo;
//   _todo.add('a','b');
// }

class TodosScreen extends StatelessWidget {
  final List<Todo> todos; //이거를 postScreen에 있는 dataList가 될 수 있게
  
  

  TodosScreen({Key key, @required this.todos}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            // When a user taps the ListTile, navigate to the DetailScreen.
            // Notice that you're not only creating a DetailScreen, you're
            // also passing the current todo through to it.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(todo: todos[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PostScreen()
                  ));
          },
          child: Text('+',),
          backgroundColor: Colors.blue,)
    );
  }
}

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Todo todo;
  final List <String> commentList = ['hi', 'goodbye','finish', 'flutter','ha,,', '??', 'abcd', 'ㅎㅎ'];
  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: 
      Center(
        // padding: EdgeInsets.all(16.0),
//         child: Text(todo.description),
      // FloatingActionButton(onPressed: () {},
      // child: Text('+'),
      // backgroundColor : Colors.blue,)
        child: Column(
        children: <Widget>[
//           for(var i = 0; i < commentList.length; i++){
          Container(
          height: 20),SizedBox(width: 40),
          Expanded(
            child: Text(todo.description),
          ),
          
          Divider(
                    color: Colors.black,
                    height: 32.0,
                  ),
                  
          Container(
          height: 20),SizedBox(width: 0),
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
            child: ListView(
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  for(var i = 0; i < commentList.length; i++)
                    ListTile(
                      title: Text(commentList[i].toString()),
                    ),
                ]
              ).toList(),
            )
              
            ),
          ),
//           const RaisedButton()  },
        ]
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PostComment()
                  ));
          },
          child: Text('+',),
          backgroundColor: Colors.blue,)
    );
  }
}
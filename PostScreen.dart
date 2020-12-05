import 'package:flutter/material.dart';
import 'package:recipe_version001/community_test.dart';

import 'Community.dart';

// class PostScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Post"),
//     );
//   }
// }

class PostScreen extends StatefulWidget{
  @override
  PostScreenState createState(){
    return PostScreenState();
  }
}

class PostScreenState extends State<PostScreen>{
  final _formKey = GlobalKey<FormState>();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  //List <Todo> dataList;//이럼 불러올때마다 list초기화 되어서 안될듯
    //다른 class에 저장하기~~
  // dataList = List();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    
    myController1.dispose();
    super.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
        // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: myController1,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Input Title',
              contentPadding: new EdgeInsets.symmetric(vertical:50.0, horizontal: 10.0),
              ),
          ),
          
          TextFormField(
            controller: myController2,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Input Post',
              contentPadding: new EdgeInsets.symmetric(vertical:50.0, horizontal: 10.0),
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  //_storeCommentData(_formKey.currentContext);
                  _storeData(myController1.text, myController2.text);//store data
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Uploading Data')));
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Community()
                  ));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
  
  Future <void> _storeData(value1, value2) async{
    // List<Todo> dataList;
    // dataList = TodosScreen().todos;
    String title;
    String description;
    // List <Todo> dataList;//이럼 불러올때마다 list초기화 되어서 안될듯
    // //다른 class에 저장하기~~
    // dataList = List();
    title = value1;
    description = value2;
    TodosScreen().todos.add(Todo(title, description));
    // dataList.add(Todo(title, description));
    // dataList.add(title, description);
    // List.generate(20, (index){
    //   dataList.add(Todo(title, description));
    // });
    // //commentList.add(value);
  }
}
class Todo {
  final String title;
  final String description;
  //List<String> Comment = [];
  //Todo(this.title, this.description, this.Comment);
  Todo(this.title, this.description);
}


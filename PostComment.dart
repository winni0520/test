import 'package:flutter/material.dart';

import 'Community.dart';
import 'Community_Test.dart';

// class PostScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Post"),
//     );
//   }
// }

class PostComment extends StatefulWidget{
  @override
  PostCommentState createState(){
    return PostCommentState();
  }
}

class PostCommentState extends State<PostComment>{
  final myController1 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    
    myController1.dispose();
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
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Input Comment',
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
                  _storeCommentData(myController1.text);//store data
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
  Future <void> _storeCommentData(value) async{
    String comment;
    //List <String> commentList = [];
    
    comment = value;
    // commentList.add(value);
    DetailScreen().commentList.add(comment);
  }
}
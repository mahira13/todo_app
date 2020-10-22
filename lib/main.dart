import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  final PrimaryColor = const Color(0xFFF9A825);
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //primarySwatch: Colors.yellow,
        primaryColor: PrimaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  createState() => new MyTodo();
}

class MyTodo extends State<TodoList> {
  @override
  //List<String> todo = ['mahi', 'ff'];
  List<String> todo = ['Grocery', 'Friends meetup'];
  List<bool> checked = [false, false];
  bool valuefirst = false;

  final TextEditingController tec = new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text("MY TODOS",
              style: TextStyle(
                  fontFamily: 'Lobster', color: Colors.white, fontSize: 25)),
        ),
        body: Stack(children: <Widget>[
          Form(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey[900]),
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  labelText: 'new task title..',
                  fillColor: Colors.blue[50],
                  filled: true,
                ),
                controller: tec,
                onSubmitted: (text) {
                  todo.add(text);
                  tec.clear();
                  setState(() {});
                },
              ),
            ),
          ),
          DraggableScrollableSheet(
            builder: (BuildContext context, ScrollController scrolController) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                    ),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            todo[index],
                            style: TextStyle(
                                fontFamily: 'Lobster',
                                color: Colors.yellow[900],
                                fontSize: 20
                                //fontWeight: FontWeight.bold
                                ),
                          ),
                          subtitle: new TextField(
                            decoration: new InputDecoration(
                              hintText: "enter details...",
                            ),
                          ),
                          trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Checkbox(
                                  checkColor: Colors.greenAccent,
                                  activeColor: Colors.green,
                                  value: checked[index],
                                  onChanged: (bool value) {
                                    setState(() {
                                      checked[index] = value;
                                      checked.add(valuefirst);
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed: () {
                                    todo.removeAt(index);
                                  },
                                ),
                              ]),
                          isThreeLine: true,
                        );
                      },
                      controller: scrolController,
                      itemCount: todo.length,
                    ),
                  ),
                ],
              );
            },
          )
        ]));
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  var todoItems = [
    'Math',
    'Architecture',
    'Biology',
    'Flutter',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDoa'),
      ),
      body: Center(
        child: ListView.builder(
            // Let the ListView know how many items it needs to build.
            itemCount: todoItems.length,
            // Provide a builder function. This is where the magic happens.
            // Convert each item into a widget based on the type of item it is.
            itemBuilder: (context, index) {
              var item = todoItems[index];

              return ToDoRow(title: item);
            }),
      ),
    );
  }
}

class ToDoRow extends StatelessWidget {
  final String title;

  ToDoRow({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (bool? value) {},
        ),
        Container(
          margin: const EdgeInsets.all(12.0),
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: const DecorationImage(
              image: AssetImage('assets/bg_header.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            border: Border.all(
              color: Colors.white,
              width: 4.0,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 4.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 24),
            ))
      ],
    );
  }
}

import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}
class Myapp extends StatelessWidget{
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Test Web',
      home: Apphome(
        title: 'My App 2',
      ) ,
    );
  }

}
class Apphome extends StatefulWidget{
  final String title;

  const Apphome({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyHomePage();
  }
}
class MyHomePage extends State<Apphome>{
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed:(){
              print('search click');
            },
            icon: const Icon(Icons.menu),
            tooltip: 'Search Menu'
        ),
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed:(){
                print('search click');
              },
              icon: const Icon(Icons.search),
              tooltip: 'Search Menu'
          ),
          IconButton(
              onPressed:(){
                print('search click');
              },
              icon: const Icon(Icons.menu),
              tooltip: 'Search Menu'
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('push the button'),
            Text(
                'counter = $counter',
                style: Theme.of(context).textTheme.headline5),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ++ counter;
            print(counter);
          });
        },
        child: const Icon(Icons.add),
        tooltip: 'add',
      ),
    );
  }
}

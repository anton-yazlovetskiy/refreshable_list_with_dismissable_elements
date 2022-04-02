import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    Future<void> refreshList() async {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          await refreshList();
        },
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(users[index]),
                onDismissed: (direction) {
                  // if (direction == DismissDirection.startToEnd) {
                  //   print('right');
                  // } else if (direction == DismissDirection.endToStart) {
                  //   print('left');
                  // } else {
                  //   print('uncown');
                  // }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('я печенька'),
                      action: SnackBarAction(
                        label: "data",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Alert Dialog Box"),
                              content: const Text(
                                  "You have raised a Alert Dialog Box"),
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("okay"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                background: Container(
                  color: Colors.red,
                ),
                child: ListTile(
                  title: Text(users[index]),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          users.add('User ${users.length + 1}');
        },
        tooltip: 'Add user',
        child: const Icon(Icons.add),
      ),
    );
  }
}

List users = [
  'User 1',
  'User 2',
  'User 3',
  'User 4',
  'User 5',
  'User 6',
  'User 7',
  'User 8'
];

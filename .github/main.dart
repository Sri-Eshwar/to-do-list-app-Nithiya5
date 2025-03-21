import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cute Todo App',
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<String> tasks = [];
  List<bool> checked = [];
  TextEditingController taskController = TextEditingController();

  void addTask(String task) {
    setState(() {
      tasks.add(task);
      checked.add(false);
    });
    taskController.clear();
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
      checked.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'To Do List',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Cursive'),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text("🌿", style: TextStyle(fontSize: 40)), // Hanging plant
              ],
            ),
            SizedBox(height: 10),
            TextField(
              controller: taskController,
              decoration: InputDecoration(
                hintText: 'Enter new task...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (taskController.text.isNotEmpty) {
                      addTask(taskController.text);
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Checkbox(
                          value: checked[index],
                          onChanged: (val) {
                            setState(() {
                              checked[index] = val!;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            tasks[index],
                            style: TextStyle(
                              fontSize: 16,
                              decoration: checked[index] ? TextDecoration.lineThrough : TextDecoration.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteTask(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text("🪴", style: TextStyle(fontSize: 50)), // Potted plant
            ),
          ],
        ),
      ),
    );
  }
}

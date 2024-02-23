import 'package:flutter/material.dart';

class NewPlan extends StatefulWidget {
  const NewPlan({Key? key}) : super(key: key);

  @override
  _AddDialogState createState() => _AddDialogState();
}

class _AddDialogState extends State<NewPlan> {

  @override
  Widget build(BuildContext context) {
    return Dialog( child: Container(
        height: 410,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(labelText: 'Title')
              ),
              const SizedBox(height: 20),
              const TextField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(labelText: 'Time')
              ),
              const SizedBox(height: 20),
              const TextField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(labelText: 'Description')
              ),
              const SizedBox(height: 50),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded( child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                        child: const Text('Cancel', style: TextStyle(color: Colors.black)),
                        onPressed: (){Navigator.of(context).pop();}
                    )),
                    const SizedBox(width: 16),
                    Expanded( child: ElevatedButton(
                        style: ElevatedButton.styleFrom( backgroundColor: Colors.blueAccent),
                        child: const Text('OK', style: TextStyle(color: Colors.black)),
                        onPressed: () {

                          Navigator.of(context).pop();
                        }
                    ))
                  ]
              )
            ]
        )
    )
    );
  }
}
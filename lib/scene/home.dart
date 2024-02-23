import 'package:flutter/material.dart';
import '../model/database.dart';
import '../model/plan.dart';
import '../component/home/plan_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final planDB = PlanDB();

  Future<void> insertPlan() async {
    var plan = Plan(
        title: 'To make money!',
        time: '10:00',
        description: '1.000.000.000.000 VND',
        isCompleted: false
    );
    planDB.insertPlan(plan);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Center(
              child: Text(
                  'My Plan',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)
              )
          )
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<List<Plan>> (
            future: planDB.getPlans(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return PlanItem(plan: snapshot.data![index]);
                    }
                );
              }
              return const Center(child: Text('No plan found'));
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Add Plan',
          child: const Icon(Icons.add),
          onPressed: () {
            insertPlan();
            // showDialog(context: context, builder: (BuildContext context) {
            //   return const NewPlan();
            // });
          }
      ),
    );
  }
}
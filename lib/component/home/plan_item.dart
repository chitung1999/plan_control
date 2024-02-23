import 'package:flutter/material.dart';
import '../../model/plan.dart';
import 'new_plan.dart';

class PlanItem extends StatefulWidget {
  final Plan? plan;
  const PlanItem({Key? key, this.plan}) : super(key: key);

  @override
  State<PlanItem> createState() => _PlanItemState();
}

class _PlanItemState extends State<PlanItem> {
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _isCompleted = widget.plan?.isCompleted ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: 350, height: 2, color: Colors.black.withOpacity(0.3)),
        Row(
            children: [
              Expanded (
                child: Container(
                  width: 200,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                            '${widget.plan?.title}',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                                color: (_isCompleted ? Colors.blue : Colors.black))
                        ),
                        const SizedBox(height: 5),
                        Text('${widget.plan?.time}', style: const TextStyle(fontSize: 15)),
                        const SizedBox(height: 5),
                        Text(
                            '${widget.plan?.description}',
                            style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.3))
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  showDialog(context: context, builder: (BuildContext context) {
                                    return const NewPlan();
                                  });
                                }
                            ),
                            const SizedBox(width: 20),
                            IconButton(icon: const Icon(Icons.delete), onPressed: () {  })
                          ],
                        )
                      ]
                  ),
                ),
              ),

              Checkbox(
                  value: _isCompleted,
                  onChanged: (bool? value) {
                    setState(() {
                      _isCompleted = value ?? false;
                    });
                  }
              ),
              const SizedBox(width: 5)
            ]
        ),
      ],
    );
  }
}
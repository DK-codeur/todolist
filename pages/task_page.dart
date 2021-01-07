import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  static const routname = '/taskPage';

  @override
  _TaskPageState createState() => _TaskPageState();
}


class Task {
  final String task;
  final isFinish;

  const Task(this.task, this.isFinish);
}

final List<Task> _myTaskList = [
  Task('Call Tom about appointment', false),
  Task('Fix onboarding experience', false),
  Task('Edit API documentation', false),
  Task('Setup user focus group', false),
  Task('Have coffe with Sam', true),
  Task('Meat with sales', true),
];


class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: _myTaskList.length,
      itemBuilder: (context, index) {

        return _myTaskList[index].isFinish 
        ? 
          _taskcomplete(_myTaskList[index].task)
        :
          _taskUncomplete(_myTaskList[index].task);  

      },
    );
  }


  Widget _taskUncomplete(String task) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, bottom: 24),
      child: Row(
        children: <Widget>[
          Icon(Icons.radio_button_unchecked, color: Theme.of(context).accentColor, size: 20),
          SizedBox(width: 28,),
          Text(task)
        ],
      ),
    );
  }

  Widget _taskcomplete(String task) {
    return Container(
      foregroundDecoration: BoxDecoration(
        color: Color(0x60FDFDFD)
      ),

      child: Padding(
        padding: EdgeInsets.only(left: 20.0, top: 24),
        child: Row(
          children: <Widget>[
            Icon(Icons.radio_button_checked, color: Theme.of(context).accentColor, size: 20),
            SizedBox(width: 28,),
            Text(task)
          ],
        ),
      ),
    );
  }


}
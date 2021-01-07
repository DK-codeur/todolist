import 'package:flutter/material.dart';
import 'package:to_do_list/pages/event_page.dart';
import 'package:to_do_list/pages/task_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'CenturyGhotic'
      ),
      home: MyHomePage(title: 'ToDo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool navTo = false;

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(

      body: Stack(
        children: <Widget>[
          Container(
            color: Theme.of(context).accentColor,
            height: 35,
          ),
          Positioned(
            right: 0,
            child: Text(
              '6',
              style: TextStyle(
                fontSize: 200, 
                color: Color(0x10000000)
              ),
            ),
          ),
          _mainContent(context),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add)
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {}
            ),

            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {}
            )
          ],
        ),
      ),

    );

  }


// func widget

  Column _mainContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 60),
        Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'Monday',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
            )
          ),
        ),

        Padding(
          child: _button(context),
          padding: EdgeInsets.all(24.0),
        ),

        Expanded(
          child: navTo
        ?
          TaskPage()
        : 
          EventPage()
        ),

        
      ],
    );
  }



  Widget _button(BuildContext context) {
    return Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                color:(!navTo) ? Theme.of(context).accentColor : Colors.white,
                textColor: (!navTo) ? Colors.white : Theme.of(context).accentColor,
                padding: EdgeInsets.all(14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Text('Tasks'),
                onPressed: () {
                  setState(() {
                    navTo = false;
                  });
                },
              ),
            ),

            SizedBox(width: 32),

            Expanded(
              child: MaterialButton(
                color: (navTo) ? Theme.of(context).accentColor : Colors.white,
                textColor: (navTo) ? Colors.white : Theme.of(context).accentColor,
               
                padding: EdgeInsets.all(14),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Theme.of(context).accentColor,),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Text('Events'),
                onPressed: () {
                  setState(() {
                    navTo = true;
                  });
                },
              ),
            )
          ],
        );
  }
}

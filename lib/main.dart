import 'package:flutter/material.dart';

void main() => runApp(
      new MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draggable',
//      home: Drag(),
      home: MyHomePage(),
    );
  }
}

class Drag extends StatefulWidget {
  Drag({Key key}) : super(key: key);

  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<Drag>  with TickerProviderStateMixin {



  double top1 = 10;
  double left1 = 50;

  double top2 = 50;
  double left2 = 100;


  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Draggable(
                    axis: Axis.horizontal,
                    child: Container(
                      padding: EdgeInsets.only(top: top1, left: left1),
                      child: DragItem1(),
                    ),
                    feedback: Container(
                      padding: EdgeInsets.only(top: top1, left: left1),
                      child: DragItem1(),
                    ),
                    childWhenDragging: Container(
                      padding: EdgeInsets.only(top: top1, left: left1),
                      child: DragItem1(),
                    ),
                    onDragStarted: (){
                      print("Drag Started");
                    },
                    onDragCompleted: () {
                      print("Drag Completed");
                    },
                    onDragEnd: (drag) {
                      setState(() {
                        top1 = top1 + drag.offset.dy < 0 ? 0 : top1 + drag.offset.dy;
                        left1 = left1 + drag.offset.dx < 0 ? 0 : left1 + drag.offset.dx;


//                  print("-----------------------------");
//                  print("-----------------------------");
//                  print("-----------------------------");
//                  print(top);
//                  print(left);
//                  print("-----------------------------");
//                  print("-----------------------------");

                      });
                    },
                  ),
                ),
      Container(
        width: 100.0,
        height: 100.0,
        color: Colors.deepPurple,
        child: DragTarget(
          builder:
              (context, List<int> candidateData, rejectedData) {
            return Center(child: Text("Odd", style: TextStyle(color: Colors.white, fontSize: 22.0),));
          },
          onWillAccept: (data) {
            return true;
          },
          onAccept: (data) {
            if(data % 2 != 0) {
              scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Correct!")));
            } else {
              scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Wrong!")));
            }
          },
        ),)

              ],
            ),

          ],
        ),
      ),
    );
  }
}


class DragItem1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      IconData(57744, fontFamily: 'MaterialIcons'),
      size: 36,
    );
  }
}


class DragItem2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      IconData(57744, fontFamily: 'MaterialIcons'),
      size: 36,
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

//  String text = "A simple way to swipe between screens";
  String text = "რამდენიმე დღე სასტუმროში ვიცხოვრე და მერე ოჯახში გადავედი";

  String letterToCount = "მ";
  int letterCounter = 0;

  List<String> wordList = [];

  void createListFromSentences(String sentences){
    wordList = sentences.split("").toList();
  }

  void countLetter(List letters, String letter){

    print(letters.length);

    for (int i=0;i<letters.length;i++) {
      if (letters[i]==letter) {
        letterCounter++;
      }
    }

    print("there are $letterCounter letter $letterToCount in sentences");

  }



  @override
  void initState() {
    super.initState();
    createListFromSentences(text);

//    print("----------------------");
//    print("----------------------");
//    print("----------------------");
//    print("Word list is");
//    print(wordList);
//    print("----------------------");
//    print("----------------------");
//    print("----------------------");

    countLetter(wordList,letterToCount);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Draggable(
              data: 5,
              child: Container(
                width: 100.0,
                height: 100.0,
                child: Center(
                  child: Text(
                    "5",
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                ),
                color: Colors.pink,
              ),
              feedback: Container(
                width: 100.0,
                height: 100.0,
                child: Center(
                  child: Text(
                    "5",
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                ),
                color: Colors.pink,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.green,
                  child: DragTarget(
                    builder:
                        (context, List<int> candidateData, rejectedData) {
                      print(candidateData);
                      return Center(child: Text("Even", style: TextStyle(color: Colors.white, fontSize: 22.0),));
                    },
                    onWillAccept: (data) {
                      return true;
                    },
                    onAccept: (data) {
                      if(data % 2 == 0) {
                        scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Correct!")));
                      } else {
                        scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Wrong!")));
                      }
                    },
                  ),
                ),
                Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.deepPurple,
                  child: DragTarget(
                    builder:
                        (context, List<int> candidateData, rejectedData) {
                      return Center(child: Text("Odd", style: TextStyle(color: Colors.white, fontSize: 22.0),));
                    },
                    onWillAccept: (data) {
                      return true;
                    },
                    onAccept: (data) {
                      if(data % 2 != 0) {
                        scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Correct!")));
                      } else {
                        scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Wrong!")));
                      }
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
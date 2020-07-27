import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: TextFieldEx(),
  ));
}

class TextFieldEx extends StatefulWidget {
  @override
  _TextFieldExState createState() => new _TextFieldExState();
}

class _TextFieldExState extends State<TextFieldEx> {
  TextEditingController _c ;
  String _text = "initial";
  List<String> myStack = List<String>();
  @override
  void initState() {
    _c = new TextEditingController();
    super.initState();
  }

  @override
  void dispose(){
    _c?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            "STACK", textAlign: TextAlign.center, style: TextStyle( fontSize: 30, color: Colors.white),
          ),
        ),
        body: new Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new TextField(
                    keyboardType: TextInputType.number,
                    // onChanged: (v)=>setState((){_text=v;}),
                    //onChanged: (v)=>setState(() {myStack.add(v);}),
                    controller: _c,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new RaisedButton(
                          child: new Text("Push"),
                          onPressed: (){
                            setState((){
                              myStack.add(_c.text);
                            });
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                        ),
                        new RaisedButton(
                          child: new Text("Pop"),
                          onPressed: (){
                            setState((){
                              myStack.removeAt(myStack.length - 1);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  // new Text("Text Input: $_text"),
                  // new Row(children: myStack.map((item) => new Text(item + ", ")).toList()),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: new Row(children: myStack.map((item) => Padding(
                      padding: const EdgeInsets.only(top: 20, left: 5.0, right: 5.0),
                      child: new Container(
                          width: 100, height: 100, color: Colors.deepPurple,
                          child: Center(child: new Text(item, style: TextStyle(fontSize: 50, color: Colors.white),))),
                    )).toList()),
                  )
                ],
              ),
            )
        )
    );
  }
}
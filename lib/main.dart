import 'package:flutter/material.dart';
import './net.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '单词本',
      theme: new ThemeData(

        primarySwatch: Colors.blueGrey,
      ),
      home: new MyHomePage(title: '单词本'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _controller = new TextEditingController();

  void _translate(){

    Request net_controller = new Request();
    net_controller.translate(_controller.text);

    setState(() {
      TransactionWord;
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              padding:const EdgeInsets.only(left:5.0,right:5.0),
              margin: const EdgeInsets.all(10.0),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    flex:3,
                      child:new TextField(
                        controller: _controller,
                        decoration: new InputDecoration(
                          hintText: "输入 中/英 搜索",
                          border: InputBorder.none,
                        ),
                      ),
                  ),
                  new Expanded(
                      flex:2,
                      child:new RaisedButton(
                        disabledTextColor: Colors.black45,
                        child: Text("Transate"),
                        color: Colors.white,
                        onPressed: _translate,
                      )
                  ),
                ],
              ),
              decoration: new BoxDecoration(
                border: new Border.all(
                  width: 1.0,
                  color: Colors.blueGrey
                ),
                borderRadius: const BorderRadius.all(const Radius.circular(5.0)),
              ),
            ),
            new Container(            // 1。 翻译部分
              padding: const EdgeInsets.only(left: 5.0),
              height: 100.0,
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: new Column(
                children: TransactionWord,
              ),
            ),
            new Container(  // 2。 按钮，保存
              child: new FlatButton(
                child: Text("保存"),
                color: Colors.lightGreen,
              )
            ),
            new Container(  // 3。 按钮，查看全部
              child: new FlatButton(
                  child: Text("查看全部")
              ),
            )
          ],
        ),
      )
    );
  }
}

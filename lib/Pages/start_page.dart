import 'package:flutter/material.dart';
import 'package:tenses_app/Pages/kuis_page.dart';

class StartPage extends StatefulWidget {
  final bool hasData;
  final score;
  StartPage({Key key, @required this.hasData, this.score}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  List<int> skor = [];
  List<bool> hasdata = [];

  @override
  void initState() {
    super.initState();
    skor.add(widget.score);
    hasdata.add(widget.hasData);

    if (hasdata[0] == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showDialog<String>(
          context: context,
          builder: (BuildContext context) => new AlertDialog(
            title: new Text("Waktu anda habis!"),
            content: new Text("Skor anda adalah ${skor[0]}"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //!!Background
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff76ABAD),
        ),
        child: Column(
          children: [
            //!!AppBar
            Stack(
              children: [
                Positioned(
                  child: AppBar(
                    centerTitle: true,
                    title: Text(
                      "Kuis Tenses",
                      style: TextStyle(fontSize: 32, color: Colors.black),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                  ),
                ),
              ],
            ),
            //!!Body
            Expanded(
              flex: 15,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset('res/images/fourchild.png'),
                    ),
                    Expanded(child: Container()),
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin: EdgeInsets.only(
                          right: 8,
                          left: 8,
                          bottom: 16,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('res/images/Tablet.png'),
                              fit: BoxFit.cover),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 100, right: 100),
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => KuisPage()));
                                },
                                child: Row(
                                  children: [
                                    Expanded(child: Icon(Icons.play_arrow)),
                                    Expanded(child: Text('Start')),
                                  ],
                                ),
                                color: Color(0xffaae6fe),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                textColor: Colors.black,
                child: Icon(
                  Icons.cancel_sharp,
                  size: 36,
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

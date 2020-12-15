import 'package:flutter/material.dart';
import '../Data/belajar_data.dart';

class BelajarPage extends StatefulWidget {
  @override
  _BelajarPageState createState() => _BelajarPageState();
}

class _BelajarPageState extends State<BelajarPage> {

  int belajarNumber = 0;

  _nextButton(){
    setState(() {
      belajarNumber = (belajarNumber + 1) % title.length;
    });
  }

  _prevButton(){
    setState(() {
      belajarNumber = (belajarNumber - 1) % title.length;
    });
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
                      "Belajar Tenses",
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
                    SizedBox(height: 16),
                    Expanded(
                      child: Image.asset('res/images/fourchild.png'),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        margin: EdgeInsets.only(right: 8, left: 8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('res/images/Board.png'),
                              fit: BoxFit.cover),
                        ),
                        child: Container(
                          // color: Colors.red,
                          margin: EdgeInsets.only(
                              top: 40, bottom: 80, left: 8, right: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                title[belajarNumber],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${desc[belajarNumber]}${contoh[belajarNumber]}',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //!!Bottombar
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      textColor: Colors.black,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Icon(
                        Icons.cancel_rounded,
                        size: 36,
                      ),
                    ),
                  ),
                  Expanded(flex: 2, child: Container()),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () => _prevButton(),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      textColor: Colors.black,
                      child: Icon(
                        Icons.chevron_left,
                        size: 36,
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () => _nextButton(),
                      textColor: Colors.black,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Icon(
                        Icons.chevron_right,
                        size: 36,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

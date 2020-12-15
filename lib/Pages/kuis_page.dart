import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';
import '../Data/kuis_data.dart';
import 'start_page.dart';

class KuisPage extends StatefulWidget {
  @override
  _KuisPageState createState() => _KuisPageState();
}

class _KuisPageState extends State<KuisPage> {
  //!!init
  int kuisNumber = 1;
  var choices = ['0', '1', '2', '3'];
  int soal = 0;
  int score = 0;
  Timer timer;
  int time = 60;
  var _prevAnswer;

  _shuffleSoal() {
    setState(() {
      for (int i = 0; i < pertanyaanNumber.length; i++) {
        pertanyaanNumber[i] = soalKuis[i];
        benar[i] = jawabanKuis[i];
        salah[i] = wrongJawaban[i];
        salah2[i] = wrongJawaban2[i];
        salah3[i] = wrongJawaban3[i];
      }

      var random = new Random();
      var i = pertanyaanNumber.length,
          k,
          temp,
          benartemp,
          salahtemp,
          salah2temp,
          salah3temp,
          kuistemp;
      while (--i > 0) {
        k = random.nextInt((i + 1));
        temp = pertanyaanNumber[k];
        benartemp = benar[k];
        salahtemp = salah[k];
        salah2temp = salah2[k];
        salah3temp = salah3[k];
        kuistemp = noKuis[k];

        pertanyaanNumber[k] = pertanyaanNumber[i];
        pertanyaanNumber[i] = temp;

        benar[k] = benar[i];
        benar[i] = benartemp;

        salah[k] = salah[i];
        salah[i] = salahtemp;

        salah2[k] = salah2[i];
        salah2[i] = salah2temp;

        salah3[k] = salah3[i];
        salah3[i] = salah3temp;

        salah3[k] = salah3[i];
        salah3[i] = salah3temp;

        noKuis[k] = noKuis[i];
        noKuis[i] = kuistemp;
      }
    });
  }

  _shuffleJawaban() {
    choices[0] = benar[soal];
    choices[1] = salah[soal];
    choices[2] = salah2[soal];
    choices[3] = salah3[soal];

    var random = new Random();
    var i = choices.length, k, temp;
    while (i-- > 0) {
      k = random.nextInt((i + 1));
      temp = choices[k];
      choices[k] = choices[i];
      choices[i] = temp;
    }
  }

  _wrongAnswer() {
    setState(() {
      _prevAnswer = Icons.cancel_sharp;
      score -= 1;
      soal = (soal + 1) % pertanyaanNumber.length;
      kuisNumber += 1;
      _shuffleJawaban();
    });
  }

  _correctAnswer() {
    setState(() {
      _prevAnswer = Icons.check;
      score += 1;
      soal = (soal + 1) % pertanyaanNumber.length;
      kuisNumber += 1;
      _shuffleJawaban();
    });
  }

  _timeCountdown(){
    timer = Timer.periodic(Duration(seconds: 1), (value) {
      setState(() {
        if(time>0){
          time--;
        } else {
          timer.cancel();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StartPage(hasData: true, score: score,)));
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _shuffleSoal();
    _shuffleJawaban();
    _timeCountdown();

    print(noKuis);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
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
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 8, bottom: 8, left: 16, right: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.timer_sharp),
                                  SizedBox(width: 8),
                                  Text(
                                    'Time: $time',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Icon(_prevAnswer)),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star),
                                  SizedBox(width: 8),
                                  Text(
                                    'Score: $score',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 40, bottom: 40, left: 16, right: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 16),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Pertanyaan ke-$kuisNumber',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '${pertanyaanNumber[soal]}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 24, right: 24),
                                  child: Row(
                                    children: [
                                      KuisButton(
                                        text: '${choices[0]}',
                                        onpressed: () {
                                          if (choices[0] == benar[soal]) {
                                            _correctAnswer();
                                          } else {
                                            _wrongAnswer();
                                          }
                                        },
                                      ),
                                      SizedBox(width: 16),
                                      KuisButton(
                                        text: '${choices[1]}',
                                        onpressed: () {
                                          if (choices[1] == benar[soal]) {
                                            _correctAnswer();
                                          } else {
                                            _wrongAnswer();
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 24, right: 24),
                                  child: Row(
                                    children: [
                                      KuisButton(
                                        text: '${choices[2]}',
                                        onpressed: () {
                                          if (choices[2] == benar[soal]) {
                                            _correctAnswer();
                                          } else {
                                            _wrongAnswer();
                                          }
                                        },
                                      ),
                                      SizedBox(width: 16),
                                      KuisButton(
                                        text: '${choices[3]}',
                                        onpressed: () {
                                          if (choices[3] == benar[soal]) {
                                            _correctAnswer();
                                          } else {
                                            _wrongAnswer();
                                          }
                                        },
                                      ),
                                    ],
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

class KuisButton extends StatelessWidget {
  KuisButton({@required this.text, @required this.onpressed});
  final String text;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(
        onPressed: onpressed,
        child: Text(text),
        color: Color(0xffaae6fe),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}

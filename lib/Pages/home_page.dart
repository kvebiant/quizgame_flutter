import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'belajar_page.dart';
import 'start_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Keluar'),
              content: Text('Apakah kamu yakin ingin keluar?'),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Tidak'),
                ),
                MaterialButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text('Ya'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    //!!Back Button Pressed / Quit
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
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
                        "Tenses Bahasa Inggris",
                        style: TextStyle(fontSize: 32, color: Colors.black),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  ),
                ],
              ),
              //!!Body
              Expanded(
                flex: 15,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: Image.asset('res/images/cloudchild.png')),
                      SizedBox(height: 32),
                      Row(
                        children: [
                          HomeButton(
                            text: 'Belajar Tenses',
                            onpressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BelajarPage()));
                            },
                          ),
                          SizedBox(width: 16),
                          HomeButton(
                            text: 'Quis Tenses',
                            onpressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StartPage(hasData: false,)),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          HomeButton(
                            text: 'Tentang Aplikasi',
                            onpressed: () => tentangAlertDialog(context),
                          ),
                          SizedBox(width: 16),
                          HomeButton(
                            text: 'Petunjuk',
                            onpressed: () => petunjukAlertDialog(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: MaterialButton(
                  onPressed: () => _onBackPressed(),
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
      ),
    );
  }

  tentangAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text('Tentang Aplikasi'),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Halo, teman.\n\n'
                  'Baca tentang aplikasi ini ya.\n\n'
                  'Aplikasi ini adalah Game Edukasi yang bernama Tenses Bahasa Inggris! '
                  'Aplikasi ini memberikan materi tentang tenses dalam bahasa inggris '
                  'dan juga kuis pada menu quis tenses yang bertujuan untuk mengulang kembali'
                  ' materi yang sudah dipelajari pada menu Belajar Tenses.\n\n\n'),
              Text(
                'Kiki Vebiant\n'
                'FTKI - Informatika\n'
                'Universitas Nasional\n\n',
                textAlign: TextAlign.end,
              ),
              Text(
                'Copyrighted 2020',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 8),
              )
            ],
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  petunjukAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text('Petunjuk'),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Halo, baca pentunjuk untuk aplikasi ini ya teman.\n\n'
                  'Pentunjuk menu:\n'),
              Text(
                'Belajar Tenses \n "Pembelajaran Materi Tenses dalam Bahasa Inggris"\n\n'
                'Quis Tenses \n "Quis yang terdiri dari materi-materi tenses yang sudah disediakan"\n\n'
                'Tentang Aplikasi \n "Menceritakan tentang aplikasi"\n\n'
                'Petunjuk \n "Memberikan petunjuk untuk menggunakan aplikasi"',
                textAlign: TextAlign.center,
              )
            ],
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class HomeButton extends StatelessWidget {
  HomeButton({@required this.text, this.onpressed});
  final String text;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 56,
        child: RaisedButton(
          onPressed: onpressed,
          child: Text(text),
          color: Color(0xffaae6fe),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
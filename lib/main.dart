import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funny Quotes',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade300),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> quoteList = [
    'ช่วงนี้อ่อนไหว มองหน้าใครก็ใช่ไปหมดเลย',
    'ภาพถ่ายอาจจะหน้าชัดหลังเบลอ แต่ภาพของเธอในใจเรามันชัดเจน',
    'จะมองอะไรนักหนา เธอมีปัญหาหรือว่ามีใจ',
    'หาวเอาไว้ใช้กับง่วง หวงเอาไว้ใช้กับเธอ',
    'ก้าวแรกโดนใจ ก้าวต่อไปโดนเท',
    'ถึงเราจะไม่ผอม แต่เวลาหอมแล้วหายเหนื่อย',
    'ถ้ายังไม่รู้จักเราดีพอ ศึกษาในแชทต่อได้นะคะ',
    'มองหน้าแล้วทำเฉย ระวังได้เป็นลูกเขยแม่เรานะ',
    'อากาศร้อนต้องเปิดแอร์ อยากมีคนเทคแคร์ต้องเปิดใจ',
    'โสดไม่จริงห้ามทัก เพราะเรารักคนง่าย',
    'รับขนมจีบซาลาเปา หรือรับเราเป็นแฟนเธอดี',
    'จีบได้ถ้าพี่ใจกล้า น้องไม่ว่าถ้าพี่ใจถึง',
    'ไม่แพ้หรอกฝุ่น แพ้คุณมากกว่า',
    'แดดแรงทำให้หน้าพัง แต่เธอน่ารักจังทำให้หน้าแดง',
    'แม่หนูชอบเชา ไม่เอาแล้วทะเล',
    'จีบเราไม่ต้องเปย์ ขอแค่ทุ่มเทและใส่ใจ',
    'รีบจีบตอนนี้ ถ้าสวยกว่านี้จีบยากละนะ',
    'เป็นคนยิ้มยาก แต่ถ้าชอบใครมากๆ จะยิ้มให้',
    'เราเป็นคนหน้านิ่ง ไม่อยากยิ้มเดี๋ยวเธอละลาย',
  ];

  var quote = quoteList[0]; // state variable

  int check = 0;

  void handleClickGo() {
    setState(
      () {
        var rand = Random();
        var randomIndex = rand.nextInt(quoteList.length);
        if (randomIndex == check) {
          while (true) {
            randomIndex = rand.nextInt(quoteList.length);
            if (randomIndex != check) {
              break;
            }
          }
          quote = quoteList[randomIndex];
          check = randomIndex;
        } else {
          quote = quoteList[randomIndex];
          check = randomIndex;
        }
      },
    );
  }

  /* static List<MaterialColor> colorsList = [
    Colors.pink,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.amber,
    Colors.lime,
    Colors.lightGreen,
    Colors.green,
    Colors.teal,
    Colors.cyan,
    Colors.lightBlue,
    Colors.indigo,
    Colors.purple,
    Colors.blueGrey,
    Colors.brown,
    Colors.grey,
  ];



  var colors = colorsList[0];
  var colorIndex = 0;

  void changeIndex() {
    setState(
      () {
        Random random = Random();
        var index = random.nextInt(colorsList.length);
        if (index == colorIndex) {
          while (true) {
            index = random.nextInt(colorsList.length);
            if (index != colorIndex) {
              break;
            }
          }
          colors = colorsList[index];
          colorIndex = index;
        } else {
          colors = colorsList[index];
          colorIndex = index;
        }
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Quotes')),
      floatingActionButton: FloatingActionButton(
        onPressed: handleClickGo,
        child: const Center(
          child: Text(
            'Next Quote',
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor:
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            quote, // positional parameter/argument
            // named parameter/argument
            style: TextStyle(
                fontSize: 45,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)]
                //color: colors,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

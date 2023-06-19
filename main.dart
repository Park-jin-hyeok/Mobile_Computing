import 'package:flutter/material.dart';
import 'secondPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyFirstPage(),
    );
  }
}

class MyFirstPage extends StatefulWidget {
  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  Map<String, bool> values = {
    '행복 증진': false,
    '스트레스 감소': false,
    '자존감 높이기': false,
    '불안 완화': false,
    '수면 개선': false,
    '수행 능력 향상': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('명상앱 시작하기'),
      ),
      body: ListView(
        children: values.keys.map((String key) {
          return CheckboxListTile(
            title: Text(key),
            value: values[key],
            onChanged: (bool? value) {
              setState(() {
                values[key] = value!;
              });
            },
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(values);
          // 다음 페이지로 이동하는 코드
          Navigator.push(context, MaterialPageRoute(builder: (context) => MySecondPage()));
        },
        child: Icon(Icons.navigate_next),
        backgroundColor: Colors.green,
      ),
    );
  }
}

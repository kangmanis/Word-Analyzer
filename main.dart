import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Analyzer',
      debugShowCheckedModeBanner: false, //to disable debug watermark
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'A Word Analyzer by Fathanah'), //heading title
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic _word = "..."; 
  dynamic _splitted = "...";
  dynamic _reverse = "...";
  dynamic _vowel = 0, _consonant = 0, _char = 0;
  dynamic _palindrome = "...";

  //set user input
  void _setWord(String word) {
    setState(() {
      _word = word;
    });
  }

  //all formula is here
  void _analyze() {
    setState(() {
      
      //to split the input
      _splitted = _word.split('');
      
      //count the input length
      _char = _splitted.length;

      //reversed
      _reverse = _word.split('').reversed.join();

      //count the vowel letter
      int a, e, i, o, u;
      a = 'a'.allMatches(_word).length;
      e = 'e'.allMatches(_word).length;
      i = 'i'.allMatches(_word).length;
      o = 'o'.allMatches(_word).length;
      u = 'u'.allMatches(_word).length;
      _vowel = a + e + i + o + u;

      //count other letters 
      _consonant = _char - _vowel;

      _char = _word.length;

      //palindrome using control flow
      if (_word == _reverse) {
        _palindrome = 'Yes';
      } else {
        _palindrome = 'No';
      }
    });
  }

  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title, textAlign: TextAlign.center)),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Container(
                margin: const EdgeInsets.all(30),
                child: const Text(
                  //Title in body
                  "Type Something: ",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(20),
                  child: TextField(
                    //controller: heightController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    //Put user input automatically in _setWord function
                    onChanged: (text) {
                      _setWord(text);
                    },
                    keyboardType: TextInputType.number,
                  )),
              //container for button
              Container(
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  //when user press button, it automatically go to _analyze function and calculate the formula
                  onPressed: _analyze,
                  child: const Text('Analyze'),
                )),
              //Column to display all the result
              Column(
                children: <Widget>[
                  Text('Word: $_word'),
                  Text("Reversed Word: $_reverse"),
                  Text("No of Consonants: $_consonant"),
                  Text("No if Vowels: $_vowel"),
                  Text("No of characters: $_char"),
                  Text("Palindrome: $_palindrome")
                ],
              )
            ])));
  }
}

//ZAHRA FATHANAH
//2019050

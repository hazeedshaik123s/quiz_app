import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int index = 0;
  int score = 0;
  bool finished = false;

  final questions = [
    {
      "q": "What is Flutter?",
      "a": ["Database", "UI Toolkit", "Browser", "OS"],
      "correct": 1
    },
    {
      "q": "Which language is used in Flutter?",
      "a": ["Java", "Python", "Dart", "C++"],
      "correct": 2
    },
    {
      "q": "Flutter is developed by?",
      "a": ["Google", "Apple", "Microsoft", "Amazon"],
      "correct": 0
    },
    {
      "q": "Starting file of Flutter?",
      "a": ["index.html", "main.dart", "app.js", "server.js"],
      "correct": 1
    }
  ];


  void answer(int value){

    if(value == questions[index]["correct"]){
      score++;
    }

    setState(() {

      if(index < questions.length - 1){
        index++;
      }
      else{
        finished = true;
      }

    });

  }


  void restart(){

    setState(() {
      index = 0;
      score = 0;
      finished = false;
    });

  }


  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(
        title: const Text("Flutter Quiz"),
        centerTitle: true,
      ),


      body: finished
      ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Quiz Completed",
              style: TextStyle(fontSize:30),
            ),

            SizedBox(height:20),

            Text(
              "Score: $score / ${questions.length}",
              style: TextStyle(fontSize:25),
            ),

            SizedBox(height:20),

            ElevatedButton(
              onPressed: restart,
              child: Text("Restart"),
            )

          ],
        ),
      )


      : Padding(
        padding: EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [

            Text(
              "Question ${index+1}/${questions.length}",
              style: TextStyle(
                fontSize:22,
                fontWeight:FontWeight.bold
              ),
            ),


            SizedBox(height:30),


            Text(
              questions[index]["q"].toString(),
              style: TextStyle(fontSize:25),
            ),


            SizedBox(height:20),


            ...(questions[index]["a"] as List)
            .asMap()
            .entries
            .map((item){

              return ElevatedButton(

                onPressed: (){
                  answer(item.key);
                },

                child: Text(
                  item.value.toString()
                ),

              );

            })

          ],
        ),
      )

    );

  }

}
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
      title: "Quiz App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuizScreen(),
    );
  }
}


class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}


class _QuizScreenState extends State<QuizScreen> {

  int questionIndex = 0;
  int score = 0;


  final List<Map<String, dynamic>> questions = [

    {
      "question": "What is Flutter?",
      "answers": [
        {"text": "Database", "score": 0},
        {"text": "UI Toolkit", "score": 1},
        {"text": "Operating System", "score": 0},
        {"text": "Browser", "score": 0},
      ]
    },

    {
      "question": "Which language is used in Flutter?",
      "answers": [
        {"text": "Java", "score": 0},
        {"text": "Python", "score": 0},
        {"text": "Dart", "score": 1},
        {"text": "C++", "score": 0},
      ]
    },

    {
      "question": "Flutter is developed by?",
      "answers": [
        {"text": "Google", "score": 1},
        {"text": "Microsoft", "score": 0},
        {"text": "Apple", "score": 0},
        {"text": "Amazon", "score": 0},
      ]
    },

    {
      "question": "Which file is the starting point of Flutter?",
      "answers": [
        {"text": "index.html", "score": 0},
        {"text": "main.dart", "score": 1},
        {"text": "app.js", "score": 0},
        {"text": "server.dart", "score": 0},
      ]
    }

  ];


  void answer(int value){

    setState(() {

      score += value;

      if(questionIndex < questions.length-1){

        questionIndex++;

      }
      else{

        showResult = true;

      }

    });

  }


  bool showResult=false;


  void restart(){

    setState(() {

      questionIndex=0;
      score=0;
      showResult=false;

    });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Flutter Quiz"),
        centerTitle: true,
      ),


      body: showResult
      ? resultScreen()
      : quizScreen(),

    );
  }



  Widget quizScreen(){

    return Padding(

      padding: const EdgeInsets.all(20),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [

          Text(
            "Question ${questionIndex+1}/${questions.length}",
            style: const TextStyle(
              fontSize:22,
              fontWeight:FontWeight.bold
            ),
          ),


          const SizedBox(height:30),


          Text(

            questions[questionIndex]["question"],

            style: const TextStyle(
              fontSize:25,
              fontWeight:FontWeight.bold
            ),

          ),


          const SizedBox(height:30),


          ...(questions[questionIndex]["answers"]
          as List<Map<String,dynamic>>)
          .map((answer){

            return ElevatedButton(

              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15)
              ),

              onPressed: (){

                this.answer(answer["score"]);

              },

              child: Text(
                answer["text"],
                style: const TextStyle(fontSize:18),
              ),

            );

          }).toList()


        ],

      ),

    );

  }



  Widget resultScreen(){

    return Center(

      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          const Text(
            "Quiz Completed!",
            style: TextStyle(
              fontSize:30,
              fontWeight:FontWeight.bold
            ),
          ),


          const SizedBox(height:20),


          Text(

            "Your Score: $score / ${questions.length}",

            style: const TextStyle(
              fontSize:25
            ),

          ),


          const SizedBox(height:30),


          ElevatedButton(

            onPressed: restart,

            child: const Text("Restart Quiz"),

          )

        ],

      ),

    );

  }

}
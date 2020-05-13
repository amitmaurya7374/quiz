import 'package:flutter/material.dart';
import 'package:quiz_app/model/question_model.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  List questionBank = [
    Question(
        questionText:
            'The Republic of India is the largest country in South Asia.',
        isCorrect: true),
    Question(
        questionText:
            'India is the second most populous democracy in the world.',
        isCorrect: false),
    Question(
        questionText: 'Mumbai is the capital city of India', isCorrect: false),
    Question(
        questionText: 'India is surrounded by Indian Ocean in the south.',
        isCorrect: true),
    Question(
        questionText:
            'India shares borders with 6 countries including Indonesia.',
        isCorrect: false),
    Question(
        questionText:
            'India is a republic consisting of 28 states and seven union territories with a two party system of democracy.',
        isCorrect: false),
    Question(
        questionText: 'India has the world’s twelfth largest economy.',
        isCorrect: false),
    Question(
        questionText:
            'Poverty, illiteracy and malnutrition have mostly been eradicated due to  economic reforms since 1991.',
        isCorrect: false),
    Question(
        questionText:
            'Four major world religions, Hinduism, Buddhism, Jainism and Sikhism originated in India.',
        isCorrect: true),
    Question(
        questionText:
            'English is one of the official languages of the country since it is a "lingua franca.',
        isCorrect: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('True Citizen'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/images/flag.jpg',
                  width: 350,
                  height: 350,
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 120.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    color: Colors.transparent,
                    border: Border.all(width: 1, color: Colors.white)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      questionBank[_currentQuestionIndex].questionText,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    elevation: 6.0,
                    color: Colors.blueGrey.shade900,
                    onPressed: () {
                      _checkAnswer(true, context);
                      setState(() {
                        _currentQuestionIndex++;
                      });
                      
                    },
                    child: Text(
                      'True',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    elevation: 6.0,
                    color: Colors.blueGrey.shade900,
                    onPressed: () {
                      _checkAnswer(false, context);
                      setState(() {
                        _currentQuestionIndex++;
                      });
                      
                    },
                    child: Text(
                      'False',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                      elevation: 6.0,
                      color: Colors.blueGrey.shade900,
                      onPressed: () => _nextQuestion(),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      //Correct
      final snackBar = SnackBar(
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
        content: Text('correct'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      debugPrint("Yes it is true");
    } else {
      debugPrint('Incorrect');
      final snackBar = SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        content: Text('InCorrect'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }
}

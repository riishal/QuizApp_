
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_/Homepage.dart';
import 'package:quiz_app_/provider/providerpage.dart';
import 'package:lottie/lottie.dart';

class Resultpage extends StatelessWidget {
  const Resultpage({super.key});

  @override
  Widget build(BuildContext context) {
    bool win = context.read<QuestionProvider>().mark >= 5;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton(
            onPressed: (() {
              
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => Homepage())));
            }),
            child: const Icon(
              Icons.keyboard_backspace,
              size: 30,
              color: Colors.black,
            )),
        title: const Padding(
          padding: EdgeInsets.only(left: 80),
          child: Text(
            'Result',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Stack(
        children: [
          win
              ? LottieBuilder.network(
                  'https://assets2.lottiefiles.com/packages/lf20_ky24lkyk.json')
              : Padding(
                  padding: const EdgeInsets.only(top: 430, left: 165),
                  child: LottieBuilder.network(
                      height: 40,
                      width: 30,
                      'https://assets6.lottiefiles.com/packages/lf20_f09c9g7f.json'),
                ),
          Column(children: [
            const SizedBox(
              height: 60,
            ),
            Center(
              child: (CircularPercentIndicator(
                animation: true,
                radius: 80,
                lineWidth: 20,
                circularStrokeCap: CircularStrokeCap.round,
                // restartAnimation: true,
                percent: context.read<QuestionProvider>().mark / 10,
                center: Text(
                  "${context.read<QuestionProvider>().mark}/10",
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 18),
                ),
                progressColor:
                    win ? const Color.fromARGB(255, 0, 143, 5) : Colors.orange,
              )),
            ),
            const SizedBox(
              height: 250,
            ),
            SizedBox(
              width: 170,
              height: 40,
              child: FloatingActionButton.extended(
                  backgroundColor: win ? Colors.green : Colors.orange,
                  onPressed: (() {
                   
                    context.read<QuestionProvider>().mark = 0;
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => Homepage())));
                  }),
                  label:
                      win ? const Text('Awesome!') : const Text('Ooops...!')),
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: (() {
                 
                  context.read<QuestionProvider>().mark = 0;

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => Homepage())));
                }),
                child: win
                    ? const Text(
                        '\t\t\t\t\tCongratulations\nYou passed the exam',
                        style: TextStyle(color: Colors.black),
                      )
                    : const Text(
                        'Try Again',
                        style: TextStyle(color: Colors.blue),
                      ))
          ])
        ],
      ),
    );
  }
}
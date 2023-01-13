

// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_/controller/providerpage.dart';
import 'package:quiz_app_/view/resultpage.dart';
import 'package:quiz_app_/utility/constats.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
   bool match=false;
  int mark = 0;
  int pageIndex = 1;
  int buttonIndex = -1;
  int indexfornextquestion=0;

  List<String> data = ['A.', 'B.', 'C.', 'D.'];

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionProvider>(builder: (context, getdata, child) {
      getdata.fetchQuestion();
      if(getdata.status==ProviderStatus.COMPLETED){
        
         return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: const Icon(
              Icons.keyboard_backspace,
              size: 30,
              color: Colors.black,
            ),
            title: const Padding(
              padding: EdgeInsets.only(left: 85),
              child: Text(
                'Quiz ',
                style: TextStyle(color: Colors.black),
              ),
            ),
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(17),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 240, top: 5),
                  child: Container(
                    // ignore: sort_child_properties_last
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        '$pageIndex/10',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 9, 8, 8),
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                    height: 35,
                    width: 70,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(-1, 1),
                              blurRadius: 5,
                              color:Colors.black)
                        ],
                        color: const Color.fromARGB(255, 255, 250, 250),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  height: 70,
                
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(getdata.data[0].questions[indexfornextquestion].question),
                  
                    ),
                  ),
                  Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Color.fromARGB(255, 197, 188, 188),
                    thickness: 1,
              
                  ),
               SizedBox(
                  height: 19,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 56, 56, 52)
                                .withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(-1, 5))
                      ]),
                  height: 35,
                  width: 150,
                  child: const Icon(
                    Icons.question_mark,
                    size: 20,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'Choose an answer',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 114, 105, 87),
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                        color: index == buttonIndex
                            ? const Color.fromARGB(255, 3, 3, 3)
                            : Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                          onPressed: (() {
                            buttonIndex=index;
                            getdata.answerCheck(buttonIndex, pageIndex, index, getdata.data[0].questions[indexfornextquestion].correctIndex);
                            buttonIndex=index;

                          }),
                          child: Row(
                            children: [
                              Text(
                                data[index],
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              const SizedBox(width: 70),
                             Text(getdata.data[0].questions[indexfornextquestion].answers[index],style: TextStyle(color: Colors.white),)
                            ],
                          )),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200, top: 30),
                  child: SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Colors.black,
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.7))),
                        onPressed: (() {
                          getdata.markIncreaser();
                          indexfornextquestion++;
                          pageIndex < 10
                              ? pageIndex++
                              : Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => Resultpage())));
                                  buttonIndex = -1;

                          print(context.read<QuestionProvider>().mark);
                        }),
                        child: Row(
                          children: const [
                            Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.blue,
                            )
                          ],
                        )),
                  ),
                )
              ],
            ),
          ));
      }else{
        return CircularProgressIndicator();
      }
   
    });

  }
}


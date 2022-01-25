import 'package:flash_cards/models/api_model.dart';
import 'package:flash_cards/screens/falshcard_view.dart';
import 'package:flash_cards/services/api.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: FutureBuilder<List<DataModel>>(
            future: API().getAPI(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var results = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 350,
                              height: 350,
                              child: FlipCard(
                                front: FlashcardView(
                                  word: results.word,
                                  origin: 'Origin : ' + results.origin,
                                  partOfSpeech: 'Part Of Speech : ' +
                                      results.meanings[index].partOfSpeech,
                                ),
                                back: Card(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 40,
                                        left: 20,
                                        right: 15,
                                        bottom: 20),
                                    child: Text(
                                      results.meanings[index].definitions[index]
                                          .definition,
                                      style: TextStyle(fontSize: 26),
                                    ),
                                  ),
                                  // FlashcardView(
                                  //   word: results.meanings[index]
                                  //       .definitions[index].definition,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                OutlineButton.icon(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 2,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        // API().counter();
                                        // API().getAPI();
                                        // _currentIndex = (_currentIndex + 1 <
                                        //         snapshot.data!.length)
                                        //     ? _currentIndex + 1
                                        //     : 0;
                                      });
                                    },
                                    icon: Icon(Icons.chevron_left),
                                    label: Text('Prev')),
                                OutlineButton.icon(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 2,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _currentIndex = (_currentIndex - 1 >= 0)
                                            ? _currentIndex - 1
                                            : snapshot.data!.length - 1;
                                      });
                                    },
                                    icon: Icon(Icons.chevron_right),
                                    label: Text('Next')),
                              ],
                            )
                          ],
                        ),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}

// void showNextCard() {
//   setState(() {
//     _currentIndex =
//     (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
//   });
// }
//
// void showPreviousCard() {
//   setState(() {
//     _currentIndex =
//     (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
//   });
// }
// }

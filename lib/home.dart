import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'models/api_model.dart';
import 'screens/falshcard_view.dart';
import 'services/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool isLoading = true;
  List<DataModel>? data;

  void getData() async {
    // setState(() {
    //   isLoading = true;
    // });
    data = await API.getAPI(_currentIndex);
    API.getListData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: isLoading
            ? Center(child: const CircularProgressIndicator())
            : ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  var results = data![index];
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
                                    top: 40, left: 20, right: 15, bottom: 20),
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
                                    if (_currentIndex == 0) return;

                                    _currentIndex--;
                                    getData();
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
                                    // if (_currentIndex == (words.length - 1))
                                    //   return;
                                    _currentIndex++;
                                    getData();
                                  });
                                },
                                icon: Icon(Icons.chevron_right),
                                label: Text('Next')),
                          ],
                        )
                      ],
                    ),
                  );
                }),
      ),
    );
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

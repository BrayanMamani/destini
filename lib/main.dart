import 'package:destini/story_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Destini());

StoryBrain storyBrain = StoryBrain();

class Destini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: StoryPage(),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      constraints: BoxConstraints.expand(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 12,
              child: Center(
                child: Text(
                  storyBrain.getStory(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Marck Script',
                    fontSize: 26.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: RawMaterialButton(
                padding: EdgeInsets.all(8.0),
                fillColor: Colors.red,
                child: Text(
                  storyBrain.getChoice1(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Marck Script',
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    storyBrain.nextStory(1);
                  });
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              flex: 2,
              child: Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: RawMaterialButton(
                  padding: EdgeInsets.all(8.0),
                  fillColor: Colors.blue,
                  child: Text(
                    storyBrain.getChoice2(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Marck Script',
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(2);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

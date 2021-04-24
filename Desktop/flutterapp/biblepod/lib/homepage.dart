import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:biblepod/model/bibleaudio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  final List<DataTiles> dataTilesList = [
    DataTiles(
        bible: 'Old Testament',
        slug: 'OT',
        book: 'Genesis 1',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
    DataTiles(
        bible: 'Old Testament',
        slug: 'OT',
        book: 'Genesis 2',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
    DataTiles(
        bible: 'Old Testament',
        slug: 'OT',
        book: 'Genesis 3',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
    DataTiles(
        bible: 'New Testament',
        slug: 'NT',
        book: '1 Timotew 4',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
    DataTiles(
        bible: 'New Testament',
        slug: 'NT',
        book: 'Mark 5',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
    DataTiles(
        bible: 'Old Testament',
        slug: 'OT',
        book: 'Genesis 6',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
    DataTiles(
        bible: 'Old Testament',
        slug: 'OT',
        book: 'Genesis 7',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
    DataTiles(
        bible: 'Old Testament',
        slug: 'OT',
        book: 'Psalm 8',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
    DataTiles(
        bible: 'Old Testament',
        slug: 'OT',
        book: 'Genesis 9',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
    DataTiles(
        bible: 'New Testament',
        slug: 'NT',
        book: 'Revelation 10',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: Drawer(
        child: Column(children: [
          SizedBox(
            height: 60.0,
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  "BiblePod",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text("Faith comes by hearing.")
            ],
          ),
          Container()
        ]),
      ),
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 2.3,
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        title: Icon(Icons.ac_unit_sharp),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_off_outlined),
          )
        ],
        bottom: TabBar(
            controller: _controller,
            labelColor: Colors.black,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(
                text: "Old Testament",
              ),
              Tab(
                text: "New Testament",
              )
            ]),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          OldTestament(dataTilesList: dataTilesList),
          NewTestament(dataTilesList: dataTilesList)
        ],
      ),
    );
  }
}

class OldTestament extends StatefulWidget {
  const OldTestament({
    Key key,
    @required this.dataTilesList,
  }) : super(key: key);

  final List<DataTiles> dataTilesList;

  @override
  _OldTestamentState createState() => _OldTestamentState();
}

class _OldTestamentState extends State<OldTestament> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (listViewContext, index) {
        return Consumer<BibleAudio>(
          builder: (_, myAudioModel, child) => Card(
            margin: EdgeInsets.all(7),
            elevation: 2.2,
            shadowColor: Colors.grey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.album),
                  title: Text(widget.dataTilesList[index].book),
                  trailing: Text(
                      myAudioModel.totalDuration.toString().split('.').first),
                  // subtitle:
                  // Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    myAudioModel.isPlaying
                        ? SliderTheme(
                            data: SliderThemeData(
                                trackHeight: 5,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 5)),
                            child: Slider(
                              value: myAudioModel.position == null
                                  ? 0
                                  : myAudioModel.position.inMilliseconds
                                      .toDouble(),
                              onChanged: (value) {
                                myAudioModel.seekAudio(
                                    Duration(milliseconds: value.toInt()));
                              },
                              min: 0,
                              max: myAudioModel.totalDuration == null
                                  ? 20
                                  : myAudioModel.totalDuration.inMilliseconds
                                      .toDouble(),
                            ),
                          )
                        : Text(''),
                    TextButton(
                      child: Text('My note'),
                      onPressed: () {/* ... */},
                    ),
                    Row(
                      children: [
                        SizedBox(width: 8),
                        Text(myAudioModel.position.toString().split('.').first),
                        IconButton(
                            icon: Icon(
                              myAudioModel.isPlaying
                                  ? Icons.pause_circle_filled
                                  : Icons.play_circle_fill_outlined,
                            ),
                            onPressed: () {
                              myAudioModel.isPlaying
                                  ? myAudioModel.pauseAudio()
                                  : myAudioModel.playAudio();
                            }),
                      ],
                    ),
                    SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      itemCount: widget.dataTilesList.length,
    );
  }
}

class NewTestament extends StatelessWidget {
  const NewTestament({
    Key key,
    @required this.dataTilesList,
  }) : super(key: key);

  final List<DataTiles> dataTilesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (listViewContext, index) {
        return Card(
          margin: EdgeInsets.all(7),
          elevation: 2.2,
          shadowColor: Colors.grey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.album),
                title: Text(dataTilesList[index].book),
                trailing: Text('${index + 1}'),
                // subtitle:
                // Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: Text('My note'),
                    onPressed: () {/* ... */},
                  ),
                  TextButton(
                    child: Row(
                      children: [
                        Text("2:50"),
                        SizedBox(width: 8),
                        Icon(Icons.play_circle_fill_rounded),
                      ],
                    ),
                    onPressed: () {/* ... */},
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ],
          ),
        );
      },
      itemCount: dataTilesList.length,
    );
  }
}

class DataTiles {
  DataTiles(
      {this.bible,
      this.slug,
      this.book,
      this.chapter,
      this.audioFile,
      this.color});

  final String bible;
  final String slug;
  final String book;
  final int chapter;
  final String audioFile;
  final Color color;
}

import 'package:flutter/material.dart';

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
  final List<DataTiles> dataTilesList = [
    DataTiles(
        bible: 'Old Testament',
        book: 'Genesis 1',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
    DataTiles(
        bible: 'Old Testament',
        book: 'Genesis 2',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
    DataTiles(
        bible: 'Old Testament',
        book: 'Genesis 3',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
    DataTiles(
        bible: 'Old Testament',
        book: 'Genesis 4',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
    DataTiles(
        bible: 'Old Testament',
        book: 'Genesis 5',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
    DataTiles(
        bible: 'Old Testament',
        book: 'Genesis 6',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
    DataTiles(
        bible: 'Old Testament',
        book: 'Genesis 7',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
    DataTiles(
        bible: 'Old Testament',
        book: 'Genesis 8',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
    DataTiles(
        bible: 'Old Testament',
        book: 'Genesis 9',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
    DataTiles(
        bible: 'Old Testament',
        book: 'Genesis 10',
        chapter: 1,
        audioFile: 'Audio file',
        color: Colors.red),
  ];

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
  DataTiles({this.bible, this.book, this.chapter, this.audioFile, this.color});

  final String bible;
  final String book;
  final int chapter;
  final String audioFile;
  final Color color;
}

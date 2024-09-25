import 'package:flutter/material.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  List<String> movieList = [
    "Breaking Bad",
    "Game Of Thrones",
    "The 100",
    "Vikings"
  ];
  List<String> movieImages = [
    "assets/images/BreakingBad.jpg",
    "assets/images/GoT.jpg",
    "assets/images/the100.jfif",
    "assets/images/vikings.jfif"
  ];
  List<String> movieDetails = [
    "Breaking Bad is a crime drama series about a high school chemistry teacher turned methamphetamine manufacturer.",
    "Game Of Thrones is a fantasy drama series based on George R. R. Martin's series of fantasy novels.",
    "The 100 is a post-apocalyptic sci-fi drama where 100 juvenile delinquents are sent back to Earth from a space station.",
    "Vikings follows the legendary Norse hero Ragnar Lothbrok as he rises to become a legendary Viking chieftain."
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Popular TV Series"),
        ),
        body: Column(
          children: [
            Expanded(
              child: cardDisplayer(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardDisplayer(BuildContext context) {
    return ListView.builder(
      itemCount: movieImages.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onLongPress: () => _showMovieDetails(context, index),
          child: Card(
            child: Column(
              children: [
                Image.asset(
                  movieImages[index],
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 200,
                ),
                Text(
                  movieList[index],
                  style: const TextStyle(
                    color: Color.fromARGB(255, 25, 20, 20),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showMovieDetails(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(movieList[index]),
          content: Text(movieDetails[index]),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}

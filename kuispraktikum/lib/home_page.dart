import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuispraktikum/books_data.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final BooksData books;

  const HomePage({Key? key, required this.books}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFavorite = false;

  // double rating = 4.1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (isFavorite) ? Colors.pink : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("${widget.books.title}"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: (isFavorite)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {
              _launchURL(widget.books.previewLink);
            },
            icon: Icon(Icons.share),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: Image.network(
                  widget.books.imageLinks,
                  width: 192,
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.blueGrey),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                child: Column(
                  children: [
                    Text(
                      "${widget.books.id}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      "${widget.books.title}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${widget.books.description}",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 12,),
                    ),
                    Text(
                      "${widget.books.authors}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${widget.books.publishedDate}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                          child: VerticalDivider(
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          "${widget.books.categories}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}

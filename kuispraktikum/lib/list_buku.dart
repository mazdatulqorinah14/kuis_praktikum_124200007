import 'package:flutter/material.dart';
import 'package:kuispraktikum/books_data.dart';

import 'home_page.dart';

class ListBuku extends StatefulWidget {
  const ListBuku({Key? key}) : super(key: key);

  @override
  _ListBukuState createState() => _ListBukuState();
}

class _ListBukuState extends State<ListBuku> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Library"),
        backgroundColor: Colors.pink,
        leading: Icon(Icons.home),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            itemBuilder: (context, index) {
              final BooksData books = booksData[index];
              return Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return HomePage(books: books);
                      }),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Image.network(
                          books.imageLinks,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: booksData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
            ),
          ),
        ),
    );
  }
}

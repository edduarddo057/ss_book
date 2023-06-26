import 'package:flutter/material.dart';
import 'package:ss_book/pages/book.dart';

class FavoriteBooks extends StatelessWidget {
  const FavoriteBooks({super.key, required this.favoriteBooks});

  final List<dynamic> favoriteBooks;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 306,
      margin: const EdgeInsets.fromLTRB(0, 32, 0, 32),
      child: Column(children: [
        Container(
          height: 23,
          margin: const EdgeInsets.only(bottom: 21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Livros favoritos",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(85, 85, 85, 1)),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20)),
                onPressed: () => null,
                child: const Text(
                  "ver todos",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color.fromRGBO(
                        160,
                        118,
                        242,
                        1,
                      )),
                ),
              )
            ],
          ),
        ),
        SizedBox(
            height: 262,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: favoriteBooks.length,
                itemBuilder: (context, index) {
                  var book = favoriteBooks[index];
                  return InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => BookPage(
                              bookId: int.parse(favoriteBooks[index]["id"]),
                            ))),
                    child: Container(
                      margin: index == 0
                          ? const EdgeInsets.symmetric(horizontal: 20)
                          : index == favoriteBooks.length - 1
                              ? const EdgeInsets.only(right: 20)
                              : const EdgeInsets.only(right: 20),
                      width: 136,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              book["cover"],
                              height: 198,
                            ),
                            Text(
                              book["name"],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Color(0xFF555555),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  height: 1),
                            ),
                            Text(
                              book["author"]["name"],
                              style: const TextStyle(
                                  color: Color(0xFF757575),
                                  fontSize: 14,
                                  height: 1),
                            )
                          ]),
                    ),
                  );
                }))
      ]),
    );
  }
}

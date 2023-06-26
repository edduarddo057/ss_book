import 'package:flutter/material.dart';

class FavoriteAuthors extends StatelessWidget {
  const FavoriteAuthors({super.key, required this.favoriteAuthors});

  final List<dynamic> favoriteAuthors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        Container(
          height: 23,
          margin: const EdgeInsets.only(bottom: 21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 23,
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Autores favoritos",
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
          height: 69,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: favoriteAuthors.length,
              itemBuilder: (context, index) {
                var authorsObject = [];

                for (var author in favoriteAuthors) {
                  if (!authorsObject.contains(author["name"])) {
                    authorsObject.add(author);
                  }
                }

                return Container(
                  height: 69,
                  width: 248,
                  margin: index == 0
                      ? const EdgeInsets.symmetric(horizontal: 22)
                      : const EdgeInsets.only(right: 22),
                  decoration: const BoxDecoration(
                      border: Border.fromBorderSide(BorderSide(
                          width: 1,
                          color: Color(0xFFE0E0E0),
                          style: BorderStyle.solid)),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Row(children: [
                    Container(
                      height: 67,
                      width: 63,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(authorsObject[index]["picture"],
                            width: 63, height: 67, fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(authorsObject[index]["name"],
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF555555))),
                          Text(
                            "${authorsObject[index]["booksCount"]} Livros",
                            style: const TextStyle(
                                color: Color(0xFF757575), fontSize: 14),
                          )
                        ],
                      ),
                    )
                  ]),
                );
              }),
        )
      ],
    ));
  }
}

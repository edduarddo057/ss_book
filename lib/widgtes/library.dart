import 'package:flutter/material.dart';
import 'package:ss_book/pages/book.dart';

class Library extends StatelessWidget {
  const Library({super.key, required this.dataLibrary});

  final List<dynamic> dataLibrary;

  void setFilter(bool selected) => selected;

  @override
  Widget build(BuildContext context) {
    var namesCategories = [];

    for (var book in dataLibrary) {
      if (!namesCategories.contains(book["category"])) {
        namesCategories.add(book["category"]);
      }
    }

    return SizedBox(
        child: Column(
      children: [
        Container(
          height: 23,
          margin: const EdgeInsets.fromLTRB(20, 30, 20, 21),
          alignment: Alignment.topLeft,
          child: const Text(
            "Biblioteca",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromRGBO(85, 85, 85, 1)),
          ),
        ),
        SizedBox(
          height: 30,
          child: ListView.builder(
            itemCount: namesCategories.length - 1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              var allChip = Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                child: FilterChip(
                    label: const SizedBox(
                      height: 32,
                      child: Text("Todos"),
                    ),
                    selected: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(50),
                            right: Radius.circular(50))),
                    showCheckmark: false,
                    labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        height: 1,
                        fontWeight: FontWeight.w500,
                        decorationColor: Color.fromRGBO(224, 224, 224, 1),
                        decorationStyle: TextDecorationStyle.solid),
                    selectedColor: const Color.fromRGBO(160, 118, 242, 1),
                    backgroundColor: Colors.white,
                    onSelected: (bool selected) => setFilter(selected)),
              );

              return Container(
                margin: index == 0
                    ? const EdgeInsets.only(right: 5)
                    : index == namesCategories.length - 1
                        ? const EdgeInsets.only(right: 20)
                        : const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    index == 0 ? allChip : const SizedBox(),
                    FilterChip(
                        label: SizedBox(
                          height: 32,
                          child: Text(
                              "${namesCategories[index][0]}${namesCategories[index].substring(1).toLowerCase()}"),
                        ),
                        selected: false,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(50),
                                right: Radius.circular(50))),
                        showCheckmark: false,
                        labelStyle: const TextStyle(
                            color: Color(0xFF757575),
                            fontSize: 14,
                            height: 1,
                            fontWeight: FontWeight.w500,
                            decorationColor: Color.fromRGBO(224, 224, 224, 1),
                            decorationStyle: TextDecorationStyle.solid),
                        selectedColor: const Color.fromRGBO(160, 118, 242, 1),
                        backgroundColor: Colors.white,
                        onSelected: (bool selected) => setFilter(selected))
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.fromLTRB(20, 21, 20, 32),
          child: ListView.builder(
            itemCount: dataLibrary.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(right: 20),
                margin: index == 0
                    ? const EdgeInsets.only(bottom: 20)
                    : index == 9
                        ? const EdgeInsets.only(top: 20)
                        : const EdgeInsets.symmetric(vertical: 10),
                child: Row(children: [
                  Image.network(
                    dataLibrary[index]["cover"],
                    width: 48,
                    height: 70,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => BookPage(
                                bookId: int.parse(dataLibrary[index]["id"]),
                              ))),
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 6),
                              child: Text(dataLibrary[index]["name"],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      height: 1,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF555555))),
                            ),
                            Text(
                              dataLibrary[index]["author"]["name"],
                              style: const TextStyle(
                                  fontSize: 14,
                                  height: 1,
                                  color: Color(0xFF757575)),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              );
            },
          ),
        )
      ],
    ));
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ss_book/services/book_service.dart';
import 'package:ss_book/widgtes/bottomNavigation.dart';
import 'package:ss_book/widgtes/error_page.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key, required this.bookId});

  final int bookId;

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  var isLoading = true;
  var error = false;
  var dataBook = {};

  @override
  void initState() {
    super.initState();
    selectBook(bookId: widget.bookId).then((value) {
      setState(() {
        isLoading = false;
        dataBook = value;
      });
    }).catchError((onError) {
      setState(() {
        error = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  color: Color.fromRGBO(160, 118, 242, 1),
                ),
              ),
            )
          : error
              ? const ErrorPage(
                  errorText: "Erro ao exbiir o livro volte para o início")
              : Stack(children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: AppBar(
                        leading: BackButton(
                          color: Colors.white,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.white.withOpacity(0))),
                        ),
                        actions: [
                          Container(
                            height: 56,
                            width: 56,
                            alignment: Alignment.center,
                            child: IconButton(
                                onPressed: () => null,
                                style: ButtonStyle(
                                    iconSize: MaterialStateProperty.all(24),
                                    iconColor:
                                        MaterialStateProperty.all(Colors.white),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white.withOpacity(0))),
                                icon: const Icon(Icons.more_vert)),
                          )
                        ],
                        flexibleSpace: Image(
                          image: NetworkImage(dataBook["cover"]),
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 285),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(32))),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.fromLTRB(20, 32, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  dataBook["name"],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Color(0xFF555555),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                margin: const EdgeInsets.only(left: 20),
                                child: IconButton(
                                    onPressed: () => null,
                                    padding: EdgeInsets.zero,
                                    icon: dataBook["isFavorite"]
                                        ? const Icon(Icons.favorite,
                                            color: Color(0xFFA076F2))
                                        : const Icon(
                                            Icons.favorite_border_outlined,
                                            color: Color(0xFFA076F2))),
                              )
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 8, 0, 10),
                            child: Text(
                              dataBook["author"]["name"],
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  color: Color(0xFF757575), fontSize: 14),
                            ),
                          ),
                          Expanded(
                            child: ShaderMask(
                              shaderCallback: (Rect rect) {
                                return const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white,
                                    Colors.transparent,
                                    Colors.transparent,
                                  ],
                                  stops: [
                                    0.0,
                                    0.1,
                                    0.9,
                                  ], // 10% purple, 80% transparent, 10% purple
                                ).createShader(rect);
                              },
                              blendMode: BlendMode.dstOut,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    dataBook["description"],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF555555),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

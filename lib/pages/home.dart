import 'package:flutter/material.dart';
import 'package:ss_book/services/book_service.dart';
import 'package:ss_book/widgtes/bottomNavigation.dart';
import 'package:ss_book/widgtes/error_page.dart';
import 'package:ss_book/widgtes/favorite_authors.dart';
import 'package:ss_book/widgtes/library.dart';
import 'package:ss_book/widgtes/placeholders/favorite_authors_placeholder.dart';
import 'package:ss_book/widgtes/placeholders/favorite_books_placeholder.dart';
import 'package:ss_book/widgtes/placeholders/library_placeholder.dart';
import '../widgtes/favorites_books.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  bool error = false;
  Map<String, dynamic> dataBooks = {};

  @override
  void initState() {
    super.initState();
    requestBooks().then((value) {
      setState(() {
        isLoading = false;
        dataBooks = value;
      });
    }).catchError((onError) {
      setState(() {
        error = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(32))),
          backgroundColor: Colors.white,
          titleSpacing: 20,
          title: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(widget.title.substring(0, 2),
                        style: const TextStyle(
                            fontFamily: "BebasNeue", fontSize: 33)),
                    Text(widget.title.substring(2),
                        style: const TextStyle(
                            fontFamily: "BebasNeue",
                            fontSize: 33,
                            color: Color.fromRGBO(160, 118, 242, 1)))
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(double.maxFinite)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: isLoading
                        ? Container(
                            height: 32,
                            width: 32,
                            color: const Color(0xFFD6D6D6),
                          )
                        : Image.network(
                            dataBooks["userPicture"],
                            width: 32,
                            height: 32,
                            fit: BoxFit.cover,
                          ),
                  ),
                )
              ],
            ),
          ),
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  width: 236,
                  child: const TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 3,
                    indicatorColor: Color.fromRGBO(160, 118, 242, 1),
                    labelColor: Color.fromRGBO(85, 85, 85, 1),
                    labelPadding: EdgeInsets.zero,
                    tabs: <Widget>[
                      SizedBox(
                        width: 94,
                        height: 48,
                        child: Tab(
                          child: Text("Meus Livros",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto")),
                        ),
                      ),
                      SizedBox(
                        width: 103,
                        height: 48,
                        child: Tab(
                          child: Text("Emprestados",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto")),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
        body: error
            ? const ErrorPage(
                errorText: "Erro! Por favor reinicie o aplicativo!")
            : TabBarView(
                children: <Widget>[
                  SizedBox(
                    height: double.infinity,
                    child: ListView(
                      children: [
                        if (isLoading)
                          const FavoriteBooksPlaceholder()
                        else
                          FavoriteBooks(
                            favoriteBooks: dataBooks["favoriteBooks"],
                          ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: 32),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32))),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (isLoading) ...[
                                  const FavoriteAuthorsPlaceholder(),
                                  const LibraryPlaceholder(),
                                ] else ...[
                                  FavoriteAuthors(
                                      favoriteAuthors:
                                          dataBooks["favoriteAuthors"]),
                                  Library(dataLibrary: dataBooks["allBooks"])
                                ]
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.warning,
                        size: 60,
                        color: Colors.yellow,
                      ),
                      Title(
                          color: const Color(0xFF555555),
                          child: const Text(
                              "Este conteudo ainda não está disponível")),
                    ],
                  ),
                ],
              ),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

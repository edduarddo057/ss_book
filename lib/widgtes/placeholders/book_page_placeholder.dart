import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookPagePlaceholder extends StatelessWidget {
  const BookPagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Shimmer.fromColors(
        baseColor: const Color(0xFFD6D6D6),
        period: const Duration(seconds: 1),
        highlightColor: const Color(0xFFE7E7E7),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: AppBar(
              leading: BackButton(
                color: Colors.white,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.white.withOpacity(0))),
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
                          iconColor: MaterialStateProperty.all(Colors.white),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.white.withOpacity(0))),
                      icon: const Icon(Icons.more_vert)),
                )
              ],
              flexibleSpace: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
              )),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 285),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(32))),
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.fromLTRB(20, 32, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      height: 46,
                      width: 276,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 46,
                    width: 276,
                    margin: const EdgeInsets.only(left: 20),
                    color: Colors.black,
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 8, 0, 10),
                child: Container(
                  height: 16,
                  width: 80,
                  margin: const EdgeInsets.only(left: 20),
                  color: Colors.black,
                ),
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 8, 0, 10),
                        child: Container(
                          height: 16,
                          width: 80,
                          margin: const EdgeInsets.only(left: 20),
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 8, 0, 10),
                        child: Container(
                          height: 16,
                          width: 80,
                          margin: const EdgeInsets.only(left: 20),
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 8, 0, 10),
                        child: Container(
                          height: 16,
                          width: 80,
                          margin: const EdgeInsets.only(left: 20),
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 8, 0, 10),
                        child: Container(
                          height: 16,
                          width: 80,
                          margin: const EdgeInsets.only(left: 20),
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 8, 0, 10),
                        child: Container(
                          height: 16,
                          width: 40,
                          margin: const EdgeInsets.only(left: 20),
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 8, 0, 10),
                        child: Container(
                          height: 16,
                          width: 80,
                          margin: const EdgeInsets.only(left: 20),
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 8, 0, 10),
                        child: Container(
                          height: 16,
                          width: 80,
                          margin: const EdgeInsets.only(left: 20),
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 8, 0, 10),
                        child: Container(
                          height: 16,
                          width: 60,
                          margin: const EdgeInsets.only(left: 20),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    ]);
  }
}

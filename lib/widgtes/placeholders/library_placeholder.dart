import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LibraryPlaceholder extends StatelessWidget {
  const LibraryPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 626,
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFD6D6D6),
        period: const Duration(seconds: 1),
        highlightColor: const Color(0xFFE7E7E7),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 23,
            width: 90,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(height: 21),
          SizedBox(
            height: 32,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  width: 88,
                  height: 32,
                  margin: index == 0
                      ? const EdgeInsets.fromLTRB(20, 0, 5, 0)
                      : index == 5
                          ? const EdgeInsets.fromLTRB(5, 0, 20, 0)
                          : const EdgeInsets.symmetric(horizontal: 5),
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(16),
                          right: Radius.circular(16))),
                );
              },
            ),
          ),
          SizedBox(
            height: 545,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Row(children: [
                    Container(
                        width: 48,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 18,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                              )),
                          const SizedBox(height: 2),
                          Container(
                              height: 18,
                              width: 65,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                              )),
                          const SizedBox(height: 2),
                          Container(
                              height: 16,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                              ))
                        ],
                      ),
                    )
                  ]),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}

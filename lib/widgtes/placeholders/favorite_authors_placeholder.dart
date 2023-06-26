import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteAuthorsPlaceholder extends StatelessWidget {
  const FavoriteAuthorsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFD6D6D6),
        period: const Duration(seconds: 1),
        highlightColor: const Color(0xFFE7E7E7),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                height: 23,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                height: 16,
                width: 59,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
              )
            ],
          ),
          const SizedBox(height: 21),
          SizedBox(
            height: 69,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                width: 248,
                height: 69,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 67,
                        width: 63,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 18,
                              width: 145,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                              )),
                          const SizedBox(height: 5),
                          Container(
                              height: 16,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

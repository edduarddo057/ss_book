import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteBooksPlaceholder extends StatelessWidget {
  const FavoriteBooksPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFD6D6D6),
        period: const Duration(seconds: 1),
        highlightColor: const Color(0xFFE7E7E7),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                height: 23,
                width: 140,
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
            height: 262,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  margin: index == 0
                      ? const EdgeInsets.fromLTRB(20, 0, 10, 0)
                      : index == 5
                          ? const EdgeInsets.fromLTRB(10, 0, 20, 0)
                          : const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 198,
                          width: 136,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          )),
                      const SizedBox(height: 10),
                      Container(
                          height: 18,
                          width: 136,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          )),
                      const SizedBox(height: 2),
                      Container(
                          height: 16,
                          width: 72,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ))
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 32),
        ]),
      ),
    );
  }
}

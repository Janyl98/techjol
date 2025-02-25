import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libraryapp_withapi/recources/constants.dart';

import 'price_tag.dart';

class BookCard extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String price;

  const BookCard({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      color: Colors.white12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Transform.scale(
              scale: 1.1,
              child: Image.network(imgUrl),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.nunito(
                      color: AppColor.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.accent.withOpacity(0.3),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.star,
                              size: 15,
                              color: AppColor.accent,
                            ),
                          )),
                      const Spacer(),
                      PriceTag(price: price),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

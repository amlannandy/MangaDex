import 'package:flutter/material.dart';

import 'package:line_icons/line_icons.dart';

import 'package:mangadex_mobile/models/manga.dart';

class MangaTile extends StatelessWidget {
  final Manga manga;

  const MangaTile(this.manga, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          manga.thumbnail != null
              ? Image.network(
                  manga.thumbnail!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Icon(
                  LineIcons.imageFile,
                ),
          Container(
            color: Colors.black45,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 5,
            ),
            child: Text(
              manga.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

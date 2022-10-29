import 'package:flutter/material.dart';

class Searchfield extends StatelessWidget {
  const Searchfield({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: TextField(
          style: const TextStyle(
              color: Colors.white, decoration: TextDecoration.none),
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
              focusColor: Colors.white,
              filled: true,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey.shade800,
              ),
              hintText: 'Search for any song here',
              hintStyle:
                  TextStyle(color: Colors.grey.shade800, fontFamily: 'dm'),
              fillColor: Colors.grey[300],
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(15)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(15))),
        ));
  }
}

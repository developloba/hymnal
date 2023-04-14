import 'package:flutter/material.dart';
import 'package:hymnal/model/hymnmodel.dart';
import 'package:searchfield/searchfield.dart';

import 'hymnscreen.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, required this.data});
  final List<HymnModel> data;
  @override
  Widget build(BuildContext context) {
    return SearchField(
      maxSuggestionsInViewPort: 6,
      suggestionsDecoration:
          BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
      itemHeight: 45,
      searchInputDecoration: InputDecoration(
          focusColor: Colors.white,
          filled: true,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade800,
          ),
          hintText: 'Search for any song here',
          hintStyle: TextStyle(color: Colors.grey.shade800, fontFamily: 'dm'),
          fillColor: Colors.grey[300],
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(15))),
      suggestions: data
          .map(
            (e) => SearchFieldListItem<HymnModel>(e.title,
                item: e,
                child: TextButton(
                  child: Text(
                    e.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HymnscreenScaffold(
                          backgroundcolor:
                              Theme.of(context).colorScheme.background,
                          textcolor: Theme.of(context).primaryColor,
                          hymnData: e),
                    ));
                  },
                )),
          )
          .toList(),
    );
  }
}

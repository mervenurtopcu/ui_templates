import 'package:flutter/material.dart';

class SearchCard extends Card{

  SearchCard({super.key}):super(
    elevation: 8,
    shape: const StadiumBorder(),
    child: TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search_rounded,color: Colors.black,),
        prefixIconColor: Colors.black,
        suffixIcon: const Icon(Icons.equalizer,color: Colors.black,),
        suffixIconColor: Colors.black,
        border: const UnderlineInputBorder(borderSide: BorderSide.none),
        hintText: "Search Books, Authors",
        hintStyle: TextStyle(color: Colors.grey[600], fontSize: 18),
      ),
    ),
  );
}
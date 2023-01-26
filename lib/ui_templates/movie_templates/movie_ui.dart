import 'package:flutter/material.dart';
import 'package:ui_templates/ui_templates/movie_templates/store_Ui.dart';


class MovieUiTemplates extends StatefulWidget {
  const MovieUiTemplates({Key? key}) : super(key: key);

  @override
  State<MovieUiTemplates> createState() => _MovieUiTemplatesState();
}

class _MovieUiTemplatesState extends State<MovieUiTemplates> {

  bool isKeyboardOpen=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Discover',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Library'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Wish List'),
            BottomNavigationBarItem(
                icon: Icon(Icons.storefront_rounded), label: 'Store'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: 3,
        ),
        body: const StoreUi(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LibraryUi extends StatefulWidget {
  const LibraryUi({Key? key}) : super(key: key);

  @override
  State<LibraryUi> createState() => _LibraryUiState();
}

class _LibraryUiState extends State<LibraryUi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyItems.values.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: _MyItems.values
                .map((e) => Tab(
                      text: e.name,
                    ))
                .toList(),
          ),
        ),
        body: const TabBarView(
          children: [_General(), _New(), _MostViewed()],
        ),
      ),
    );
  }
}

enum _MyItems { General, New, MostViewed }

enum _CardColors { blue, purple, green, pink, red, yellow }

class _General extends StatelessWidget {
  const _General({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List categories = [
      "Biography",
      "Business",
      "Children",
      "Cookery",
      "Fiction",
      "Graphic Novels"
    ];
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            color: colorChange(index),
            child: SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  categories[index],
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: categories.length,
      ),
    );
  }

  Color? colorChange(int value) {
    if (value == _CardColors.blue.index) {
      return Colors.blue;
    } else if (value == _CardColors.purple.index) {
      return Colors.purple;
    } else if (value == _CardColors.green.index) {
      return Colors.green;
    } else if (value == _CardColors.pink.index) {
      return Colors.pink;
    } else if (value == _CardColors.red.index) {
      return Colors.red;
    } else if (value == _CardColors.yellow.index) {
      return Colors.yellow;
    }
    return null;
  }
}

class _New extends StatelessWidget {
  const _New({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => const Placeholder(
              color: Colors.pinkAccent,
            ));
  }
}

class _MostViewed extends StatelessWidget {
  const _MostViewed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

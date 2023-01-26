import 'package:flutter/material.dart';
import 'package:ui_templates/ui_templates/movie_templates/custom_widgets/dummy_data.dart';
import 'package:ui_templates/ui_templates/movie_templates/custom_widgets/search_card.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StoreUi extends StatefulWidget {
  const StoreUi({Key? key}) : super(key: key);

  @override
  State<StoreUi> createState() => _StoreUiState();
}

class _StoreUiState extends State<StoreUi> {
  final movieList = DummyData.MovieListItems;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          SearchCard(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 175,
                        height: 200,
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(movieList[index].url),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        margin: const EdgeInsets.only(
                          top: 10.0,
                        ),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movieList[index].movieName,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.normal),
                              ),
                              Text(
                                movieList[index].directorName,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RatingBarIndicator(
                                rating: movieList[index].rate,
                                itemCount: 5,
                                itemSize: 15,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.pinkAccent,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 25,
                                width: 175,
                                child: Text(
                                  movieList[index].description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(color: Colors.grey[400]),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Colors.pinkAccent,
                                        ),
                                      ),
                                      child: const Text("Add to chart",
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 100,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        elevation:
                                            MaterialStateProperty.all(3.0),
                                      ),
                                      child: const Text("Add to wishlist",
                                          style: TextStyle(color: Colors.black),
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: movieList.length,
            ),
          ),
        ],
      ),
    ));
  }
}

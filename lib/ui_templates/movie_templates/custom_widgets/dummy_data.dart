class DummyData {
  static final MovieListItems = [
    _MovieListItemModel(
        "https://images-na.ssl-images-amazon.com/images/M/MV5BMTI0NTI4NjE3NV5BMl5BanBnXkFtZTYwMDA0Nzc4._V1_.jpg",
        "I Am Legend",
        "Francis Lawrence",
        5,
        "Years after a plague kills most of humanity and transforms the rest into monsters, the sole survivor in New York City struggles valiantly to find a cure."),
    _MovieListItemModel(
      "https://images-na.ssl-images-amazon.com/images/M/MV5BMjEyOTYyMzUxNl5BMl5BanBnXkFtZTcwNTg0MTUzNA@@._V1_SX1500_CR0,0,1500,999_AL_.jpg",
      "Avatar",
      "James Cameron",
      4,
      "A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.",
    ),
    _MovieListItemModel(
        "https://images-na.ssl-images-amazon.com/images/M/MV5BMTA0NjY0NzE4OTReQTJeQWpwZ15BbWU3MDczODg2Nzc@._V1_SX1777_CR0,0,1777,999_AL_.jpg",
        "The Avengers",
        "Joss Whedon",
        3,
        "Earth's mightiest heroes must come together and learn to fight as a team if they are to stop the mischievous Loki and his alien army from enslaving humanity."),
    _MovieListItemModel(
      "https://images-na.ssl-images-amazon.com/images/M/MV5BMjA3NTEwOTMxMV5BMl5BanBnXkFtZTgwMjMyODgxMzE@._V1_SX1500_CR0,0,1500,999_AL_.jpg",
      "Interstellar",
      "Christopher Nolan",
      2,
      "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
    )
  ];
}

class _MovieListItemModel {
  _MovieListItemModel(
      this.url, this.movieName, this.directorName, this.rate, this.description);

  final String url;
  final String movieName;
  final String directorName;
  final double rate;
  final String description;
}

class ModelPage {
  String? title;
  String? image;
  var rating;
  int? releaseYear;
  List<String>? genre;

  ModelPage(
      {this.title, this.image, this.rating, this.releaseYear, this.genre});

  factory ModelPage.fromjson(Map<String, dynamic> json) {
    return ModelPage(
      title: json['title'],
      image: json['image'],
      rating: json['rating'],
      releaseYear: json['releaseYear'],
      genre: List<String>.from(json["genre"].map((x) => x)),
    );
  }
}

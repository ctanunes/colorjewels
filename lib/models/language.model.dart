class Language {
  int id;
  double rating;
  String title;
  String image;
  String location;
  String description;
  bool isPlayed;

  Language({
    this.id,
    this.title,
    this.rating,
    this.image,
    this.location,
    this.isPlayed,
    this.description,
  });
}
List<Language> jewels = [];

List<Language> recents = [
  Language(
    id: 1,
    title: "Portuguese",
    image: "assets/images/images-1.jpg",
    location: "PT - Lisbon",
    rating: 4.5,
    isPlayed: false,
    description:
    "Learn colors in Portuguese!",
  ),
  Language(
    id: 2,
    title: "English",
    image: "assets/images/images-2.png",
    location: "ENG - London",
    rating: 4.5,
    isPlayed: false,
    description:
    "Learn colors in English!",
  ),
  Language(
    id: 3,
    title: "French",
    image: "assets/images/images-3.jpg",
    location: "FR - Paris",
    rating: 4.5,
    isPlayed: false,
    description:
    "Learn colors in French!",
  ),
  Language(
    id: 4,
    title: "Italian",
    image: "assets/images/images-4.png",
    location: "IT - Milan",
    rating: 4.5,
    isPlayed: false,
    description:
    "Learn colors in Italian!",
  ),
];
class Episode {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characteres;
  final String created;

  Episode(
      {required this.id,
      required this.name,
      required this.airDate,
      required this.episode,
      required this.characteres,
      required this.created});

  Episode.loading()
      : this(
            id: 0,
            name: "",
            airDate: "",
            episode: "",
            characteres: [],
            created: "");
}

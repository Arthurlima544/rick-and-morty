import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<dynamic> characteres;
  final String created;

  const Episode(
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

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'] as int,
      name: json['name'],
      airDate: json['air_date'],
      episode: json['episode'],
      characteres: json['characters'] as List,
      created: json['created'],
    );
  }

  @override
  List<Object?> get props => [id, name, airDate, episode, characteres, created];
}

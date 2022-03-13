import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/model/location.dart';
import 'package:rick_and_morty/model/origin.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final Location location;
  final String gender;
  final Origin origin;
  final String urlImage;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.location,
    required this.gender,
    required this.origin,
    required this.urlImage,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] as int,
      name: json['name'],
      status: json['status'],
      location: Location.fromJson(json['location']),
      gender: json['gender'],
      origin: Origin.fromJson(json['origin']),
      urlImage: json['image'],
    );
  }

  @override
  List<Object?> get props =>
      [id, name, status, location, gender, origin, urlImage];
}

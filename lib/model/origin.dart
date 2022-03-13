import 'package:equatable/equatable.dart';

class Origin extends Equatable {
  final String name;
  final String url;

  const Origin({
    required this.name,
    required this.url,
  });

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      name: json['name'],
      url: json['url'],
    );
  }

  @override
  List<Object?> get props => [name, url];
}

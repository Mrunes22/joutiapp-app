import 'package:json_annotation/json_annotation.dart';

part 'annonce.g.dart';

@JsonSerializable()
class Annonce {
  final String id;
  final String titre;
  final String description;
  final String brand;
  final String size;
  final String etat;
  final String color;
  final String material;
  final double prix;
  final String category;
  final DateTime createdAt;
  final String seller;
  final String? imageName;

  Annonce({
    required this.id,
    required this.titre,
    required this.description,
    required this.brand,
    required this.size,
    required this.etat,
    required this.color,
    required this.material,
    required this.prix,
    required this.category,
    required this.createdAt,
    required this.seller,
    this.imageName,
  });

  factory Annonce.fromJson(Map<String, dynamic> json) => _$AnnonceFromJson(json);
  Map<String, dynamic> toJson() => _$AnnonceToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annonce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Annonce _$AnnonceFromJson(Map<String, dynamic> json) => Annonce(
      id: json['id'] as String,
      titre: json['titre'] as String,
      description: json['description'] as String,
      brand: json['brand'] as String,
      size: json['size'] as String,
      etat: json['etat'] as String,
      color: json['color'] as String,
      material: json['material'] as String,
      prix: (json['prix'] as num).toDouble(),
      category: json['category'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      seller: json['seller'] as String,
      imageName: json['imageName'] as String?,
    );

Map<String, dynamic> _$AnnonceToJson(Annonce instance) => <String, dynamic>{
      'id': instance.id,
      'titre': instance.titre,
      'description': instance.description,
      'brand': instance.brand,
      'size': instance.size,
      'etat': instance.etat,
      'color': instance.color,
      'material': instance.material,
      'prix': instance.prix,
      'category': instance.category,
      'createdAt': instance.createdAt.toIso8601String(),
      'seller': instance.seller,
      'imageName': instance.imageName,
    };

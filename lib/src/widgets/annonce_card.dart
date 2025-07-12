
import 'package:flutter/material.dart';
import '../models/annonce.dart';
import '../config/constants.dart';

class AnnonceCard extends StatelessWidget {
  final Annonce annonce;
  final VoidCallback onTap;

  const AnnonceCard({
    Key? key,
    required this.annonce,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final imageUrl = annonce.imageName != null
        ? '${ApiConstants.baseUrl}/images/annonces/${annonce.imageName}'
        : null;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                color: Colors.grey[200],
              ),
              child: imageUrl != null
                  ? Image.network(imageUrl, fit: BoxFit.cover)
                  : const Icon(Icons.image_outlined, size: 48, color: Colors.grey),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      annonce.titre,
                      style: c.textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${annonce.prix.toStringAsFixed(2)} DH',
                      style: c.textTheme.bodyText2?.copyWith(
                        color: AppColors.accent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(annonce.category, style: c.textTheme.caption),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:formation_flutter/res/app_colors.dart';

/// Widget réutilisable pour l'entête des écrans produits
/// Affiche : image, nom du produit et marque dans une Stack
class ProductHeader extends StatelessWidget {
  const ProductHeader({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.brandName,
  });

  final String imageUrl;
  final String productName;
  final String brandName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image en haut
        SizedBox(
          height: 250,
          width: double.infinity,
          child: _buildImage(),
        ),
        // Carte blanche avec coins arrondis en haut uniquement
        Transform.translate(
          offset: const Offset(0, -24),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nom du produit
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                // Marque
                Text(
                  brandName,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Construit l'image appropriée (locale ou réseau)
  Widget _buildImage() {
    if (imageUrl.startsWith('asset:')) {
      // Image locale
      final assetPath = imageUrl.replaceFirst('asset:', '');
      return Image.asset(
        assetPath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: AppColors.divider,
            child: const Icon(Icons.image_not_supported),
          );
        },
      );
    } else {
      // Image réseau
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: AppColors.divider,
            child: const Icon(Icons.image_not_supported),
          );
        },
      );
    }
  }}
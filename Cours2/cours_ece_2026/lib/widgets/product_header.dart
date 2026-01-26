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
    return Stack(
      children: [
        // Image de fond avec bords arrondis en haut
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          height: 250,
          width: double.infinity,
          child: _buildImage(),
        ),
        // Carte par-dessus l'image
        Positioned(
          top: 30,
          left: 20,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nom du produit
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 18,
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
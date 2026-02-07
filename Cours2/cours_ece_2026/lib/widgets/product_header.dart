import 'package:flutter/material.dart';
import 'package:formation_flutter/model/product.dart';
import 'package:formation_flutter/res/app_colors.dart';
import 'package:provider/provider.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Product? product = context.watch<Product?>();
    
    // Fallback if product is null, though it should be handled by the parent
    if (product == null) return const SizedBox();

    final String imageUrl = product.picture ?? '';
    final String productName = product.name ?? 'Produit inconnu';
    final String brandName = product.brands?.join(', ') ?? 'Marque inconnue';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 250,
          width: double.infinity,
          child: _buildImage(imageUrl),
        ),
        Transform.translate(
          offset: const Offset(0, -24),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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

  Widget _buildImage(String imageUrl) {
    if (imageUrl.startsWith('asset:')) {
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
  }
}
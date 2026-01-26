import 'package:flutter/material.dart';
import 'package:formation_flutter/res/app_colors.dart';

/// Widget affichant le Groupe Nova (1, 2, 3, 4)
class ProductNovaScoreWidget extends StatelessWidget {
  const ProductNovaScoreWidget({
    super.key,
    required this.group,
  });

  final int group; // 1, 2, 3, 4

  String _getNovaDescription() {
    switch (group) {
      case 1:
        return 'Aliments non transformés ou transformés minimalement';
      case 2:
        return 'Ingrédients culinaires transformés';
      case 3:
        return 'Aliments transformés';
      case 4:
        return 'Produits alimentaires et boissons ultra-transformés';
      default:
        return 'Groupe inconnu';
    }
  }

  Color _getGroupColor() {
    switch (group) {
      case 1:
        return Colors.green;
      case 2:
        return Colors.yellow[700]!;
      case 3:
        return Colors.orange;
      case 4:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre avec groupe
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: _getGroupColor(),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      '$group',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Groupe Nova',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Description
            Text(
              _getNovaDescription(),
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textPrimary,
                height: 1.4,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

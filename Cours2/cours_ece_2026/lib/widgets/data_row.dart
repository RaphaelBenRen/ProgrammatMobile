import 'package:flutter/material.dart';
import 'package:formation_flutter/res/app_colors.dart';
import 'package:formation_flutter/widgets/custom_divider.dart';

/// Widget réutilisable pour afficher une ligne de données (libellé + valeur)
class ProductDataRow extends StatelessWidget {
  const ProductDataRow({
    super.key,
    required this.label,
    this.value,
    this.showDivider = true,
  });

  final String label;
  final String? value;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              if (value != null)
                Text(
                  value!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
            ],
          ),
        ),
        if (showDivider || value == null)
          const CustomDivider(
            axis: Axis.horizontal,
            thickness: 1.0,
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:formation_flutter/model/button_state.dart';

/// Widget réutilisable pour les deux boutons (positif/négatif)
/// Style "pill" avec checkmark et X
class StateButton extends StatelessWidget {
  const StateButton({
    super.key,
    required this.state,
    required this.label,
    this.onPressed,
  });

  final ButtonState state;
  final String label;
  final VoidCallback? onPressed;

  /// Retourne l'icône en fonction de l'état
  IconData _getIcon() {
    return state == ButtonState.positive 
      ? Icons.check
      : Icons.close;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF17A2B8), // Couleur turquoise/cyan
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24), // Bien arrondi pour effet pill
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getIcon(),
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

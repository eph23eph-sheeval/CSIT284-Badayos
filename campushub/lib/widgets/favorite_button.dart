import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/activity.dart';
import '../providers/favorites_provider.dart';
 
class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key, required this.activity});
 
  final Activity activity;
 
  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}
 
class _FavoriteButtonState extends State<FavoriteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
 
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }
 
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final isFav = favoritesProvider.isFavorite(widget.activity);
 
    return ScaleTransition(
      scale: _scaleAnimation,
      child: TextButton.icon(
        onPressed: () {
          _controller.forward().then((_) => _controller.reverse());
          favoritesProvider.toggleActivityFavoriteStatus(widget.activity);
        },
        icon: Icon(
          isFav ? Icons.favorite : Icons.favorite_border,
          color: const Color.fromARGB(255, 6, 13, 85),
        ),
        label: Text(
          isFav ? 'Favorited' : 'Favorite',
          style: TextStyle(
            color: isFav ? const Color.fromARGB(255, 10, 77, 43) : Colors.grey,
          ),
        ),
      ),
    );
  }
}

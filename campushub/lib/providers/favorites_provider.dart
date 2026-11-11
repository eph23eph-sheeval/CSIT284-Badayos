import 'package:flutter/foundation.dart';
import '../models/activity.dart';
 
class FavoritesProvider with ChangeNotifier {
  final List<Activity> _favoriteActivities = [];
 
  List<Activity> get favoriteActivities => [..._favoriteActivities];
 
  bool isFavorite(Activity activity) {
    return _favoriteActivities.any((item) => item.id == activity.id);
  }
 
  void toggleActivityFavoriteStatus(Activity activity) {
    final isExist = isFavorite(activity);
    if (isExist) {
      _favoriteActivities.removeWhere((item) => item.id == activity.id);
    } else {
      _favoriteActivities.add(activity);
    }
    notifyListeners();
  }
}
 
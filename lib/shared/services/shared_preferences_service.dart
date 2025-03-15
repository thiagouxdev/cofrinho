import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String hasCompletedOnboardingKey = 'hasCompletedOnboarding';

  Future<bool> getHasCompletedOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(hasCompletedOnboardingKey) ?? false;
  }

  Future<void> setHasCompletedOnboarding(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(hasCompletedOnboardingKey, value);
  }
}

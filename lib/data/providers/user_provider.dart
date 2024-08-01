import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class UserNotifier extends StateNotifier<UserModel?> {
  UserNotifier() : super(null) {
    _loadUser();
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('user');
    if (jsonString != null) {
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      state = UserModel.fromJson(jsonMap);
    }
  }

  Future<void> setUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(user.toJson());
    await prefs.setString('user', jsonString);
    state = user;
  }

  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    state = null;
  }

  Future<bool> isLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('user');
    print('userState: $jsonString');
    if (jsonString != null) {
      return true;
    } else {
      return false;
    }
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserModel?>((ref) {
  return UserNotifier();
});

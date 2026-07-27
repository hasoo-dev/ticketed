import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Manages the logged-in user's session. Login state is derived from
/// whether a stored user exists — never tracked as a separate flag,
/// so there's no way for "isLogin" and "has a user" to disagree.
class SessionService {
  SessionService._internal();
  static final SessionService instance = SessionService._internal();
  factory SessionService() => instance;

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  static const _kSessionKey = 'session_user';

  Map<String, dynamic>? _cachedUser;

  /// In-memory cache, safe to read synchronously anywhere in the app
  /// after `restoreSession()` has run once at startup.
  Map<String, dynamic>? get currentUser => _cachedUser;
  bool get isLoggedIn => _cachedUser != null;

  /// Convenience getters for the fields you'll reach for constantly —
  /// add more here as needed instead of scattering `currentUser?['x']`
  /// null-checks across the app.
  String? get userId => _cachedUser?['id'] as String?;
  String? get businessName => _cachedUser?['businessName'] as String?;

  Future<void> saveSession(Map<String, dynamic> user) async {
    await _storage.write(key: _kSessionKey, value: jsonEncode(user));
    _cachedUser = user;
  }

  /// Call once at app start (e.g. from the splash screen) to hydrate
  /// `currentUser` from disk before routing to home or sign-in.
  Future<Map<String, dynamic>?> restoreSession() async {
    try {
      final raw = await _storage.read(key: _kSessionKey);
      if (raw == null || raw.isEmpty) {
        _cachedUser = null;
        return null;
      }
      _cachedUser = jsonDecode(raw) as Map<String, dynamic>;
      return _cachedUser;
    } catch (e) {
      debugPrint('SessionService.restoreSession failed: $e');
      _cachedUser = null;
      return null;
    }
  }

  Future<void> clearSession() async {
    await _storage.delete(key: _kSessionKey);
    _cachedUser = null;
  }
}
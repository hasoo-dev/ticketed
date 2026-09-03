import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../core/utils/app_logger.dart';

/// Comprehensive Session & Auth Controller using FlutterSecureStorage.
/// Manages user authentication state, secure tokens, trade specialization,
/// and profile caching across the application.
class SessionService extends ChangeNotifier {
  SessionService._internal();
  static final SessionService instance = SessionService._internal();
  factory SessionService() => instance;

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  static const _kSessionUserKey = 'ticketed_session_user';
  static const _kAccessTokenKey = 'ticketed_access_token';
  static const _kRefreshTokenKey = 'ticketed_refresh_token';
  static const _kTradeKey = 'ticketed_selected_trade';

  Map<String, dynamic>? _cachedUser;
  String? _cachedTrade;
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;
  Map<String, dynamic>? get currentUser => _cachedUser;
  bool get isLoggedIn => _cachedUser != null;

  String? get userId => _cachedUser?['id'] as String?;
  String? get userName => _cachedUser?['name'] as String? ?? 'Contractor';
  String? get userEmail => _cachedUser?['email'] as String? ?? '';
  String? get businessName => _cachedUser?['businessName'] as String? ?? 'Apex Construction';
  String? get selectedTrade => _cachedTrade ?? _cachedUser?['trade'] as String? ?? 'General Contractor';
  String? get userPhone => _cachedUser?['phone'] as String? ?? '+1 (555) 100-9900';

  /// Restore stored session, token, and trade specialization at app startup
  Future<Map<String, dynamic>?> restoreSession() async {
    try {
      final raw = await _storage.read(key: _kSessionUserKey);
      _cachedTrade = await _storage.read(key: _kTradeKey);

      if (raw != null && raw.isNotEmpty) {
        _cachedUser = jsonDecode(raw) as Map<String, dynamic>;
        AppLogger.i('Restored session for user: ${_cachedUser?['name']} (${_cachedUser?['email']})');
      } else {
        _cachedUser = null;
        AppLogger.d('No saved session found in secure storage.');
      }
    } catch (e, st) {
      AppLogger.e('SessionService.restoreSession error: $e', error: e, stackTrace: st);
      _cachedUser = null;
    } finally {
      _isInitialized = true;
      notifyListeners();
    }
    return _cachedUser;
  }

  /// Persist session and user profile securely
  Future<void> saveSession({
    required String id,
    required String email,
    required String name,
    required String businessName,
    String? phone,
    String? trade,
    String? accessToken,
    String? refreshToken,
  }) async {
    final userData = {
      'id': id,
      'email': email,
      'name': name,
      'businessName': businessName,
      'phone': phone ?? '+1 (555) 100-9900',
      'trade': trade ?? _cachedTrade ?? 'General Contractor',
      'savedAt': DateTime.now().toIso8601String(),
    };

    await _storage.write(key: _kSessionUserKey, value: jsonEncode(userData));
    if (accessToken != null) {
      await _storage.write(key: _kAccessTokenKey, value: accessToken);
    }
    if (refreshToken != null) {
      await _storage.write(key: _kRefreshTokenKey, value: refreshToken);
    }
    if (trade != null) {
      await setTrade(trade);
    }

    _cachedUser = userData;
    AppLogger.success('Session saved securely for: ${userData['name']}');
    notifyListeners();
  }

  /// Update active trade specialization
  Future<void> setTrade(String trade) async {
    _cachedTrade = trade;
    await _storage.write(key: _kTradeKey, value: trade);
    if (_cachedUser != null) {
      _cachedUser!['trade'] = trade;
      await _storage.write(key: _kSessionUserKey, value: jsonEncode(_cachedUser));
    }
    AppLogger.i('Active trade set to: $trade');
    notifyListeners();
  }

  /// Update specific profile details
  Future<void> updateProfile({
    String? name,
    String? businessName,
    String? phone,
    String? email,
  }) async {
    if (_cachedUser == null) return;

    if (name != null) _cachedUser!['name'] = name;
    if (businessName != null) _cachedUser!['businessName'] = businessName;
    if (phone != null) _cachedUser!['phone'] = phone;
    if (email != null) _cachedUser!['email'] = email;

    await _storage.write(key: _kSessionUserKey, value: jsonEncode(_cachedUser));
    AppLogger.i('Profile updated for user: ${_cachedUser?['name']}');
    notifyListeners();
  }

  /// Retrieve secure access token
  Future<String?> getAccessToken() async {
    return _storage.read(key: _kAccessTokenKey);
  }

  /// Wipe session upon sign out
  Future<void> clearSession() async {
    await _storage.delete(key: _kSessionUserKey);
    await _storage.delete(key: _kAccessTokenKey);
    await _storage.delete(key: _kRefreshTokenKey);
    _cachedUser = null;
    AppLogger.i('Session cleared / User signed out.');
    notifyListeners();
  }
}
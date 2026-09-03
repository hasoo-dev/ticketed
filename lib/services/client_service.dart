import 'package:flutter/material.dart';
import '../data/database/app_database.dart';
import '../models/client_model.dart';

class ClientService extends ChangeNotifier {
  static final ClientService _instance = ClientService._internal();
  factory ClientService() => _instance;
  ClientService._internal() {
    _initDatabase();
  }

  final List<ClientModel> _clients = [];
  final AppDatabase _db = AppDatabase.instance;
  bool _isLoaded = false;

  List<ClientModel> get clients => List.unmodifiable(_clients);
  bool get isLoaded => _isLoaded;

  Future<void> _initDatabase() async {
    try {
      final dbClients = await _db.getAllClients();
      if (dbClients.isNotEmpty) {
        _clients.clear();
        _clients.addAll(dbClients);
      } else {
        _initSampleData();
        for (final c in _clients) {
          await _db.insertOrUpdateClient(c);
        }
      }
    } catch (e) {
      if (_clients.isEmpty) _initSampleData();
    } finally {
      _isLoaded = true;
      notifyListeners();
    }
  }

  void _initSampleData() {
    _clients.addAll([
      ClientModel(
        id: 'c1',
        name: 'John Doe',
        company: 'Apex Residential Ltd',
        email: 'johndoe@apexres.com',
        phone: '+1 (555) 234-5678',
        address: '142 Elmwood Ave, Seattle, WA',
        initials: 'JD',
        quotesCount: 4,
        totalBilled: 18450.0,
        avatarColor: const Color(0xffE6E8F8),
      ),
      ClientModel(
        id: 'c2',
        name: 'Alice Smith',
        company: 'Highline Properties',
        email: 'alice@highline.io',
        phone: '+1 (555) 345-6789',
        address: '88 Pinnacle Way, Suite 400, Bellevue, WA',
        initials: 'AS',
        quotesCount: 6,
        totalBilled: 34200.0,
        avatarColor: const Color(0xffEEEEEE),
      ),
      ClientModel(
        id: 'c3',
        name: 'Robert Taylor',
        company: 'Modern Mechanics Co',
        email: 'robert@modernmechanics.com',
        phone: '+1 (555) 901-2345',
        address: '99 Technology Way, Seattle, WA',
        initials: 'RT',
        quotesCount: 12,
        totalBilled: 86500.0,
        avatarColor: const Color(0xff8FE3A9),
      ),
      ClientModel(
        id: 'c4',
        name: 'Sarah Jenkins',
        company: 'Cascade Retail Mall',
        email: 'sjenkins@cascademall.com',
        phone: '+1 (555) 456-7890',
        address: '500 Cascade Blvd, Tacoma, WA',
        initials: 'SJ',
        quotesCount: 2,
        totalBilled: 9400.0,
        avatarColor: const Color(0xffFFE5B4),
      ),
      ClientModel(
        id: 'c5',
        name: 'Marcus Vance',
        company: 'Vance Industrial Logistics',
        email: 'mvance@vancelogistics.com',
        phone: '+1 (555) 678-1234',
        address: '1200 Harbor Point Dr, Everett, WA',
        initials: 'MV',
        quotesCount: 8,
        totalBilled: 52100.0,
        avatarColor: const Color(0xffD1E8E2),
      ),
    ]);
  }

  List<ClientModel> searchClients(String query) {
    if (query.trim().isEmpty) return _clients;
    final lower = query.toLowerCase();
    return _clients.where((c) {
      return c.name.toLowerCase().contains(lower) ||
          c.company.toLowerCase().contains(lower) ||
          c.address.toLowerCase().contains(lower) ||
          c.email.toLowerCase().contains(lower);
    }).toList();
  }

  ClientModel? getClientById(String id) {
    try {
      return _clients.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }

  Future<void> addClient(ClientModel client) async {
    _clients.insert(0, client);
    notifyListeners();
    try {
      await _db.insertOrUpdateClient(client);
    } catch (_) {}
  }

  Future<void> updateClient(ClientModel client) async {
    final index = _clients.indexWhere((c) => c.id == client.id);
    if (index != -1) {
      _clients[index] = client;
      notifyListeners();
      try {
        await _db.insertOrUpdateClient(client);
      } catch (_) {}
    }
  }

  Future<void> deleteClient(String id) async {
    _clients.removeWhere((c) => c.id == id);
    notifyListeners();
    try {
      await _db.deleteClientById(id);
    } catch (_) {}
  }

  int get totalClientsCount => _clients.length;
  double get averageQuoteVolume =>
      _clients.isEmpty ? 0.0 : (_clients.fold(0.0, (s, c) => s + c.totalBilled) / _clients.length);
}

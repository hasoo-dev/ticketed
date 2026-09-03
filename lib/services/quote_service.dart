import 'package:flutter/foundation.dart';
import '../core/utils/app_logger.dart';
import '../data/database/app_database.dart';
import '../models/client_model.dart';
import '../models/line_item_model.dart';
import '../models/quote_model.dart';
import 'client_service.dart';

class QuoteService extends ChangeNotifier {
  static final QuoteService _instance = QuoteService._internal();
  factory QuoteService() => _instance;
  QuoteService._internal() {
    _initDatabase();
  }

  final List<QuoteModel> _quotes = [];
  final AppDatabase _db = AppDatabase.instance;
  bool _isLoaded = false;

  List<QuoteModel> get quotes => List.unmodifiable(_quotes);
  bool get isLoaded => _isLoaded;

  Future<void> _initDatabase() async {
    try {
      final dbQuotes = await _db.getAllQuotes();
      if (dbQuotes.isNotEmpty) {
        _quotes.clear();
        _quotes.addAll(dbQuotes);
        AppLogger.i('Loaded ${_quotes.length} quotes from Drift SQLite database.');
      } else {
        _initSampleData();
        for (final q in _quotes) {
          await _db.insertOrUpdateQuote(q);
        }
        AppLogger.success('Initialized sample quotes in Drift SQLite database.');
      }
    } catch (e, st) {
      AppLogger.e('Error loading quotes from database: $e', error: e, stackTrace: st);
      if (_quotes.isEmpty) _initSampleData();
    } finally {
      _isLoaded = true;
      notifyListeners();
    }
  }

  void _initSampleData() {
    final clientService = ClientService();
    final clientList = clientService.clients;

    ClientModel getClient(int index, String fallbackName, String fallbackCompany) {
      if (clientList.isNotEmpty && index < clientList.length) {
        return clientList[index];
      }
      return ClientModel(
        id: 'c_$index',
        name: fallbackName,
        company: fallbackCompany,
        email: 'client$index@apex.com',
        phone: '+1 (555) 234-5678',
        address: 'Seattle, WA',
        initials: fallbackName.isNotEmpty ? fallbackName.substring(0, 1) : 'C',
      );
    }

    _quotes.addAll([
      QuoteModel(
        id: 'q-1001',
        quoteNumber: 'QT-2024-001',
        client: getClient(0, 'John Doe', 'Apex Residential Ltd'),
        projectName: 'Kitchen Remodel & Custom Cabinetry',
        siteAddress: '142 Elmwood Ave, Seattle, WA',
        status: QuoteStatus.sent,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        validUntil: DateTime.now().add(const Duration(days: 29)),
        items: [
          LineItemModel(
            id: 'i1',
            description: 'Custom Shaker-Style Hardwood Cabinets',
            quantity: 14,
            unitPrice: 180.0,
            unit: 'units',
          ),
          LineItemModel(
            id: 'i2',
            description: 'Quartz Countertop Fabrication & Precision Fitting',
            quantity: 45,
            unitPrice: 32.0,
            unit: 'sq ft',
          ),
          LineItemModel(
            id: 'i3',
            description: 'Plumbing & Electrical Fixture Re-connection',
            quantity: 8,
            unitPrice: 95.0,
            unit: 'hrs',
          ),
        ],
      ),
      QuoteModel(
        id: 'q-1002',
        quoteNumber: 'QT-2024-002',
        client: getClient(1, 'Alice Smith', 'Highline Properties'),
        projectName: 'Exterior Painting & Surface Prep',
        siteAddress: '88 Pinnacle Way, Bellevue, WA',
        status: QuoteStatus.viewed,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        validUntil: DateTime.now().add(const Duration(days: 28)),
        items: [
          LineItemModel(
            id: 'i4',
            description: 'High-Pressure Wash & Surface Sanding',
            quantity: 1,
            unitPrice: 450.0,
            unit: 'job',
          ),
          LineItemModel(
            id: 'i5',
            description: 'Premium Weather-Shield Acrylic Exterior Paint (2 Coats)',
            quantity: 12,
            unitPrice: 65.0,
            unit: 'gal',
          ),
          LineItemModel(
            id: 'i6',
            description: 'Skilled Painter Labor',
            quantity: 10,
            unitPrice: 62.0,
            unit: 'hrs',
          ),
        ],
      ),
      QuoteModel(
        id: 'q-1003',
        quoteNumber: 'QT-2024-003',
        client: getClient(2, 'Robert Taylor', 'Modern Mechanics Co'),
        projectName: 'Commercial Roof Overhaul & Water Barrier',
        siteAddress: '99 Technology Way, Seattle, WA',
        status: QuoteStatus.accepted,
        createdAt: DateTime.now().subtract(const Duration(days: 4)),
        validUntil: DateTime.now().add(const Duration(days: 26)),
        signatureName: 'Robert Taylor',
        signatureDate: '2024-08-20',
        isSigned: true,
        items: [
          LineItemModel(
            id: 'i7',
            description: 'TPO Single-Ply Membrane Roof Installation',
            quantity: 1800,
            unitPrice: 4.8,
            unit: 'sq ft',
          ),
          LineItemModel(
            id: 'i8',
            description: 'Drainage Scuppers & Flashing Waterproofing',
            quantity: 6,
            unitPrice: 280.0,
            unit: 'ea',
          ),
          LineItemModel(
            id: 'i9',
            description: 'Commercial Roofing Crew Deployment',
            quantity: 24,
            unitPrice: 85.0,
            unit: 'hrs',
          ),
        ],
      ),
      QuoteModel(
        id: 'q-1004',
        quoteNumber: 'QT-2024-004',
        client: getClient(3, 'Sarah Jenkins', 'Cascade Retail Mall'),
        projectName: 'HVAC Maintenance & Coil Service',
        siteAddress: '500 Cascade Blvd, Tacoma, WA',
        status: QuoteStatus.sent,
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        validUntil: DateTime.now().add(const Duration(days: 25)),
        items: [
          LineItemModel(
            id: 'i10',
            description: 'Air Handler Blower & Condenser Coil Cleaning',
            quantity: 2,
            unitPrice: 250.0,
            unit: 'units',
          ),
          LineItemModel(
            id: 'i11',
            description: 'Smart Programmable Thermostat Replacement',
            quantity: 2,
            unitPrice: 175.0,
            unit: 'units',
          ),
        ],
      ),
      QuoteModel(
        id: 'q-1005',
        quoteNumber: 'QT-2024-005',
        client: getClient(4, 'Marcus Vance', 'Vance Industrial Logistics'),
        projectName: 'Warehouse High-Bay LED Retrofit',
        siteAddress: '1200 Harbor Point Dr, Everett, WA',
        status: QuoteStatus.accepted,
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
        validUntil: DateTime.now().add(const Duration(days: 23)),
        signatureName: 'Marcus Vance',
        signatureDate: '2024-08-18',
        isSigned: true,
        items: [
          LineItemModel(
            id: 'i12',
            description: '150W Industrial High-Bay UFO LED Fixtures (18,000 lm)',
            quantity: 18,
            unitPrice: 135.0,
            unit: 'units',
          ),
          LineItemModel(
            id: 'i13',
            description: 'Scissor Lift Rental & Electrician Ceiling Wiring',
            quantity: 12,
            unitPrice: 140.0,
            unit: 'hrs',
          ),
        ],
      ),
    ]);
  }

  List<QuoteModel> getQuotesByStatus(QuoteStatus? status) {
    if (status == null) return _quotes;
    return _quotes.where((q) => q.status == status).toList();
  }

  List<QuoteModel> searchQuotes(String query, {QuoteStatus? status}) {
    var list = status != null ? getQuotesByStatus(status) : _quotes;
    if (query.trim().isEmpty) return list;
    final lower = query.toLowerCase();
    return list.where((q) {
      return q.projectName.toLowerCase().contains(lower) ||
          q.quoteNumber.toLowerCase().contains(lower) ||
          q.client.name.toLowerCase().contains(lower) ||
          q.client.company.toLowerCase().contains(lower) ||
          q.siteAddress.toLowerCase().contains(lower);
    }).toList();
  }

  QuoteModel? getQuoteById(String id) {
    try {
      return _quotes.firstWhere((q) => q.id == id);
    } catch (_) {
      return null;
    }
  }

  Future<void> addQuote(QuoteModel quote) async {
    _quotes.insert(0, quote);
    AppLogger.success('New quote created: ${quote.quoteNumber} - ${quote.projectName}');
    notifyListeners();
    try {
      await _db.insertOrUpdateQuote(quote);
    } catch (e, st) {
      AppLogger.e('Failed to persist new quote: $e', error: e, stackTrace: st);
    }
  }

  Future<void> updateQuote(QuoteModel quote) async {
    final index = _quotes.indexWhere((q) => q.id == quote.id);
    if (index != -1) {
      _quotes[index] = quote;
      AppLogger.i('Quote updated: ${quote.quoteNumber}');
      notifyListeners();
      try {
        await _db.insertOrUpdateQuote(quote);
      } catch (e, st) {
        AppLogger.e('Failed to persist updated quote: $e', error: e, stackTrace: st);
      }
    }
  }

  Future<void> signQuote(String id, String signatureName, String signatureDate) async {
    final index = _quotes.indexWhere((q) => q.id == id);
    if (index != -1) {
      final q = _quotes[index];
      final updated = q.copyWith(
        status: QuoteStatus.accepted,
        signatureName: signatureName,
        signatureDate: signatureDate,
        isSigned: true,
      );
      _quotes[index] = updated;
      AppLogger.success('Quote signed & accepted: ${updated.quoteNumber} by $signatureName');
      notifyListeners();
      try {
        await _db.insertOrUpdateQuote(updated);
      } catch (e, st) {
        AppLogger.e('Failed to persist signed quote: $e', error: e, stackTrace: st);
      }
    }
  }

  Future<void> deleteQuote(String id) async {
    _quotes.removeWhere((q) => q.id == id);
    AppLogger.i('Quote deleted: id=$id');
    notifyListeners();
    try {
      await _db.deleteQuoteById(id);
    } catch (e, st) {
      AppLogger.e('Failed to delete quote in DB: $e', error: e, stackTrace: st);
    }
  }

  int get pendingQuotesCount =>
      _quotes.where((q) => q.status == QuoteStatus.sent || q.status == QuoteStatus.viewed).length;

  double get acceptedSumThisMonth => _quotes
      .where((q) => q.status == QuoteStatus.accepted)
      .fold(0.0, (sum, q) => sum + q.total);

  String generateNextQuoteNumber() {
    final count = _quotes.length + 1;
    return 'QT-2024-${count.toString().padLeft(3, '0')}';
  }
}

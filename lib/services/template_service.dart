import 'package:flutter/material.dart';
import '../data/database/app_database.dart';
import '../models/line_item_model.dart';
import '../models/template_model.dart';

class TemplateService extends ChangeNotifier {
  static final TemplateService _instance = TemplateService._internal();
  factory TemplateService() => _instance;
  TemplateService._internal() {
    _initDatabase();
  }

  final List<TemplateModel> _templates = [];
  final AppDatabase _db = AppDatabase.instance;
  bool _isLoaded = false;

  List<TemplateModel> get templates => List.unmodifiable(_templates);
  bool get isLoaded => _isLoaded;

  Future<void> _initDatabase() async {
    try {
      final dbTemplates = await _db.getAllTemplates();
      if (dbTemplates.isNotEmpty) {
        _templates.clear();
        _templates.addAll(dbTemplates);
      } else {
        _initDefaultTemplates();
        for (final t in _templates) {
          await _db.insertOrUpdateTemplate(t);
        }
      }
    } catch (e) {
      if (_templates.isEmpty) _initDefaultTemplates();
    } finally {
      _isLoaded = true;
      notifyListeners();
    }
  }

  void _initDefaultTemplates() {
    _templates.addAll([
      TemplateModel(
        id: 't1',
        title: 'Commercial HVAC Inspection & Tune-Up',
        trade: 'HVAC',
        description: 'Comprehensive 40-point HVAC inspection, filter swaps, refrigerant recharge, and diagnostics.',
        usageCount: 28,
        defaultItems: [
          LineItemModel(
            id: 'ti1',
            description: 'Commercial Rooftop HVAC Diagnostic & Calibration',
            quantity: 4,
            unitPrice: 185.0,
            unit: 'hrs',
          ),
          LineItemModel(
            id: 'ti2',
            description: 'MERV 13 High-Efficiency Air Filter Replacements',
            quantity: 8,
            unitPrice: 42.0,
            unit: 'units',
          ),
          LineItemModel(
            id: 'ti3',
            description: 'R-410A Refrigerant Top-off (per lb)',
            quantity: 6,
            unitPrice: 75.0,
            unit: 'lbs',
          ),
          LineItemModel(
            id: 'ti4',
            description: 'Post-Inspection Compliance Certification Report',
            quantity: 1,
            unitPrice: 150.0,
            unit: 'report',
          ),
        ],
      ),
      TemplateModel(
        id: 't2',
        title: '200A Electrical Panel Upgrade',
        trade: 'Electrician',
        description: 'Full main breaker panel replacement with surge protection and municipal permit inspection.',
        usageCount: 45,
        defaultItems: [
          LineItemModel(
            id: 'ti5',
            description: '200A 40-Space Main Breaker Distribution Panel',
            quantity: 1,
            unitPrice: 850.0,
            unit: 'panel',
          ),
          LineItemModel(
            id: 'ti6',
            description: 'Certified Master Electrician Labor (Panel Installation)',
            quantity: 8,
            unitPrice: 125.0,
            unit: 'hrs',
          ),
          LineItemModel(
            id: 'ti7',
            description: 'Whole-Home Type 2 Surge Protection Device',
            quantity: 1,
            unitPrice: 280.0,
            unit: 'ea',
          ),
          LineItemModel(
            id: 'ti8',
            description: 'City Inspection & Permit Fee Pass-through',
            quantity: 1,
            unitPrice: 220.0,
            unit: 'ea',
          ),
        ],
      ),
      TemplateModel(
        id: 't3',
        title: 'Full Master Bathroom Remodel',
        trade: 'General Contractor',
        description: 'Complete demo, tiling, vanity fixture install, glass enclosure, and modern lighting.',
        usageCount: 19,
        defaultItems: [
          LineItemModel(
            id: 'ti9',
            description: 'Demolition & Debris Disposal (Roll-off container included)',
            quantity: 1,
            unitPrice: 1200.0,
            unit: 'job',
          ),
          LineItemModel(
            id: 'ti10',
            description: 'Waterproof Subfloor & Porcelain Tile Installation',
            quantity: 120,
            unitPrice: 18.5,
            unit: 'sq ft',
          ),
          LineItemModel(
            id: 'ti11',
            description: 'Double Vanity & Quartz Countertop Installation',
            quantity: 1,
            unitPrice: 1650.0,
            unit: 'ea',
          ),
          LineItemModel(
            id: 'ti12',
            description: 'Custom Frameless Glass Shower Enclosure',
            quantity: 1,
            unitPrice: 1850.0,
            unit: 'ea',
          ),
          LineItemModel(
            id: 'ti13',
            description: 'Plumbing & Electrical Rough-in Finishing',
            quantity: 16,
            unitPrice: 95.0,
            unit: 'hrs',
          ),
        ],
      ),
      TemplateModel(
        id: 't4',
        title: 'Commercial Water Line & Backflow Repipe',
        trade: 'Plumber',
        description: 'Copper main line replacement, pressure regulator setup, and annual backflow certification.',
        usageCount: 32,
        defaultItems: [
          LineItemModel(
            id: 'ti14',
            description: 'Type L Rigid Copper Pipe 1-1/2 Inch (per linear ft)',
            quantity: 80,
            unitPrice: 24.0,
            unit: 'ft',
          ),
          LineItemModel(
            id: 'ti15',
            description: 'Lead-Free Reduced Pressure Zone Backflow Preventer',
            quantity: 1,
            unitPrice: 1100.0,
            unit: 'ea',
          ),
          LineItemModel(
            id: 'ti16',
            description: 'Licensed Commercial Plumber Labor & Trenching',
            quantity: 14,
            unitPrice: 135.0,
            unit: 'hrs',
          ),
        ],
      ),
      TemplateModel(
        id: 't5',
        title: 'Architectural Shingle Roof Repair',
        trade: 'Roofing',
        description: 'Underlayment leak repair, architectural shingle match, flashing sealing, and gutter guard.',
        usageCount: 51,
        defaultItems: [
          LineItemModel(
            id: 'ti17',
            description: 'High-Wind Architectural Shingles (per bundle)',
            quantity: 10,
            unitPrice: 48.0,
            unit: 'bundle',
          ),
          LineItemModel(
            id: 'ti18',
            description: 'Synthetic Self-Adhering Waterproof Underlayment',
            quantity: 2,
            unitPrice: 130.0,
            unit: 'roll',
          ),
          LineItemModel(
            id: 'ti19',
            description: 'Chimney & Valley Flashing Custom Fabrication & Seal',
            quantity: 1,
            unitPrice: 450.0,
            unit: 'job',
          ),
          LineItemModel(
            id: 'ti20',
            description: 'Roofing Crew Skilled Labor',
            quantity: 12,
            unitPrice: 85.0,
            unit: 'hrs',
          ),
        ],
      ),
    ]);
  }

  List<TemplateModel> getTemplatesByTrade(String trade) {
    if (trade.toLowerCase() == 'all') return _templates;
    return _templates.where((t) => t.trade.toLowerCase() == trade.toLowerCase()).toList();
  }

  List<TemplateModel> searchTemplates(String query) {
    if (query.trim().isEmpty) return _templates;
    final lower = query.toLowerCase();
    return _templates.where((t) {
      return t.title.toLowerCase().contains(lower) ||
          t.trade.toLowerCase().contains(lower) ||
          t.description.toLowerCase().contains(lower);
    }).toList();
  }

  Future<void> addTemplate(TemplateModel template) async {
    _templates.insert(0, template);
    notifyListeners();
    try {
      await _db.insertOrUpdateTemplate(template);
    } catch (_) {}
  }

  Future<void> deleteTemplate(String id) async {
    _templates.removeWhere((t) => t.id == id);
    notifyListeners();
    try {
      await _db.deleteTemplateById(id);
    } catch (_) {}
  }
}

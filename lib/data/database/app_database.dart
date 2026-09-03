import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import '../../models/client_model.dart';
import '../../models/line_item_model.dart';
import '../../models/quote_model.dart';
import '../../models/template_model.dart';

part 'app_database.g.dart';

class Clients extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get company => text()();
  TextColumn get email => text()();
  TextColumn get phone => text()();
  TextColumn get address => text()();
  TextColumn get initials => text()();
  IntColumn get quotesCount => integer().withDefault(const Constant(0))();
  RealColumn get totalBilled => real().withDefault(const Constant(0.0))();

  @override
  Set<Column> get primaryKey => {id};
}

class Quotes extends Table {
  TextColumn get id => text()();
  TextColumn get quoteNumber => text()();
  TextColumn get clientId => text()();
  TextColumn get clientName => text()();
  TextColumn get clientCompany => text()();
  TextColumn get clientEmail => text()();
  TextColumn get clientPhone => text()();
  TextColumn get clientAddress => text()();
  TextColumn get clientInitials => text()();
  TextColumn get projectName => text()();
  TextColumn get siteAddress => text()();
  TextColumn get itemsJson => text()();
  RealColumn get taxRate => real().withDefault(const Constant(0.08))();
  RealColumn get discount => real().withDefault(const Constant(0.0))();
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get validUntil => dateTime().nullable()();
  TextColumn get paymentTerms => text()();
  TextColumn get notes => text()();
  TextColumn get signatureName => text().nullable()();
  TextColumn get signatureDate => text().nullable()();
  BoolColumn get isSigned => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class Templates extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get trade => text()();
  TextColumn get description => text()();
  TextColumn get defaultItemsJson => text()();
  IntColumn get usageCount => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Clients, Quotes, Templates])
class AppDatabase extends _$AppDatabase {
  AppDatabase._internal() : super(_openConnection());
  static final AppDatabase instance = AppDatabase._internal();
  factory AppDatabase() => instance;

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'ticketed_local_db');
  }

  // --- Client Operations ---
  Future<List<ClientModel>> getAllClients() async {
    final rows = await select(clients).get();
    return rows.map((r) {
      return ClientModel(
        id: r.id,
        name: r.name,
        company: r.company,
        email: r.email,
        phone: r.phone,
        address: r.address,
        initials: r.initials,
        quotesCount: r.quotesCount,
        totalBilled: r.totalBilled,
      );
    }).toList();
  }

  Future<void> insertOrUpdateClient(ClientModel client) async {
    await into(clients).insertOnConflictUpdate(
      ClientsCompanion(
        id: Value(client.id),
        name: Value(client.name),
        company: Value(client.company),
        email: Value(client.email),
        phone: Value(client.phone),
        address: Value(client.address),
        initials: Value(client.initials),
        quotesCount: Value(client.quotesCount),
        totalBilled: Value(client.totalBilled),
      ),
    );
  }

  Future<void> deleteClientById(String id) async {
    await (delete(clients)..where((c) => c.id.equals(id))).go();
  }

  // --- Quote Operations ---
  Future<List<QuoteModel>> getAllQuotes() async {
    final rows = await select(quotes).get();
    return rows.map((r) {
      final List<dynamic> rawItems = jsonDecode(r.itemsJson) as List<dynamic>;
      final items = rawItems
          .map((i) => LineItemModel.fromMap(i as Map<String, dynamic>))
          .toList();

      final client = ClientModel(
        id: r.clientId,
        name: r.clientName,
        company: r.clientCompany,
        email: r.clientEmail,
        phone: r.clientPhone,
        address: r.clientAddress,
        initials: r.clientInitials,
      );

      QuoteStatus status = QuoteStatus.sent;
      try {
        status = QuoteStatus.values.firstWhere(
          (s) => s.name.toLowerCase() == r.status.toLowerCase(),
        );
      } catch (_) {}

      return QuoteModel(
        id: r.id,
        quoteNumber: r.quoteNumber,
        client: client,
        projectName: r.projectName,
        siteAddress: r.siteAddress,
        items: items,
        taxRate: r.taxRate,
        discount: r.discount,
        status: status,
        createdAt: r.createdAt,
        validUntil: r.validUntil,
        paymentTerms: r.paymentTerms,
        notes: r.notes,
        signatureName: r.signatureName,
        signatureDate: r.signatureDate,
        isSigned: r.isSigned,
      );
    }).toList();
  }

  Future<void> insertOrUpdateQuote(QuoteModel quote) async {
    final itemsJson = jsonEncode(quote.items.map((i) => i.toMap()).toList());

    await into(quotes).insertOnConflictUpdate(
      QuotesCompanion(
        id: Value(quote.id),
        quoteNumber: Value(quote.quoteNumber),
        clientId: Value(quote.client.id),
        clientName: Value(quote.client.name),
        clientCompany: Value(quote.client.company),
        clientEmail: Value(quote.client.email),
        clientPhone: Value(quote.client.phone),
        clientAddress: Value(quote.client.address),
        clientInitials: Value(quote.client.initials),
        projectName: Value(quote.projectName),
        siteAddress: Value(quote.siteAddress),
        itemsJson: Value(itemsJson),
        taxRate: Value(quote.taxRate),
        discount: Value(quote.discount),
        status: Value(quote.status.name),
        createdAt: Value(quote.createdAt),
        validUntil: Value(quote.validUntil),
        paymentTerms: Value(quote.paymentTerms),
        notes: Value(quote.notes),
        signatureName: Value(quote.signatureName),
        signatureDate: Value(quote.signatureDate),
        isSigned: Value(quote.isSigned),
      ),
    );
  }

  Future<void> deleteQuoteById(String id) async {
    await (delete(quotes)..where((q) => q.id.equals(id))).go();
  }

  // --- Template Operations ---
  Future<List<TemplateModel>> getAllTemplates() async {
    final rows = await select(templates).get();
    return rows.map((r) {
      final List<dynamic> rawItems = jsonDecode(r.defaultItemsJson) as List<dynamic>;
      final items = rawItems
          .map((i) => LineItemModel.fromMap(i as Map<String, dynamic>))
          .toList();

      return TemplateModel(
        id: r.id,
        title: r.title,
        trade: r.trade,
        description: r.description,
        defaultItems: items,
        usageCount: r.usageCount,
      );
    }).toList();
  }

  Future<void> insertOrUpdateTemplate(TemplateModel template) async {
    final itemsJson = jsonEncode(template.defaultItems.map((i) => i.toMap()).toList());

    await into(templates).insertOnConflictUpdate(
      TemplatesCompanion(
        id: Value(template.id),
        title: Value(template.title),
        trade: Value(template.trade),
        description: Value(template.description),
        defaultItemsJson: Value(itemsJson),
        usageCount: Value(template.usageCount),
      ),
    );
  }

  Future<void> deleteTemplateById(String id) async {
    await (delete(templates)..where((t) => t.id.equals(id))).go();
  }
}

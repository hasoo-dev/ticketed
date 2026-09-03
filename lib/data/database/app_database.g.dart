// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ClientsTable extends Clients with TableInfo<$ClientsTable, Client> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _companyMeta = const VerificationMeta(
    'company',
  );
  @override
  late final GeneratedColumn<String> company = GeneratedColumn<String>(
    'company',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _initialsMeta = const VerificationMeta(
    'initials',
  );
  @override
  late final GeneratedColumn<String> initials = GeneratedColumn<String>(
    'initials',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quotesCountMeta = const VerificationMeta(
    'quotesCount',
  );
  @override
  late final GeneratedColumn<int> quotesCount = GeneratedColumn<int>(
    'quotes_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalBilledMeta = const VerificationMeta(
    'totalBilled',
  );
  @override
  late final GeneratedColumn<double> totalBilled = GeneratedColumn<double>(
    'total_billed',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    company,
    email,
    phone,
    address,
    initials,
    quotesCount,
    totalBilled,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clients';
  @override
  VerificationContext validateIntegrity(
    Insertable<Client> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('company')) {
      context.handle(
        _companyMeta,
        company.isAcceptableOrUnknown(data['company']!, _companyMeta),
      );
    } else if (isInserting) {
      context.missing(_companyMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('initials')) {
      context.handle(
        _initialsMeta,
        initials.isAcceptableOrUnknown(data['initials']!, _initialsMeta),
      );
    } else if (isInserting) {
      context.missing(_initialsMeta);
    }
    if (data.containsKey('quotes_count')) {
      context.handle(
        _quotesCountMeta,
        quotesCount.isAcceptableOrUnknown(
          data['quotes_count']!,
          _quotesCountMeta,
        ),
      );
    }
    if (data.containsKey('total_billed')) {
      context.handle(
        _totalBilledMeta,
        totalBilled.isAcceptableOrUnknown(
          data['total_billed']!,
          _totalBilledMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Client map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Client(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      company: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      initials: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}initials'],
      )!,
      quotesCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quotes_count'],
      )!,
      totalBilled: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_billed'],
      )!,
    );
  }

  @override
  $ClientsTable createAlias(String alias) {
    return $ClientsTable(attachedDatabase, alias);
  }
}

class Client extends DataClass implements Insertable<Client> {
  final String id;
  final String name;
  final String company;
  final String email;
  final String phone;
  final String address;
  final String initials;
  final int quotesCount;
  final double totalBilled;
  const Client({
    required this.id,
    required this.name,
    required this.company,
    required this.email,
    required this.phone,
    required this.address,
    required this.initials,
    required this.quotesCount,
    required this.totalBilled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['company'] = Variable<String>(company);
    map['email'] = Variable<String>(email);
    map['phone'] = Variable<String>(phone);
    map['address'] = Variable<String>(address);
    map['initials'] = Variable<String>(initials);
    map['quotes_count'] = Variable<int>(quotesCount);
    map['total_billed'] = Variable<double>(totalBilled);
    return map;
  }

  ClientsCompanion toCompanion(bool nullToAbsent) {
    return ClientsCompanion(
      id: Value(id),
      name: Value(name),
      company: Value(company),
      email: Value(email),
      phone: Value(phone),
      address: Value(address),
      initials: Value(initials),
      quotesCount: Value(quotesCount),
      totalBilled: Value(totalBilled),
    );
  }

  factory Client.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Client(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      company: serializer.fromJson<String>(json['company']),
      email: serializer.fromJson<String>(json['email']),
      phone: serializer.fromJson<String>(json['phone']),
      address: serializer.fromJson<String>(json['address']),
      initials: serializer.fromJson<String>(json['initials']),
      quotesCount: serializer.fromJson<int>(json['quotesCount']),
      totalBilled: serializer.fromJson<double>(json['totalBilled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'company': serializer.toJson<String>(company),
      'email': serializer.toJson<String>(email),
      'phone': serializer.toJson<String>(phone),
      'address': serializer.toJson<String>(address),
      'initials': serializer.toJson<String>(initials),
      'quotesCount': serializer.toJson<int>(quotesCount),
      'totalBilled': serializer.toJson<double>(totalBilled),
    };
  }

  Client copyWith({
    String? id,
    String? name,
    String? company,
    String? email,
    String? phone,
    String? address,
    String? initials,
    int? quotesCount,
    double? totalBilled,
  }) => Client(
    id: id ?? this.id,
    name: name ?? this.name,
    company: company ?? this.company,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    address: address ?? this.address,
    initials: initials ?? this.initials,
    quotesCount: quotesCount ?? this.quotesCount,
    totalBilled: totalBilled ?? this.totalBilled,
  );
  Client copyWithCompanion(ClientsCompanion data) {
    return Client(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      company: data.company.present ? data.company.value : this.company,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      address: data.address.present ? data.address.value : this.address,
      initials: data.initials.present ? data.initials.value : this.initials,
      quotesCount: data.quotesCount.present
          ? data.quotesCount.value
          : this.quotesCount,
      totalBilled: data.totalBilled.present
          ? data.totalBilled.value
          : this.totalBilled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Client(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('company: $company, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('initials: $initials, ')
          ..write('quotesCount: $quotesCount, ')
          ..write('totalBilled: $totalBilled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    company,
    email,
    phone,
    address,
    initials,
    quotesCount,
    totalBilled,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Client &&
          other.id == this.id &&
          other.name == this.name &&
          other.company == this.company &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.address == this.address &&
          other.initials == this.initials &&
          other.quotesCount == this.quotesCount &&
          other.totalBilled == this.totalBilled);
}

class ClientsCompanion extends UpdateCompanion<Client> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> company;
  final Value<String> email;
  final Value<String> phone;
  final Value<String> address;
  final Value<String> initials;
  final Value<int> quotesCount;
  final Value<double> totalBilled;
  final Value<int> rowid;
  const ClientsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.company = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.initials = const Value.absent(),
    this.quotesCount = const Value.absent(),
    this.totalBilled = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClientsCompanion.insert({
    required String id,
    required String name,
    required String company,
    required String email,
    required String phone,
    required String address,
    required String initials,
    this.quotesCount = const Value.absent(),
    this.totalBilled = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       company = Value(company),
       email = Value(email),
       phone = Value(phone),
       address = Value(address),
       initials = Value(initials);
  static Insertable<Client> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? company,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? address,
    Expression<String>? initials,
    Expression<int>? quotesCount,
    Expression<double>? totalBilled,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (company != null) 'company': company,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (initials != null) 'initials': initials,
      if (quotesCount != null) 'quotes_count': quotesCount,
      if (totalBilled != null) 'total_billed': totalBilled,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClientsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? company,
    Value<String>? email,
    Value<String>? phone,
    Value<String>? address,
    Value<String>? initials,
    Value<int>? quotesCount,
    Value<double>? totalBilled,
    Value<int>? rowid,
  }) {
    return ClientsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      company: company ?? this.company,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      initials: initials ?? this.initials,
      quotesCount: quotesCount ?? this.quotesCount,
      totalBilled: totalBilled ?? this.totalBilled,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (company.present) {
      map['company'] = Variable<String>(company.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (initials.present) {
      map['initials'] = Variable<String>(initials.value);
    }
    if (quotesCount.present) {
      map['quotes_count'] = Variable<int>(quotesCount.value);
    }
    if (totalBilled.present) {
      map['total_billed'] = Variable<double>(totalBilled.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('company: $company, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('initials: $initials, ')
          ..write('quotesCount: $quotesCount, ')
          ..write('totalBilled: $totalBilled, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuotesTable extends Quotes with TableInfo<$QuotesTable, Quote> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quoteNumberMeta = const VerificationMeta(
    'quoteNumber',
  );
  @override
  late final GeneratedColumn<String> quoteNumber = GeneratedColumn<String>(
    'quote_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientNameMeta = const VerificationMeta(
    'clientName',
  );
  @override
  late final GeneratedColumn<String> clientName = GeneratedColumn<String>(
    'client_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientCompanyMeta = const VerificationMeta(
    'clientCompany',
  );
  @override
  late final GeneratedColumn<String> clientCompany = GeneratedColumn<String>(
    'client_company',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientEmailMeta = const VerificationMeta(
    'clientEmail',
  );
  @override
  late final GeneratedColumn<String> clientEmail = GeneratedColumn<String>(
    'client_email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientPhoneMeta = const VerificationMeta(
    'clientPhone',
  );
  @override
  late final GeneratedColumn<String> clientPhone = GeneratedColumn<String>(
    'client_phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientAddressMeta = const VerificationMeta(
    'clientAddress',
  );
  @override
  late final GeneratedColumn<String> clientAddress = GeneratedColumn<String>(
    'client_address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientInitialsMeta = const VerificationMeta(
    'clientInitials',
  );
  @override
  late final GeneratedColumn<String> clientInitials = GeneratedColumn<String>(
    'client_initials',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectNameMeta = const VerificationMeta(
    'projectName',
  );
  @override
  late final GeneratedColumn<String> projectName = GeneratedColumn<String>(
    'project_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _siteAddressMeta = const VerificationMeta(
    'siteAddress',
  );
  @override
  late final GeneratedColumn<String> siteAddress = GeneratedColumn<String>(
    'site_address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemsJsonMeta = const VerificationMeta(
    'itemsJson',
  );
  @override
  late final GeneratedColumn<String> itemsJson = GeneratedColumn<String>(
    'items_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taxRateMeta = const VerificationMeta(
    'taxRate',
  );
  @override
  late final GeneratedColumn<double> taxRate = GeneratedColumn<double>(
    'tax_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.08),
  );
  static const VerificationMeta _discountMeta = const VerificationMeta(
    'discount',
  );
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
    'discount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _validUntilMeta = const VerificationMeta(
    'validUntil',
  );
  @override
  late final GeneratedColumn<DateTime> validUntil = GeneratedColumn<DateTime>(
    'valid_until',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _paymentTermsMeta = const VerificationMeta(
    'paymentTerms',
  );
  @override
  late final GeneratedColumn<String> paymentTerms = GeneratedColumn<String>(
    'payment_terms',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _signatureNameMeta = const VerificationMeta(
    'signatureName',
  );
  @override
  late final GeneratedColumn<String> signatureName = GeneratedColumn<String>(
    'signature_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _signatureDateMeta = const VerificationMeta(
    'signatureDate',
  );
  @override
  late final GeneratedColumn<String> signatureDate = GeneratedColumn<String>(
    'signature_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSignedMeta = const VerificationMeta(
    'isSigned',
  );
  @override
  late final GeneratedColumn<bool> isSigned = GeneratedColumn<bool>(
    'is_signed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_signed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    quoteNumber,
    clientId,
    clientName,
    clientCompany,
    clientEmail,
    clientPhone,
    clientAddress,
    clientInitials,
    projectName,
    siteAddress,
    itemsJson,
    taxRate,
    discount,
    status,
    createdAt,
    validUntil,
    paymentTerms,
    notes,
    signatureName,
    signatureDate,
    isSigned,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quotes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Quote> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('quote_number')) {
      context.handle(
        _quoteNumberMeta,
        quoteNumber.isAcceptableOrUnknown(
          data['quote_number']!,
          _quoteNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quoteNumberMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('client_name')) {
      context.handle(
        _clientNameMeta,
        clientName.isAcceptableOrUnknown(data['client_name']!, _clientNameMeta),
      );
    } else if (isInserting) {
      context.missing(_clientNameMeta);
    }
    if (data.containsKey('client_company')) {
      context.handle(
        _clientCompanyMeta,
        clientCompany.isAcceptableOrUnknown(
          data['client_company']!,
          _clientCompanyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_clientCompanyMeta);
    }
    if (data.containsKey('client_email')) {
      context.handle(
        _clientEmailMeta,
        clientEmail.isAcceptableOrUnknown(
          data['client_email']!,
          _clientEmailMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_clientEmailMeta);
    }
    if (data.containsKey('client_phone')) {
      context.handle(
        _clientPhoneMeta,
        clientPhone.isAcceptableOrUnknown(
          data['client_phone']!,
          _clientPhoneMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_clientPhoneMeta);
    }
    if (data.containsKey('client_address')) {
      context.handle(
        _clientAddressMeta,
        clientAddress.isAcceptableOrUnknown(
          data['client_address']!,
          _clientAddressMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_clientAddressMeta);
    }
    if (data.containsKey('client_initials')) {
      context.handle(
        _clientInitialsMeta,
        clientInitials.isAcceptableOrUnknown(
          data['client_initials']!,
          _clientInitialsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_clientInitialsMeta);
    }
    if (data.containsKey('project_name')) {
      context.handle(
        _projectNameMeta,
        projectName.isAcceptableOrUnknown(
          data['project_name']!,
          _projectNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_projectNameMeta);
    }
    if (data.containsKey('site_address')) {
      context.handle(
        _siteAddressMeta,
        siteAddress.isAcceptableOrUnknown(
          data['site_address']!,
          _siteAddressMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_siteAddressMeta);
    }
    if (data.containsKey('items_json')) {
      context.handle(
        _itemsJsonMeta,
        itemsJson.isAcceptableOrUnknown(data['items_json']!, _itemsJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_itemsJsonMeta);
    }
    if (data.containsKey('tax_rate')) {
      context.handle(
        _taxRateMeta,
        taxRate.isAcceptableOrUnknown(data['tax_rate']!, _taxRateMeta),
      );
    }
    if (data.containsKey('discount')) {
      context.handle(
        _discountMeta,
        discount.isAcceptableOrUnknown(data['discount']!, _discountMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('valid_until')) {
      context.handle(
        _validUntilMeta,
        validUntil.isAcceptableOrUnknown(data['valid_until']!, _validUntilMeta),
      );
    }
    if (data.containsKey('payment_terms')) {
      context.handle(
        _paymentTermsMeta,
        paymentTerms.isAcceptableOrUnknown(
          data['payment_terms']!,
          _paymentTermsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentTermsMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    if (data.containsKey('signature_name')) {
      context.handle(
        _signatureNameMeta,
        signatureName.isAcceptableOrUnknown(
          data['signature_name']!,
          _signatureNameMeta,
        ),
      );
    }
    if (data.containsKey('signature_date')) {
      context.handle(
        _signatureDateMeta,
        signatureDate.isAcceptableOrUnknown(
          data['signature_date']!,
          _signatureDateMeta,
        ),
      );
    }
    if (data.containsKey('is_signed')) {
      context.handle(
        _isSignedMeta,
        isSigned.isAcceptableOrUnknown(data['is_signed']!, _isSignedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Quote map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Quote(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      quoteNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quote_number'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_id'],
      )!,
      clientName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_name'],
      )!,
      clientCompany: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_company'],
      )!,
      clientEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_email'],
      )!,
      clientPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_phone'],
      )!,
      clientAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_address'],
      )!,
      clientInitials: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_initials'],
      )!,
      projectName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_name'],
      )!,
      siteAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}site_address'],
      )!,
      itemsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}items_json'],
      )!,
      taxRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tax_rate'],
      )!,
      discount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      validUntil: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}valid_until'],
      ),
      paymentTerms: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_terms'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      signatureName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}signature_name'],
      ),
      signatureDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}signature_date'],
      ),
      isSigned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_signed'],
      )!,
    );
  }

  @override
  $QuotesTable createAlias(String alias) {
    return $QuotesTable(attachedDatabase, alias);
  }
}

class Quote extends DataClass implements Insertable<Quote> {
  final String id;
  final String quoteNumber;
  final String clientId;
  final String clientName;
  final String clientCompany;
  final String clientEmail;
  final String clientPhone;
  final String clientAddress;
  final String clientInitials;
  final String projectName;
  final String siteAddress;
  final String itemsJson;
  final double taxRate;
  final double discount;
  final String status;
  final DateTime createdAt;
  final DateTime? validUntil;
  final String paymentTerms;
  final String notes;
  final String? signatureName;
  final String? signatureDate;
  final bool isSigned;
  const Quote({
    required this.id,
    required this.quoteNumber,
    required this.clientId,
    required this.clientName,
    required this.clientCompany,
    required this.clientEmail,
    required this.clientPhone,
    required this.clientAddress,
    required this.clientInitials,
    required this.projectName,
    required this.siteAddress,
    required this.itemsJson,
    required this.taxRate,
    required this.discount,
    required this.status,
    required this.createdAt,
    this.validUntil,
    required this.paymentTerms,
    required this.notes,
    this.signatureName,
    this.signatureDate,
    required this.isSigned,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['quote_number'] = Variable<String>(quoteNumber);
    map['client_id'] = Variable<String>(clientId);
    map['client_name'] = Variable<String>(clientName);
    map['client_company'] = Variable<String>(clientCompany);
    map['client_email'] = Variable<String>(clientEmail);
    map['client_phone'] = Variable<String>(clientPhone);
    map['client_address'] = Variable<String>(clientAddress);
    map['client_initials'] = Variable<String>(clientInitials);
    map['project_name'] = Variable<String>(projectName);
    map['site_address'] = Variable<String>(siteAddress);
    map['items_json'] = Variable<String>(itemsJson);
    map['tax_rate'] = Variable<double>(taxRate);
    map['discount'] = Variable<double>(discount);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || validUntil != null) {
      map['valid_until'] = Variable<DateTime>(validUntil);
    }
    map['payment_terms'] = Variable<String>(paymentTerms);
    map['notes'] = Variable<String>(notes);
    if (!nullToAbsent || signatureName != null) {
      map['signature_name'] = Variable<String>(signatureName);
    }
    if (!nullToAbsent || signatureDate != null) {
      map['signature_date'] = Variable<String>(signatureDate);
    }
    map['is_signed'] = Variable<bool>(isSigned);
    return map;
  }

  QuotesCompanion toCompanion(bool nullToAbsent) {
    return QuotesCompanion(
      id: Value(id),
      quoteNumber: Value(quoteNumber),
      clientId: Value(clientId),
      clientName: Value(clientName),
      clientCompany: Value(clientCompany),
      clientEmail: Value(clientEmail),
      clientPhone: Value(clientPhone),
      clientAddress: Value(clientAddress),
      clientInitials: Value(clientInitials),
      projectName: Value(projectName),
      siteAddress: Value(siteAddress),
      itemsJson: Value(itemsJson),
      taxRate: Value(taxRate),
      discount: Value(discount),
      status: Value(status),
      createdAt: Value(createdAt),
      validUntil: validUntil == null && nullToAbsent
          ? const Value.absent()
          : Value(validUntil),
      paymentTerms: Value(paymentTerms),
      notes: Value(notes),
      signatureName: signatureName == null && nullToAbsent
          ? const Value.absent()
          : Value(signatureName),
      signatureDate: signatureDate == null && nullToAbsent
          ? const Value.absent()
          : Value(signatureDate),
      isSigned: Value(isSigned),
    );
  }

  factory Quote.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Quote(
      id: serializer.fromJson<String>(json['id']),
      quoteNumber: serializer.fromJson<String>(json['quoteNumber']),
      clientId: serializer.fromJson<String>(json['clientId']),
      clientName: serializer.fromJson<String>(json['clientName']),
      clientCompany: serializer.fromJson<String>(json['clientCompany']),
      clientEmail: serializer.fromJson<String>(json['clientEmail']),
      clientPhone: serializer.fromJson<String>(json['clientPhone']),
      clientAddress: serializer.fromJson<String>(json['clientAddress']),
      clientInitials: serializer.fromJson<String>(json['clientInitials']),
      projectName: serializer.fromJson<String>(json['projectName']),
      siteAddress: serializer.fromJson<String>(json['siteAddress']),
      itemsJson: serializer.fromJson<String>(json['itemsJson']),
      taxRate: serializer.fromJson<double>(json['taxRate']),
      discount: serializer.fromJson<double>(json['discount']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      validUntil: serializer.fromJson<DateTime?>(json['validUntil']),
      paymentTerms: serializer.fromJson<String>(json['paymentTerms']),
      notes: serializer.fromJson<String>(json['notes']),
      signatureName: serializer.fromJson<String?>(json['signatureName']),
      signatureDate: serializer.fromJson<String?>(json['signatureDate']),
      isSigned: serializer.fromJson<bool>(json['isSigned']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'quoteNumber': serializer.toJson<String>(quoteNumber),
      'clientId': serializer.toJson<String>(clientId),
      'clientName': serializer.toJson<String>(clientName),
      'clientCompany': serializer.toJson<String>(clientCompany),
      'clientEmail': serializer.toJson<String>(clientEmail),
      'clientPhone': serializer.toJson<String>(clientPhone),
      'clientAddress': serializer.toJson<String>(clientAddress),
      'clientInitials': serializer.toJson<String>(clientInitials),
      'projectName': serializer.toJson<String>(projectName),
      'siteAddress': serializer.toJson<String>(siteAddress),
      'itemsJson': serializer.toJson<String>(itemsJson),
      'taxRate': serializer.toJson<double>(taxRate),
      'discount': serializer.toJson<double>(discount),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'validUntil': serializer.toJson<DateTime?>(validUntil),
      'paymentTerms': serializer.toJson<String>(paymentTerms),
      'notes': serializer.toJson<String>(notes),
      'signatureName': serializer.toJson<String?>(signatureName),
      'signatureDate': serializer.toJson<String?>(signatureDate),
      'isSigned': serializer.toJson<bool>(isSigned),
    };
  }

  Quote copyWith({
    String? id,
    String? quoteNumber,
    String? clientId,
    String? clientName,
    String? clientCompany,
    String? clientEmail,
    String? clientPhone,
    String? clientAddress,
    String? clientInitials,
    String? projectName,
    String? siteAddress,
    String? itemsJson,
    double? taxRate,
    double? discount,
    String? status,
    DateTime? createdAt,
    Value<DateTime?> validUntil = const Value.absent(),
    String? paymentTerms,
    String? notes,
    Value<String?> signatureName = const Value.absent(),
    Value<String?> signatureDate = const Value.absent(),
    bool? isSigned,
  }) => Quote(
    id: id ?? this.id,
    quoteNumber: quoteNumber ?? this.quoteNumber,
    clientId: clientId ?? this.clientId,
    clientName: clientName ?? this.clientName,
    clientCompany: clientCompany ?? this.clientCompany,
    clientEmail: clientEmail ?? this.clientEmail,
    clientPhone: clientPhone ?? this.clientPhone,
    clientAddress: clientAddress ?? this.clientAddress,
    clientInitials: clientInitials ?? this.clientInitials,
    projectName: projectName ?? this.projectName,
    siteAddress: siteAddress ?? this.siteAddress,
    itemsJson: itemsJson ?? this.itemsJson,
    taxRate: taxRate ?? this.taxRate,
    discount: discount ?? this.discount,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    validUntil: validUntil.present ? validUntil.value : this.validUntil,
    paymentTerms: paymentTerms ?? this.paymentTerms,
    notes: notes ?? this.notes,
    signatureName: signatureName.present
        ? signatureName.value
        : this.signatureName,
    signatureDate: signatureDate.present
        ? signatureDate.value
        : this.signatureDate,
    isSigned: isSigned ?? this.isSigned,
  );
  Quote copyWithCompanion(QuotesCompanion data) {
    return Quote(
      id: data.id.present ? data.id.value : this.id,
      quoteNumber: data.quoteNumber.present
          ? data.quoteNumber.value
          : this.quoteNumber,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      clientName: data.clientName.present
          ? data.clientName.value
          : this.clientName,
      clientCompany: data.clientCompany.present
          ? data.clientCompany.value
          : this.clientCompany,
      clientEmail: data.clientEmail.present
          ? data.clientEmail.value
          : this.clientEmail,
      clientPhone: data.clientPhone.present
          ? data.clientPhone.value
          : this.clientPhone,
      clientAddress: data.clientAddress.present
          ? data.clientAddress.value
          : this.clientAddress,
      clientInitials: data.clientInitials.present
          ? data.clientInitials.value
          : this.clientInitials,
      projectName: data.projectName.present
          ? data.projectName.value
          : this.projectName,
      siteAddress: data.siteAddress.present
          ? data.siteAddress.value
          : this.siteAddress,
      itemsJson: data.itemsJson.present ? data.itemsJson.value : this.itemsJson,
      taxRate: data.taxRate.present ? data.taxRate.value : this.taxRate,
      discount: data.discount.present ? data.discount.value : this.discount,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      validUntil: data.validUntil.present
          ? data.validUntil.value
          : this.validUntil,
      paymentTerms: data.paymentTerms.present
          ? data.paymentTerms.value
          : this.paymentTerms,
      notes: data.notes.present ? data.notes.value : this.notes,
      signatureName: data.signatureName.present
          ? data.signatureName.value
          : this.signatureName,
      signatureDate: data.signatureDate.present
          ? data.signatureDate.value
          : this.signatureDate,
      isSigned: data.isSigned.present ? data.isSigned.value : this.isSigned,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Quote(')
          ..write('id: $id, ')
          ..write('quoteNumber: $quoteNumber, ')
          ..write('clientId: $clientId, ')
          ..write('clientName: $clientName, ')
          ..write('clientCompany: $clientCompany, ')
          ..write('clientEmail: $clientEmail, ')
          ..write('clientPhone: $clientPhone, ')
          ..write('clientAddress: $clientAddress, ')
          ..write('clientInitials: $clientInitials, ')
          ..write('projectName: $projectName, ')
          ..write('siteAddress: $siteAddress, ')
          ..write('itemsJson: $itemsJson, ')
          ..write('taxRate: $taxRate, ')
          ..write('discount: $discount, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('validUntil: $validUntil, ')
          ..write('paymentTerms: $paymentTerms, ')
          ..write('notes: $notes, ')
          ..write('signatureName: $signatureName, ')
          ..write('signatureDate: $signatureDate, ')
          ..write('isSigned: $isSigned')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    quoteNumber,
    clientId,
    clientName,
    clientCompany,
    clientEmail,
    clientPhone,
    clientAddress,
    clientInitials,
    projectName,
    siteAddress,
    itemsJson,
    taxRate,
    discount,
    status,
    createdAt,
    validUntil,
    paymentTerms,
    notes,
    signatureName,
    signatureDate,
    isSigned,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Quote &&
          other.id == this.id &&
          other.quoteNumber == this.quoteNumber &&
          other.clientId == this.clientId &&
          other.clientName == this.clientName &&
          other.clientCompany == this.clientCompany &&
          other.clientEmail == this.clientEmail &&
          other.clientPhone == this.clientPhone &&
          other.clientAddress == this.clientAddress &&
          other.clientInitials == this.clientInitials &&
          other.projectName == this.projectName &&
          other.siteAddress == this.siteAddress &&
          other.itemsJson == this.itemsJson &&
          other.taxRate == this.taxRate &&
          other.discount == this.discount &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.validUntil == this.validUntil &&
          other.paymentTerms == this.paymentTerms &&
          other.notes == this.notes &&
          other.signatureName == this.signatureName &&
          other.signatureDate == this.signatureDate &&
          other.isSigned == this.isSigned);
}

class QuotesCompanion extends UpdateCompanion<Quote> {
  final Value<String> id;
  final Value<String> quoteNumber;
  final Value<String> clientId;
  final Value<String> clientName;
  final Value<String> clientCompany;
  final Value<String> clientEmail;
  final Value<String> clientPhone;
  final Value<String> clientAddress;
  final Value<String> clientInitials;
  final Value<String> projectName;
  final Value<String> siteAddress;
  final Value<String> itemsJson;
  final Value<double> taxRate;
  final Value<double> discount;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime?> validUntil;
  final Value<String> paymentTerms;
  final Value<String> notes;
  final Value<String?> signatureName;
  final Value<String?> signatureDate;
  final Value<bool> isSigned;
  final Value<int> rowid;
  const QuotesCompanion({
    this.id = const Value.absent(),
    this.quoteNumber = const Value.absent(),
    this.clientId = const Value.absent(),
    this.clientName = const Value.absent(),
    this.clientCompany = const Value.absent(),
    this.clientEmail = const Value.absent(),
    this.clientPhone = const Value.absent(),
    this.clientAddress = const Value.absent(),
    this.clientInitials = const Value.absent(),
    this.projectName = const Value.absent(),
    this.siteAddress = const Value.absent(),
    this.itemsJson = const Value.absent(),
    this.taxRate = const Value.absent(),
    this.discount = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.validUntil = const Value.absent(),
    this.paymentTerms = const Value.absent(),
    this.notes = const Value.absent(),
    this.signatureName = const Value.absent(),
    this.signatureDate = const Value.absent(),
    this.isSigned = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuotesCompanion.insert({
    required String id,
    required String quoteNumber,
    required String clientId,
    required String clientName,
    required String clientCompany,
    required String clientEmail,
    required String clientPhone,
    required String clientAddress,
    required String clientInitials,
    required String projectName,
    required String siteAddress,
    required String itemsJson,
    this.taxRate = const Value.absent(),
    this.discount = const Value.absent(),
    required String status,
    required DateTime createdAt,
    this.validUntil = const Value.absent(),
    required String paymentTerms,
    required String notes,
    this.signatureName = const Value.absent(),
    this.signatureDate = const Value.absent(),
    this.isSigned = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       quoteNumber = Value(quoteNumber),
       clientId = Value(clientId),
       clientName = Value(clientName),
       clientCompany = Value(clientCompany),
       clientEmail = Value(clientEmail),
       clientPhone = Value(clientPhone),
       clientAddress = Value(clientAddress),
       clientInitials = Value(clientInitials),
       projectName = Value(projectName),
       siteAddress = Value(siteAddress),
       itemsJson = Value(itemsJson),
       status = Value(status),
       createdAt = Value(createdAt),
       paymentTerms = Value(paymentTerms),
       notes = Value(notes);
  static Insertable<Quote> custom({
    Expression<String>? id,
    Expression<String>? quoteNumber,
    Expression<String>? clientId,
    Expression<String>? clientName,
    Expression<String>? clientCompany,
    Expression<String>? clientEmail,
    Expression<String>? clientPhone,
    Expression<String>? clientAddress,
    Expression<String>? clientInitials,
    Expression<String>? projectName,
    Expression<String>? siteAddress,
    Expression<String>? itemsJson,
    Expression<double>? taxRate,
    Expression<double>? discount,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? validUntil,
    Expression<String>? paymentTerms,
    Expression<String>? notes,
    Expression<String>? signatureName,
    Expression<String>? signatureDate,
    Expression<bool>? isSigned,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (quoteNumber != null) 'quote_number': quoteNumber,
      if (clientId != null) 'client_id': clientId,
      if (clientName != null) 'client_name': clientName,
      if (clientCompany != null) 'client_company': clientCompany,
      if (clientEmail != null) 'client_email': clientEmail,
      if (clientPhone != null) 'client_phone': clientPhone,
      if (clientAddress != null) 'client_address': clientAddress,
      if (clientInitials != null) 'client_initials': clientInitials,
      if (projectName != null) 'project_name': projectName,
      if (siteAddress != null) 'site_address': siteAddress,
      if (itemsJson != null) 'items_json': itemsJson,
      if (taxRate != null) 'tax_rate': taxRate,
      if (discount != null) 'discount': discount,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (validUntil != null) 'valid_until': validUntil,
      if (paymentTerms != null) 'payment_terms': paymentTerms,
      if (notes != null) 'notes': notes,
      if (signatureName != null) 'signature_name': signatureName,
      if (signatureDate != null) 'signature_date': signatureDate,
      if (isSigned != null) 'is_signed': isSigned,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuotesCompanion copyWith({
    Value<String>? id,
    Value<String>? quoteNumber,
    Value<String>? clientId,
    Value<String>? clientName,
    Value<String>? clientCompany,
    Value<String>? clientEmail,
    Value<String>? clientPhone,
    Value<String>? clientAddress,
    Value<String>? clientInitials,
    Value<String>? projectName,
    Value<String>? siteAddress,
    Value<String>? itemsJson,
    Value<double>? taxRate,
    Value<double>? discount,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<DateTime?>? validUntil,
    Value<String>? paymentTerms,
    Value<String>? notes,
    Value<String?>? signatureName,
    Value<String?>? signatureDate,
    Value<bool>? isSigned,
    Value<int>? rowid,
  }) {
    return QuotesCompanion(
      id: id ?? this.id,
      quoteNumber: quoteNumber ?? this.quoteNumber,
      clientId: clientId ?? this.clientId,
      clientName: clientName ?? this.clientName,
      clientCompany: clientCompany ?? this.clientCompany,
      clientEmail: clientEmail ?? this.clientEmail,
      clientPhone: clientPhone ?? this.clientPhone,
      clientAddress: clientAddress ?? this.clientAddress,
      clientInitials: clientInitials ?? this.clientInitials,
      projectName: projectName ?? this.projectName,
      siteAddress: siteAddress ?? this.siteAddress,
      itemsJson: itemsJson ?? this.itemsJson,
      taxRate: taxRate ?? this.taxRate,
      discount: discount ?? this.discount,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      validUntil: validUntil ?? this.validUntil,
      paymentTerms: paymentTerms ?? this.paymentTerms,
      notes: notes ?? this.notes,
      signatureName: signatureName ?? this.signatureName,
      signatureDate: signatureDate ?? this.signatureDate,
      isSigned: isSigned ?? this.isSigned,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (quoteNumber.present) {
      map['quote_number'] = Variable<String>(quoteNumber.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (clientName.present) {
      map['client_name'] = Variable<String>(clientName.value);
    }
    if (clientCompany.present) {
      map['client_company'] = Variable<String>(clientCompany.value);
    }
    if (clientEmail.present) {
      map['client_email'] = Variable<String>(clientEmail.value);
    }
    if (clientPhone.present) {
      map['client_phone'] = Variable<String>(clientPhone.value);
    }
    if (clientAddress.present) {
      map['client_address'] = Variable<String>(clientAddress.value);
    }
    if (clientInitials.present) {
      map['client_initials'] = Variable<String>(clientInitials.value);
    }
    if (projectName.present) {
      map['project_name'] = Variable<String>(projectName.value);
    }
    if (siteAddress.present) {
      map['site_address'] = Variable<String>(siteAddress.value);
    }
    if (itemsJson.present) {
      map['items_json'] = Variable<String>(itemsJson.value);
    }
    if (taxRate.present) {
      map['tax_rate'] = Variable<double>(taxRate.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (validUntil.present) {
      map['valid_until'] = Variable<DateTime>(validUntil.value);
    }
    if (paymentTerms.present) {
      map['payment_terms'] = Variable<String>(paymentTerms.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (signatureName.present) {
      map['signature_name'] = Variable<String>(signatureName.value);
    }
    if (signatureDate.present) {
      map['signature_date'] = Variable<String>(signatureDate.value);
    }
    if (isSigned.present) {
      map['is_signed'] = Variable<bool>(isSigned.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuotesCompanion(')
          ..write('id: $id, ')
          ..write('quoteNumber: $quoteNumber, ')
          ..write('clientId: $clientId, ')
          ..write('clientName: $clientName, ')
          ..write('clientCompany: $clientCompany, ')
          ..write('clientEmail: $clientEmail, ')
          ..write('clientPhone: $clientPhone, ')
          ..write('clientAddress: $clientAddress, ')
          ..write('clientInitials: $clientInitials, ')
          ..write('projectName: $projectName, ')
          ..write('siteAddress: $siteAddress, ')
          ..write('itemsJson: $itemsJson, ')
          ..write('taxRate: $taxRate, ')
          ..write('discount: $discount, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('validUntil: $validUntil, ')
          ..write('paymentTerms: $paymentTerms, ')
          ..write('notes: $notes, ')
          ..write('signatureName: $signatureName, ')
          ..write('signatureDate: $signatureDate, ')
          ..write('isSigned: $isSigned, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TemplatesTable extends Templates
    with TableInfo<$TemplatesTable, Template> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tradeMeta = const VerificationMeta('trade');
  @override
  late final GeneratedColumn<String> trade = GeneratedColumn<String>(
    'trade',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _defaultItemsJsonMeta = const VerificationMeta(
    'defaultItemsJson',
  );
  @override
  late final GeneratedColumn<String> defaultItemsJson = GeneratedColumn<String>(
    'default_items_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usageCountMeta = const VerificationMeta(
    'usageCount',
  );
  @override
  late final GeneratedColumn<int> usageCount = GeneratedColumn<int>(
    'usage_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    trade,
    description,
    defaultItemsJson,
    usageCount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'templates';
  @override
  VerificationContext validateIntegrity(
    Insertable<Template> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('trade')) {
      context.handle(
        _tradeMeta,
        trade.isAcceptableOrUnknown(data['trade']!, _tradeMeta),
      );
    } else if (isInserting) {
      context.missing(_tradeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('default_items_json')) {
      context.handle(
        _defaultItemsJsonMeta,
        defaultItemsJson.isAcceptableOrUnknown(
          data['default_items_json']!,
          _defaultItemsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_defaultItemsJsonMeta);
    }
    if (data.containsKey('usage_count')) {
      context.handle(
        _usageCountMeta,
        usageCount.isAcceptableOrUnknown(data['usage_count']!, _usageCountMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Template map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Template(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      trade: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trade'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      defaultItemsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_items_json'],
      )!,
      usageCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}usage_count'],
      )!,
    );
  }

  @override
  $TemplatesTable createAlias(String alias) {
    return $TemplatesTable(attachedDatabase, alias);
  }
}

class Template extends DataClass implements Insertable<Template> {
  final String id;
  final String title;
  final String trade;
  final String description;
  final String defaultItemsJson;
  final int usageCount;
  const Template({
    required this.id,
    required this.title,
    required this.trade,
    required this.description,
    required this.defaultItemsJson,
    required this.usageCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['trade'] = Variable<String>(trade);
    map['description'] = Variable<String>(description);
    map['default_items_json'] = Variable<String>(defaultItemsJson);
    map['usage_count'] = Variable<int>(usageCount);
    return map;
  }

  TemplatesCompanion toCompanion(bool nullToAbsent) {
    return TemplatesCompanion(
      id: Value(id),
      title: Value(title),
      trade: Value(trade),
      description: Value(description),
      defaultItemsJson: Value(defaultItemsJson),
      usageCount: Value(usageCount),
    );
  }

  factory Template.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Template(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      trade: serializer.fromJson<String>(json['trade']),
      description: serializer.fromJson<String>(json['description']),
      defaultItemsJson: serializer.fromJson<String>(json['defaultItemsJson']),
      usageCount: serializer.fromJson<int>(json['usageCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'trade': serializer.toJson<String>(trade),
      'description': serializer.toJson<String>(description),
      'defaultItemsJson': serializer.toJson<String>(defaultItemsJson),
      'usageCount': serializer.toJson<int>(usageCount),
    };
  }

  Template copyWith({
    String? id,
    String? title,
    String? trade,
    String? description,
    String? defaultItemsJson,
    int? usageCount,
  }) => Template(
    id: id ?? this.id,
    title: title ?? this.title,
    trade: trade ?? this.trade,
    description: description ?? this.description,
    defaultItemsJson: defaultItemsJson ?? this.defaultItemsJson,
    usageCount: usageCount ?? this.usageCount,
  );
  Template copyWithCompanion(TemplatesCompanion data) {
    return Template(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      trade: data.trade.present ? data.trade.value : this.trade,
      description: data.description.present
          ? data.description.value
          : this.description,
      defaultItemsJson: data.defaultItemsJson.present
          ? data.defaultItemsJson.value
          : this.defaultItemsJson,
      usageCount: data.usageCount.present
          ? data.usageCount.value
          : this.usageCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Template(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('trade: $trade, ')
          ..write('description: $description, ')
          ..write('defaultItemsJson: $defaultItemsJson, ')
          ..write('usageCount: $usageCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, trade, description, defaultItemsJson, usageCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Template &&
          other.id == this.id &&
          other.title == this.title &&
          other.trade == this.trade &&
          other.description == this.description &&
          other.defaultItemsJson == this.defaultItemsJson &&
          other.usageCount == this.usageCount);
}

class TemplatesCompanion extends UpdateCompanion<Template> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> trade;
  final Value<String> description;
  final Value<String> defaultItemsJson;
  final Value<int> usageCount;
  final Value<int> rowid;
  const TemplatesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.trade = const Value.absent(),
    this.description = const Value.absent(),
    this.defaultItemsJson = const Value.absent(),
    this.usageCount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TemplatesCompanion.insert({
    required String id,
    required String title,
    required String trade,
    required String description,
    required String defaultItemsJson,
    this.usageCount = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       trade = Value(trade),
       description = Value(description),
       defaultItemsJson = Value(defaultItemsJson);
  static Insertable<Template> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? trade,
    Expression<String>? description,
    Expression<String>? defaultItemsJson,
    Expression<int>? usageCount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (trade != null) 'trade': trade,
      if (description != null) 'description': description,
      if (defaultItemsJson != null) 'default_items_json': defaultItemsJson,
      if (usageCount != null) 'usage_count': usageCount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TemplatesCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? trade,
    Value<String>? description,
    Value<String>? defaultItemsJson,
    Value<int>? usageCount,
    Value<int>? rowid,
  }) {
    return TemplatesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      trade: trade ?? this.trade,
      description: description ?? this.description,
      defaultItemsJson: defaultItemsJson ?? this.defaultItemsJson,
      usageCount: usageCount ?? this.usageCount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (trade.present) {
      map['trade'] = Variable<String>(trade.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (defaultItemsJson.present) {
      map['default_items_json'] = Variable<String>(defaultItemsJson.value);
    }
    if (usageCount.present) {
      map['usage_count'] = Variable<int>(usageCount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TemplatesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('trade: $trade, ')
          ..write('description: $description, ')
          ..write('defaultItemsJson: $defaultItemsJson, ')
          ..write('usageCount: $usageCount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ClientsTable clients = $ClientsTable(this);
  late final $QuotesTable quotes = $QuotesTable(this);
  late final $TemplatesTable templates = $TemplatesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    clients,
    quotes,
    templates,
  ];
}

typedef $$ClientsTableCreateCompanionBuilder =
    ClientsCompanion Function({
      required String id,
      required String name,
      required String company,
      required String email,
      required String phone,
      required String address,
      required String initials,
      Value<int> quotesCount,
      Value<double> totalBilled,
      Value<int> rowid,
    });
typedef $$ClientsTableUpdateCompanionBuilder =
    ClientsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> company,
      Value<String> email,
      Value<String> phone,
      Value<String> address,
      Value<String> initials,
      Value<int> quotesCount,
      Value<double> totalBilled,
      Value<int> rowid,
    });

class $$ClientsTableFilterComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get company => $composableBuilder(
    column: $table.company,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get initials => $composableBuilder(
    column: $table.initials,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quotesCount => $composableBuilder(
    column: $table.quotesCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalBilled => $composableBuilder(
    column: $table.totalBilled,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ClientsTableOrderingComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get company => $composableBuilder(
    column: $table.company,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get initials => $composableBuilder(
    column: $table.initials,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quotesCount => $composableBuilder(
    column: $table.quotesCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalBilled => $composableBuilder(
    column: $table.totalBilled,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ClientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get company =>
      $composableBuilder(column: $table.company, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get initials =>
      $composableBuilder(column: $table.initials, builder: (column) => column);

  GeneratedColumn<int> get quotesCount => $composableBuilder(
    column: $table.quotesCount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalBilled => $composableBuilder(
    column: $table.totalBilled,
    builder: (column) => column,
  );
}

class $$ClientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ClientsTable,
          Client,
          $$ClientsTableFilterComposer,
          $$ClientsTableOrderingComposer,
          $$ClientsTableAnnotationComposer,
          $$ClientsTableCreateCompanionBuilder,
          $$ClientsTableUpdateCompanionBuilder,
          (Client, BaseReferences<_$AppDatabase, $ClientsTable, Client>),
          Client,
          PrefetchHooks Function()
        > {
  $$ClientsTableTableManager(_$AppDatabase db, $ClientsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> company = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> initials = const Value.absent(),
                Value<int> quotesCount = const Value.absent(),
                Value<double> totalBilled = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClientsCompanion(
                id: id,
                name: name,
                company: company,
                email: email,
                phone: phone,
                address: address,
                initials: initials,
                quotesCount: quotesCount,
                totalBilled: totalBilled,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String company,
                required String email,
                required String phone,
                required String address,
                required String initials,
                Value<int> quotesCount = const Value.absent(),
                Value<double> totalBilled = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClientsCompanion.insert(
                id: id,
                name: name,
                company: company,
                email: email,
                phone: phone,
                address: address,
                initials: initials,
                quotesCount: quotesCount,
                totalBilled: totalBilled,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ClientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ClientsTable,
      Client,
      $$ClientsTableFilterComposer,
      $$ClientsTableOrderingComposer,
      $$ClientsTableAnnotationComposer,
      $$ClientsTableCreateCompanionBuilder,
      $$ClientsTableUpdateCompanionBuilder,
      (Client, BaseReferences<_$AppDatabase, $ClientsTable, Client>),
      Client,
      PrefetchHooks Function()
    >;
typedef $$QuotesTableCreateCompanionBuilder =
    QuotesCompanion Function({
      required String id,
      required String quoteNumber,
      required String clientId,
      required String clientName,
      required String clientCompany,
      required String clientEmail,
      required String clientPhone,
      required String clientAddress,
      required String clientInitials,
      required String projectName,
      required String siteAddress,
      required String itemsJson,
      Value<double> taxRate,
      Value<double> discount,
      required String status,
      required DateTime createdAt,
      Value<DateTime?> validUntil,
      required String paymentTerms,
      required String notes,
      Value<String?> signatureName,
      Value<String?> signatureDate,
      Value<bool> isSigned,
      Value<int> rowid,
    });
typedef $$QuotesTableUpdateCompanionBuilder =
    QuotesCompanion Function({
      Value<String> id,
      Value<String> quoteNumber,
      Value<String> clientId,
      Value<String> clientName,
      Value<String> clientCompany,
      Value<String> clientEmail,
      Value<String> clientPhone,
      Value<String> clientAddress,
      Value<String> clientInitials,
      Value<String> projectName,
      Value<String> siteAddress,
      Value<String> itemsJson,
      Value<double> taxRate,
      Value<double> discount,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<DateTime?> validUntil,
      Value<String> paymentTerms,
      Value<String> notes,
      Value<String?> signatureName,
      Value<String?> signatureDate,
      Value<bool> isSigned,
      Value<int> rowid,
    });

class $$QuotesTableFilterComposer
    extends Composer<_$AppDatabase, $QuotesTable> {
  $$QuotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quoteNumber => $composableBuilder(
    column: $table.quoteNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientCompany => $composableBuilder(
    column: $table.clientCompany,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientEmail => $composableBuilder(
    column: $table.clientEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientPhone => $composableBuilder(
    column: $table.clientPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientAddress => $composableBuilder(
    column: $table.clientAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientInitials => $composableBuilder(
    column: $table.clientInitials,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get projectName => $composableBuilder(
    column: $table.projectName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get siteAddress => $composableBuilder(
    column: $table.siteAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemsJson => $composableBuilder(
    column: $table.itemsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get taxRate => $composableBuilder(
    column: $table.taxRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get validUntil => $composableBuilder(
    column: $table.validUntil,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentTerms => $composableBuilder(
    column: $table.paymentTerms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get signatureName => $composableBuilder(
    column: $table.signatureName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get signatureDate => $composableBuilder(
    column: $table.signatureDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSigned => $composableBuilder(
    column: $table.isSigned,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuotesTableOrderingComposer
    extends Composer<_$AppDatabase, $QuotesTable> {
  $$QuotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quoteNumber => $composableBuilder(
    column: $table.quoteNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientCompany => $composableBuilder(
    column: $table.clientCompany,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientEmail => $composableBuilder(
    column: $table.clientEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientPhone => $composableBuilder(
    column: $table.clientPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientAddress => $composableBuilder(
    column: $table.clientAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientInitials => $composableBuilder(
    column: $table.clientInitials,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectName => $composableBuilder(
    column: $table.projectName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get siteAddress => $composableBuilder(
    column: $table.siteAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemsJson => $composableBuilder(
    column: $table.itemsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get taxRate => $composableBuilder(
    column: $table.taxRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get validUntil => $composableBuilder(
    column: $table.validUntil,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentTerms => $composableBuilder(
    column: $table.paymentTerms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get signatureName => $composableBuilder(
    column: $table.signatureName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get signatureDate => $composableBuilder(
    column: $table.signatureDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSigned => $composableBuilder(
    column: $table.isSigned,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuotesTable> {
  $$QuotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get quoteNumber => $composableBuilder(
    column: $table.quoteNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  GeneratedColumn<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientCompany => $composableBuilder(
    column: $table.clientCompany,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientEmail => $composableBuilder(
    column: $table.clientEmail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientPhone => $composableBuilder(
    column: $table.clientPhone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientAddress => $composableBuilder(
    column: $table.clientAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientInitials => $composableBuilder(
    column: $table.clientInitials,
    builder: (column) => column,
  );

  GeneratedColumn<String> get projectName => $composableBuilder(
    column: $table.projectName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get siteAddress => $composableBuilder(
    column: $table.siteAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get itemsJson =>
      $composableBuilder(column: $table.itemsJson, builder: (column) => column);

  GeneratedColumn<double> get taxRate =>
      $composableBuilder(column: $table.taxRate, builder: (column) => column);

  GeneratedColumn<double> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get validUntil => $composableBuilder(
    column: $table.validUntil,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentTerms => $composableBuilder(
    column: $table.paymentTerms,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get signatureName => $composableBuilder(
    column: $table.signatureName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get signatureDate => $composableBuilder(
    column: $table.signatureDate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSigned =>
      $composableBuilder(column: $table.isSigned, builder: (column) => column);
}

class $$QuotesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuotesTable,
          Quote,
          $$QuotesTableFilterComposer,
          $$QuotesTableOrderingComposer,
          $$QuotesTableAnnotationComposer,
          $$QuotesTableCreateCompanionBuilder,
          $$QuotesTableUpdateCompanionBuilder,
          (Quote, BaseReferences<_$AppDatabase, $QuotesTable, Quote>),
          Quote,
          PrefetchHooks Function()
        > {
  $$QuotesTableTableManager(_$AppDatabase db, $QuotesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> quoteNumber = const Value.absent(),
                Value<String> clientId = const Value.absent(),
                Value<String> clientName = const Value.absent(),
                Value<String> clientCompany = const Value.absent(),
                Value<String> clientEmail = const Value.absent(),
                Value<String> clientPhone = const Value.absent(),
                Value<String> clientAddress = const Value.absent(),
                Value<String> clientInitials = const Value.absent(),
                Value<String> projectName = const Value.absent(),
                Value<String> siteAddress = const Value.absent(),
                Value<String> itemsJson = const Value.absent(),
                Value<double> taxRate = const Value.absent(),
                Value<double> discount = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> validUntil = const Value.absent(),
                Value<String> paymentTerms = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<String?> signatureName = const Value.absent(),
                Value<String?> signatureDate = const Value.absent(),
                Value<bool> isSigned = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuotesCompanion(
                id: id,
                quoteNumber: quoteNumber,
                clientId: clientId,
                clientName: clientName,
                clientCompany: clientCompany,
                clientEmail: clientEmail,
                clientPhone: clientPhone,
                clientAddress: clientAddress,
                clientInitials: clientInitials,
                projectName: projectName,
                siteAddress: siteAddress,
                itemsJson: itemsJson,
                taxRate: taxRate,
                discount: discount,
                status: status,
                createdAt: createdAt,
                validUntil: validUntil,
                paymentTerms: paymentTerms,
                notes: notes,
                signatureName: signatureName,
                signatureDate: signatureDate,
                isSigned: isSigned,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String quoteNumber,
                required String clientId,
                required String clientName,
                required String clientCompany,
                required String clientEmail,
                required String clientPhone,
                required String clientAddress,
                required String clientInitials,
                required String projectName,
                required String siteAddress,
                required String itemsJson,
                Value<double> taxRate = const Value.absent(),
                Value<double> discount = const Value.absent(),
                required String status,
                required DateTime createdAt,
                Value<DateTime?> validUntil = const Value.absent(),
                required String paymentTerms,
                required String notes,
                Value<String?> signatureName = const Value.absent(),
                Value<String?> signatureDate = const Value.absent(),
                Value<bool> isSigned = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuotesCompanion.insert(
                id: id,
                quoteNumber: quoteNumber,
                clientId: clientId,
                clientName: clientName,
                clientCompany: clientCompany,
                clientEmail: clientEmail,
                clientPhone: clientPhone,
                clientAddress: clientAddress,
                clientInitials: clientInitials,
                projectName: projectName,
                siteAddress: siteAddress,
                itemsJson: itemsJson,
                taxRate: taxRate,
                discount: discount,
                status: status,
                createdAt: createdAt,
                validUntil: validUntil,
                paymentTerms: paymentTerms,
                notes: notes,
                signatureName: signatureName,
                signatureDate: signatureDate,
                isSigned: isSigned,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuotesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuotesTable,
      Quote,
      $$QuotesTableFilterComposer,
      $$QuotesTableOrderingComposer,
      $$QuotesTableAnnotationComposer,
      $$QuotesTableCreateCompanionBuilder,
      $$QuotesTableUpdateCompanionBuilder,
      (Quote, BaseReferences<_$AppDatabase, $QuotesTable, Quote>),
      Quote,
      PrefetchHooks Function()
    >;
typedef $$TemplatesTableCreateCompanionBuilder =
    TemplatesCompanion Function({
      required String id,
      required String title,
      required String trade,
      required String description,
      required String defaultItemsJson,
      Value<int> usageCount,
      Value<int> rowid,
    });
typedef $$TemplatesTableUpdateCompanionBuilder =
    TemplatesCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> trade,
      Value<String> description,
      Value<String> defaultItemsJson,
      Value<int> usageCount,
      Value<int> rowid,
    });

class $$TemplatesTableFilterComposer
    extends Composer<_$AppDatabase, $TemplatesTable> {
  $$TemplatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trade => $composableBuilder(
    column: $table.trade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultItemsJson => $composableBuilder(
    column: $table.defaultItemsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get usageCount => $composableBuilder(
    column: $table.usageCount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TemplatesTableOrderingComposer
    extends Composer<_$AppDatabase, $TemplatesTable> {
  $$TemplatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trade => $composableBuilder(
    column: $table.trade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultItemsJson => $composableBuilder(
    column: $table.defaultItemsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get usageCount => $composableBuilder(
    column: $table.usageCount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TemplatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TemplatesTable> {
  $$TemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get trade =>
      $composableBuilder(column: $table.trade, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get defaultItemsJson => $composableBuilder(
    column: $table.defaultItemsJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get usageCount => $composableBuilder(
    column: $table.usageCount,
    builder: (column) => column,
  );
}

class $$TemplatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TemplatesTable,
          Template,
          $$TemplatesTableFilterComposer,
          $$TemplatesTableOrderingComposer,
          $$TemplatesTableAnnotationComposer,
          $$TemplatesTableCreateCompanionBuilder,
          $$TemplatesTableUpdateCompanionBuilder,
          (Template, BaseReferences<_$AppDatabase, $TemplatesTable, Template>),
          Template,
          PrefetchHooks Function()
        > {
  $$TemplatesTableTableManager(_$AppDatabase db, $TemplatesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TemplatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> trade = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> defaultItemsJson = const Value.absent(),
                Value<int> usageCount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TemplatesCompanion(
                id: id,
                title: title,
                trade: trade,
                description: description,
                defaultItemsJson: defaultItemsJson,
                usageCount: usageCount,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String trade,
                required String description,
                required String defaultItemsJson,
                Value<int> usageCount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TemplatesCompanion.insert(
                id: id,
                title: title,
                trade: trade,
                description: description,
                defaultItemsJson: defaultItemsJson,
                usageCount: usageCount,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TemplatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TemplatesTable,
      Template,
      $$TemplatesTableFilterComposer,
      $$TemplatesTableOrderingComposer,
      $$TemplatesTableAnnotationComposer,
      $$TemplatesTableCreateCompanionBuilder,
      $$TemplatesTableUpdateCompanionBuilder,
      (Template, BaseReferences<_$AppDatabase, $TemplatesTable, Template>),
      Template,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ClientsTableTableManager get clients =>
      $$ClientsTableTableManager(_db, _db.clients);
  $$QuotesTableTableManager get quotes =>
      $$QuotesTableTableManager(_db, _db.quotes);
  $$TemplatesTableTableManager get templates =>
      $$TemplatesTableTableManager(_db, _db.templates);
}

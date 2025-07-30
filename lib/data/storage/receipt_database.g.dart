// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_database.dart';

// ignore_for_file: type=lint
class $StoresTable extends Stores with TableInfo<$StoresTable, Store> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _storeNameMeta =
      const VerificationMeta('storeName');
  @override
  late final GeneratedColumn<String> storeName = GeneratedColumn<String>(
      'store_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, storeName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stores';
  @override
  VerificationContext validateIntegrity(Insertable<Store> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('store_name')) {
      context.handle(_storeNameMeta,
          storeName.isAcceptableOrUnknown(data['store_name']!, _storeNameMeta));
    } else if (isInserting) {
      context.missing(_storeNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Store map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Store(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      storeName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}store_name'])!,
    );
  }

  @override
  $StoresTable createAlias(String alias) {
    return $StoresTable(attachedDatabase, alias);
  }
}

class Store extends DataClass implements Insertable<Store> {
  final int id;
  final String storeName;
  const Store({required this.id, required this.storeName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['store_name'] = Variable<String>(storeName);
    return map;
  }

  StoresCompanion toCompanion(bool nullToAbsent) {
    return StoresCompanion(
      id: Value(id),
      storeName: Value(storeName),
    );
  }

  factory Store.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Store(
      id: serializer.fromJson<int>(json['id']),
      storeName: serializer.fromJson<String>(json['storeName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'storeName': serializer.toJson<String>(storeName),
    };
  }

  Store copyWith({int? id, String? storeName}) => Store(
        id: id ?? this.id,
        storeName: storeName ?? this.storeName,
      );
  Store copyWithCompanion(StoresCompanion data) {
    return Store(
      id: data.id.present ? data.id.value : this.id,
      storeName: data.storeName.present ? data.storeName.value : this.storeName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Store(')
          ..write('id: $id, ')
          ..write('storeName: $storeName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, storeName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Store &&
          other.id == this.id &&
          other.storeName == this.storeName);
}

class StoresCompanion extends UpdateCompanion<Store> {
  final Value<int> id;
  final Value<String> storeName;
  const StoresCompanion({
    this.id = const Value.absent(),
    this.storeName = const Value.absent(),
  });
  StoresCompanion.insert({
    this.id = const Value.absent(),
    required String storeName,
  }) : storeName = Value(storeName);
  static Insertable<Store> custom({
    Expression<int>? id,
    Expression<String>? storeName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (storeName != null) 'store_name': storeName,
    });
  }

  StoresCompanion copyWith({Value<int>? id, Value<String>? storeName}) {
    return StoresCompanion(
      id: id ?? this.id,
      storeName: storeName ?? this.storeName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (storeName.present) {
      map['store_name'] = Variable<String>(storeName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoresCompanion(')
          ..write('id: $id, ')
          ..write('storeName: $storeName')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tagNameMeta =
      const VerificationMeta('tagName');
  @override
  late final GeneratedColumn<String> tagName = GeneratedColumn<String>(
      'tag_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, tagName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags';
  @override
  VerificationContext validateIntegrity(Insertable<Tag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tag_name')) {
      context.handle(_tagNameMeta,
          tagName.isAcceptableOrUnknown(data['tag_name']!, _tagNameMeta));
    } else if (isInserting) {
      context.missing(_tagNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tag(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      tagName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag_name'])!,
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

class Tag extends DataClass implements Insertable<Tag> {
  final int id;
  final String tagName;
  const Tag({required this.id, required this.tagName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tag_name'] = Variable<String>(tagName);
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      id: Value(id),
      tagName: Value(tagName),
    );
  }

  factory Tag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tag(
      id: serializer.fromJson<int>(json['id']),
      tagName: serializer.fromJson<String>(json['tagName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tagName': serializer.toJson<String>(tagName),
    };
  }

  Tag copyWith({int? id, String? tagName}) => Tag(
        id: id ?? this.id,
        tagName: tagName ?? this.tagName,
      );
  Tag copyWithCompanion(TagsCompanion data) {
    return Tag(
      id: data.id.present ? data.id.value : this.id,
      tagName: data.tagName.present ? data.tagName.value : this.tagName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('id: $id, ')
          ..write('tagName: $tagName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tagName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tag && other.id == this.id && other.tagName == this.tagName);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<int> id;
  final Value<String> tagName;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.tagName = const Value.absent(),
  });
  TagsCompanion.insert({
    this.id = const Value.absent(),
    required String tagName,
  }) : tagName = Value(tagName);
  static Insertable<Tag> custom({
    Expression<int>? id,
    Expression<String>? tagName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tagName != null) 'tag_name': tagName,
    });
  }

  TagsCompanion copyWith({Value<int>? id, Value<String>? tagName}) {
    return TagsCompanion(
      id: id ?? this.id,
      tagName: tagName ?? this.tagName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tagName.present) {
      map['tag_name'] = Variable<String>(tagName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('tagName: $tagName')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _categoryNameMeta =
      const VerificationMeta('categoryName');
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
      'category_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, categoryName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_name')) {
      context.handle(
          _categoryNameMeta,
          categoryName.isAcceptableOrUnknown(
              data['category_name']!, _categoryNameMeta));
    } else if (isInserting) {
      context.missing(_categoryNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      categoryName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_name'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String categoryName;
  const Category({required this.id, required this.categoryName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_name'] = Variable<String>(categoryName);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      categoryName: Value(categoryName),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      categoryName: serializer.fromJson<String>(json['categoryName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryName': serializer.toJson<String>(categoryName),
    };
  }

  Category copyWith({int? id, String? categoryName}) => Category(
        id: id ?? this.id,
        categoryName: categoryName ?? this.categoryName,
      );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      categoryName: data.categoryName.present
          ? data.categoryName.value
          : this.categoryName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, categoryName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.categoryName == this.categoryName);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> categoryName;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.categoryName = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String categoryName,
  }) : categoryName = Value(categoryName);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? categoryName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryName != null) 'category_name': categoryName,
    });
  }

  CategoriesCompanion copyWith({Value<int>? id, Value<String>? categoryName}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }
}

class $ReceiptsTable extends Receipts with TableInfo<$ReceiptsTable, Receipt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReceiptsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _storeIdMeta =
      const VerificationMeta('storeId');
  @override
  late final GeneratedColumn<int> storeId = GeneratedColumn<int>(
      'store_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES stores (id)'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
      'total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
      'tag_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tags (id)'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES categories (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, storeId, date, total, currency, tagId, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'receipts';
  @override
  VerificationContext validateIntegrity(Insertable<Receipt> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('store_id')) {
      context.handle(_storeIdMeta,
          storeId.isAcceptableOrUnknown(data['store_id']!, _storeIdMeta));
    } else if (isInserting) {
      context.missing(_storeIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Receipt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Receipt(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      storeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}store_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag_id']),
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
    );
  }

  @override
  $ReceiptsTable createAlias(String alias) {
    return $ReceiptsTable(attachedDatabase, alias);
  }
}

class Receipt extends DataClass implements Insertable<Receipt> {
  final int id;
  final int storeId;
  final DateTime date;
  final double total;
  final String currency;
  final int? tagId;
  final int categoryId;
  const Receipt(
      {required this.id,
      required this.storeId,
      required this.date,
      required this.total,
      required this.currency,
      this.tagId,
      required this.categoryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['store_id'] = Variable<int>(storeId);
    map['date'] = Variable<DateTime>(date);
    map['total'] = Variable<double>(total);
    map['currency'] = Variable<String>(currency);
    if (!nullToAbsent || tagId != null) {
      map['tag_id'] = Variable<int>(tagId);
    }
    map['category_id'] = Variable<int>(categoryId);
    return map;
  }

  ReceiptsCompanion toCompanion(bool nullToAbsent) {
    return ReceiptsCompanion(
      id: Value(id),
      storeId: Value(storeId),
      date: Value(date),
      total: Value(total),
      currency: Value(currency),
      tagId:
          tagId == null && nullToAbsent ? const Value.absent() : Value(tagId),
      categoryId: Value(categoryId),
    );
  }

  factory Receipt.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Receipt(
      id: serializer.fromJson<int>(json['id']),
      storeId: serializer.fromJson<int>(json['storeId']),
      date: serializer.fromJson<DateTime>(json['date']),
      total: serializer.fromJson<double>(json['total']),
      currency: serializer.fromJson<String>(json['currency']),
      tagId: serializer.fromJson<int?>(json['tagId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'storeId': serializer.toJson<int>(storeId),
      'date': serializer.toJson<DateTime>(date),
      'total': serializer.toJson<double>(total),
      'currency': serializer.toJson<String>(currency),
      'tagId': serializer.toJson<int?>(tagId),
      'categoryId': serializer.toJson<int>(categoryId),
    };
  }

  Receipt copyWith(
          {int? id,
          int? storeId,
          DateTime? date,
          double? total,
          String? currency,
          Value<int?> tagId = const Value.absent(),
          int? categoryId}) =>
      Receipt(
        id: id ?? this.id,
        storeId: storeId ?? this.storeId,
        date: date ?? this.date,
        total: total ?? this.total,
        currency: currency ?? this.currency,
        tagId: tagId.present ? tagId.value : this.tagId,
        categoryId: categoryId ?? this.categoryId,
      );
  Receipt copyWithCompanion(ReceiptsCompanion data) {
    return Receipt(
      id: data.id.present ? data.id.value : this.id,
      storeId: data.storeId.present ? data.storeId.value : this.storeId,
      date: data.date.present ? data.date.value : this.date,
      total: data.total.present ? data.total.value : this.total,
      currency: data.currency.present ? data.currency.value : this.currency,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Receipt(')
          ..write('id: $id, ')
          ..write('storeId: $storeId, ')
          ..write('date: $date, ')
          ..write('total: $total, ')
          ..write('currency: $currency, ')
          ..write('tagId: $tagId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, storeId, date, total, currency, tagId, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Receipt &&
          other.id == this.id &&
          other.storeId == this.storeId &&
          other.date == this.date &&
          other.total == this.total &&
          other.currency == this.currency &&
          other.tagId == this.tagId &&
          other.categoryId == this.categoryId);
}

class ReceiptsCompanion extends UpdateCompanion<Receipt> {
  final Value<int> id;
  final Value<int> storeId;
  final Value<DateTime> date;
  final Value<double> total;
  final Value<String> currency;
  final Value<int?> tagId;
  final Value<int> categoryId;
  const ReceiptsCompanion({
    this.id = const Value.absent(),
    this.storeId = const Value.absent(),
    this.date = const Value.absent(),
    this.total = const Value.absent(),
    this.currency = const Value.absent(),
    this.tagId = const Value.absent(),
    this.categoryId = const Value.absent(),
  });
  ReceiptsCompanion.insert({
    this.id = const Value.absent(),
    required int storeId,
    required DateTime date,
    required double total,
    required String currency,
    this.tagId = const Value.absent(),
    required int categoryId,
  })  : storeId = Value(storeId),
        date = Value(date),
        total = Value(total),
        currency = Value(currency),
        categoryId = Value(categoryId);
  static Insertable<Receipt> custom({
    Expression<int>? id,
    Expression<int>? storeId,
    Expression<DateTime>? date,
    Expression<double>? total,
    Expression<String>? currency,
    Expression<int>? tagId,
    Expression<int>? categoryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (storeId != null) 'store_id': storeId,
      if (date != null) 'date': date,
      if (total != null) 'total': total,
      if (currency != null) 'currency': currency,
      if (tagId != null) 'tag_id': tagId,
      if (categoryId != null) 'category_id': categoryId,
    });
  }

  ReceiptsCompanion copyWith(
      {Value<int>? id,
      Value<int>? storeId,
      Value<DateTime>? date,
      Value<double>? total,
      Value<String>? currency,
      Value<int?>? tagId,
      Value<int>? categoryId}) {
    return ReceiptsCompanion(
      id: id ?? this.id,
      storeId: storeId ?? this.storeId,
      date: date ?? this.date,
      total: total ?? this.total,
      currency: currency ?? this.currency,
      tagId: tagId ?? this.tagId,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (storeId.present) {
      map['store_id'] = Variable<int>(storeId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReceiptsCompanion(')
          ..write('id: $id, ')
          ..write('storeId: $storeId, ')
          ..write('date: $date, ')
          ..write('total: $total, ')
          ..write('currency: $currency, ')
          ..write('tagId: $tagId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $StoresTable stores = $StoresTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $ReceiptsTable receipts = $ReceiptsTable(this);
  late final ReceiptDao receiptDao = ReceiptDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [stores, tags, categories, receipts];
}

typedef $$StoresTableCreateCompanionBuilder = StoresCompanion Function({
  Value<int> id,
  required String storeName,
});
typedef $$StoresTableUpdateCompanionBuilder = StoresCompanion Function({
  Value<int> id,
  Value<String> storeName,
});

final class $$StoresTableReferences
    extends BaseReferences<_$AppDatabase, $StoresTable, Store> {
  $$StoresTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ReceiptsTable, List<Receipt>> _receiptsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.receipts,
          aliasName: $_aliasNameGenerator(db.stores.id, db.receipts.storeId));

  $$ReceiptsTableProcessedTableManager get receiptsRefs {
    final manager = $$ReceiptsTableTableManager($_db, $_db.receipts)
        .filter((f) => f.storeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_receiptsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$StoresTableFilterComposer
    extends Composer<_$AppDatabase, $StoresTable> {
  $$StoresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get storeName => $composableBuilder(
      column: $table.storeName, builder: (column) => ColumnFilters(column));

  Expression<bool> receiptsRefs(
      Expression<bool> Function($$ReceiptsTableFilterComposer f) f) {
    final $$ReceiptsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.receipts,
        getReferencedColumn: (t) => t.storeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReceiptsTableFilterComposer(
              $db: $db,
              $table: $db.receipts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$StoresTableOrderingComposer
    extends Composer<_$AppDatabase, $StoresTable> {
  $$StoresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get storeName => $composableBuilder(
      column: $table.storeName, builder: (column) => ColumnOrderings(column));
}

class $$StoresTableAnnotationComposer
    extends Composer<_$AppDatabase, $StoresTable> {
  $$StoresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get storeName =>
      $composableBuilder(column: $table.storeName, builder: (column) => column);

  Expression<T> receiptsRefs<T extends Object>(
      Expression<T> Function($$ReceiptsTableAnnotationComposer a) f) {
    final $$ReceiptsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.receipts,
        getReferencedColumn: (t) => t.storeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReceiptsTableAnnotationComposer(
              $db: $db,
              $table: $db.receipts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$StoresTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StoresTable,
    Store,
    $$StoresTableFilterComposer,
    $$StoresTableOrderingComposer,
    $$StoresTableAnnotationComposer,
    $$StoresTableCreateCompanionBuilder,
    $$StoresTableUpdateCompanionBuilder,
    (Store, $$StoresTableReferences),
    Store,
    PrefetchHooks Function({bool receiptsRefs})> {
  $$StoresTableTableManager(_$AppDatabase db, $StoresTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StoresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StoresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StoresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> storeName = const Value.absent(),
          }) =>
              StoresCompanion(
            id: id,
            storeName: storeName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String storeName,
          }) =>
              StoresCompanion.insert(
            id: id,
            storeName: storeName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$StoresTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({receiptsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (receiptsRefs) db.receipts],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (receiptsRefs)
                    await $_getPrefetchedData<Store, $StoresTable, Receipt>(
                        currentTable: table,
                        referencedTable:
                            $$StoresTableReferences._receiptsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$StoresTableReferences(db, table, p0).receiptsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.storeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$StoresTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StoresTable,
    Store,
    $$StoresTableFilterComposer,
    $$StoresTableOrderingComposer,
    $$StoresTableAnnotationComposer,
    $$StoresTableCreateCompanionBuilder,
    $$StoresTableUpdateCompanionBuilder,
    (Store, $$StoresTableReferences),
    Store,
    PrefetchHooks Function({bool receiptsRefs})>;
typedef $$TagsTableCreateCompanionBuilder = TagsCompanion Function({
  Value<int> id,
  required String tagName,
});
typedef $$TagsTableUpdateCompanionBuilder = TagsCompanion Function({
  Value<int> id,
  Value<String> tagName,
});

final class $$TagsTableReferences
    extends BaseReferences<_$AppDatabase, $TagsTable, Tag> {
  $$TagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ReceiptsTable, List<Receipt>> _receiptsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.receipts,
          aliasName: $_aliasNameGenerator(db.tags.id, db.receipts.tagId));

  $$ReceiptsTableProcessedTableManager get receiptsRefs {
    final manager = $$ReceiptsTableTableManager($_db, $_db.receipts)
        .filter((f) => f.tagId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_receiptsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TagsTableFilterComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tagName => $composableBuilder(
      column: $table.tagName, builder: (column) => ColumnFilters(column));

  Expression<bool> receiptsRefs(
      Expression<bool> Function($$ReceiptsTableFilterComposer f) f) {
    final $$ReceiptsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.receipts,
        getReferencedColumn: (t) => t.tagId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReceiptsTableFilterComposer(
              $db: $db,
              $table: $db.receipts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TagsTableOrderingComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tagName => $composableBuilder(
      column: $table.tagName, builder: (column) => ColumnOrderings(column));
}

class $$TagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tagName =>
      $composableBuilder(column: $table.tagName, builder: (column) => column);

  Expression<T> receiptsRefs<T extends Object>(
      Expression<T> Function($$ReceiptsTableAnnotationComposer a) f) {
    final $$ReceiptsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.receipts,
        getReferencedColumn: (t) => t.tagId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReceiptsTableAnnotationComposer(
              $db: $db,
              $table: $db.receipts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TagsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TagsTable,
    Tag,
    $$TagsTableFilterComposer,
    $$TagsTableOrderingComposer,
    $$TagsTableAnnotationComposer,
    $$TagsTableCreateCompanionBuilder,
    $$TagsTableUpdateCompanionBuilder,
    (Tag, $$TagsTableReferences),
    Tag,
    PrefetchHooks Function({bool receiptsRefs})> {
  $$TagsTableTableManager(_$AppDatabase db, $TagsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> tagName = const Value.absent(),
          }) =>
              TagsCompanion(
            id: id,
            tagName: tagName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String tagName,
          }) =>
              TagsCompanion.insert(
            id: id,
            tagName: tagName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TagsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({receiptsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (receiptsRefs) db.receipts],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (receiptsRefs)
                    await $_getPrefetchedData<Tag, $TagsTable, Receipt>(
                        currentTable: table,
                        referencedTable:
                            $$TagsTableReferences._receiptsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TagsTableReferences(db, table, p0).receiptsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.tagId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TagsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TagsTable,
    Tag,
    $$TagsTableFilterComposer,
    $$TagsTableOrderingComposer,
    $$TagsTableAnnotationComposer,
    $$TagsTableCreateCompanionBuilder,
    $$TagsTableUpdateCompanionBuilder,
    (Tag, $$TagsTableReferences),
    Tag,
    PrefetchHooks Function({bool receiptsRefs})>;
typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  required String categoryName,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  Value<String> categoryName,
});

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ReceiptsTable, List<Receipt>> _receiptsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.receipts,
          aliasName:
              $_aliasNameGenerator(db.categories.id, db.receipts.categoryId));

  $$ReceiptsTableProcessedTableManager get receiptsRefs {
    final manager = $$ReceiptsTableTableManager($_db, $_db.receipts)
        .filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_receiptsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryName => $composableBuilder(
      column: $table.categoryName, builder: (column) => ColumnFilters(column));

  Expression<bool> receiptsRefs(
      Expression<bool> Function($$ReceiptsTableFilterComposer f) f) {
    final $$ReceiptsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.receipts,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReceiptsTableFilterComposer(
              $db: $db,
              $table: $db.receipts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryName => $composableBuilder(
      column: $table.categoryName,
      builder: (column) => ColumnOrderings(column));
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get categoryName => $composableBuilder(
      column: $table.categoryName, builder: (column) => column);

  Expression<T> receiptsRefs<T extends Object>(
      Expression<T> Function($$ReceiptsTableAnnotationComposer a) f) {
    final $$ReceiptsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.receipts,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReceiptsTableAnnotationComposer(
              $db: $db,
              $table: $db.receipts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, $$CategoriesTableReferences),
    Category,
    PrefetchHooks Function({bool receiptsRefs})> {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> categoryName = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            categoryName: categoryName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String categoryName,
          }) =>
              CategoriesCompanion.insert(
            id: id,
            categoryName: categoryName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CategoriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({receiptsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (receiptsRefs) db.receipts],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (receiptsRefs)
                    await $_getPrefetchedData<Category, $CategoriesTable,
                            Receipt>(
                        currentTable: table,
                        referencedTable:
                            $$CategoriesTableReferences._receiptsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriesTableReferences(db, table, p0)
                                .receiptsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, $$CategoriesTableReferences),
    Category,
    PrefetchHooks Function({bool receiptsRefs})>;
typedef $$ReceiptsTableCreateCompanionBuilder = ReceiptsCompanion Function({
  Value<int> id,
  required int storeId,
  required DateTime date,
  required double total,
  required String currency,
  Value<int?> tagId,
  required int categoryId,
});
typedef $$ReceiptsTableUpdateCompanionBuilder = ReceiptsCompanion Function({
  Value<int> id,
  Value<int> storeId,
  Value<DateTime> date,
  Value<double> total,
  Value<String> currency,
  Value<int?> tagId,
  Value<int> categoryId,
});

final class $$ReceiptsTableReferences
    extends BaseReferences<_$AppDatabase, $ReceiptsTable, Receipt> {
  $$ReceiptsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $StoresTable _storeIdTable(_$AppDatabase db) => db.stores
      .createAlias($_aliasNameGenerator(db.receipts.storeId, db.stores.id));

  $$StoresTableProcessedTableManager get storeId {
    final $_column = $_itemColumn<int>('store_id')!;

    final manager = $$StoresTableTableManager($_db, $_db.stores)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_storeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TagsTable _tagIdTable(_$AppDatabase db) =>
      db.tags.createAlias($_aliasNameGenerator(db.receipts.tagId, db.tags.id));

  $$TagsTableProcessedTableManager? get tagId {
    final $_column = $_itemColumn<int>('tag_id');
    if ($_column == null) return null;
    final manager = $$TagsTableTableManager($_db, $_db.tags)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias(
          $_aliasNameGenerator(db.receipts.categoryId, db.categories.id));

  $$CategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$CategoriesTableTableManager($_db, $_db.categories)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ReceiptsTableFilterComposer
    extends Composer<_$AppDatabase, $ReceiptsTable> {
  $$ReceiptsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));

  $$StoresTableFilterComposer get storeId {
    final $$StoresTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.storeId,
        referencedTable: $db.stores,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StoresTableFilterComposer(
              $db: $db,
              $table: $db.stores,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TagsTableFilterComposer get tagId {
    final $$TagsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $db.tags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagsTableFilterComposer(
              $db: $db,
              $table: $db.tags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ReceiptsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReceiptsTable> {
  $$ReceiptsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  $$StoresTableOrderingComposer get storeId {
    final $$StoresTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.storeId,
        referencedTable: $db.stores,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StoresTableOrderingComposer(
              $db: $db,
              $table: $db.stores,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TagsTableOrderingComposer get tagId {
    final $$TagsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $db.tags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagsTableOrderingComposer(
              $db: $db,
              $table: $db.tags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ReceiptsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReceiptsTable> {
  $$ReceiptsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  $$StoresTableAnnotationComposer get storeId {
    final $$StoresTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.storeId,
        referencedTable: $db.stores,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StoresTableAnnotationComposer(
              $db: $db,
              $table: $db.stores,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TagsTableAnnotationComposer get tagId {
    final $$TagsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $db.tags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagsTableAnnotationComposer(
              $db: $db,
              $table: $db.tags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ReceiptsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReceiptsTable,
    Receipt,
    $$ReceiptsTableFilterComposer,
    $$ReceiptsTableOrderingComposer,
    $$ReceiptsTableAnnotationComposer,
    $$ReceiptsTableCreateCompanionBuilder,
    $$ReceiptsTableUpdateCompanionBuilder,
    (Receipt, $$ReceiptsTableReferences),
    Receipt,
    PrefetchHooks Function({bool storeId, bool tagId, bool categoryId})> {
  $$ReceiptsTableTableManager(_$AppDatabase db, $ReceiptsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReceiptsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReceiptsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReceiptsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> storeId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<double> total = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<int?> tagId = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
          }) =>
              ReceiptsCompanion(
            id: id,
            storeId: storeId,
            date: date,
            total: total,
            currency: currency,
            tagId: tagId,
            categoryId: categoryId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int storeId,
            required DateTime date,
            required double total,
            required String currency,
            Value<int?> tagId = const Value.absent(),
            required int categoryId,
          }) =>
              ReceiptsCompanion.insert(
            id: id,
            storeId: storeId,
            date: date,
            total: total,
            currency: currency,
            tagId: tagId,
            categoryId: categoryId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ReceiptsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {storeId = false, tagId = false, categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (storeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.storeId,
                    referencedTable:
                        $$ReceiptsTableReferences._storeIdTable(db),
                    referencedColumn:
                        $$ReceiptsTableReferences._storeIdTable(db).id,
                  ) as T;
                }
                if (tagId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tagId,
                    referencedTable: $$ReceiptsTableReferences._tagIdTable(db),
                    referencedColumn:
                        $$ReceiptsTableReferences._tagIdTable(db).id,
                  ) as T;
                }
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$ReceiptsTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$ReceiptsTableReferences._categoryIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ReceiptsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReceiptsTable,
    Receipt,
    $$ReceiptsTableFilterComposer,
    $$ReceiptsTableOrderingComposer,
    $$ReceiptsTableAnnotationComposer,
    $$ReceiptsTableCreateCompanionBuilder,
    $$ReceiptsTableUpdateCompanionBuilder,
    (Receipt, $$ReceiptsTableReferences),
    Receipt,
    PrefetchHooks Function({bool storeId, bool tagId, bool categoryId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$StoresTableTableManager get stores =>
      $$StoresTableTableManager(_db, _db.stores);
  $$TagsTableTableManager get tags => $$TagsTableTableManager(_db, _db.tags);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$ReceiptsTableTableManager get receipts =>
      $$ReceiptsTableTableManager(_db, _db.receipts);
}

mixin _$ReceiptDaoMixin on DatabaseAccessor<AppDatabase> {
  $StoresTable get stores => attachedDatabase.stores;
  $TagsTable get tags => attachedDatabase.tags;
  $CategoriesTable get categories => attachedDatabase.categories;
  $ReceiptsTable get receipts => attachedDatabase.receipts;
}

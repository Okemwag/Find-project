// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltCard> _$builtCardSerializer = new _$BuiltCardSerializer();

class _$BuiltCardSerializer implements StructuredSerializer<BuiltCard> {
  @override
  final Iterable<Type> types = const [BuiltCard, _$BuiltCard];
  @override
  final String wireName = 'BuiltCard';

  @override
  Iterable<Object?> serialize(Serializers serializers, BuiltCard object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.firstName;
    if (value != null) {
      result
        ..add('firstName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.secondName;
    if (value != null) {
      result
        ..add('secondName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.thirdName;
    if (value != null) {
      result
        ..add('thirdName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.regNumber;
    if (value != null) {
      result
        ..add('regNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.idNumber;
    if (value != null) {
      result
        ..add('idNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.department;
    if (value != null) {
      result
        ..add('department')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.locationFound;
    if (value != null) {
      result
        ..add('locationFound')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.schoolName;
    if (value != null) {
      result
        ..add('schoolName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  BuiltCard deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltCardBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'secondName':
          result.secondName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'thirdName':
          result.thirdName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'regNumber':
          result.regNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'idNumber':
          result.idNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'department':
          result.department = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'locationFound':
          result.locationFound = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'schoolName':
          result.schoolName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltCard extends BuiltCard {
  @override
  final String? firstName;
  @override
  final String? secondName;
  @override
  final String? thirdName;
  @override
  final String? regNumber;
  @override
  final String? idNumber;
  @override
  final String? status;
  @override
  final String? department;
  @override
  final String? locationFound;
  @override
  final String? schoolName;

  factory _$BuiltCard([void Function(BuiltCardBuilder)? updates]) =>
      (new BuiltCardBuilder()..update(updates))._build();

  _$BuiltCard._(
      {this.firstName,
      this.secondName,
      this.thirdName,
      this.regNumber,
      this.idNumber,
      this.status,
      this.department,
      this.locationFound,
      this.schoolName})
      : super._();

  @override
  BuiltCard rebuild(void Function(BuiltCardBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltCardBuilder toBuilder() => new BuiltCardBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltCard &&
        firstName == other.firstName &&
        secondName == other.secondName &&
        thirdName == other.thirdName &&
        regNumber == other.regNumber &&
        idNumber == other.idNumber &&
        status == other.status &&
        department == other.department &&
        locationFound == other.locationFound &&
        schoolName == other.schoolName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, firstName.hashCode),
                                    secondName.hashCode),
                                thirdName.hashCode),
                            regNumber.hashCode),
                        idNumber.hashCode),
                    status.hashCode),
                department.hashCode),
            locationFound.hashCode),
        schoolName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BuiltCard')
          ..add('firstName', firstName)
          ..add('secondName', secondName)
          ..add('thirdName', thirdName)
          ..add('regNumber', regNumber)
          ..add('idNumber', idNumber)
          ..add('status', status)
          ..add('department', department)
          ..add('locationFound', locationFound)
          ..add('schoolName', schoolName))
        .toString();
  }
}

class BuiltCardBuilder implements Builder<BuiltCard, BuiltCardBuilder> {
  _$BuiltCard? _$v;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _secondName;
  String? get secondName => _$this._secondName;
  set secondName(String? secondName) => _$this._secondName = secondName;

  String? _thirdName;
  String? get thirdName => _$this._thirdName;
  set thirdName(String? thirdName) => _$this._thirdName = thirdName;

  String? _regNumber;
  String? get regNumber => _$this._regNumber;
  set regNumber(String? regNumber) => _$this._regNumber = regNumber;

  String? _idNumber;
  String? get idNumber => _$this._idNumber;
  set idNumber(String? idNumber) => _$this._idNumber = idNumber;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _department;
  String? get department => _$this._department;
  set department(String? department) => _$this._department = department;

  String? _locationFound;
  String? get locationFound => _$this._locationFound;
  set locationFound(String? locationFound) =>
      _$this._locationFound = locationFound;

  String? _schoolName;
  String? get schoolName => _$this._schoolName;
  set schoolName(String? schoolName) => _$this._schoolName = schoolName;

  BuiltCardBuilder();

  BuiltCardBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _firstName = $v.firstName;
      _secondName = $v.secondName;
      _thirdName = $v.thirdName;
      _regNumber = $v.regNumber;
      _idNumber = $v.idNumber;
      _status = $v.status;
      _department = $v.department;
      _locationFound = $v.locationFound;
      _schoolName = $v.schoolName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltCard other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BuiltCard;
  }

  @override
  void update(void Function(BuiltCardBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BuiltCard build() => _build();

  _$BuiltCard _build() {
    final _$result = _$v ??
        new _$BuiltCard._(
            firstName: firstName,
            secondName: secondName,
            thirdName: thirdName,
            regNumber: regNumber,
            idNumber: idNumber,
            status: status,
            department: department,
            locationFound: locationFound,
            schoolName: schoolName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:find_my_id/chopper_api/serializers.dart';

class BuiltValueConverter extends JsonConverter {
  T _deserialize<T>(dynamic value) {
    return serializers.deserializeWith(
        serializers.serializerForType(T)!, value);
  }

  BuiltList<T> _deserializeListOf<T>(Iterable value) => BuiltList(
        value.map((value) => _deserialize<T>(value)).toList(growable: false),
      );

  dynamic _decode<T>(entity) {
    if (entity is T) return entity;

    try {
      if (entity is List) return _deserializeListOf<T>(entity);
      return _deserialize<T>(entity);
    } catch (e) {
      return null;
    }
  }

  @override
  FutureOr<Response<ResultType>> convertResponse<ResultType, Item>(
    Response response,
  ) async {
    final jsonRes = await super.convertResponse(response);

    var body = jsonRes.body;
    if (body is! Map<String, Item>) {
      body = _decode<Item>(body);
    }

    return jsonRes.copyWith<ResultType>(body: body);
  }

  @override
  Request convertRequest(Request request) {
    if (request.body is! Map) {
      request = request.copyWith(
        body: serializers.serializeWith(
            serializers.serializerForType(request.body.runtimeType)!,
            request.body),
      );
    }
    Request processedRequest = super.convertRequest(request);

    return processedRequest;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_api_services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$MyApiService extends MyApiService {
  _$MyApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MyApiService;

  @override
  Future<Response<BuiltList<BuiltCard>>> getCards(String searchString) {
    final String $url = '/search/${searchString}';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BuiltList<BuiltCard>, BuiltCard>($request);
  }

  @override
  Future<Response<dynamic>> postCard({
    http.MultipartFile? image,
    String? firstName,
    String? secondName,
    String? thirdName,
    String? regNumber,
    String? idNumber,
    String? status,
    String? department,
    String? locationFound,
    String? schoolName,
  }) {
    final String $url = '/create';
    final Map<String, String> $headers = {
      'content-type': 'multipart/form-data',
    };
    final List<PartValue> $parts = <PartValue>[
      PartValue<http.MultipartFile?>(
        'image',
        image,
      ),
      PartValue<String?>(
        'first_name',
        firstName,
      ),
      PartValue<String?>(
        'second_name',
        secondName,
      ),
      PartValue<String?>(
        'third_name',
        thirdName,
      ),
      PartValue<String?>(
        'reg_number',
        regNumber,
      ),
      PartValue<String?>(
        'id_number',
        idNumber,
      ),
      PartValue<String?>(
        'status',
        status,
      ),
      PartValue<String?>(
        'department',
        department,
      ),
      PartValue<String?>(
        'location_found',
        locationFound,
      ),
      PartValue<String?>(
        'school_name',
        schoolName,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }
}

import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:find_my_id/chopper_api/converters.dart';
import 'package:find_my_id/models/card.dart';

import 'package:http/http.dart' as http;

part 'my_api_services.chopper.dart';

@ChopperApi(baseUrl: '')
abstract class MyApiService extends ChopperService {
  @Get(path: '/search/{searchString}')
  Future<Response<BuiltList<BuiltCard>>> getCards(
      @Path('searchString') String searchString);

  @Post(path: '/create', headers: {'content-type': 'multipart/form-data'})
  @multipart
  Future<Response> postCard({
    @Part("image") http.MultipartFile? image,
    @Part("first_name") String? firstName,
    @Part("second_name") String? secondName,
    @Part("third_name") String? thirdName,
    @Part("reg_number") String? regNumber,
    @Part("id_number") String? idNumber,
    @Part("status") String? status,
    @Part("department") String? department,
    @Part("location_found") String? locationFound,
    @Part("school_name") String? schoolName,
  });


  //TODO: create signup,login endpoints
  //TODO: update token endpoint


  static MyApiService create() {
    final client = ChopperClient(
      baseUrl: "http://192.168.0.106:8000/",
      services: [
        _$MyApiService(),
      ],
      converter: JsonConverter(),
    );

    return _$MyApiService(client);
  }

  static ChopperClient recreateClient(String stringUrl) {
    return ChopperClient(
      baseUrl: stringUrl,
      services: [
        _$MyApiService(),
      ],
      converter: BuiltValueConverter(),
    );
  }

}

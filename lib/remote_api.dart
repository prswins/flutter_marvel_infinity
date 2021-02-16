import 'dart:convert';
import 'dart:io';
import 'package:flutter_marvel_infinity/comics_summary.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class RemoteApi {
  static Future<List<ComicsSummary>> getCharacterList(
    int offset,
    int limit, {
    String searchTerm,
  }) async =>
      http
          .get(
            _ApiUrlBuilder.characterList(offset, limit, searchTerm: searchTerm),
          )
          .mapFromResponse(
            (jsonArray) => _parseItemListFromJsonArray(
              jsonArray['data']['results'],
              (jsonObject) => ComicsSummary.fromJson(jsonObject),
            ),
          )
          // ignore: missing_return
        /*  .then((value) {
        List<ComicsSummary> list = value;

        list.forEach((element) {
          print(element.title);
          print(element.description);
          
        });
      })*/;

  static List<T> _parseItemListFromJsonArray<T>(
    List<dynamic> jsonArray,
    T Function(dynamic object) mapper,
  ) =>
      jsonArray.map(mapper).toList();
}

class GenericHttpException implements Exception {}

class NoConnectionException implements Exception {}

class _ApiUrlBuilder {
  static const _baseUrl = 'https://gateway.marvel.com:443/v1/public/comics';
  static const _apiPublicKey = '2c4a7fc508f666cbbee091bffd5a1ecd';
  static const _apiPrivateKey = '2718076f3bc96260cbde0c16387247b8778e4bbe';
  static String _timestamp = DateTime.now().toIso8601String();
  static String _hash =
      generateMd5(_timestamp + "" + _apiPrivateKey + "" + _apiPublicKey);

  static String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  static String _buildParametros(String ts, apikey, hash) => '&ts=$ts'
      '&apikey=$apikey'
      '&hash=$hash';

  static String characterList(
    int offset,
    int limit, {
    String searchTerm,
  }) =>
      /*'$_baseUrl$_charactersResource?'
      'offset=$offset'
      '&limit=$limit'
      '${_buildSearchTermQuery(searchTerm)}'*/
      '$_baseUrl?'
      '${_buildSearchTermQuery(searchTerm)}'
      '&offset=$offset'
      '&limit=$limit'
      '${_buildParametros(_timestamp, _apiPublicKey, _hash)}';

  static String _buildSearchTermQuery(String searchTerm) =>
      searchTerm?.isEmpty == false
          ? '&titleStartsWith=${searchTerm.replaceAll(' ', '+').toLowerCase()}'
          : '';
}

extension on Future<http.Response> {
  Future<R> mapFromResponse<R, T>(R Function(T) jsonParser) async {
    try {
      final response = await this;
      print(response.statusCode);
      print(response.request.url);
      if (response.statusCode == 200) {
        return jsonParser(jsonDecode(response.body));
      } else {
        throw GenericHttpException();
      }
    } on SocketException {
      throw NoConnectionException();
    }
  }
}

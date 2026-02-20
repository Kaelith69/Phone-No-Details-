import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/app_config.dart';
import '../models/phone_details.dart';

/// Service responsible for communicating with the APILayer
/// number-verification endpoint.
class PhoneService {
  const PhoneService({http.Client? client}) : _client = client;

  final http.Client? _client;

  /// Validates [phoneNumber] and returns the parsed [PhoneDetails].
  ///
  /// Throws an [Exception] when the HTTP request fails or returns a
  /// non-200 status code.
  Future<PhoneDetails> validateNumber(String phoneNumber) async {
    final uri = Uri.parse(AppConfig.baseUrl).replace(
      queryParameters: {'number': phoneNumber},
    );

    final client = _client ?? http.Client();
    final response = await client.get(
      uri,
      headers: {'apikey': AppConfig.apiKey},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return PhoneDetails.fromJson(data);
    }

    throw Exception(
      'Validation request failed with status ${response.statusCode}.',
    );
  }
}

/// Immutable data model for a phone-number validation response.
class PhoneDetails {
  const PhoneDetails({
    required this.valid,
    required this.number,
    required this.localFormat,
    required this.internationalFormat,
    required this.countryCode,
    required this.countryName,
    required this.location,
    required this.carrier,
    required this.lineType,
  });

  /// Constructs a [PhoneDetails] instance from a JSON map.
  factory PhoneDetails.fromJson(Map<String, dynamic> json) {
    return PhoneDetails(
      valid: json['valid'] as bool? ?? false,
      number: json['number'] as String? ?? '',
      localFormat: json['local_format'] as String? ?? '',
      internationalFormat: json['international_format'] as String? ?? '',
      countryCode: json['country_code'] as String? ?? '',
      countryName: json['country_name'] as String? ?? '',
      location: json['location'] as String? ?? '',
      carrier: json['carrier'] as String? ?? '',
      lineType: json['line_type'] as String? ?? '',
    );
  }

  final bool valid;
  final String number;
  final String localFormat;
  final String internationalFormat;
  final String countryCode;
  final String countryName;
  final String location;
  final String carrier;
  final String lineType;
}

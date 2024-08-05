import 'package:shipping_pilot/models/index.dart';

class Visit {
  Client buyer;
  VisitDeliveryRecord deliveryRecord;
  String id;
  List<String> packages;
  double price;
  String secureCode;
  VisitStats stats;
  String status;
  String travelId;
  int travelIndex;

  //? statuses
  static const NEW_STATUS = 'new'; // ignore: constant_identifier_names
  static const FAILED_STATUS = 'failed'; // ignore: constant_identifier_names
  static const IN_PROGRESS_STATUS = 'in_propress'; // ignore: constant_identifier_names
  static const SUCCESSFUL_STATUS = 'successful'; // ignore: constant_identifier_names

  Visit({
    required this.buyer,
    required this.deliveryRecord,
    required this.id,
    required this.packages,
    required this.price,
    required this.secureCode,
    required this.stats,
    required this.status,
    required this.travelId,
    required this.travelIndex,
  });

  factory Visit.fromJson(Map<String, dynamic> json) => Visit(
    buyer: Client.fromJson(json['buyer']),
    deliveryRecord: VisitDeliveryRecord.fromJson(json['delivery_record']),
    id: json['id'],
    packages: List<String>.from(json['packages'].map((x) => x)),
    price: json['price'].toDouble(),
    secureCode: json['secure_code'],
    stats: VisitStats.fromJson(json['stats']),
    status: json['status'],
    travelId: json['travel_id'],
    travelIndex: json['travel_index'],
  );

  Map<String, dynamic> toJson() => {
    'buyer': buyer.toJson(),
    'delivery_record': deliveryRecord.toJson(),
    'id': id,
    'packages': List<dynamic>.from(packages.map((x) => x)),
    'price': price,
    'secure_code': secureCode,
    'stats': stats.toJson(),
    'status': status,
    'travel_id': travelId,
    'travel_index': travelIndex,
  };

  Visit copyWith({
    Client? buyer,
    VisitDeliveryRecord? deliveryRecord,
    String? id,
    List<String>? packages,
    double? price,
    String? secureCode,
    VisitStats? stats,
    String? status,
    String? travelId,
    int? travelIndex,
  }) {
    return Visit(
      buyer: buyer ?? this.buyer.copyWith(),
      deliveryRecord: deliveryRecord ?? this.deliveryRecord.copyWith(),
      id: id ?? this.id,
      packages: packages ?? List<String>.from(this.packages),
      price: price ?? this.price,
      secureCode: secureCode ?? this.secureCode,
      stats: stats ?? this.stats.copyWith(),
      status: status ?? this.status,
      travelId: travelId ?? this.travelId,
      travelIndex: travelIndex ?? this.travelIndex,
    );
  }

  bool hasSecureCode() {
    return secureCode.isNotEmpty;
  }
}

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final int id;
  final int customerId;
  final List<int> productsIds;
  final double deliveryFee;
  final double subtotal;
  final double totall;
  final bool isAccepted;
  final bool isDelivered;
  final bool isCancled;
  final DateTime createdAt;
  const Order( {
    required this.id,
    required this.customerId,
    required this.productsIds,
    required this.deliveryFee,
    required this.subtotal,
    required this.totall,
    required this.isAccepted,
    required this.isDelivered,
    required this.isCancled,
    required this.createdAt,
  });

  Order copyWith({
    int? id,
    int? customerId,
    List<int>? productsIds,
    double? deliveryFee,
    double? subtotal,
    double? totall,
    bool? isAccepted,
    bool? isDelivered,
    bool? isCancled,
    DateTime? createdAt,
  }) {
    return Order(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      productsIds: productsIds ?? this.productsIds,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      subtotal: subtotal ?? this.subtotal,
      totall: totall ?? this.totall,
      isAccepted: isAccepted ?? this.isAccepted,
      isDelivered: isDelivered ?? this.isDelivered,
      createdAt: createdAt ?? this.createdAt,
      isCancled: isCancled?? this.isCancled,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customerId': customerId,
      'productsIds': productsIds,
      'deliveryFee': deliveryFee,
      'subtotal': subtotal,
      'totall': totall,
      'isAccepted': isAccepted,
      'isDelivered': isDelivered,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Order.formSnapshot(DocumentSnapshot map) {
    return Order(
      id: map['id']?.toInt() ?? 0,
      customerId: map['customerId']?.toInt() ?? 0,
      productsIds: List<int>.from(map['productsIds']),
      deliveryFee: map['deliveryFee']?.toDouble() ?? 0.0,
      subtotal: map['subtotal']?.toDouble() ?? 0.0,
      totall: map['totall']?.toDouble() ?? 0.0,
      isAccepted: map['isAccepted'] ?? false,
      isDelivered: map['isDelivered'] ?? false,
      isCancled: map['isCancled'] ?? false,
      createdAt: map['createdAt'].toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  // factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Order(id: $id, customerId: $customerId, productsIds: $productsIds, deliveryFee: $deliveryFee, subtotal: $subtotal, totall: $totall, isAccepted: $isAccepted, isDelivered: $isDelivered, createdAt: $createdAt)';
  }

  @override
  List<Object> get props {
    return [
      id,
      customerId,
      productsIds,
      deliveryFee,
      subtotal,
      totall,
      isAccepted,
      isDelivered,
      createdAt,
    ];
  }

  static List<Order> orders = [
    Order(
        id: 1,
        customerId: 2556, 
        productsIds: [1, 2],
        deliveryFee: 10,
        subtotal: 20,//
        totall: 30,//
        isAccepted: false,
        isDelivered: false,
        isCancled: false,
        createdAt: DateTime.now()),
    Order(
        id: 2,
        customerId: 2566,
        productsIds: [1, 2, 3],
        deliveryFee: 10,
        subtotal: 23,
        totall: 33,
        isAccepted: false,
        isDelivered: false,
         isCancled: false,
        createdAt: DateTime.now()),
    Order(
        id: 3,
        customerId: 5699,
        productsIds: [1, 2, 6, 3],
        deliveryFee: 10,
        subtotal: 10,
        totall: 20,
        isAccepted: false,
        isDelivered: false,
         isCancled: false,
        createdAt: DateTime.now()),
    Order(
        id: 4,
        customerId: 2569,
        productsIds: [1, 2],
        deliveryFee: 0,
        subtotal: 50,
        totall: 50,
        isAccepted: false,
        isDelivered: false,
         isCancled: false,
        createdAt: DateTime.now()),
  ];
}

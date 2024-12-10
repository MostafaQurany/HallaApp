// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactServer {
  final String id;
  Timestamp? timestamp = Timestamp.now();
  String? favoriteCategories = "";

  ContactServer({
    required this.id,
    this.timestamp,
    this.favoriteCategories,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContactServer &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          timestamp == other.timestamp &&
          favoriteCategories == other.favoriteCategories);

  @override
  int get hashCode =>
      id.hashCode ^ timestamp.hashCode ^ favoriteCategories.hashCode;

  @override
  String toString() {
    return 'ContactModelServer{ id: $id, timestamp: $timestamp, favoriteCategories: $favoriteCategories,}';
  }

  ContactServer copyWith({
    String? id,
    Timestamp? timestamp,
    String? favoriteCategories,
  }) {
    return ContactServer(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      favoriteCategories: favoriteCategories ?? this.favoriteCategories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'timestamp': timestamp ?? Timestamp.now().millisecondsSinceEpoch,
      'favoriteCategories': favoriteCategories ?? '',
    };
  }

  factory ContactServer.fromMap(Map<String, dynamic> map) {
    return ContactServer(
      id: map['id'] ?? '',
      timestamp: map['timestamp'] ?? Timestamp.now(),
      favoriteCategories: map['favoriteCategories'] ?? '',
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactModelServer {
  final String id;
  Timestamp? timestamp = Timestamp.now();
  String? favoriteCategories = "";

  ContactModelServer({
    required this.id,
    this.timestamp,
    this.favoriteCategories,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContactModelServer &&
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

  ContactModelServer copyWith({
    String? id,
    Timestamp? timestamp,
    String? favoriteCategories,
  }) {
    return ContactModelServer(
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

  factory ContactModelServer.fromMap(Map<String, dynamic> map) {
    return ContactModelServer(
      id: map['id'] ?? '',
      timestamp: map['timestamp'] ?? Timestamp.now(),
      favoriteCategories: map['favoriteCategories'] ?? '',
    );
  }
}

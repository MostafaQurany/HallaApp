// ignore_for_file: public_member_api_docs, sort_constructors_first

class Guest {
  final String id;
  final String name;
  final String pinCode;
  final bool isUpGraded;
  final String uId;
  Guest({
    required this.id,
    required this.name,
    required this.pinCode,
    this.isUpGraded = false,
    this.uId = '',
  });


}

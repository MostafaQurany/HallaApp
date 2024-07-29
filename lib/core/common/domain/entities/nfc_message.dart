
class NfcMessage {
  final String id;
  final String uId;
  final String email;
  final String phone;
  final String pinCode;
  
  NfcMessage({
    required this.id,
    required this.uId,
    required this.email,
    required this.phone,
    required this.pinCode,
  }); 

  


  @override
  String toString() {
    return 'NfcMessage(id: $id, uId: $uId, email: $email, phone: $phone, pinCode: $pinCode)';
  }


}


class Company {
  final String name;
  final String phoneNumber;
  final String website;
  final String position; 
  
  Company({
    required this.name,
    required this.phoneNumber,
    required this.website,
    required this.position,
  });


  @override
  String toString() {
    return 'Company(name: $name, phoneNumber: $phoneNumber, website: $website, position: $position)';
  }
}

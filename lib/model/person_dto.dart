class PersonDto {
  //  final String id;
  final String name;
  final int age;
  final String email;

  const PersonDto({
    
    required this.name,
    required this.age,
    required this.email,
  });
    Map<String, dynamic> toJson() {
    return {
      
      "name": name,
      "age": age,
      "email": email,
    };
  }
}
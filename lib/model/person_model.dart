class Person{
  final String id;
  final String name;
  final int age;
  final String email;

  Person({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json["name"],
      age: json["age"],
      email: json["email"],
      id: json["id"],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "age": age,
      "email": email,
    };
  }

  Person copyWith({//http put. Isso é um parametro nomeado.
    String? id,
    String? name,
    int? age,
    String? email,
  }) {
    return Person(//Se não for nulo(se existir) vai atualizar o valor, se for nulo vai manter o valor antigo.
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
    );
  }

}












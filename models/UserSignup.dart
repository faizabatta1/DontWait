import 'dart:convert';

class UserSignup {
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String gender;
  final String password;


  UserSignup({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password
  });

  Map<String,dynamic> toMap(){
    return{
      'id':id,
      'firstname':firstname,
      'lastname':lastname,
      'email':email,
      'phone':phone,
      'gender':gender,
      'password':password,
    };
  }
  factory UserSignup.fromMap (Map<String,dynamic> map){
    return UserSignup(
      id: map['id']?? '',
      firstname: map['firstname']?? '',
      lastname: map['lastname']?? '',
      email: map['email']?? '',
      phone: map['phone']?? '',
      gender: map['gender']?? '',
      password: map['password']?? '',
    );
  }
  String toJson() => json.encode(toMap());

  factory UserSignup.fromJson(String source) => UserSignup.fromMap(json.decode(source));

}

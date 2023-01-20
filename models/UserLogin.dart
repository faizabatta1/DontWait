import 'dart:convert';

class UserLogin {
  final String id;
  final String password;


  UserLogin({
    required this.id,
    required this.password
  });

  Map<String,dynamic> toMap(){
    return{
      'id':id,
      'password':password,
    };
  }
  factory UserLogin.fromMap (Map<String,dynamic> map){
    return UserLogin(
      id: map['id']?? '',
      password: map['password']?? '',
    );
  }
  String toJson() => json.encode(toMap());

  factory UserLogin.fromJson(String source) => UserLogin.fromMap(json.decode(source));

}

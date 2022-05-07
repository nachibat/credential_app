// To parse this JSON data, do
//
//     final userResponse = userResponseFromMap(jsonString);

import 'dart:convert';

// class UserResponse {
//     UserResponse({
//         required this.ok,
//         required this.usuario,
//     });

//     bool ok;
//     Usuario usuario;

//     factory UserResponse.fromJson(String str) => UserResponse.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
//         ok: json["ok"],
//         usuario: Usuario.fromMap(json["usuario"]),
//     );

//     Map<String, dynamic> toMap() => {
//         "ok": ok,
//         "usuario": usuario.toMap(),
//     };
// }

class Usuario {
    Usuario({
        this.usuario,
        this.legajo,
        this.tipo,
        this.dni,
        this.apelNom,
        this.especialidad,
        this.anioCursa
    });

    String? usuario;
    int? legajo;
    String? tipo;
    int? dni;
    String? apelNom;
    String? especialidad;
    int? anioCursa;

    factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        usuario: json["usuario"],
        legajo: json["legajo"],
        tipo: json["tipo"],
        dni: json["dni"],
        apelNom: json["apelNom"],
        especialidad: json["especialidad"],
        anioCursa: json["anioCursa"]
    );

    Map<String, dynamic> toMap() => {
        "usuario": usuario,
        "legajo": legajo,
        "tipo": tipo,
        "dni": dni,
        "apelNom": apelNom,
        "especialidad": especialidad,
        "anioCursa": anioCursa
    };
}

import 'dart:io';
import 'dart:convert';
import 'package:facultad_app/src/models/user_model.dart';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:cross_local_storage/cross_local_storage.dart';


class AuthService extends ChangeNotifier {

  // final String _baseUrl = '10.0.2.2:3000';  // Linea desarrollo
  final String _baseUrl = 'frsncred.frsn.utn.edu.ar:9096';  // Linea final
  // final storage = new FlutterSecureStorage();
  late LocalStorageInterface storage;
  bool terms = false;
  late Usuario user;
  String? profileImage;

  Future<String?> login(String legajo, String usuario, String password) async {
    // Las siguientes 3 lineas ayudan a saltar la verificacion de certificados del servidor zonaekos
    final ioc = new HttpClient();
    ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    storage = await LocalStorage.getInstance();
    
    final Map<String, String> authData = {
      'usuario': usuario,
      'password': password,
      'legajo': legajo.toString()
    };

    // final url = Uri.http(_baseUrl, '/api/login'); // Linea desarrollo
    final url = Uri.https(_baseUrl, '/api/Credencial/RecuperarCredencial'); // Linea final
    final resp = await http.post(url,
      body: jsonEncode(authData),
      headers: {
        "Accept": "aplication/json",
        "Content-type": "application/json"
      }
    );
    if (resp.statusCode == 400) {
      return 'login_error';
    } else {
      final Map<String, dynamic> decodedResp = jsonDecode(resp.body);

      if (decodedResp.containsKey('usuario')) {
        // await storage.write(key: 'data', value: jsonEncode(authData), aOptions: _getAndroidOptions());

        await storage.setString('data', jsonEncode(authData));
        user = Usuario.fromMap( decodedResp);
        return 'login_ok';
      } else {
        return 'login_error';
      }
    }
    
    
  }

  Future logout() async {
    storage = await LocalStorage.getInstance();
    await storage.remove('data');
    await storage.remove('pathImage');
    // await storage.delete(key: 'data', aOptions: _getAndroidOptions());
    // await storage.delete(key: 'pathImage', aOptions: _getAndroidOptions());
    profileImage = null;
  }

  // Future<String> readToken() async {
  //   final token = await storage.read(key: 'token') ?? '';
  //   if (token == '') return token;
  //   final consulta = await getUser(token);
  //   if (consulta) {
  //     return token;
  //   } else {
  //     return '';
  //   }
  // }

  Future<String> readData() async {
    // final data = await storage.read(key: 'data', aOptions: _getAndroidOptions()) ?? '';
    // final data = '';
    // if (data != '') {
    //   // final authData = jsonDecode(data);
    //   final authData = data;
    //   // final consulta = await login(authData['legajo'], authData['usuario'], authData['password']);
    //   final consulta = await login(authData[0], authData[1], authData[2]);
    //   if (consulta == 'Login OK') {
    //     return authData[0];
    //   } else {
    //     return '';
    //   }
    // } else {
    //   return '';
    // }

    storage = await LocalStorage.getInstance();
    final data = storage.getString('data') ?? '';
    if (data != '') {
      final authData = jsonDecode(data);
      print('Auth');
      print(authData['legajo']);
      print(authData['usuario']);
      print(authData['password']);
      final consulta = await login(authData['legajo'], authData['usuario'], authData['password']);
      print(consulta);
      if (consulta == 'login_ok') {
        return authData['usuario'];
      } else {
        return '';
      }
    } else {
      return '';
    }

  }

  // Future<bool> getUser(String token) async {
  //   final ioc = new HttpClient();
  //   ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  //   final http = new IOClient(ioc);
  //   final url = '$_baseUrl/usuario';
  //   final headers = {
  //     'token': token
  //   };
  //   final resp = await http.get(Uri.parse(url), headers: headers);
  //   final Map<String, dynamic> decodedResp = json.decode(resp.body);
  //   // print(decodedResp);
  //   if (decodedResp['ok'] == true) {
  //     user = Usuario.fromMap( decodedResp['usuario']);
  //     return true;
  //   }
  //   return false;
  // }

  void takePicture(String path) async {
    storage = await LocalStorage.getInstance();
    await storage.setString('pathImage', path);
    // await storage.write(key: 'pathImage', value: path, aOptions: _getAndroidOptions());
    this.profileImage = path;
    notifyListeners();
  }

  Future loadPicture() async {
    storage = await LocalStorage.getInstance();
    this.profileImage = storage.getString('pathImage');
    // this.profileImage = await storage.read(key: 'pathImage', aOptions: _getAndroidOptions());
  }

  Widget getImage(double radius) {
    if (this.profileImage == null) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage('assets/user.png'),
      );
    } else {
      return CircleAvatar(
        radius: radius,
        backgroundImage: Image.file(
          // File(this.profileImage!),
          File(this.profileImage!),
          fit: BoxFit.cover,
        ).image,
      );
    }
  }

  // AndroidOptions _getAndroidOptions() => const AndroidOptions(
  //   encryptedSharedPreferences: true
  // );

}
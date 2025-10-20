import 'package:mimpedir1/tipo.dart';

class Restaurante{
  int? _codigo;
  String? _nome;
  String? _latitude;
  String? _longitude;
  String? _proprietario;
  Tipo? _tipoCulinaria;

// gets
  int? get codigo => _codigo;
  String? get nome => _nome;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get proprietario => _proprietario;
  Tipo? get tipoCulinaria => _tipoCulinaria;

//sets
  set codigo(int? valor) => _codigo = valor;
  set nome(String? valor) => _nome = valor;
  set latitude(String? valor) => _latitude = valor;
  set longitude(String? valor) => _longitude = valor;
  set proprietario(String? valor) => _proprietario = valor;
  set tipoCulinaria(Tipo? valor) => _tipoCulinaria = valor;

  Restaurante({int? codigo, String? nome, String? latitude, String? longitude, String? proprietario, Tipo? tipoCulinaria}) {
    _codigo = codigo;
    _nome = nome;
    _latitude = latitude;
    _longitude = longitude;
    _proprietario = proprietario;
    _tipoCulinaria = tipoCulinaria;
  }

}
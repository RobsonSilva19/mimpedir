class Usuario{
  int? _codigo;
  String? _nome;
  String? _login;
  String? _senha;

  Usuario({String? nome, int? codigo, String? senha, String? login}){
    _senha = senha;
    _codigo = codigo;
    _nome = nome;
    _login = login;
  }

  String? get login {
    return _login;
  }

  String? get nome => _nome;
  String? get senha => _senha;
  int? get codigo => _codigo;

  set login(String? login){
    _login = login;
  }

  set nome(String? nome) => _nome = nome;
  set senha(String? senha) => _senha = senha;
  set codigo(int? codigo) => _codigo = codigo;

}
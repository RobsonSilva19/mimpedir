import 'database_helper.dart';
import '../usuario.dart';

  class UsuarioDAO{

    static Usuario usuarioLogado = Usuario();

    static Future<bool> autenticar (String login, String senha) async{
      final db = await DatabaseHelper.getDataBase();

      final resultado = await db.query(
        'tb_usuario',
        where: 'nm_login = ? and ds_senha = ?',
        whereArgs: [login, senha]
      );

      UsuarioDAO.usuarioLogado.codigo = resultado.first['cd_usuario'] as int;
      UsuarioDAO.usuarioLogado.nome = resultado.first['nm_usuario'] as String;
      UsuarioDAO.usuarioLogado.login = resultado.first['nm_login'] as String;
      UsuarioDAO.usuarioLogado.senha = resultado.first['ds_senha'] as String;

      return resultado.isNotEmpty;
    }
  }
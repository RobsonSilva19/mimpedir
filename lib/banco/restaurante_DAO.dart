import 'package:mimpedir1/banco/database_helper.dart';
import 'package:mimpedir1/banco/usuario_dao.dart';
import 'package:mimpedir1/usuario.dart';

class RestauranteDAO{
  static Future<List<Restaurante>> listarTodos() async{
    final db = await DatabaseHelper.getDataBase();
    final resultado =await db.query('tb_restaurante',
      where: 'cd_usuario = ?',
      whereArgs: [UsuarioDAO.usuarioLogado.codigo]
    );

    return resultado.map((mapa){
      return Restaurante(
        codigo: mapa['cd_restaurante'] as int,
        nome: mapa['nm_restaurante'] as string
      );
    }).toList();
  }

  static Future<int> cadastrarRestaurante(
      String? nome, String? latitude, String? longitude, int? tipo
      ) async{
    final db = await DatabaseHelper.getDataBase();

    final dadosRestaurante = {
      'nm_restaurante': nome,
      'latitude_restaurante': latitude,
      'longitude_restaurante': longitude,
      'cd_tipo': tipo,
      'cd_usuario': UsuarioDAO.usuarioLogado.codigo
    };

    try{
      final idRestaurante = await db.insert('db_restaurante', dadosRestaurante);
      return idRestaurante;
    }catch(e){
      print("Erro ao cadastrar: $e");
      return -1;
    }
  }
}


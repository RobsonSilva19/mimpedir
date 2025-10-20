import 'package:flutter/material.dart';
import 'package:mimpedir1/banco/database_helper.dart';
import 'package:mimpedir1/restaurante.dart';
import 'package:mimpedir1/banco/tipo_DAO.dart';
import 'package:mimpedir1/tipo.dart';
import 'package:mimpedir1/banco/restaurante_DAO.dart';
import 'package:mimpedir1/tela_home.dart';



class TelaEditarRestaurante extends StatefulWidget{
  static Restaurante restaurante = Restaurante();

  @override
  State<StatefulWidget> createState() {
    return TelaEditarRestauranteState();
  }
}

class TelaEditarRestauranteState extends State<TelaEditarRestaurante>{

  final TextEditingController cdController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  String? culinariaSelecionada;
  List<Tipo> tiposCulinaria = [];
  int? tipoCulinaria;
  int? codigo = TelaEditarRestaurante.restaurante.codigo as int;

  void initState(){
    super.initState();
    carregarTipos();
    cdController.text = TelaEditarRestaurante.restaurante.codigo.toString()!;
    nomeController.text = TelaEditarRestaurante.restaurante.nome!;
    latitudeController.text = TelaEditarRestaurante.restaurante.latitude!;
    longitudeController.text = TelaEditarRestaurante.restaurante.longitude!;
    culinariaSelecionada = TelaEditarRestaurante.restaurante.tipoCulinaria?.descricao!;
  }

  Future<void> carregarTipos() async{
    final lista = await TipoDAO.listarTipos();
    setState(() {
      tiposCulinaria = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar Restaurante")),
      body: Padding(padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Informaçôes do Restaurante"),
            SizedBox(height: 40),
            Text('CODIGO'),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'CODIGO'),
              validator: (String? value) {},
              controller: cdController,
              enabled: false,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Nome do Restaurante'),
              validator: (String? value) {},
            ),
            SizedBox(height: 10),
            Text("Tipo de comida: "),
            DropdownButtonFormField<String>(
                value: culinariaSelecionada,
                items: tipoCulinaria.map((tipo){
                  return DropdownMenuItem<String>(
                    value: tipo.descricao,
                    child: Text("${tipo.descricao}"),
                  );
                }),
                onChanged: (value) {}),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Latitude'),
                validator: (String? value) {},
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Longitude'),
                validator: (String? value) {},
              ),
              SizedBox(height: 50),
              ElevatedButton(onPressed: () {
                RestauranteDAO.atualizar();
                setState(() {

                });
                Navigator.pop(context);
              }, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.save),
                  Text("Salvar")
                ],
              ))
          ],
        ),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:zeitplan/domain/usecase/lista_contatos.dart';
import 'package:zeitplan/domain/entity/contato.dart';

import '../../model/contato.dart' as contato_model;

class ListaContatoApi implements ListaContatos {

  @override
  Future<List<Contato>> lista() async{
    final client = Dio();
    final response = await client.get("http://jsonplaceholder.typicode.com/users");
    final List<Contato> listaContatos = [];
    for (var element in response.data) {
      listaContatos.add(
          Contato(element["name"],
              element["email"], element["phone"]));
    }
    return listaContatos;
  }

}
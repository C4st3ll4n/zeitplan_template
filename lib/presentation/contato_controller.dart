import 'package:get/get.dart';
import 'package:zeitplan/data/usecase/lista_contatos/lista_contato_api.dart';

import '../domain/entity/contato.dart';

class ContatoController extends GetxController{
  final usecase = ListaContatoApi();

  final RxList<Contato> _data = RxList([]);

  Stream<List<Contato>> get contatoStream => _data.stream;

  void listarContatos() async{
    final resposta = await usecase.lista();
    _data.addAll(resposta);
  }
}
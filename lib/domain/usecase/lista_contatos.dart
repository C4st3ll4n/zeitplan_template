import 'package:zeitplan/domain/entity/contato.dart';

abstract class ListaContatos{
  Future<List<Contato>> lista() async {
    // TODO: implement lista
    throw UnimplementedError();
  }
}
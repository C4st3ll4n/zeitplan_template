import 'package:zeitplan/domain/entity/contato.dart';

class Contato{

  final String nome;
  final String email;
  final String telefone;

  Contato(this.nome, this.email, this.telefone);

  Contato parse(){
    return Contato(nome, telefone, email);
  }
}
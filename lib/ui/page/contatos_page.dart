import 'package:flutter/material.dart';
import 'package:zeitplan/infra/phone_call/phone_call_adapter.dart';

import '../../domain/entity/contato.dart';
import '../../presentation/contato_controller.dart';

class ContatosPage extends StatefulWidget {
  const ContatosPage({Key? key}) : super(key: key);

  @override
  State<ContatosPage> createState() => _ContatosPageState();
}

class _ContatosPageState extends State<ContatosPage> {

  final controller = ContatoController();
  final phoneCall = PhoneCallAdapter();

  @override
  Widget build(BuildContext context) {

    controller.listarContatos();

    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      body: Builder(builder:(BuildContext buildContext){
        return StreamBuilder<List<Contato>>(
          stream: controller.contatoStream,
          builder:
            (BuildContext context, AsyncSnapshot<List<Contato>> snapshot) {

            if(snapshot.data == null){
              return Center(child: CircularProgressIndicator());
            }

            if(snapshot.data!.isEmpty){
              return Center(child: Text("Não há dados"),);
            }

            if(snapshot.hasError){
              return Center(child: Text("Algo deu errado"),);
            }

              return ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext contexto, int indice){
                    final contato = snapshot.data![indice];
                    return ListTile(
                      title: Text(contato.nome),
                      leading: IconButton(
                        icon: const Icon(Icons.phone), onPressed: () {
                          phoneCall.call(contato.telefone);
                      },
                      ),
                    );
              });
        },);
      }),
    );
  }
}

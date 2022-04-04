import 'package:flutter/material.dart';
import 'package:yetu_gestor/dominio/entidades/saida.dart';

class ItemSaida extends StatelessWidget {
  final Saida saida;
  final bool visaoGeral;
  final Function aoClicar;
  ItemSaida({
    Key? key,
    required this.saida,
    required this.aoClicar,
    required this.visaoGeral,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Quantidade: ${saida.quantidade ?? 0}"),
            Text(
                "Data da Entrada: ${saida.data.toString().replaceAll(" ", " às ").replaceAll(".000", "")}"),
            Text("Motivo: ${saida.motivo ?? "Sem Motivo"}"),
            Visibility(
                visible: visaoGeral,
                child: Text("Produto: ${saida.produto?.nome ?? "Nenhum"}")),
          ],
        ),
      ),
    );
  }
}

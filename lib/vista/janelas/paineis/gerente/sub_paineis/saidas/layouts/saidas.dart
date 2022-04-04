import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/vista/componentes/item_saida.dart';
import '../../../../../../componentes/item_entrada.dart';
import 'saidas_c.dart';

class LayoutSaidas extends StatelessWidget {
  late SaidasC _c;
  final bool visaoGeral;
  LayoutSaidas({required this.visaoGeral}) {
    _c = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () {
          var itens = _c.lista
              .map((saida) => ItemSaida(
                    visaoGeral: visaoGeral,
                    saida: saida,
                    aoClicar: () {},
                  ))
              .toList();
          if (itens.isEmpty) {
            return Center(child: Text("Sem saídas!"));
          }
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: itens,
            ),
          );
        },
      ),
    );
  }
}

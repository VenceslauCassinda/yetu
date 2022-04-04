import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../componentes/item_entrada.dart';
import 'entradas_c.dart';

class LayoutEntradas extends StatelessWidget {
  late EntradasC _c;
  final bool visaoGeral;
  LayoutEntradas({required this.visaoGeral}) {
    _c = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () {
          var itens = _c.lista
              .map((entrada) => ItemEntrada(
                    visaoGeral: visaoGeral,
                    entrada: entrada,
                    aoClicar: () {},
                  ))
              .toList();
          if (itens.isEmpty) {
            return Center(child: Text("Sem entradas!"));
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

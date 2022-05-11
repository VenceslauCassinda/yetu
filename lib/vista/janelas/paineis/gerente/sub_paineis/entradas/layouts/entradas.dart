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
    return Obx(
      () {
        if (_c.lista.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: LinearProgressIndicator(),
          );
        }
        var itens = _c.lista
            .map((entrada) => ItemEntrada(
                  visaoGeral: visaoGeral,
                  entrada: entrada,
                  aoClicar: () {},
                ))
            .toList();
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(itemCount: itens.length,itemBuilder: (c, i) => itens[i]),
          ),
        );
      },
    );
  }
}

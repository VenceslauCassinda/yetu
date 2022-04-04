import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/vista/componentes/item_saida.dart';
import 'vendas_c.dart';

class LayoutVendas extends StatelessWidget {
  late VendasC _c;
  final bool visaoGeral;
  LayoutVendas({required this.visaoGeral}) {
    _c = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () {
          var itens = _c.lista.map((venda) => Text("data")).toList();
          if (itens.isEmpty) {
            return Center(child: Text("Sem Vendas!"));
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

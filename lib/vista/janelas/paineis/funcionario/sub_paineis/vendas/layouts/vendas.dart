import 'package:componentes_visuais/componentes/icone_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/dominio/entidades/item_venda.dart';
import 'package:yetu_gestor/dominio/entidades/venda.dart';
import 'package:yetu_gestor/solucoes_uteis/console.dart';
import 'package:yetu_gestor/vista/componentes/item_saida.dart';
import '../../../../../../componentes/item_modelo_venda.dart';
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
          var itens = _c.lista
              .map((venda) => ItemModeloVenda(c: _c, venda: venda,))
              .toList();
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

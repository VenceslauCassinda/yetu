import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/layouts/produtos/produtos_c.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/painel_gerente_c.dart';

class PainelProdutos extends StatelessWidget {
  late ProdutosC _c;
  PainelProdutos() {
    _c = Get.put(ProdutosC());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _c.lista.map((element) => Text("s")).toList(),
          ),
        ),
      ),
    );
  }
}

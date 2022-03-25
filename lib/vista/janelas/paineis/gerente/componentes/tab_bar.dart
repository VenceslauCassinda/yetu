import 'package:flutter/material.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/painel_gerente_c.dart';

import '../../../../../recursos/constantes.dart';

class ModeloTabBar extends StatelessWidget {
  final PainelGerenteC _c;
  const ModeloTabBar({
    Key? key,
    required PainelGerenteC c,
  })  : _c = c,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          tabBarTheme: const TabBarTheme(
              indicator: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              labelColor: branca,
              unselectedLabelColor: primaryColor)),
      child: DefaultTabController(
        length: 3,
        child: TabBar(
            onTap: (valor) async {
              await _c.navegar(valor);
            },
            tabs: [
              Tab(
                child: Text("Todos"),
              ),
              Tab(child: Text("Activos")),
              Tab(child: Text("Desactivos")),
            ]),
      ),
    );
  }
}

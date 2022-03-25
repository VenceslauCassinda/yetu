import 'package:flutter/material.dart';

import '../../../../../recursos/constantes.dart';
import '../painel_administrador_c.dart';

class ModeloTabBar extends StatelessWidget {
  final PainelAdministradorC _c;
  const ModeloTabBar({
    Key? key,
    required PainelAdministradorC c,
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
        length: 4,
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
              Tab(
                  child: Text(
                "Eliminados",
                overflow: TextOverflow.ellipsis,
              )),
            ]),
      ),
    );
  }
}
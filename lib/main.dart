import 'package:flutter/material.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/base_dados.dart';
import 'package:yetu_gestor/vista/aplicacao.dart';
import 'package:sqlite3/open.dart';

import 'fonte_dados/padrao_dao/configuracao.dart';

void main() async {
  open.overrideFor(OperatingSystem.windows, openOn);
  runApp(Aplicacao());
}

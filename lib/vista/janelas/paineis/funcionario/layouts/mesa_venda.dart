import 'package:componentes_visuais/componentes/butoes.dart';
import 'package:flutter/material.dart';
import 'package:yetu_gestor/vista/janelas/paineis/funcionario/sub_paineis/layouts/vendas_c.dart';

import '../../../../../dominio/entidades/produto.dart';
import '../../../../../recursos/constantes.dart';
import '../../../../componentes/pesquisa.dart';
import '../../gerente/sub_paineis/produtos/layouts/produtos.dart';

class LayoutMesaVenda extends StatelessWidget {
  final VendasC _c;
  LayoutMesaVenda(this._c);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      child: FutureBuilder<List<Produto>>(
          future: _c.pegarLista(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return CircularProgressIndicator();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            child: LayoutPesquisa(
                              accaoNaInsercaoNoCampoTexto: (dado) {},
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .5,
                            child: SingleChildScrollView(
                              child: LayoutProdutos(
                                lista: snapshot.data!,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(.2)),
                            borderRadius: BorderRadius.circular(7)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        "Cliente: ",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 300,
                                      child: TextField(
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text("Telefone: ",
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 300,
                                      child: TextField(
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("Total a Pagar: 0KZ"),
                                Spacer(),
                                ModeloButao(
                                  corButao: primaryColor,
                                  corTitulo: Colors.white,
                                  butaoHabilitado: true,
                                  tituloButao: "Pagar",
                                  icone: Icons.add,
                                  metodoChamadoNoClique: () {
                                    _c.mostrarFormasPagamento(context, accaoAoFinalizar: (valor, opcao){
                                      
                                    });
                                  },
                                )
                              ],
                            ),
                            Container(width: 200, child: Divider()),
                            Text("Total Pago: 0KZ"),
                            Container(width: 200, child: Divider()),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                ModeloButao(
                  corButao: primaryColor,
                  corTitulo: Colors.white,
                  butaoHabilitado: true,
                  tituloButao: "Finalizar Venda",
                  metodoChamadoNoClique: () {},
                ),
              ],
            );
          }),
    );
  }

}

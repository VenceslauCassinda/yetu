import 'package:componentes_visuais/componentes/butoes.dart';
import 'package:componentes_visuais/componentes/formatos/formatos.dart';
import 'package:componentes_visuais/componentes/icone_item.dart';
import 'package:componentes_visuais/componentes/selector_numero.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/solucoes_uteis/formato_dado.dart';
import 'package:yetu_gestor/vista/janelas/paineis/funcionario/layouts/mesa_venda_c.dart';
import 'package:yetu_gestor/vista/janelas/paineis/funcionario/sub_paineis/layouts/vendas_c.dart';
import '../../../../../dominio/entidades/produto.dart';
import '../../../../../recursos/constantes.dart';
import '../../../../componentes/pesquisa.dart';
import '../../gerente/sub_paineis/produtos/layouts/produtos.dart';

class LayoutMesaVenda extends StatelessWidget {
  late VendasC _vendasC;
  late MesaVendaC _c;
  Map<String, TextEditingController> controladores = {};

  LayoutMesaVenda() {
    _c = MesaVendaC();
    initiC();
  }

  initiC() {
    try {
      _c = Get.find();
    } catch (e) {
      _vendasC = Get.put(VendasC());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      child: FutureBuilder<List<Produto>>(
          future: _vendasC.pegarLista(),
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
                                lista: snapshot.data ?? [],
                                accaoAoClicarCadaProduto: (produto) {
                                  _c.adicionarProdutoAmesa(produto);
                                  controladores["${produto.id}1"] =
                                      TextEditingController(text: "0");
                                  controladores["${produto.id}2"] =
                                      TextEditingController(text: "0");
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(.2)),
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
                                              style: TextStyle(fontSize: 20),
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ]),
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
                                    Obx(
                                      () => Text(
                                          "Total a Pagar: ${formatar(_c.listaItensVenda.fold<double>(0, (previousValue, element) => ((element.total ?? 0) + previousValue)))} KZ"),
                                    ),
                                    Spacer(),
                                    ModeloButao(
                                      corButao: primaryColor,
                                      corTitulo: Colors.white,
                                      butaoHabilitado: true,
                                      tituloButao: "Pagar",
                                      icone: Icons.add,
                                      metodoChamadoNoClique: () {
                                        _c.mostrarFormasPagamento(context);
                                      },
                                    )
                                  ],
                                ),
                                Container(width: 200, child: Divider()),
                                Row(
                                  children: [
                                    Obx(() => Text(
                                        "Total Pago: ${formatar(_c.listaPagamentos.fold<double>(0, (previousValue, element) => ((element.valor ?? 0) + previousValue)))} KZ")),
                                    Spacer(),
                                    Text("Data de levantamento: "),
                                    Obx(() {
                                      return ToggleButtons(
                                          selectedColor: primaryColor,
                                          onPressed: (i) {
                                            _c.mudarData(i, context);
                                          },
                                          children: [
                                            Text("Hoje"),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(_c.dataLevantamento
                                                          .value ==
                                                      null
                                                  ? "Seleccionar"
                                                  : "${formatarMesOuDia(_c.dataLevantamento.value!.day)}/${formatarMesOuDia(_c.dataLevantamento.value!.month)}/${_c.dataLevantamento.value!.year}"),
                                            ),
                                          ],
                                          isSelected: _c.hojeOuData);
                                    })
                                  ],
                                ),
                                Obx(() => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: _c.listaPagamentos
                                          .map((element) => Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "${formatar(element.valor ?? 0)} KZ - Pago com ${element.formaPagamento?.descricao ?? "[Não Definido]"}"),
                                                  IconeItem(
                                                      metodoQuandoItemClicado:
                                                          () {
                                                        _c.removerPagamento(
                                                            element);
                                                      },
                                                      icone: Icons.delete,
                                                      titulo: ""),
                                                ],
                                              ))
                                          .toList(),
                                    )),
                                Container(width: 200, child: Divider()),
                              ],
                            ),
                          ),
                          Obx(
                            () => Container(
                              height: MediaQuery.of(context).size.height * .3,
                              padding: EdgeInsets.all(20),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: _c.listaItensVenda
                                      .map((element) => Container(
                                            height: 100,
                                            width: double.infinity,
                                            child: Card(
                                              elevation: 4,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 200,
                                                      child: Text(element
                                                          .produto!.nome!),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text("Quantidade: "),
                                                    NumberTextField(
                                                      controller: controladores[
                                                          "${element.idProduto}1"]!,
                                                      arrowsWidth: 40,
                                                      arrowsHeight: 25,
                                                      contentPadding:
                                                          EdgeInsets.all(4),
                                                      aoDigitar: (valor) {
                                                        _c.definirQuantidade(
                                                          valor,
                                                          element,
                                                          controladores[
                                                              "${element.idProduto}1"]!,
                                                          controladores[
                                                              "${element.idProduto}2"]!,
                                                        );
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      width: 80,
                                                      child: Text(
                                                          "Preço: ${element.produto!.listaPreco!.isEmpty ? "Nenhum" : formatar(element.produto!.listaPreco![0])}"),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text("Desconto(%): "),
                                                    Container(
                                                      height: 30,
                                                      width: 40,
                                                      margin: EdgeInsets.only(
                                                          bottom: 10),
                                                      child: TextField(
                                                        controller: controladores[
                                                            "${element.idProduto}2"]!,
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .digitsOnly
                                                        ],
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                        onChanged: (valor) {
                                                          _c.descontar(
                                                            int.tryParse(valor),
                                                            element,
                                                            controladores[
                                                                "${element.idProduto}2"]!,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                          "Total: ${formatar(element.total ?? 0)} KZ"),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ),
                          )
                        ],
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

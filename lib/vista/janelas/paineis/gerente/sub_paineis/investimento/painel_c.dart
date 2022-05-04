import 'package:componentes_visuais/componentes/layout_confirmacao_accao.dart';
import 'package:componentes_visuais/dialogo/dialogos.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_funcionario_i.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_produto_i.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_receccao_i.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_saida_i.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipula_stock.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_entrada.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_preco.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_produto.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_receccao.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_saida.dart';
import 'package:yetu_gestor/dominio/entidades/entrada.dart';
import 'package:yetu_gestor/dominio/entidades/painel_actual.dart';
import 'package:yetu_gestor/dominio/entidades/produto.dart';
import 'package:yetu_gestor/dominio/entidades/saida.dart';
import 'package:yetu_gestor/dominio/entidades/stock.dart';
import 'package:yetu_gestor/fonte_dados/erros.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_entrada.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_funcionario.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_preco.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_produto.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_receccao.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedores_usuario.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/layouts/layout_quantidade.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/painel_gerente_c.dart';

import '../../../../../../../contratos/casos_uso/manipular_stock_i.dart';
import '../../../../../../../dominio/casos_uso/manipular_fincionario.dart';
import '../../../../../../../dominio/casos_uso/manipular_usuario.dart';
import '../../../../../../../dominio/entidades/estado.dart';
import '../../../../../../../fonte_dados/provedores/provedor_saida.dart';
import '../../../../../../../fonte_dados/provedores/provedor_stock.dart';
import '../../../../../../../recursos/constantes.dart';
import '../../../../../aplicacao_c.dart';
import '../../layouts/layout_produto.dart';

class PainelInvestimentoC extends GetxController {
  var lista = RxList<Produto>();
  late ManipularProdutoI _manipularProdutoI;
  late ManipularStockI _manipularStockI;
  late ManipularRececcaoI _manipularRececcaoI;
  late ManipularFuncionarioI _manipularFuncionarioI;
  late ManipularSaidaI _manipularSaidaI;
  var indiceTabActual = 1.obs;

  var totalInvestido = 0.0.obs;
  PainelInvestimentoC() {
    _manipularStockI = ManipularStock(ProvedorStock());
    _manipularProdutoI = ManipularProduto(
        ProvedorProduto(), _manipularStockI, ManipularPreco(ProvedorPreco()));
    _manipularRececcaoI = ManipularRececcao(ProvedorRececcao(),
        ManipularEntrada(ProvedorEntrada(), _manipularStockI));
    _manipularFuncionarioI = ManipularFuncionario(
        ManipularUsuario(ProvedorUsuario()), ProveedorFuncionario());
    _manipularSaidaI = ManipularSaida(ProvedorSaida(), _manipularStockI);
  }
  @override
  void onInit() async {
    await pegarActivos();
    super.onInit();
  }

  Future<void> pegarTodos() async {
    lista.clear();
    var res = await _manipularProdutoI.pegarLista();
    for (var cada in res) {
      lista.add(cada);
    }
  }

  Future<void> pegarActivos() async {
    lista.clear();
    var res = await _manipularProdutoI.pegarLista();
    for (var cada in res) {
      if (cada.estado == Estado.ATIVADO) {
        lista.add(cada);
      }
    }
  }

  Future<void> pegarDesactivos() async {
    lista.clear();
    var res = await _manipularProdutoI.pegarLista();
    for (var cada in res) {
      if (cada.estado == Estado.DESACTIVADO) {
        lista.add(cada);
      }
    }
  }

  Future<void> pegarElimindados() async {
    lista.clear();
    var res = await _manipularProdutoI.pegarLista();
    for (var cada in res) {
      if (cada.estado == Estado.ELIMINADO) {
        lista.add(cada);
      }
    }
  }

  Future<void> navegar(int tab) async {
    indiceTabActual.value = tab;
    if (tab == 0) {
      await pegarTodos();
    }
    if (tab == 1) {
      await pegarActivos();
    }
    if (tab == 2) {
      await pegarDesactivos();
    }
    if (tab == 3) {
      await pegarElimindados();
    }
  }

  void mostrarDialogoAdicionarProduto() {
    mostrarDialogoDeLayou(LayoutProduto(
      accaoAoFinalizar: (nome, precoCompra, precoVenda) async {
        await _adicionarProduto(nome, precoCompra, precoVenda);
      },
    ));
  }

  void mostrarDialogoReceber(Produto produto) {
    mostrarDialogoDeLayou(LayoutQuantidade(
        comOpcaoRetirada: false,
        accaoAoFinalizar: (quantidade, opcaoRetiradaSelecionada) async {
          var motivo = Entrada.MOTIVO_ABASTECIMENTO;
          await _receberProduto(produto, quantidade, motivo);
        },
        titulo: "Receber produto ${produto.nome}"));
  }

  Future<void> _receberProduto(
      Produto produto, String quantidade, String motivo) async {
    AplicacaoC aplicacaoC = Get.find();
    var funcionario = await _manipularFuncionarioI
        .pegarFuncionarioDoUsuarioDeId((aplicacaoC.pegarUsuarioActual())!.id!);
    await _manipularRececcaoI.receberProduto(
        produto, int.parse(quantidade), funcionario, motivo);
    _somarQuantidadeProduto(produto, quantidade);
  }

  void mostrarDialogoAumentar(Produto produto) {
    mostrarDialogoDeLayou(LayoutQuantidade(
        comOpcaoRetirada: false,
        accaoAoFinalizar: (quantidade, o) async {
          var motivo = Entrada.MOTIVO_AJUSTE_STOCK;
          await _receberProduto(produto, quantidade, motivo);
        },
        titulo: "Aumentar quantidade do produto ${produto.nome}"));
  }

  void mostrarDialogoRetirar(Produto produto) {
    mostrarDialogoDeLayou(LayoutQuantidade(
        comOpcaoRetirada: true,
        accaoAoFinalizar: (quantidade, opcaoRetiradaSelecionada) async {
          await _retirarProduto(produto, quantidade, opcaoRetiradaSelecionada!);
        },
        titulo: "Retirar quantidade do produto ${produto.nome}"));
  }

  void _somarQuantidadeProduto(Produto produto, String quantidade) {
    for (var i = 0; i < lista.length; i++) {
      if (lista[i].id == produto.id) {
        produto.stock!.quantidade =
            ((lista[i].stock!.quantidade! + int.parse(quantidade)));
        lista[i] = produto;
        fecharDialogoCasoAberto();
        break;
      }
    }
  }

  void _subtrairQuantidadeProduto(Produto produto, String quantidade) {
    for (var i = 0; i < lista.length; i++) {
      if (lista[i].id == produto.id) {
        produto.stock!.quantidade =
            ((lista[i].stock!.quantidade! - int.parse(quantidade)));
        lista[i] = produto;
        fecharDialogoCasoAberto();
        break;
      }
    }
  }

  void _alterarProduto(Produto produto) {
    for (var i = 0; i < lista.length; i++) {
      if (lista[i].id == produto.id) {
        lista[i] = produto;
        fecharDialogoCasoAberto();
        break;
      }
    }
  }

  void mostrarDialogoActualizarProduto(Produto produto) {
    mostrarDialogoDeLayou(LayoutProduto(
      produto: produto,
      accaoAoFinalizar: (nome, precoCompra, precoVenda) async {
        await _actualizarProduto(nome, precoCompra, precoVenda, produto);
      },
    ));
  }

  void mostrarDialogoEliminarProduto(Produto produto) {
    mostrarDialogoDeLayou(LayoutConfirmacaoAccao(
        corButaoSim: primaryColor,
        pergunta: "Deseja mesmo eliminar o Produto ${produto.nome}",
        accaoAoConfirmar: () async {
          await _manipularProdutoI.removerProduto(produto);
          await _eliminarProduto(produto);
        },
        accaoAoCancelar: () {}));
  }

  void recuperarProduto(Produto produto) async {
    await _manipularProdutoI.recuperarProduto(produto);
    _eliminarProduto(produto);
  }

  void activarProduto(Produto produto) async {
    await _manipularProdutoI.activarProduto(produto);
    _eliminarProduto(produto);
  }

  void desactivarProduto(Produto produto) async {
    await _manipularProdutoI.desactivarrProduto(produto);
    _eliminarProduto(produto);
  }

  Future<void> _eliminarProduto(Produto produto) async {
    lista.removeWhere((element) => element.id == produto.id);
    fecharDialogoCasoAberto();
  }

  Future<void> _adicionarProduto(
    String nome,
    String precoCompra,
    String precoVenda,
  ) async {
    try {
      var novoProduto =
          Produto(nome: nome, precoCompra: double.parse(precoCompra));
      var id = await _manipularProdutoI.adicionarProduto(novoProduto);
      novoProduto.id = id;
      await _manipularProdutoI.adicionarPrecoProduto(
          novoProduto, double.parse(precoVenda));
      novoProduto.listaPreco = [double.parse(precoVenda)];
      novoProduto.stock = Stock.zerado();
      lista.add(novoProduto);
      fecharDialogoCasoAberto();
    } on Erro catch (e) {
      mostrarDialogoDeInformacao(e.sms);
    }
  }

  Future<void> _actualizarProduto(String nome, String precoCompra,
      String precoVenda, Produto produto) async {
    try {
      for (var i = 0; i < lista.length; i++) {
        if (lista[i].id == produto.id) {
          produto.nome = nome;
          produto.precoCompra = double.parse(precoCompra);
          produto.listaPreco = [double.parse(precoVenda)];
          lista[i] = produto;
          await _manipularProdutoI.actualizarProduto(produto);
          await _manipularProdutoI.atualizarPrecoProduto(
              produto, double.parse(precoVenda));
          fecharDialogoCasoAberto();
          break;
        }
      }
    } on Erro catch (e) {
      mostrarDialogoDeInformacao(e.sms);
    }
  }

  void terminarSessao() {
    AplicacaoC.terminarSessao();
  }

  Future<void> _retirarProduto(Produto produto, String quantidade,
      String opcaoRetiradaSelecionada) async {
    try {
      var data = DateTime.now();
      await _manipularSaidaI.registarSaida(Saida(
          idProduto: produto.id,
          quantidade: int.parse(quantidade),
          estado: Estado.ATIVADO,
          data: data,
          motivo: opcaoRetiradaSelecionada));
      _subtrairQuantidadeProduto(produto, quantidade);
    } on Erro catch (e) {
      mostrarDialogoDeInformacao(e.sms);
    }
  }

  void verEntradas(Produto produto) {
    PainelGerenteC c = Get.find();
    c.irParaPainel(PainelActual.ENTRADAS, valor: produto);
  }

  void verSaidas(Produto produto) {
    PainelGerenteC c = Get.find();
    c.irParaPainel(PainelActual.SAIDAS, valor: produto);
  }
}

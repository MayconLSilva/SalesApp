import 'package:SalesApp/model/ClienteModel.dart';
import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

class ClienteEnderecoDialog extends StatefulWidget {
  //Inicio do código ref. ao controller
  late TextEditingController _cepController;
  late TextEditingController _cidadeController;
  late TextEditingController _regiaoController;
  late TextEditingController _enderecoController;
  late TextEditingController _numeroenderecoController;
  late TextEditingController _bairroController;

  ClienteEnderecoDialog(int idCliente){
    print('Tela cadastro de endereço, recuperando o código do cliente  $idCliente');

    int _idCliente = idCliente;
    _cepController = new TextEditingController();
    _cidadeController = new TextEditingController();
    _regiaoController = new TextEditingController();
    _enderecoController = new TextEditingController();
    _numeroenderecoController = new TextEditingController();
    _bairroController = new TextEditingController();

  }

  @override
  ClienteEnderecoDialogState createState() => new ClienteEnderecoDialogState();
}

class ClienteEnderecoDialogState extends State<ClienteEnderecoDialog>{
  @override
  Widget build(BuildContext context) {

    //Inicio do código ref. ao tamanho dos campos
    final tamanhoDaTela = MediaQuery
        .of(context)
        .size
        .width / 3.3;
    final tamanhoCampoNumero = tamanhoDaTela;
    final tamanhoCampoEndereco = tamanhoDaTela * 2;
    //Fim do código ref. ao tamanho dos campos

    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Endereços'),
            actions: [
              //Inicio do código método salvar
              TextButton.icon(
                label: Text('SALVAR'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 15,
                  ),
                  primary: Colors.white,
                ),
                icon: Icon(
                  Icons.save_outlined,
                  color: Colors.white,
                  size: 30.0,
                ),
                //MÉTODO CHAMA O BOTÃO SALVAR
                onPressed: () {

                },
                //FIM DO MÉTODO CHAMA O BOTÃO SALVAR
              ),
              //Fim do código método salvar

              //BUSCA ENDEREÇO PELO CEP
              TextButton.icon(
                label: Text('CEP'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 15,
                  ),
                  primary: Colors.white,
                ),
                icon: Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: 30.0,
                ),
                //MÉTODO CHAMA A PESQUISA DE ENDEREÇO PELO CEP
                onPressed: () {

                },
                //FIM DO MÉTODO CHAMA A PESQUISA DE ENDEREÇO PELO CEP
              ),

            ],
        ),
      ///> INICIO DOS CAMPOS DA TELA "BODY" <///
        body:
          SingleChildScrollView(
            child: Stack(
                children: <Widget>[
                  new Container(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                        child: Column(
                            children: <Widget>[
                              //Chamo cada campo separadamento
                              buildTextFormFieldCEP(),
                              buildTextFormFieldCidade(),
                              buildDropdownButtonFormFieldRegiao(),

                              //INICIO DO CÓDIGO QUE DEIXO A ROW COM DUAS COLUNAS
                              Container(
                                alignment: Alignment.topCenter,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        alignment: Alignment.topCenter,
                                        //width: 200,
                                        width: tamanhoCampoEndereco,
                                        child: buildTextFormFieldEndereco()
                                    ),
                                    Container(
                                        alignment: Alignment.topCenter,
                                        margin: const EdgeInsets.only(left: 5.0),
                                        width: tamanhoCampoNumero,
                                        //width: halfMediaWidth,
                                        child: buildTextFormFieldEnderecoNumero()
                                    ),
                                  ],
                                ),
                              ),
                              //FIM DO CÓDIGO QUE DEIXO A ROW COM DUAS COLUNAS

                              buildTextFormFieldBairro()

                            ],
                        ),
                    ),
                  ),
                ],
            ),
          ),
      ///> FIM DOS CAMPOS DA TELA "BODY" <///
    );
  }

//Inicio do código ref aos campos
  TextFormField buildTextFormFieldCEP() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        // obrigatório
        FilteringTextInputFormatter.digitsOnly,
        CepInputFormatter(),
      ],
      maxLength: 10,
      decoration: InputDecoration(
        icon: Icon(
          Icons.location_city,
          color: Colors.grey[600],
          size: 30.0,
        ),
        labelText: "CEP",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Informe seu CEP!';
        }
        return null;
      },
    );
  }

  TextFormField buildTextFormFieldCidade() {
    return TextFormField(
      keyboardType: TextInputType.text,
      maxLength: 15,
      decoration: InputDecoration(
        icon: Icon(
          Icons.location_city,
          color: Colors.grey[600],
          size: 30.0,
        ),
        labelText: "Cidade",
        //labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Informe a cidade do cliente!';
        }
        return null;
      },
    );
  }

  DropdownButtonFormField buildDropdownButtonFormFieldRegiao() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        //border: OutlineInputBorder(borderRadius: const BorderRadius.all(const Radius.circular(30.0),),), //Borda da combobox
        //filled: true, //Cor de fundo da combobox
        //hintStyle: TextStyle(color: Colors.grey[800]),
          labelText: "Região",
          icon: Icon(
            Icons.location_city,
            color: Colors.grey[600],
            size: 30.0,
          ),
          hintText: "Região",
          fillColor: Colors.blue[200]),
      onChanged: (regiaoSelecionada) {
        print(regiaoSelecionada);
      },
      items: Regioes.listaRegioes.map((String regiao) {
        return DropdownMenuItem(
          value: regiao,
          child: Text(regiao),
        );
      }).toList(),
    );
  }

  TextFormField buildTextFormFieldEndereco() {
    return TextFormField(
      keyboardType: TextInputType.text,
      maxLength: 30,
      decoration: InputDecoration(
        labelText: "Endereço",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Informe o endereço do cliente!';
        }
        return null;
      },
    );
  }

  TextFormField buildTextFormFieldEnderecoNumero() {
    return TextFormField(
      keyboardType: TextInputType.text,
      maxLength: 5,
      decoration: InputDecoration(
        //icon:Icon(Icons.location_city_outlined), //Icone fora do campo
        labelText: "Nº",
        //labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Informe o número do endereço do cliente!';
        }
        return null;
      },
    );
  }

  TextFormField buildTextFormFieldBairro() {
    return TextFormField(
      keyboardType: TextInputType.text,
      maxLength: 60,
      decoration: InputDecoration(
        icon: Icon(
          Icons.location_city_outlined,
          color: Colors.grey[600],
          size: 30.0,
        ),
        labelText: "Bairro",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Informe o bairro do cliente!';
        }
        return null;
      },
    );
  }
//Fim do código ref aos campos

}
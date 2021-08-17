import 'package:SalesApp/adapter/DataBaseHelper.dart';
import 'package:SalesApp/control/ClienteControl.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:SalesApp/clientes.dart';
import 'package:SalesApp/model/ClienteModel.dart';
import 'package:SalesApp/control/ClienteControl2.dart';

class NovoClienteDialog extends StatefulWidget {
  @override
  NovoClienteDialogState createState() => new NovoClienteDialogState();

}

class NovoClienteDialogState extends State<NovoClienteDialog> {
  //Inicio os métodos controller
  late TextEditingController _nomeController;
  late TextEditingController _emailController;
  // TextEditingController _foneController;

  @override
  Widget build(BuildContext context) {
    final tamanhoDaTela = MediaQuery.of(context).size.width / 3.3;
    final tamanhoCampoNumero = tamanhoDaTela ;
    final tamanhoCampoEndereco = tamanhoDaTela * 2;

    _nomeController = TextEditingController();
    _emailController = TextEditingController();

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Novo Cliente'),
        actions: [

          //MÉTODO ICON/TEXT BOTÃO SALVAR
          TextButton.icon(
            label: Text('SALVAR'),
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                  fontSize: 15,
                  //fontStyle: FontStyle.italic

              ),
              primary: Colors.white, //COR DO TEXTO DO BOTÃO
              //backgroundColor: Colors.red, //COR DO BOTÃO
              //elevation: 1, //SOMBRA DO BOTÃO
              //side: BorderSide(color: Colors.blue, width: 5),
              //shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            //icon: Icon(Icons.save_outlined),
            icon:Icon(
              Icons.save_outlined,
              color: Colors.white,
              size: 30.0,
            ),
            //MÉTODO CHAMA O BOTÃO SALVAR
            onPressed: (){
              //SalvarRegistro();
              SalvarCliente();
            },
            //FIM DO MÉTODO CHAMA O BOTÃO SALVAR
          ),
          //FIM MÉTODO ICON/TEXT BOTÃO SALVAR

        ],

      ),


 /////////////////////////////////////////////////INICIO DO CÓDIGO DOS CAMPOS/////////////////////////////////////////////////
      body: SingleChildScrollView(
        child: Stack(
            children: <Widget>[
              new Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[

                        buildTextFormFieldNome(),
                        buildTextFormFieldCPF(),
                        buildTextFormFieldEmail(),
                        buildDropdownButtonFormFieldRegiao(),
                        buildTextFormFieldCidade(),
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
/////////////////////////////////////////////////FIM DO CÓDIGO DOS CAMPOS/////////////////////////////////////////////////

    );
  }


  TextFormField buildTextFormFieldNome() {
    return TextFormField(
      keyboardType: TextInputType.text,
      maxLength: 50,
      //initialValue: 'marcio@ ...', //Posso colocar um valor inicial no campo
      //cursorColor: Colors.deepOrange, //Cor do curso no campo
      controller: _nomeController,
      decoration: InputDecoration(
        //prefixIcon: Icon(Icons.face_outlined), //Icone dentro do campo
        //icon:Icon(Icons.supervisor_account_outlined), //Icone fora do campo
        icon:Icon(
          Icons.supervisor_account_outlined,
          color: Colors.grey[600],
          size: 30.0,
        ),
        //helperText: 'Helper text', //Pode colocar um label abaixo do campo
        //suffixIcon: Icon(Icons.check_circle,), //Pode colocar um sufixo, icone no final do campo
        //filled: true, //Deixa o fundo do text mais escuro
        //fillColor: Colors.grey[200],
        //border: OutlineInputBorder(),//Circula o campo com uma borda
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(60)), //Circula o campo com uma borda redonda
        //contentPadding: EdgeInsetsDirectional.only(top: 10.0, bottom: 20.0, start: 5.0, end: 5.0), //Tamanho, top do campo
        labelText: "Nome",
        //hintText: "ddd",
        //labelStyle: TextStyle(color: Colors.grey[600], fontSize: 20.0),
      ),
      //maxLines: 1, //Não deixa o campo pular linhas.
      //obscureText: isPassword ? true : false, //VALIDAR
      //controller: alcoolController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Informe o nome do cliente!';
        }
        return null;
      },
    );
  }

  TextFormField buildTextFormFieldEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      maxLength: 20,
      controller: _emailController,
      decoration: InputDecoration(
        icon:Icon(
          Icons.email_outlined,
          color: Colors.grey[600],
          size: 30.0,
        ),//Icone fora do campo
        labelText: "E-mail",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Informe o e-mail do cliente!';
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
        icon:Icon(
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

  TextFormField buildTextFormFieldCPF() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        // obrigatório
        FilteringTextInputFormatter.digitsOnly,
        CpfOuCnpjFormatter(),
      ],
      maxLength: 18,
      //controller: _cpfCnpjController,
      decoration: InputDecoration(
        icon:Icon(
          Icons.badge_outlined,
          color: Colors.grey[600],
          size: 30.0,
        ),
        labelText: "CPF/CNPJ",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Informe o CPF/CNPJ do cliente!';
        }
        return null;
      },
    );
  }

  DropdownButtonFormField buildDropdownButtonFormFieldRegiao(){
    return DropdownButtonFormField(
      decoration: InputDecoration(
        //border: OutlineInputBorder(borderRadius: const BorderRadius.all(const Radius.circular(30.0),),), //Borda da combobox
        //filled: true, //Cor de fundo da combobox
        //hintStyle: TextStyle(color: Colors.grey[800]),
          labelText: "Região",
          icon:Icon(
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
        icon:Icon(
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

  void SalvarRegistro() async {
    try
    {
      ClienteModel clienteModel = new ClienteModel();
      var control = ClienteControl2();

      clienteModel.nomeCliente = _nomeController.text;
      clienteModel.emailCliente = _emailController.text;
      //widget.id = await control.inserir(obj);
      control.inserir(clienteModel);
      print('Cliente salvo com sucesso');
    }
    catch (e) {
      print('Erro ao salvar o cliente' + e.toString());
    }
  }

  void SalvarCliente() async{
    ClienteControl clienteControl = new ClienteControl();
    ClienteModel clienteModel = new ClienteModel();

    String nome = _nomeController.text;
    String email = _emailController.text;

    Map<String, dynamic> row = {
    DatabaseHelper.columnNome : nome,
    DatabaseHelper.columnEmail  : email
    };
    final id = await clienteControl.insert(row);
    print('Cliente: $nome id $id inserida');
    _showToastClienteSalvo(context);

    // Map<String, dynamic> row = {
    //   // DatabaseHelper.columnNome : 'Macoratti',
    //   // DatabaseHelper.columnEmail  : 53
    //   DatabaseHelper.columnNome : _nomeController,
    //   DatabaseHelper.columnEmail  : _emailController
    // };
    // //final id = await  dbHelper.insert(row);
    // final id = await clienteControl.insert(row);
    // print('linha inserida id: $id');
    // _showToastClienteSalvo(context);




  }

  void _showToastClienteSalvo(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Cliente inserido'),
        action: SnackBarAction(label: 'Ocultar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }



}




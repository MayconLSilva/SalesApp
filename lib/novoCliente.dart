import 'package:SalesApp/Util.dart';
import 'package:SalesApp/control/ClienteControl.dart';
import 'package:SalesApp/screens/clienteEndereco.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:SalesApp/model/ClienteModel.dart';

class NovoClienteDialog extends StatefulWidget {

  //Inicio do código ref. ao controller
  late TextEditingController _nomeController;
  late TextEditingController _CpfCnpjController;
  late TextEditingController _rgIeController;
  late TextEditingController _emailController;
  late TextEditingController _telefoneController;
  late TextEditingController _celularController;

  NovoClienteDialog(){

    _nomeController = new TextEditingController();
    _CpfCnpjController = new TextEditingController();
    _rgIeController = new TextEditingController();
    _emailController = new TextEditingController();
    _telefoneController = new TextEditingController();
    _celularController = new TextEditingController();
  }
  //Fim do código ref. ao controller
  @override
  NovoClienteDialogState createState() => new NovoClienteDialogState();
}

class NovoClienteDialogState extends State<NovoClienteDialog> {
  //Codigo importando classe modelo, controle e util
  ClienteControl clienteControl = new ClienteControl();
  ClienteModel clienteModel = new ClienteModel();
  Util util = new Util();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Novo Cliente'),
        actions: [

          //Inicio do código método salvar
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
            icon: Icon(
              Icons.save_outlined,
              color: Colors.white,
              size: 30.0,
            ),
            //MÉTODO CHAMA O BOTÃO SALVAR
            onPressed: () {
              SalvarCliente();
            },
            //FIM DO MÉTODO CHAMA O BOTÃO SALVAR
          ),
          //Fim do código método salvar

          //Inicio do código método cadastrar endereço
          TextButton.icon(
            label: Text(''),
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

            onPressed: () {
              /*
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Clientes()));
              */

              int id = clienteModel.idCliente;
              print('Chamando cadastro de endereço, cliente de código $id');
              if(id == 0)//Só vou chamar caso o cliente já foi cadastrado e abro a tela, caso seja um novo cliente não chamo a tela.
                return;

              Navigator.of(context).push(new MaterialPageRoute<Null>(
                  builder: (BuildContext context) {
                    return new ClienteEnderecoDialog(id);
                  },
                  fullscreenDialog: true
              ));

            },
            //
          ),
          //Fim do código método cadastrar endereço

        ],

      ),


      /////////////////////////////////////////////////INICIO DO CÓDIGO DOS CAMPOS/////////////////////////////////////////////////
      body:

        SingleChildScrollView(
          //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Stack(
            children: <Widget>[
              new Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[

                      buildTextFormFieldNome(),
                      buildTextFormFieldCPF(),
                      buildTextFormFieldIERg(),
                      buildTextFormFieldEmail(),
                      buildTextFormFieldTelefone(),
                      buildTextFormFieldCelular()

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
      controller: widget._nomeController,
      decoration: InputDecoration(
        //prefixIcon: Icon(Icons.face_outlined), //Icone dentro do campo
        //icon:Icon(Icons.supervisor_account_outlined), //Icone fora do campo
        icon: Icon(
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

  TextFormField buildTextFormFieldCPF() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        // obrigatório
        FilteringTextInputFormatter.digitsOnly,
        CpfOuCnpjFormatter(),
      ],
      maxLength: 18,
      controller: widget._CpfCnpjController,
      decoration: InputDecoration(
        icon: Icon(
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

  TextFormField buildTextFormFieldIERg() {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 18,
      controller: widget._rgIeController,
      decoration: InputDecoration(
        icon: Icon(
          Icons.badge_outlined,
          color: Colors.grey[600],
          size: 30.0,
        ),
        labelText: "I.E/RG",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Informe a I.E/RG do cliente!';
        }
        return null;
      },
    );
  }

  TextFormField buildTextFormFieldEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      maxLength: 30,
      controller: widget._emailController,
      decoration: InputDecoration(
        icon: Icon(
          Icons.email_outlined,
          color: Colors.grey[600],
          size: 30.0,
        ), //Icone fora do campo
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

  TextFormField buildTextFormFieldTelefone() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        // obrigatório
        FilteringTextInputFormatter.digitsOnly,
        TelefoneInputFormatter(),
      ],
      maxLength: 14,
      controller: widget._telefoneController,
      decoration: InputDecoration(
        icon: Icon(
          Icons.phone_outlined,
          color: Colors.grey[600],
          size: 30.0,
        ),
        labelText: "Telefone",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Informe o telefone do cliente!';
        }
        return null;
      },
    );
  }

  TextFormField buildTextFormFieldCelular() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        // obrigatório
        FilteringTextInputFormatter.digitsOnly,
        TelefoneInputFormatter(),
      ],
      maxLength: 15,
      controller: widget._celularController,
      decoration: InputDecoration(
        icon: Icon(
          Icons.phone_iphone_outlined,
          color: Colors.grey[600],
          size: 30.0,
        ),
        labelText: "Celular",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Informe o celular do cliente!';
        }
        return null;
      },
    );
  }

//Método salvar/inserir cliente
  void SalvarCliente() async {
     // ClienteControl clienteControl = new ClienteControl();
     // ClienteModel clienteModel = new ClienteModel();
    // Util util = new Util();

    clienteModel.idCliente = 0;
    clienteModel.nomeCliente = widget._nomeController.text;
    clienteModel.cpfCliente = widget._CpfCnpjController.text;
    clienteModel.rgIeCliente = widget._rgIeController.text;
    clienteModel.emailCliente = widget._emailController.text;
    clienteModel.telefoneCliente = widget._telefoneController.text;
    clienteModel.celularCliente = widget._celularController.text;

    if(widget._nomeController.text == '' )
    {
      return Util.mensagem(context, "O campo nome deve ser preenchido!");
    }

    if(widget._CpfCnpjController.text == '')
    {
      return Util.mensagem(context, "O campo CPF/CNPJ deve ser preenchido!");
    }

    final id = await clienteControl.insertCliente(clienteModel);
    print('Cliente:  $id inserida');
    util.toastSucesso("Cliente inserido com sucesso!");

    Navigator.pop(context);

  }



//Método salvar cliente antigo
/*
void SalvarClienteOld() async{
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
 */


}

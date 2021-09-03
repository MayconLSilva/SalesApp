class ClienteModel{
  int _idCliente=0;
  String _nomeCliente = "";
  String _cpfCliente= "";
  String _rgIeCliente = "";
  String _emailCliente= "";
  String _regiaoCliente= "";
  String _cidadeCliente= "";
  String _enderecoCliente= "";
  String _numeroEnderecoCliente= "";
  String _bairroCliente= "";
  String _telefoneCliente = "";
  String _celularCliente = "";



  //}
  // @override
  // ClienteModel(
  //     //this._idCliente,
  //     this._nomeCliente,
  //     this._cpfCliente,
  //     this._emailCliente,
  //     this._regiaoCliente,
  //     this._cidadeCliente,
  //     this._enderecoCliente,
  //     this._numeroEnderecoCliente,
  //     this._bairroCliente);
  //
  // Map<String, dynamic> getMap() {
  //   Map<String, dynamic> map = Map();
  //   map['nomeCliente'] = this._nomeCliente;
  //   map['cpfCliente'] = this._cpfCliente;
  //   map['emailCliente'] = this._emailCliente;
  //   map['regiaoCliente'] = this._regiaoCliente;
  //   map['cidadeCliente'] = this._cidadeCliente;
  //   map['enderecoCliente'] = this._enderecoCliente;
  //   map['numeroEnderecoCliente'] = this._numeroEnderecoCliente;
  //   map['bairroCliente'] = this._bairroCliente;
  //   return map;
  // }

  int get idCliente => _idCliente;

  set idCliente(int value) {
    _idCliente = value;
  }

  String get nomeCliente => _nomeCliente;

  set nomeCliente(String value) {
    _nomeCliente = value;
  }

  String get cpfCliente => _cpfCliente;

  set cpfCliente(String value) {
    _cpfCliente = value;
  }

  String get rgIeCliente => _rgIeCliente;

  set rgIeCliente(String value) {
    _rgIeCliente = value;
  }

  String get emailCliente => _emailCliente;

  set emailCliente(String value) {
    _emailCliente = value;
  }

  String get regiaoCliente => _regiaoCliente;

  set regiaoCliente(String value) {
    _regiaoCliente = value;
  }

  String get cidadeCliente => _cidadeCliente;

  set cidadeCliente(String value) {
    _cidadeCliente = value;
  }

  String get enderecoCliente => _enderecoCliente;

  set enderecoCliente(String value) {
    _enderecoCliente = value;
  }

  String get numeroEnderecoCliente => _numeroEnderecoCliente;

  set numeroEnderecoCliente(String value) {
    _numeroEnderecoCliente = value;
  }

  String get bairroCliente => _bairroCliente;

  set bairroCliente(String value) {
    _bairroCliente = value;
  }

  String get celularCliente => _celularCliente;

  set celularCliente(String value) {
    _celularCliente = value;
  }

  String get telefoneCliente => _telefoneCliente;

  set telefoneCliente(String value) {
    _telefoneCliente = value;
  }

}
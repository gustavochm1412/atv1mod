class Account {
  int? id;  
  String nome;  
  double valor;  

  Account({this.id, required this.nome, required this.valor});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
       id: json['id'] != null ? int.tryParse(json['id'].toString()) : null, 
      nome: json['nome'],
      valor: json['valor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'valor': valor,
    };
  }
}

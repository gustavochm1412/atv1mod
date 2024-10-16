import 'package:flutter/material.dart';
import 'account_service.dart';
import 'account.dart';

class AccountListPage extends StatefulWidget {
  @override
  _AccountListPageState createState() => _AccountListPageState();
}

class _AccountListPageState extends State<AccountListPage> {
  final AccountService accountService = AccountService();
  late Future<List<Account>> futureAccounts;

  @override
  void initState() {
    super.initState();
    futureAccounts = accountService.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Contas')),
      body: FutureBuilder<List<Account>>(
        future: futureAccounts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar contas: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhuma conta disponível.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Account account = snapshot.data![index];
                return ListTile(
                  title: Text(account.nome),
                  subtitle: Text('Saldo: R\$${account.valor.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await accountService.delete(account.id!);
                      setState(() {
                        futureAccounts = accountService.getAll();
                      });
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

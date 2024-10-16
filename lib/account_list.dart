import 'package:atividade_01/account_form.dart';
import 'package:flutter/material.dart';
import 'account_service.dart';
import 'account.dart';

class AccountList extends StatefulWidget {
  const AccountList({Key? key}) : super(key: key);

  @override
  _AccountListState createState() => _AccountListState();
}

class _AccountListState extends State<AccountList> {
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
      appBar: AppBar(title: const Text('Accounts')),
      body: FutureBuilder<List<Account>>(
        future: futureAccounts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Account account = snapshot.data![index];
                return ListTile(
                  title: Text(account.nome),
                  subtitle: Text('Balance: \$${account.valor.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          // Navegar para a tela de edição
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await accountService.delete(account.id!);
                          setState(() {
                            futureAccounts = accountService.getAll();
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar para o formulário de criação
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AccountForm()),
          ).then((_) {
            setState(() {
              futureAccounts = accountService.getAll();
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

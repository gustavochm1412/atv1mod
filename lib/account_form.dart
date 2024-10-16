import 'package:flutter/material.dart';
import 'account_service.dart';
import 'account.dart';

class AccountForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController balanceController = TextEditingController();
  final AccountService accountService = AccountService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor digite um nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: balanceController,
                decoration: InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor digite um valor';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Account newAccount = Account(
                      nome: nameController.text,
                      valor: double.parse(balanceController.text),
                    );
                    try {
                      await accountService.create(newAccount);
                      Navigator.pop(context);
                    } catch (e) {
                      print('Error creating account: $e');
                    }
                  }
                },
                child: Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

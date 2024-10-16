import 'dart:convert';
import 'package:http/http.dart' as http;
import 'account.dart';

class AccountService {
  final String baseUrl = 'http://localhost:3001'; 

  Future<List<Account>> getAll() async {
    final response = await http.get(Uri.parse('$baseUrl/accounts'));
    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.body);
      return list.map((model) => Account.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load accounts');
    }
  }

  Future<Account> create(Account account) async {
    final response = await http.post(
      Uri.parse('$baseUrl/accounts'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(account.toJson()),
    );
    if (response.statusCode == 201) {
      return Account.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create account');
    }
  }

  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/accounts/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete account');
    }
  }
}

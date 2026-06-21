import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:user_directory_api/models/user.dart';

class ApiService {
  Future<List<User>> fetchUsers() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);

        return data.map((e) => User.fromJson(e)).toList();
      } else {
        throw Exception("Something went wrong.\nPlease try again.");
      }
    } on SocketException {
      throw Exception("No Internet Connection");
    } on TimeoutException {
      throw Exception("Request Timed Out");
    } catch (e) {
      throw Exception("Failed to load users");
    }
  }
}

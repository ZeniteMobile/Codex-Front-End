import 'dart:convert';
import 'package:codex/dto/updateuserDto.dart';
import 'package:codex/main.dart'; // Certifique-se que 'baseUrl' está aqui
import 'package:http/http.dart' as http;

class ProfileService {
  Future<Map<String, dynamic>> getUserProfile(String userId) async {
    final Uri url = Uri.parse('$baseUrl/usuario/$userId');

    try {
      // 1. Faz a requisição GET
      final http.Response response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // Se precisar de autenticação (Token JWT), adicione aqui:
          // 'Authorization': 'Bearer SEU_TOKEN_AQUI',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        final Map<String, dynamic> errorData = json.decode(response.body);
        final String errorMessage =
            errorData['message'] ?? 'Erro ao buscar dados do perfil.';
        throw Exception(errorMessage);
      }
    } catch (e) {
      throw Exception('Falha ao se comunicar com o servidor: ${e.toString()}');
    }
  }

  Future<bool> updateUserProfile({
    required String userId,
    required UpdateUserDto dto,
  }) async {
    final Uri url = Uri.parse('$baseUrl/usuario/$userId');

    try {
      final String body = json.encode(dto.toJson());
      final http.Response response = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // Se precisar de autenticação (Token JWT), adicione aqui também:
          // 'Authorization': 'Bearer SEU_TOKEN_AQUI',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        final Map<String, dynamic> errorData = json.decode(response.body);
        final String errorMessage =
            errorData['message'] ?? 'Ocorreu um erro desconhecido.';
        throw Exception(errorMessage);
      }
    } catch (e) {
      throw Exception('Falha ao se comunicar com o servidor: ${e.toString()}');
    }
  }
}

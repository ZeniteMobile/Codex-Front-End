import 'dart:convert';
import 'package:codex/dto/updateuserDto.dart';
import 'package:codex/main.dart';
import 'package:http/http.dart' as http;

class ProfileService {
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

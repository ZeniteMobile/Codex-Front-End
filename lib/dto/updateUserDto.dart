class UpdateUserDto {
  final String? nome;
  final String? email;
  final String? senhaAtual;
  final String? novaSenha;

  UpdateUserDto({this.nome, this.email, this.senhaAtual, this.novaSenha});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (nome != null && nome!.isNotEmpty) {
      data['nome'] = nome;
    }
    if (email != null && email!.isNotEmpty) {
      data['email'] = email;
    }
    if (senhaAtual != null && senhaAtual!.isNotEmpty) {
      data['senhaAtual'] = senhaAtual;
    }
    if (novaSenha != null && novaSenha!.isNotEmpty) {
      data['novaSenha'] = novaSenha;
    }

    return data;
  }
}

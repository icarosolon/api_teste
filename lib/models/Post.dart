class Post {
  int id;
  String nome;
  String dtNasc;
  String sexo;
  String createdAt;
  String updatedAt;

  Post(this.id, this.nome, this.dtNasc, this.sexo, this.createdAt,
      this.updatedAt);

/*
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      this.id: json['id'],
      nome: json['nome'],
      dtNasc: json['dt_nasc'],
      sexo: json['sexo'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
*/
  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    dtNasc = json['dt_nasc'];
    sexo = json['sexo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['dt_nasc'] = this.dtNasc;
    data['sexo'] = this.sexo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

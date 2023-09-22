class Arquivo {
  String? path; //todo mudar para DocumentReference

  Arquivo({this.path});

  factory Arquivo.fromMap(Map<String, dynamic>? map) {
    return Arquivo(
      path: map?['path'],
    );
  }
}

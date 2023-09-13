abstract class InterfaceCRUD<T> {
  Future<void> criar(T objeto);

  Future<void> atualizar(T objeto);

  Future<T> buscar(String chave, String valor);

  Future<List<T>> buscarTodos();

  Future<void> deletar(T objeto);
}

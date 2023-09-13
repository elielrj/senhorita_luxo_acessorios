abstract class InterfaceMap<T> {
  Map<String,dynamic> converterObjetoEmMap(T objeto);

  T converterMapEmObjeto(Map<String,dynamic> map);

  List<Map<String, dynamic>> converterListaDeObjetosEmListDeMap(List<T> listaDeObjetos);

  List<T> converterListaDeMapEmListaDeObjetos(List<Map<String, dynamic>> listaDeMap);
}

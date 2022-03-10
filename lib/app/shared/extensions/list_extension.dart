extension ListExtension<T> on List<T> {
  List<T> updateItem(int index, T item) {
    List<T> list = [];
    list.add(item);
    replaceRange(index, index + 1, list);
    return this;
  }
}

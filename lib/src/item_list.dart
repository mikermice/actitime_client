abstract class ItemList<T> {
  /// Offset position
  final int offset;

  /// Max number of returned items
  final int limit;

  ItemList({required this.offset, required this.limit});
}

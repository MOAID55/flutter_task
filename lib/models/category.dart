
class Category {
  final String name;
  final bool isSelected;

  Category({required this.name, this.isSelected = false});

  // Added copyWith for immutability when changing isSelected
  Category copyWith({
    String? name,
    bool? isSelected,
  }) {
    return Category(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
class BaggageItem {
  String? id;
  String? name;
  double? size;
  int? currentKg;
  int? currentGram;
  BaggageItem(
      {this.id, this.name, this.size, this.currentKg, this.currentGram});
  factory BaggageItem.fromJson(Map<String, dynamic> parsedJson) {
    return BaggageItem(
      id: parsedJson['id'] ?? "",
      name: parsedJson['name'] ?? "",
      size: parsedJson['size'] ?? "",
      currentKg: parsedJson['currentKg'],
      currentGram: parsedJson['currentGram'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "size": size,
      "currentKg": currentKg,
      "currentGram": currentGram
    };
  }
}

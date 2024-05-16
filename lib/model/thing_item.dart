enum EThingType {
  clothes("Clothes"),
  hygiene("Hygiene"),
  cosmetics("Cosmetics"),
  electronics("Electronics"),
  medication("Medication"),
  jewelry("Jewelry"),
  documents("Documents");

  const EThingType(this.text);
  final String text;
}

enum EThingCount {
  kg("kg"),
  gram("gram"),
  ;

  const EThingCount(this.text);
  final String text;
}

class ThingItem {
  String? id;
  String? baggageId;
  String? description;
  EThingType? type;
  int? size;
  EThingCount? countType;
  ThingItem(
      {this.id,
      this.baggageId,
      this.description,
      this.size,
      this.type,
      this.countType});
  factory ThingItem.fromJson(Map<String, dynamic> parsedJson) {
    return ThingItem(
      id: parsedJson['id'] ?? "",
      baggageId: parsedJson['baggageId'] ?? "",
      description: parsedJson['description'] ?? "",
      size: parsedJson['size'],
      type: EThingType.values.byName(parsedJson['type']),
      countType: EThingCount.values.byName(parsedJson['countType']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "baggageId": baggageId,
      "description": description,
      "size": size,
      "type": type!.name,
      "countType": countType!.name
    };
  }
}

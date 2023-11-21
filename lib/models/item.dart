// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
    String model;
    int pk;
    Fields fields;

    Item({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    int amount;
    int price;
    String description;
    String category;
    int user;

    Fields({
        required this.name,
        required this.amount,
        required this.price,
        required this.description,
        required this.category,
        required this.user,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        amount: json["amount"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "price": price,
        "description": description,
        "category": category,
        "user": user,
    };
}

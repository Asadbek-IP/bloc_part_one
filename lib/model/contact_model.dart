import 'dart:convert';

List<Contact> contactFromJson(List str) =>
    List<Contact>.from(str.map((x) => Contact.fromJson(x)));

String contactToJson(List<Contact> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Contact {
  String name;
  String avatar;
  String phoneNumber;
  String id;

  Contact({
    required this.name,
    required this.avatar,
    required this.phoneNumber,
    required this.id,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        name: json["name"],
        avatar: json["avatar"],
        phoneNumber: json["phoneNumber"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "avatar": avatar,
        "phoneNumber": phoneNumber,
        "id": id,
      };
}

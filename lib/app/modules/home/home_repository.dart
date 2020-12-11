import 'dart:convert';

import 'package:hasura_connect/hasura_connect.dart';

class HomeRepository {
  final HasuraConnect hasuraConnect;

  HomeRepository(this.hasuraConnect);

  Future<Snapshot<List<Author>>> first() async {
    var query = '''subscription MySubscription {
        authors {
          id
          name
        }
      }
      ''';

    var snapshot = await hasuraConnect.subscription(query);

    return snapshot.map((data) {
      if (data == null) {
        return null;
      }
      return Author.fromJsonList(data["data"]["authors"]);
    });
  }

  Future<Snapshot<List<Book>>> second() async {
    var query = '''subscription MySubscription {
        books {
          name
          id
        }
      }

      ''';

    var snapshot = await hasuraConnect.subscription(query);

    return snapshot.map((data) {
      if (data == null) {
        return null;
      }
      return Book.fromJsonList(data["data"]["books"]);
    });
  }
}

class Author {
  final int id;
  final String name;

  Author(this.id, this.name);

  static List<Author> fromJsonList(List list) {
    if (list == null) return null;
    return list
        .map((item) => item.cast<String, dynamic>())
        .map<Author>((item) => Author.fromMap(item))
        .toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Author.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Author(
      map['id'],
      map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Author.fromJson(String source) => Author.fromMap(json.decode(source));
}

class Book {
  final int id;
  final String name;

  Book(this.id, this.name);

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Book(
      map['id'],
      map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  static List<Book> fromJsonList(List list) {
    if (list == null) return null;
    return list
        .map((item) => item.cast<String, dynamic>())
        .map<Book>((item) => Book.fromMap(item))
        .toList();
  }
}

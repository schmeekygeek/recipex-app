import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final List<String>? recipes;

  User({
    this.recipes,
  });

  factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return User(
      recipes:
          data?['recipes'] is Iterable ? List.from(data?['recipes']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (recipes != null) 'recipes': recipes,
    };
  }
}

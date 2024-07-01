import 'dart:math';

import 'package:bussines_owner/Constants/Person/person.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonController extends StateNotifier<Person?> {
  PersonController() : super(null);

  void setPerson(Person person) {
    print('before setting person login check its empty or not $person');

    state = person;
  }

  // void factoryClearPerson(Person person) {
  //   state = Person.clear();
  // }

  void clearPerson() {
    state = null;
    print('clear person state $state');
  }
}

final personProvider = StateNotifierProvider<PersonController, Person?>((ref) {
  return PersonController();
});

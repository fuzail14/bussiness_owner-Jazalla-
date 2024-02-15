import 'package:bussines_owner/Constants/Person/person.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonController extends StateNotifier<Person?> {
  PersonController() : super(null);

  void setPerson(Person person) {
    state = person;
  }
}

final personProvider = StateNotifierProvider<PersonController, Person?>((ref) {
  return PersonController();
});

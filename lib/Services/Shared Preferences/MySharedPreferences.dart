import 'package:shared_preferences/shared_preferences.dart';

import '../../Constants/Person/person.dart';
import '../../Constants/shared_preferences_constants.dart';

class MySharedPreferences {
  static Future<void> deleteUserData() async {
    Person person = Person();

    await SharedPreferences.getInstance().then((value) {
      // value.remove(userIdSPKey);
      // value.remove(firstNameSPKey);
      // value.remove(lastNameSPKey);
      final success = value.remove(bearerTokenSPKEY);

      print(success.then((value) => value));

      value.remove(userIdSPKey);
      value.remove(companyIdSPKey);
      value.remove(nameSPKey);
      value.remove(firstNameSPKey);
      value.remove(lastNameSPKey);
      value.remove(mobileNoSPKEY);
      value.remove(userRoleIdSPKey);
      value.remove(emailSPKEY);
      value.remove(typeSPKEY);
      value.remove(bearerTokenSPKEY);
      value.remove(fcmTokenSPKEY);
      value.remove(companyNameSPKEY);
      value.remove(logoSPKEY);
      value.remove(logoPathSPKEY);

      value.remove(employeeIdSPKEY);
      value.remove(primaryActivitySPKEY);
      value.remove(userAvatarPathSPKEY);
    });
  }

  static setUserData({required Person person, required fcmToken}) async {
    print('set user shared pref function ${person.data!.type}');
    //  print('set user data in shared pref ${person.data!.employee!.id}');

    await SharedPreferences.getInstance().then((value) {
      value.setInt(userIdSPKey, person.data!.id ?? 0);
      value.setInt(companyIdSPKey, person.data!.companyId ?? 0);
      value.setString(nameSPKey, person.data!.name ?? '');
      value.setString(firstNameSPKey, person.data!.firstName ?? '');
      value.setString(lastNameSPKey, person.data!.lastName ?? '');
      value.setString(mobileNoSPKEY, person.data!.mobileNo ?? '');

      value.setInt(userRoleIdSPKey, person.data!.userRoleId ?? 0);
      value.setString(emailSPKEY, person.data!.email ?? '');
      value.setString(typeSPKEY, person.data!.type ?? '');
      value.setString(bearerTokenSPKEY, person.Bearer ?? '');
      value.setString(fcmTokenSPKEY, fcmToken ?? '');
      value.setString(
          companyNameSPKEY, person.data!.company!.companyName ?? '');

      value.setString(
          primaryActivitySPKEY, person.data!.company!.primaryActivity ?? '');

      value.setString(logoSPKEY, person.data!.company!.logo ?? '');
      value.setString(logoPathSPKEY, person.data!.company!.logoPath ?? '');
      value.setString(userAvatarPathSPKEY, person.data!.avatar ?? '');

      if (person.data!.employee != null) {
        value.setInt(employeeIdSPKEY, person.data!.employee!.id ?? 0);
      }
    });
  }

  static Future<Person> getUserData() async {
    var person = Person();
    await SharedPreferences.getInstance().then((value) {
      value.getInt(userIdSPKey) ?? value.setInt(userIdSPKey, 0);
      value.getInt(companyIdSPKey) ?? value.setInt(companyIdSPKey, 0);
      value.getString(nameSPKey) ?? value.setString(nameSPKey, '');
      value.getString(firstNameSPKey) ?? value.setString(firstNameSPKey, '');
      value.getString(lastNameSPKey) ?? value.setString(lastNameSPKey, '');

      value.getString(mobileNoSPKEY) ?? value.setString(mobileNoSPKEY, '');
      value.getInt(userRoleIdSPKey) ?? value.setInt(userRoleIdSPKey, 0);
      value.getString(emailSPKEY) ?? value.setString(emailSPKEY, '');
      value.getString(typeSPKEY) ?? value.setString(typeSPKEY, '');
      value.getString(bearerTokenSPKEY) ??
          value.setString(bearerTokenSPKEY, '');

      value.getString(fcmTokenSPKEY) ?? value.setString(fcmTokenSPKEY, '');
      value.getString(companyNameSPKEY) ??
          value.setString(companyNameSPKEY, '');
      value.getInt(employeeIdSPKEY) ?? value.setInt(employeeIdSPKEY, 0);
      value.getString(primaryActivitySPKEY) ??
          value.setString(primaryActivitySPKEY, '');

      value.getString(logoSPKEY) ?? value.setString(logoSPKEY, '');

      value.getString(logoPathSPKEY) ?? value.setString(logoPathSPKEY, '');

      value.getString(userAvatarPathSPKEY) ??
          value.setString(userAvatarPathSPKEY, '');

      person = Person(
        data: Data(
            id: value.getInt(userIdSPKey),
            companyId: value.getInt(companyIdSPKey),
            name: value.getString(nameSPKey),
            firstName: value.getString(firstNameSPKey),
            lastName: value.getString(lastNameSPKey),
            mobileNo: value.getString(mobileNoSPKEY),
            userRoleId: value.getInt(userRoleIdSPKey),
            email: value.getString(emailSPKEY),
            type: value.getString(typeSPKEY),
            fcmtoken: value.getString(fcmTokenSPKEY),
            avatar: value.getString(userAvatarPathSPKEY),
            company: Company(
              companyName: value.getString(companyNameSPKEY),
              primaryActivity: value.getString(primaryActivitySPKEY),
              logo: value.getString(logoSPKEY),
              logoPath: value.getString(logoPathSPKEY),
            ),
            employee: Employee(
              id: value.getInt(employeeIdSPKEY),
            )),
        Bearer: value.getString(bearerTokenSPKEY),
      );
    });
    return person;
  }

  static updateUserData({required fcmToken}) async {
    await SharedPreferences.getInstance().then((value) {
      value.setString(fcmTokenSPKEY, fcmToken ?? '');
    });
  }
}

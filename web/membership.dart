import 'dart:html';
import 'package:membership/membership.dart';

Members members;
Member signedInMember;

main() {
  members = new Members();
  var administrator = new Member('dr');
  administrator.password = 'dr';
  administrator.firstName = 'Dzenan';
  administrator.lastName = 'Ridjanovic';
  administrator.admin = true;
  members.add(administrator);
}

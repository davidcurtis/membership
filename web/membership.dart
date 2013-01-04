import 'dart:html';
import 'package:membership/membership.dart';

var members = new Members();

void addMember() {
  var input = query("#new-member");
  members.add(new Member(input.value));
  input.value = "";
}

main() {
  var member1 = new Member('dzenanr');
  var member2 = new Member('davidc');
  var member3 = new Member('timr');
  members.add(member1);
  members.add(member2);
  members.add(member3);
}

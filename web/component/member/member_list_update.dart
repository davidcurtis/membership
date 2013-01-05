import 'package:web_ui/web_ui.dart';
import 'package:membership/membership.dart';

class MemberListUpdate extends WebComponent {
  Members members;

  addMember() {
    var code = query("#code");
    var member = new Member(code.value);
    var password = query("#password");
    var firstName = query("#firstName");
    var lastName = query("#lastName");
    member.password = password.value;
    member.firstName = firstName.value;
    member.lastName = lastName.value;
    members.add(member);
    code.value = "";
    password.value = "";
    firstName.value = "";
    lastName.value = "";
  }
}
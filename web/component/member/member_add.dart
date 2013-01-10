import 'package:membership/membership.dart';
import 'package:web_ui/web_ui.dart';

class MemberAdd extends WebComponent {
  Members members;

  add() {
    var code = query("#code");
    var password = query("#password");
    var firstName = query("#firstName");
    var lastName = query("#lastName");
    var message = query("#message");
    var error = false;
    message.text = '';
    if (code.value.trim() == '') {
      message.text = 'code is mandatory; ${message.text}';
      error = true;
    }
    if (password.value.trim() == '') {
      message.text = 'password is mandatory; ${message.text}';
      error = true;
    }
    if (firstName.value.trim() == '') {
      message.text = 'first name is mandatory; ${message.text}';
      error = true;
    }
    if (lastName.value.trim() == '') {
      message.text = 'last name is mandatory; ${message.text}';
      error = true;
    }
    if (!error) {
      var member = new Member(code.value);
      member.password = password.value;
      member.firstName = firstName.value;
      member.lastName = lastName.value;
      if (members.add(member)) {
        message.text = 'added';
        members.order();
      } else {
        message.text = 'code already in use';
      }
    }
  }

}
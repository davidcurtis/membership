import 'package:web_ui/web_ui.dart';
import 'package:membership/membership.dart';

class MemberSignIn extends WebComponent {
  Members members;
  Member signedInMember;
  bool showSignOut = false;
  bool showSignIn = true;
  bool showSignInButtons = true;
  bool showSignUp = false;

  var code;
  var password;
  var firstName;
  var lastName;
  var message;
  var error = false;

  signIn() {
    code = query("#code");
    password = query("#password");
    message = query("#message");
    message.text = '';
    error = false;
    if (code.value.trim() == '') {
      message.text = 'code is mandatory; ${message.text}';
      error = true;
    }
    if (password.value.trim() == '') {
      message.text = 'password is mandatory; ${message.text}';
      error = true;
    }
    if (!error) {
      signedInMember = members.find(code.value.trim());
      if (signedInMember != null) {
        showSignIn = false;
        showSignOut = true;
      } else {
        message.text = 'not valid sign in';
      }
    }
  }

  signUp() {
    message = query("#message");
    message.text = '';
    showSignInButtons = false;
    showSignUp = true;
  }

  add() {
    code = query("#code");
    password = query("#password");
    firstName = query("#firstName");
    lastName = query("#lastName");
    message = query("#message");
    message.text = '';
    error = false;
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
    if (members.contain(code.value.trim())) {
      message.text = 'code must be unique; ${message.text}';
      error = true;
    }
    if (!error) {
      signedInMember = new Member(code.value);
      signedInMember.password = password.value;
      signedInMember.firstName = firstName.value;
      signedInMember.lastName = lastName.value;
      members.add(signedInMember);
      members.order();
      showSignOut = true;
      showSignIn = false;
      showSignUp = false;
    }
  }

  signOut() {
    signedInMember = null;
    showSignOut = false;
    showSignIn = true;
    showSignInButtons = true;
    showSignUp = false;
  }
}

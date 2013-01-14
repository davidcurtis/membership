import 'dart:html';

import 'package:membership/membership.dart';
import 'package:web_ui/web_ui.dart';

class MemberSignIn extends WebComponent {
  Members members;
  Member signedInMember;

  bool showSignIn = true;
  bool showSignUp = false;
  bool showMember = false;
  bool showSignOut = false;

  signIn() {
    InputElement code = query("#code");
    InputElement password = query("#password");
    LabelElement message = query("#message");
    message.text = '';
    var error = false;
    if (code.value.trim() == '') {
      message.text = 'code is mandatory; ${message.text}';
      error = true;
    }
    if (password.value.trim() == '') {
      message.text = 'password is mandatory; ${message.text}';
      error = true;
    }
    if (!error) {
      var member = members.find(code.value.trim());
      if (member != null) {
        if (member.password == password.value.trim()) {
          signedInMember = member;
          showSignIn = false;
          showSignUp = false;
          showSignOut = true;
        } else {
          message.text = 'not valid sign in';
        }
      } else {
        message.text = 'not valid sign in';
      }
    }
  }

  signUp() {
    LabelElement message = query("#message");
    message.text = '';
    showSignUp = true;
  }

  add() {
    InputElement code = query("#code");
    InputElement password = query("#password");
    InputElement firstName = query("#firstName");
    InputElement lastName = query("#lastName");
    LabelElement message = query("#message");
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
        members.order();
        message.text = 'added, please sign in';
      } else {
        message.text = 'code already in use';
      }
    }
  }

  member() {
    showMember = true;
  }

  signOut() {
    signedInMember = null;
    showSignIn = true;
    showSignUp = false;
    showMember = false;
    showSignOut = false;
  }
}

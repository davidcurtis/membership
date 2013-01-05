library membership;

class Member {
  String code;
  String password = '';
  String firstName;
  String lastName;
  bool admin = false;

  Member(this.code);

  display() {
    print(code);
  }
}

class Members {
  var _members = new List<Member>();

  Iterator<Member> iterator() => _members.iterator();

  add(Member member) {
    _members.add(member);
  }

  List<Member> get list => _members;

  display() {
    _members.forEach((m) {
      m.display();
    });
  }
}

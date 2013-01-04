// Auto-generated from member_list.html.
// DO NOT EDIT.

library x_member_list;

import 'dart:html' as autogenerated_html;
import 'dart:web_audio' as autogenerated_audio;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;

import 'package:web_ui/web_ui.dart';

import 'package:membership/membership.dart';

class MemberList extends WebComponent {
  
  /** Autogenerated from the template. */
  
  /**
  * Shadow root for this component. We use 'var' to allow simulating shadow DOM
  * on browsers that don't support this feature.
  */
  var _root;
  autogenerated_html.LIElement __e4;
  
  var __binding3;
  
  List<autogenerated.WatcherDisposer> __stoppers1;
  
  MemberList.forElement(e) : super.forElement(e);
  
  void created_autogenerated() {
    _root = createShadowRoot();
    
    _root.innerHtml = '''
    
    <li id="__e-4"></li>
    ''';
    __e4 = _root.query('#__e-4');
    __binding3 = new autogenerated_html.Text('');
    __stoppers1 = [];
    __e4.nodes.add(__binding3);
    
  }
  
  void inserted_autogenerated() {
    __stoppers1.add(autogenerated.watchAndInvoke(() => '${ member.code }', (__e) {
      __binding3 = autogenerated.updateBinding( member.code , __binding3, __e.newValue);
    }));
    
  }
  
  void removed_autogenerated() {
    _root = null;
    
    __e4 = null;
    
    (__stoppers1..forEach((s) => s())).clear();
    
    __binding3 = null;
    
  }
  
  void composeChildren() {
    super.composeChildren();
    if (_root is! autogenerated_html.ShadowRoot) _root = this;
  }
  
  /** Original code from the component. */
  
  Member member;
}


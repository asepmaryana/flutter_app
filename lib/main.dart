import 'package:flutter/material.dart';
import 'package:hand_app/basic-layout.dart';
import 'package:hand_app/button.dart';
import 'package:hand_app/change-icon-color.dart';
import 'package:hand_app/datatable.dart';
import 'package:hand_app/drop-down.dart';
import 'package:hand_app/grid-list.dart';
import 'package:hand_app/hor-lis-tab.dart';
import 'package:hand_app/input-text.dart';
import 'package:hand_app/json-storage.dart';
import 'package:hand_app/list-view-maps.dart';
import 'package:hand_app/list-view-refresh.dart';
import 'package:hand_app/list-view.dart';
import 'package:hand_app/login-screen.dart';
import 'package:hand_app/radio.dart';
import 'package:hand_app/raise-button.dart';
import 'package:hand_app/rest.dart';
import 'package:hand_app/route.dart';
import 'package:hand_app/row-column.dart';
import 'package:hand_app/simple-drawer.dart';
import 'package:hand_app/sql-lite.dart';
import 'package:hand_app/state-management.dart';
import 'package:hand_app/stateless-route.dart';
import 'package:hand_app/switchs.dart';
import 'package:hand_app/tabbar.dart';
import 'package:hand_app/table.dart';
import 'package:hand_app/tabs.dart';
import 'package:hand_app/variable-drawer.dart';
import 'package:hand_app/widgets.dart';

//void main() => runApp(new MaterialApp(home: AwesomeButton()));
/*
void main() {
  runApp(new MaterialApp(
    home: new HomePageLess(),
    routes: <String, WidgetBuilder> {
      '/SeconPage': (BuildContext context) => new SeconPageLess()
    }
  ));
}
*/
//void main() => runApp(RouteApp());
//var routes = <String, WidgetBuilder>{
//  "/todos": (BuildContext context) => new TodosPage()
//};
void main() => runApp(new MaterialApp(home: new SqlHome(), debugShowCheckedModeBanner: false));
//void main() => runApp(new LoginApp());
//void main() => runApp(new ManagementApp());

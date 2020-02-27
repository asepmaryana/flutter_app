import 'package:flutter/material.dart';

class Company {
  int id;
  String name;

  Company({this.id, this.name});

  static List<Company> getCompanies() {
    return <Company> [
      Company(id: 1, name: 'Google'),
      Company(id: 2, name: 'Apple'),
      Company(id: 3, name: 'Samsung'),
      Company(id: 4, name: 'Sony'),
      Company(id: 5, name: 'LG')
    ];
  }
}

class DropDown extends StatefulWidget {
  DropDown() : super();
  final String title = 'DropDown Demo';

  @override
  DropDownState createState() => new DropDownState();

}

class DropDownState extends State<DropDown> {
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropDownMenuItems;
  Company _selectedCompany;

  @override
  void initState() {
    _dropDownMenuItems = buildDropDownMenuItems(_companies);
    _selectedCompany = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropDownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for(Company company in companies) {
      items.add(DropdownMenuItem(value: company, child: Text(company.name)));
    }
    return items;
  }

  void onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
      print('selected: '+selectedCompany.name);
    });
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(title: new Text('DropDown Button Example')),
        body: new Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Select company'),
                SizedBox(height: 20.0),
                DropdownButton(
                  value: _selectedCompany,
                  items: _dropDownMenuItems,
                  onChanged: onChangeDropdownItem,
                  
                ),
                SizedBox(height: 20.0),
                Text('Selected: ${_selectedCompany.name}'),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
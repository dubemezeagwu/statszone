import 'package:flutter/material.dart';
import 'package:statszone/domain/models/country.dart';
import 'package:statszone/presentation/widgets/country_list_tile.dart';


class CountryExpansionWidget extends StatefulWidget {
  final List<Country> data;

  const CountryExpansionWidget({
    Key? key,
    required this.data}) : super(key: key);

  @override
  State<CountryExpansionWidget> createState() => _CountryExpansionWidgetState();
}

class _CountryExpansionWidgetState extends State<CountryExpansionWidget> {
  @override
  Widget build(BuildContext context) {
    final List<Item> _data = generateItems(items: widget.data);
    return SingleChildScrollView(
      child: Container(
        child: _buildExpansionPanel(_data),
      ),
    );
  }

  Widget _buildExpansionPanel (List<Item> data){
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpand) {
        setState(() {
          data[index].isExpanded = !isExpand;
        });
      },
      children: data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded,){
              return CountryListTile(
                  title: item.headerValue.name!,
                  image: item.headerValue.flag!,
              );
            },
            body: ListTile(title: Text(item.expandedValue),),
          isExpanded: item.isExpanded
        );
      }).toList(),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  Country headerValue;
  bool isExpanded;
}

List<Item> generateItems ({required List<Country> items}){
  return List<Item>.generate(items.length, (index) => Item(
      expandedValue: "No content",
      headerValue: items[index])
  );
}

import 'package:statszone/domain/app_domain.dart';
import 'package:statszone/presentation/widgets/country_list_tile.dart';

class CustomExpansionWidget extends StatefulWidget {
  final List<TeamInfo> teamData;

  const CustomExpansionWidget({
    Key? key,
    required this.teamData,
  }) : super(key: key);

  @override
  State<CustomExpansionWidget> createState() => _CustomExpansionWidgetState();
}

class _CustomExpansionWidgetState extends State<CustomExpansionWidget> {
  List<Item> _data = <Item>[];

  @override
  void initState() {
    _data = generateItems(items: widget.teamData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildExpansionPanel(_data),
      ),
    );
  }

  Widget _buildExpansionPanel(List<Item> data) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpand) {
        setState(() {
          data[index].isExpanded = !isExpand;
        });
      },
      children: data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
            headerBuilder: (
              BuildContext context,
              bool isExpanded,
            ) {
              return CountryListTile(
                title: item.headerValue.team!.name!,
                image: item.headerValue.team!.logo!,
              );
            },
            body: Column(
              children: item.expandedValue.map(
                (e) => ListTile(
                  leading: e.icon,
                  title: Text(e.title),
                  dense: true,
                  iconColor: kBlack,
                )).toList(),
            ),
            isExpanded: item.isExpanded);
      }).toList(),
    );
  }

  List<Item> generateItems({required List<TeamInfo> items}) {
    return List<Item>.generate(
        items.length,
        (index) => Item(
          expandedValue: categories, 
          headerValue: items[index]));
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  List<Category> expandedValue;
  TeamInfo headerValue;
  bool isExpanded;
}

class Category {
  final String title;
  final Icon icon;

  Category(this.title, this.icon);
}

final List<Category> categories = [
  Category("Team Information", const Icon(Icons.info)),
  Category("Form", const Icon(Icons.stacked_line_chart)),
  Category("Squad", const Icon(Icons.stadium))
];

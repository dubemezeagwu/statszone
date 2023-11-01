import 'package:statszone/domain/app_domain.dart';
import 'package:statszone/presentation/widgets/team_list_tile.dart';

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
        child: _buildExpansionPanel(_data, context),
      ),
    );
  }

  Widget _buildExpansionPanel(List<Item> data, BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          data[index].isExpanded = isExpanded;
        });
      },
      materialGapSize: 2,
      children: data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
            headerBuilder: (
              BuildContext context,
              bool isExpanded,
            ) {
              return TeamListTile(
                title: item.headerValue.team!.name!,
                image: item.headerValue.team!.logo!,
              );
            },
            body: Column(
              children: item.expandedValue
                  .map((e) => ListTile(
                        leading: e.icon,
                        title: Text(e.title),
                        dense: true,
                        iconColor: context.theme.brightness == Brightness.dark
                            ? kWhite
                            : kBlack,
                      ))
                  .toList(),
            ),
            isExpanded: item.isExpanded);
      }).toList(),
    );
  }

  List<Item> generateItems({required List<TeamInfo> items}) {
    return List<Item>.generate(
        items.length,
        (index) =>
            Item(expandedValue: TeamOptions.values, headerValue: items[index]));
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  List<TeamOptions> expandedValue;
  TeamInfo headerValue;
  bool isExpanded;
}

enum TeamOptions {
  teamInformation("Team Information", Icon(Icons.info)),
  form("Form", Icon(Icons.stacked_line_chart)),
  squad("Squad", Icon(Icons.stadium));

  final String title;
  final Icon icon;

  const TeamOptions(this.title, this.icon);
}

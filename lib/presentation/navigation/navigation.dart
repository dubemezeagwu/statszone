import 'package:statszone/presentation/app_presentation.dart';

class NavigationWidget extends StatefulWidget {
  // final int loadedTab;

  const NavigationWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  int _selectedTab = 0;

  void onSelected(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedTab = 0;
  }

  static const List<Widget> bottomNavigationScreens = [
    TeamsScreen(),
    PlayersScreen(),
    FavouritesScreen(),
    StatsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    const bottomBarItems = BottomBarContent.bottomBarList;
    return Scaffold(
      appBar: MainAppBar(
        title: 'STATS ZONE',
        automaticallyImplyLeading: true,
      ),
      body: bottomNavigationScreens[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          iconSize: 20,
          elevation: 0,
          backgroundColor: kPrimary10,
          selectedIconTheme: const IconThemeData(size: 28),
          unselectedItemColor: kBlack2,
          currentIndex: _selectedTab,
          onTap: onSelected,
          items: List.generate(
            bottomBarItems.length,
            (index) => BottomNavigationBarItem(
              icon: Icon(
                _selectedTab == index
                    ? bottomBarItems[index].selectedIcon
                    : bottomBarItems[index].unselectedIcon,
              ),
              label: bottomBarItems[index].label,
            ),
          )),
    );
  }
}

class BottomBarContent {
  final IconData selectedIcon;
  final IconData unselectedIcon;
  final String label;

  const BottomBarContent(
      {required this.selectedIcon,
      required this.unselectedIcon,
      required this.label});

  static const List<BottomBarContent> bottomBarList = [
    BottomBarContent(
        selectedIcon: Icons.list,
        unselectedIcon: Icons.list_outlined,
        label: "Teams"),
    BottomBarContent(
        selectedIcon: Icons.person,
        unselectedIcon: Icons.person_outline_outlined,
        label: "Players"),
    BottomBarContent(
        selectedIcon: Icons.stacked_bar_chart,
        unselectedIcon: Icons.stacked_bar_chart_outlined,
        label: "Stats"),
    BottomBarContent(
        selectedIcon: Icons.bookmark_border_rounded,
        unselectedIcon: Icons.bookmark_border_outlined,
        label: "Favourites"),
  ];
}

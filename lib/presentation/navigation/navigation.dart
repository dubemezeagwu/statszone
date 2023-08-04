import 'package:statszone/presentation/app_presentation.dart';
import 'package:flutter/cupertino.dart';

class NavigationWidget extends StatefulWidget {

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
    StatsScreen(),
    FavouritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    const bottomBarItems = BottomBarContent.bottomBarList;
    return Consumer(builder: ((context, ref, child) {
      final theme = ref.watch(themeNotifierProvider);
      final toggle = ref.read(themeNotifierProvider.notifier);
      return Scaffold(
        appBar: MainAppBar(
          title: AppStrings.appTitle,
          automaticallyImplyLeading: true,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: Row(
                children: [
                  InkWell(
                    child: theme
                        ? const Icon(Icons.mode_night)
                        : const Icon (Icons.sunny),
                  ).paddingRight(4),
                  CupertinoSwitch(
                    key: const Key("themeSwitch"),
                    value: theme,
                    // activeColor: kDarkGrey,
                    activeColor: theme ? kGrey800 : kGrey,
                    onChanged: (bool value) {
                      toggle.toggleTheme();
                    },
                  ).scale(scale: 0.8, alignment: const Alignment(0.0, 0.0)),
                ],
              ),
            )
          ],
        ),
        body: IndexedStack(
          index: _selectedTab,
          children: bottomNavigationScreens,
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            iconSize: 20,
            elevation: 0,
            backgroundColor: kPrimary10,
            selectedIconTheme: const IconThemeData(size: 28),
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
    }));
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
        label: AppStrings.teams),
    BottomBarContent(
        selectedIcon: Icons.person,
        unselectedIcon: Icons.person_outline_outlined,
        label: AppStrings.players),
    BottomBarContent(
        selectedIcon: Icons.stacked_bar_chart,
        unselectedIcon: Icons.stacked_bar_chart_outlined,
        label: AppStrings.stats),
    BottomBarContent(
        selectedIcon: Icons.bookmark_border_rounded,
        unselectedIcon: Icons.bookmark_border_outlined,
        label: AppStrings.favourites),
  ];
}

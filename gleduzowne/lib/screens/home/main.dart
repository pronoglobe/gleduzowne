import 'package:flutter/material.dart';
import 'package:gleduzowne/components/terminal/main.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: NavigationRail(
            selectedIndex: 0,
            onDestinationSelected: (int index) {},
            labelType: NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.folder),
                label: Text('Files'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.search),
                label: Text('Search'),
              ),
              // Add more NavigationRailDestinations for other panels
            ],
          ),
        ),
        Flexible(
          flex: 4,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[200],
                        child: Center(child: Text('Editor Pane')),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[300],
                        child: Center(child: Text('Render Pane')),
                      ),
                    ),
                  ],
                ),
              ),
              Terminal(),
            ],
          ),
        ),
      ],
    );
  }
}
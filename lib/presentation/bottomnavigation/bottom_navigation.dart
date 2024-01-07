import 'package:flutter/material.dart';
import 'package:vsig_flutter/presentation/bottomnavigation/components/navigation_button.dart';
import 'package:vsig_flutter/presentation/imagegeneration/generateimage.dart';
import 'package:vsig_flutter/presentation/savedimages/savedimages.dart';
import 'package:vsig_flutter/utils/responsivetextstyle.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0; //Selected Index

  void _onItemTapped(int index) {
    //Change the screen on tab
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _widgetOptions = <Widget>[
    const ImageGenerate(),
    const SavedImages()
  ];
  @override
  Widget build(BuildContext context) {
    final responsivetextstyle = ResponsiveTextStyle(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            _selectedIndex == 0 ? 'Image Generation' : "Generated Images",
            style:
                responsivetextstyle.getCustomTextStyle(color: Colors.black38)),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
          color: Colors.greenAccent,
          child: Stack(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavigationButton(
                  iconPath: "assets/icons/image-generate.svg",
                  label: 'Generate',
                  color: const Color.fromARGB(255, 21, 39, 202),
                  isSelected: _selectedIndex == 0,
                  onPressed: () => _onItemTapped(0),
                ),
                NavigationButton(
                  isSelected: _selectedIndex == 1,
                  color: const Color.fromARGB(255, 21, 39, 202),
                  iconPath: "assets/icons/downloaded-generated.svg",
                  label: 'Generated Images',
                  onPressed: () => _onItemTapped(1),
                ),
              ],
            ),
          ])),
    );
  }
}

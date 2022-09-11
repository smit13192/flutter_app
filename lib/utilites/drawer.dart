import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {

  MyDrawer({Key? key,required  this.name,required this.email}) : super(key: key);
  String name;
  String email;
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var currentPage = DrawerSelection.home;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top:20),
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.purple),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/boy.png")),
                    ),
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    widget.email,
                    style:const TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
            ),
            drawerList(1, "Home", Icons.home_outlined,
                currentPage == DrawerSelection.home ? true : false),
            drawerList(2, "DashBoard", Icons.dashboard_outlined,
                currentPage == DrawerSelection.dashboard ? true : false),
            drawerList(3, "Contact", Icons.people_alt_outlined,
                currentPage == DrawerSelection.contact ? true : false),
            drawerList(4, "Events", Icons.event,
                currentPage == DrawerSelection.event ? true : false),
            drawerList(5, "Notes", Icons.notes,
                currentPage == DrawerSelection.notes ? true : false),
            const Divider(),
            drawerList(6, "Setting", Icons.settings_outlined,
                currentPage == DrawerSelection.settings ? true : false),
            drawerList(7, "Privacy Policy", Icons.privacy_tip_outlined,
                currentPage == DrawerSelection.privacy ? true : false),
            drawerList(8, "Send FeedBack", Icons.feed_outlined,
                currentPage == DrawerSelection.feedback ? true : false),
          ],
        ),
      ),
    );
  }

  Widget drawerList(int id, String heading, IconData icon, bool page) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      child: Material(
        color: page ? Colors.black12 : Colors.transparent,
        child: InkWell(
          onTap: () {
            switch (id) {
              case 1:
                currentPage = DrawerSelection.home;
                break;
              case 2:
                currentPage = DrawerSelection.dashboard;
                break;
              case 3:
                currentPage = DrawerSelection.contact;
                break;
              case 4:
                currentPage = DrawerSelection.event;
                break;
              case 5:
                currentPage = DrawerSelection.notes;
                break;
              case 6:
                currentPage = DrawerSelection.settings;
                break;
              case 7:
                currentPage = DrawerSelection.privacy;
                break;
              case 8:
                currentPage = DrawerSelection.feedback;
                break;
            }
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Expanded(
                  child: Icon(
                    icon,
                    size: 20,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    heading,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum DrawerSelection {
  home,
  dashboard,
  contact,
  event,
  notes,
  settings,
  privacy,
  feedback
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://media.licdn.com/dms/image/v2/D4D03AQGHdv4lox7w-w/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1691960254895?e=2147483647&v=beta&t=9_-8ktud6sEeyhheorYkC2q2Sj92Qi3idsJ3mFJuJ6o";

    return Drawer(
      child: Container(
        color: context.colors.secondary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: context.colors.primary,
                ),
                accountName: Text(
                  'Muzafar Ibrahim',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: context.colors.secondary,
                  ),
                ),
                accountEmail: Text(
                  'muzafarmahar9@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: context.colors.secondary,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: context.colors.primary,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: context.colors.primary),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.square_stack_3d_down_right_fill,
                color: context.colors.primary,
              ),
              title: Text(
                "Products",
                textScaleFactor: 1.2,
                style: TextStyle(color: context.colors.primary),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.cart,
                color: context.colors.primary,
              ),
              title: Text(
                "Cart",
                textScaleFactor: 1.2,
                style: TextStyle(color: context.colors.primary),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: context.colors.primary,
              ),
              title: Text(
                "Settings",
                textScaleFactor: 1.2,
                style: TextStyle(color: context.colors.primary),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: context.colors.primary,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(color: context.colors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

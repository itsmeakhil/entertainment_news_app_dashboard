import 'package:entertainment_news_app_dashboard/screens/dashboard/post_screen.dart';
import 'package:entertainment_news_app_dashboard/screens/dashboard/tag_screen.dart';
import 'package:entertainment_news_app_dashboard/screens/dashboard/user_screen.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'dashboard/category_screen.dart';
import 'dashboard/dashboard_screen.dart';


class AdminDashboard extends StatefulWidget {
   const AdminDashboard({Key? key,}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  List items = ["Dashboard", "Post","Category",'Tag','User' ];

    int _selectedIndex = 0;
 //N
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: adPrimary,
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            Text("Entertainment"),
            Spacer(),
            Text("Username",style: TextStyle(fontSize: 13),),

          ],
        ),

      ),
      body: Row(
        children: <Widget>[
          Container(
            width: 180,
            height: size.height,
            color: adSecondary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 70.0,
                    right: 30,
                    left: 30,
                  ),
                  child: Icon(Icons.movie_filter_outlined,size: 80,color: adPrimary,)
                ),
                const SizedBox(
                  height: 100,
                ),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics:
                      const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder:
                          (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 12),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                                child: Text(
                                  items[index],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight:_selectedIndex ==
                                          index
                                          ? FontWeight.bold:FontWeight.normal,
                                      color:
                                      _selectedIndex ==
                                          index
                                          ? adTextColor
                                          : Colors.black),
                                ),
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                }),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 12),
                      child: Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children:  [
                DashBoardScreen(),
                PostScreen(),
                CategoryScreen(),
                TagScreen(),
                UserScreen(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

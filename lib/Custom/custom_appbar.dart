import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side logo and search bar
            Row(
              children: [
                Text("Gramaphone", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(width: MediaQuery.of(context).size.width *0.09,),
                Container(
                  width: MediaQuery.of(context).size.width *0.30,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                ),
              ],
            ),

            // Right side dropdown, icons, and user info
            Row(
              children: [
                Text("Status", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                SizedBox(width: 5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton<String>(
                    value: 'Available',
                    items: [
                      DropdownMenuItem(
                        value: 'Available',
                        child: Text('Available'),
                      ),
                      DropdownMenuItem(
                        value: 'Busy',
                        child: Text('Busy'),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(width: 25),

                // Icon buttons (home, graph, cart, notification)
                IconButton(
                  icon: Icon(Icons.home_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.stacked_bar_chart),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.shopping_bag_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                ),
                SizedBox(width: 15),
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

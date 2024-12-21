import 'package:adhicine/home.dart';
import 'package:adhicine/report.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shadowColor: Colors.black,
      elevation: 5.0,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: const CircularNotchedRectangle(),
      // notchMargin: 6,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    onTap(0);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MedicineHomeScreen(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.home_rounded,
                    color: currentIndex == 0 ? Colors.blue : Colors.grey,
                  ),
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 10.0,
                    color: currentIndex == 0 ? Colors.blue : Colors.grey,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    onTap(1);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReportScreen(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.bar_chart,
                    color: currentIndex == 1 ? Colors.blue : Colors.grey,
                  ),
                ),
                Text(
                  'Report',
                  style: TextStyle(
                    color: currentIndex == 1 ? Colors.blue : Colors.grey,
                    fontSize: 10.0,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

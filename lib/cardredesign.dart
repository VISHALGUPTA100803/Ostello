import 'package:flutter/material.dart';

import 'card1.dart';
import 'card2.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardRedesign extends StatefulWidget {
  const CardRedesign({super.key});

  @override
  State<CardRedesign> createState() => _CardRedesignState();
}

class _CardRedesignState extends State<CardRedesign> {
  String? selectedSortOption = 'Relevance'; // To track the selected option

  void showSortOptions(BuildContext context, RelativeRect position) async {
    final result = await showMenu<String>(
      context: context,
      position: position, // Use the updated position here
      items: [
        _buildPopupMenuItem("Relevance"),
        _buildPopupMenuItem("Distance"),
        _buildPopupMenuItem("Price"),
        _buildPopupMenuItem("Rating"),
      ],
    );

    if (result != null && result != selectedSortOption) {
      setState(() {
        selectedSortOption = result;
      });
    }
  }

  PopupMenuItem<String> _buildPopupMenuItem(String text) {
    bool isSelected = selectedSortOption == text;

    return PopupMenuItem<String>(
      value: text,
      child: Row(
        children: [
          // Displaying a circle always. If the item is selected, the circle is purple
          Icon(Icons.circle,
              color: isSelected ? Colors.purple : Colors.grey, size: 12),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/Ellipse 496.svg',
              ),
              //
              Icon(Icons.chevron_left),
            ],
          ),
        ),
        title: const Text(
          'For JEE-Mains',
          style: TextStyle(
            color: Color(0xFF000000),
            fontSize: 16,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
              ),
              width: double.infinity,
              height: 44,
              child: TextField(
                style: const TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.16,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search for UPSC Coaching',
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFBDBDBD),
                      width: 1.5,
                    ),
                  ),
                  suffixIcon: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.mic, color: Colors.purple),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  width: 79,
                  height: 29,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFF7D23E0)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Filters',
                        style: TextStyle(
                          color: Color(0xFF7D23E0),
                          fontSize: 14,
                          fontFamily: 'Avenir Next LT Pro',
                          fontWeight: FontWeight.w400,
                          height: 1.21,
                          letterSpacing: 0.14,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        (Icons.menu_open),
                        color: Colors.purple,
                        size: 15,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16.0),
                  width: 79,
                  height: 29,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFF7D23E0)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sort',
                        style: TextStyle(
                          color: Color(0xFF7D23E0),
                          fontSize: 14,
                          fontFamily: 'Avenir Next LT Pro',
                          fontWeight: FontWeight.w400,
                          height: 1.21,
                          letterSpacing: 0.14,
                        ),
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                      InkWell(
                        onTap: () {
                          final RenderBox button =
                              context.findRenderObject() as RenderBox;
                          final RenderBox overlay = Overlay.of(context)
                              .context
                              .findRenderObject() as RenderBox;

                          final Offset buttonTopRight = button.localToGlobal(
                              Offset(button.size.width, 0),
                              ancestor: overlay);
                          final double menuHeight = 4 *
                              48.0; // Assuming each menu item has a height of 48.0
                          final double offsetFromTop =
                              24.0; // Adjust this value to move the menu slightly above the down arrow

                          final RelativeRect position = RelativeRect.fromLTRB(
                            buttonTopRight.dx -
                                button.size
                                    .width, // Starts from the beginning of the "Sort" button
                            buttonTopRight.dy -
                                offsetFromTop, // Adjust the top offset
                            overlay.size.width - buttonTopRight.dx,
                            overlay.size.height -
                                (buttonTopRight.dy -
                                    menuHeight +
                                    offsetFromTop),
                          );

                          showSortOptions(context, position);
                        },
                        child: const Icon(
                          (Icons.arrow_downward),
                          color: Colors.purple,
                          size: 15,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  margin: EdgeInsets.only(top: 16.0),
                  width: 79,
                  height: 29,
                  decoration: ShapeDecoration(
                    color: Color(0xFF7D23E0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFF7D23E0)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '<2Km',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Avenir Next LT Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.21,
                        letterSpacing: 0.14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  margin: EdgeInsets.only(top: 16.0),
                  width: 79,
                  height: 29,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFF7D23E0)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'JEE',
                      style: TextStyle(
                        color: Color(0xFF7D23E0),
                        fontSize: 14,
                        fontFamily: 'Avenir Next LT Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.21,
                        letterSpacing: 0.14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Card1(),
            const Card2(),
            const Card1(),
            const Card2(),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/2.png',
                      width: 79, height: 82, fit: BoxFit.cover),
                ),
                SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: 156,
                  child: Text(
                    'Having a tough time navigating through your career roadmap?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Avenir Next LT Pro',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 88,
                  height: 25,
                  decoration: ShapeDecoration(
                    color: Color(0xFF7D23E0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Ask Ostello',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Avenir Next LT Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Card1(),
          ],
        ),
      ),
    );
  }
}

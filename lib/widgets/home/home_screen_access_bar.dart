import 'package:fireweb/widgets/shared/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenAccessBar extends StatefulWidget {
  const HomeScreenAccessBar({
    Key? key,
    required this.screenSize,
    required this.tags,
    required this.selectedTag,
    required this.onTap,
  }) : super(key: key);

  final Size screenSize;
  final List<String> tags;
  final String selectedTag;
  final ValueSetter<String> onTap;

  @override
  _HomeScreenAccessBarState createState() => _HomeScreenAccessBarState();
}

class _HomeScreenAccessBarState extends State<HomeScreenAccessBar> {
  List _isHovering = [];
  List<Widget> rowElements = [];

  @override
  void initState() {
    _isHovering = [];
    for (int i = 0; i < widget.tags.length; i++) {
      _isHovering.add(false);
    }
    super.initState();
  }

  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < widget.tags.length; i++) {
      Widget elementTile = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            value ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },
        onTap: () {
          widget.onTap(widget.tags[i]);
        },
        child: Text(widget.tags[i],
            style: GoogleFonts.ubuntu(
              fontSize: 14,
              color: _isHovering[i] ? Colors.green.shade200 : (widget.selectedTag == widget.tags[i] ? Colors.green.shade900 : Colors.green.shade400),
              fontWeight: FontWeight.bold,
            )),
      );
      Widget spacer = SizedBox(
        height: widget.screenSize.height / 20,
        child: VerticalDivider(
          width: 1,
          color: Colors.blueGrey[100],
          thickness: 1,
        ),
      );
      rowElements.add(elementTile);
      if (i < widget.tags.length - 1) {
        rowElements.add(spacer);
      }
    }

    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: widget.screenSize.height * 0.40,
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
        ),
        child: ResponsiveWidget.isSmallScreen(context)
            ? Column(
                children: [
                  ...Iterable<int>.generate(widget.tags.length).map(
                    (int pageIndex) => Padding(
                      padding:
                          EdgeInsets.only(top: widget.screenSize.height / 80),
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: widget.screenSize.height / 45,
                              bottom: widget.screenSize.height / 45,
                              left: widget.screenSize.width / 20),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {},
                            child: Text(
                              widget.tags[pageIndex],
                              style: const TextStyle(
                                  color: Colors.blueGrey, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: widget.screenSize.height / 50,
                    bottom: widget.screenSize.height / 50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: generateRowElements(),
                  ),
                ),
              ),
      ),
    );
  }
}

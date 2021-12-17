import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TagsRow extends StatelessWidget {
  final List<String> tags;
  final String selectedTag;
  final ValueSetter<String> onTap;

  const TagsRow(
      {required this.tags,
      required this.selectedTag,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          tags.isNotEmpty
              ? Row(children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: tags
                        .map((tag) => tagComponent(
                            tag: tag,
                            selected: tag == selectedTag,
                            onTap: onTap))
                        .toSet()
                        .toList(),
                  ),
                ])
              : Container()
        ],
      ),
    );
  }

  Widget tagComponent({
    tag,
    selected,
    onTap,
  }) {
    return InkWell(
        onTap: () => onTap(tag),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 5.0,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            decoration: BoxDecoration(
                color: selected ? Colors.green.shade500 : Colors.green.shade900,
                borderRadius: BorderRadius.circular(100.0)),
            child: Text(
              tag,
              style: GoogleFonts.ubuntu(
                  fontSize: 14,
                  color: selected ? Colors.white : Colors.green.shade200,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:recipex_app/providers/theme_model.dart';

class MetaData extends StatefulWidget {
  final String origin;
  final String category;
  final String tags;
  const MetaData(
    {super.key, required this.origin, required this.category, required this.tags,}
  );

  @override
  State<MetaData> createState() => _MetaDataState();
}

class _MetaDataState extends State<MetaData> {
  static late List<String> tags;

  @override
  void initState() {
    tags = widget.tags.split(',');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [ 
        Row(
          children: [
            const Text(
              'Origin: ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.lightBlue,
                letterSpacing: 1
              ),
            ),
            Text(
              widget.origin,
            )
          ],
        ),
        Row(
          children: [
            const Text(
              'Category: ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.lightBlue,
                letterSpacing: 1
              ),
            ),
            Text(
              widget.category,
              overflow: TextOverflow.clip,
            )
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            spacing: 5,
            runSpacing: 4,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              const Text(
                'Tags: ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.lightBlue,
                  letterSpacing: 1
                ),
              ),
              for(String tag in tags) 
              Card(
                color: Colors.limeAccent,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                  child: Text(
                    tag,
                    style: const TextStyle(
                      fontSize: 17,
                      color: White.text,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

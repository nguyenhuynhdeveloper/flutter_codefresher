import 'package:flutter/material.dart';

class ShowcasePannel extends StatelessWidget {
  const ShowcasePannel({
    Key? key,
    required this.panelName,
    this.panelNameStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    this.showViewAll = false,
    this.showcaseHeight,
    required this.showcaseItemCount,
    this.showcaseItemPadding = const EdgeInsets.all(0),
    required this.showcaseItem,
    this.showcaseScrollDirection = Axis.horizontal,
    this.listItemsBackgroundColor,
    this.onPressedItem,
  }) : super(key: key);

  final String panelName;
  final TextStyle? panelNameStyle;
  final bool showViewAll;
  final double? showcaseHeight;
  final int showcaseItemCount;
  final EdgeInsetsGeometry showcaseItemPadding;
  final Widget showcaseItem;
  final Axis showcaseScrollDirection;
  final Color? listItemsBackgroundColor;
  final Function()? onPressedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Text(
                panelName,
                style: panelNameStyle,
              ),
              const Spacer(),
              if (showViewAll)
                const Text(
                  'View all',
                  style: TextStyle(fontSize: 20),
                ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        showcaseScrollDirection == Axis.horizontal
            ? SizedBox(
                height: showcaseHeight,
                child: buildListItems(),
              )
            : buildListItems(),
      ],
    );
  }

  Widget buildListItems() {
    return Container(
      color: listItemsBackgroundColor,
      padding: EdgeInsets.only(
          left: showcaseScrollDirection == Axis.horizontal ? 20 : 0),
      child: ListView.builder(
        scrollDirection: showcaseScrollDirection,
        shrinkWrap: true,
        physics: showcaseScrollDirection == Axis.vertical
            ? const NeverScrollableScrollPhysics()
            : const ClampingScrollPhysics(),
        itemCount: showcaseItemCount,
        itemBuilder: (context, index) => Padding(
          padding: showcaseItemPadding,
          child: GestureDetector(onTap: onPressedItem, child: showcaseItem),
        ),
      ),
    );
  }
}

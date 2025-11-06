import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_container.dart';
import '../../../../core/widgets/custom_icon_button.dart';

class AdminCardWidget extends StatelessWidget {
  final String cardTitle;
  final String cardSubtitle;
  final void Function()? onTapCreate;
  final void Function()? onTapDelete;
  const AdminCardWidget({
    super.key,
    required this.cardTitle,
    required this.cardSubtitle,
    this.onTapCreate,
    this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: EdgeInsets.symmetric(vertical: 6),
      // padding: EdgeInsetsGeometry.all(10),
      useIntrinsicHeight: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.black,
                    fontSize: 18,

                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cardSubtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 55,
            child: Row(
              spacing: 6,
              children: [
                CustomIconButton(
                  icon: Icons.edit,
                  onTap: onTapCreate ?? () {},
                  size: 24,
                  color: Colors.grey.shade700,
                ),
                CustomIconButton(
                  icon: Icons.delete,
                  onTap: onTapDelete ?? () {},
                  size: 24,
                  color: Colors.grey.shade700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

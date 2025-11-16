import 'barrel.dart';
class ProfileTileItems extends StatelessWidget {
  const ProfileTileItems({
    super.key,
    required this.items,
  });
  final List<ProfileItemModel> items;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12.r),
          )),
      child: Column(
        children: List.generate(
          items.length,
          (index) {
            final item = items[index];
            return Column(
              children: [
                GestureDetector(
                  onTap: item.onTap,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (item.leadingWidget != null) ...[
                          item.leadingWidget?? const AppEmptyWidget(),
                       const WidthSpace(12),
                        ],
                      Expanded(
                        child: Text(
                          item.title,
                          style: AppTextStyles.textStyle16bodyLarge400,
                        ),
                      ),
                      CustomTrailingWidget(item: item),
                    ],
                  ),
                ),
                if (index < items.length - 1)
                  Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Divider(
                      color: ColorManager.dividerColor,
                      thickness: 1.r,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

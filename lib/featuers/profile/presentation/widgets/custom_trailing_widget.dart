import 'barrel.dart';

class CustomTrailingWidget extends StatelessWidget {
  const CustomTrailingWidget({super.key, required this.item});
  final ProfileItemModel item;
  @override
  Widget build(BuildContext context) {
    switch (item.trailingType) {
      case TrailingType.arrow:
        return Icon(
          Icons.arrow_forward_ios,
          size: 16.r,
          color: ColorManager.grey1,
        );

      case TrailingType.textField:
        if (item.controller != null) {
          return SizedBox(
            width: 100.w,
            height: 40.h,
            child: CustomTextFormField(
              hintText: item.hintText,
              textAlign: TextAlign.end,
              keyboardType: TextInputType.number,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
              hintStyle: AppTextStyles.kTextStyle14MediumGrey400
                  .copyWith(color: ColorManager.blackGrey),
              controller: item.controller!,
              fillColor: ColorManager.white,
            ),
          );
        }
        return const AppEmptyWidget();

      case TrailingType.none:
        return const AppEmptyWidget();
    }
  }
}

import '../widgets/widgets.dart';

class DropDownBloodTypes extends StatefulWidget {
  const DropDownBloodTypes({super.key});

  @override
  State<DropDownBloodTypes> createState() => _DropDownBloodTypesState();
}

class _DropDownBloodTypesState extends State<DropDownBloodTypes> {
  String? selectedBloodType;
  List<String> bloodTypes = ["A+", "B+", "O+", "AB+", "A-", "B-", "O-", "AB-"];

  @override
  Widget build(BuildContext context) {
    return ContainerWithShadowColor(
      // margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          //menuWidth: 1.sw - 40.w,
          isExpanded: true,
          borderRadius: BorderRadius.circular(10.r),
          icon: SvgPicture.asset(
            IconAssets.dropDownIcon,
            colorFilter:
                const ColorFilter.mode(ColorManager.grey, BlendMode.srcIn),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          value: selectedBloodType,
          hint: Text("bloodType".tr),
          style: AppTextStyles.kTextStyle16Grey400.copyWith(fontSize: 14.sp),
          items: bloodTypes
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedBloodType = value!;
            });
          },
        ),
      ),
    );
  }
}

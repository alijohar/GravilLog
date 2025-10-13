import '../widgets/widgets.dart';

class ExistingConditions extends StatefulWidget {
  const ExistingConditions({super.key});

  @override
  State<ExistingConditions> createState() => _ExistingConditionsState();
}

class _ExistingConditionsState extends State<ExistingConditions> {
  List<String> conditions = [
    "diabetes".tr,
    "pressure".tr,
    "issues".tr,
    "anemia".tr,
    "other".tr
  ];
  List<String> selectedConditions = [];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...conditions.map(
        (e) {
          bool isSelected = selectedConditions.contains(e);
          return ContainerWithShadowColor(
            margin: EdgeInsets.only(bottom: 16.h),
            child: CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: isSelected,
              onChanged: (value) {
                setState(
                  () {
                    value == true
                        ? selectedConditions.add(e)
                        : selectedConditions.remove(e);
                  },
                );
              },
              title: Text(
                e,
                style: AppTextStyles.textStyle14bodyMedium400
              ),
            ),
          );
        },
      )
    ]);
  }
}

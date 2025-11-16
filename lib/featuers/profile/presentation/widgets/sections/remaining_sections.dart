import '../barrel.dart';

class RemainingSections extends StatelessWidget {
  const RemainingSections({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        const GoalsSection(),

        const BodySection(),

       const  ConditionalSection(),


        const CommunitySection(),

        AppElevatedButton(
            onPressed: () {},
            borderColor: ColorManager.orangeColor,
            backGroundColor: ColorManager.scaffoldSecondBackGround,
            textStyle:AppTextStyles.kTextStyle14black600.copyWith(color:ColorManager.orangeColor),
            text: TranslationKeys.logOut

        ),
      ],
    );
  }
}

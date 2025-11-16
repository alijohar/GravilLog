import '../barrel.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:<Widget> [
      const Expanded(
        child:
        CustomProfileImage()
      ),
       Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
                Text(
                  //here is caching name
                    TranslationKeys.userName.tr,
                style: AppTextStyles.textStyle18displaySmall600
              ),
             const HeightSpace(4),
               Text(
                 //here is caching email
                   TranslationKeys.userEmail.tr,
                style: AppTextStyles.textStyle12darkGrey500
              ),

            ],
          ),
        ),
      ],
    );
  }
}

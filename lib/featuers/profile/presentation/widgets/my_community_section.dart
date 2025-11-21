import 'barrel.dart';

class CommunitySection extends StatelessWidget {
  const CommunitySection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            TranslationKeys.myCommunity.tr,
            style:AppTextStyles.textStyle18displaySmall600
        ),

        Localizations.override(
          locale:const Locale(AppConstants.englishLanguage) ,
          context: context,
          child: ProfileTileItems(
            items: [
              const ProfileItemModel(
                title: 'TikTok',
                trailingType: TrailingType.none,
                leadingWidget: FaIcon(FontAwesomeIcons.tiktok,
                color: ColorManager.black,),
              ),


              ProfileItemModel(
                title: 'Instagram',
                trailingType: TrailingType.none,
                leadingWidget: SvgPicture.asset(IconAssets.instagramIcon),
              ),

              const ProfileItemModel(
                title: 'Snapchat',
                trailingType: TrailingType.none,
                leadingWidget: FaIcon(FontAwesomeIcons.snapchat,
                  color: ColorManager.black,),
              ),

              const ProfileItemModel(
                  title: 'Facebook',
                  trailingType: TrailingType.none,
                  leadingWidget: Icon(
                    IconData(
                        AppIconCode.facebookCodeIcon,
                        fontFamily: AppConstants.iconsFontFamily),
                        color:ColorManager.facebookColor,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

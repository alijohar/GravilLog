import 'barrel.dart';
class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return  GestureDetector(
      onTap: (){
        controller.pickProfileImage();
      },
      child: Stack(
        children: [
          AspectRatio(
             aspectRatio:1.15,
            child: 
            Obx(
              ()=> Container(
                decoration:  BoxDecoration(
                  color: ColorManager.darkWhiteShade,
                  shape: BoxShape.circle,
                  image:controller.profileImage.value!=null?
                      DecorationImage(image: FileImage(controller.profileImage.value!)):
                      null
                ),

              ),
            ),
          ),
            Positioned(
            top: 0.h,
            right: 10.w,
            child:   Container(
              padding: EdgeInsets.all(8.r),
              decoration:  BoxDecoration(
                color: ColorManager.mintGreen,
                shape: BoxShape.circle,
                border: Border.fromBorderSide(
                    BorderSide(
                        strokeAlign: BorderSide.strokeAlignOutside,
                        width: 5.r,
                        color: Colors.white
                    )
                ),
              ),
              child:
              SvgPicture.asset(
                IconAssets.editIcon,
                height: 18.h,
              )

            ),
          ),
        ],
      ),
    );
  }
}

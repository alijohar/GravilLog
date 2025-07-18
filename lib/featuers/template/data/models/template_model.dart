
import '../../../../core/resources/strings_manager.dart';
import '../../business/entities/template_entity.dart';

class TemplateModel extends TemplateEntity {
  const TemplateModel({
    required String template,
  }) : super(
          template: template,
        );

  factory TemplateModel.fromJson(Map<String, dynamic> json) {
    return TemplateModel(

      template: json[AppStrings.kTemplate],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppStrings.kTemplate: template,
    };
  }
}

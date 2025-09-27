import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends StatelessWidget {
  PrivacyPolicyView({super.key});

  PrivacyPolicyController controller = Get.find();

  final htmlData = {
    "en":  """
  <h1>Privacy Policy</h1>

  <h2>Introduction</h2>
  <p>Welcome to GraviLog. Your privacy is important to us, and we are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and protect your data when you use our services.</p>

  <h2>Information We Collect</h2>
  <ul>
    <li><strong>Personal Information:</strong> Name, email address, contact details, and payment information (if applicable).</li>
    <li><strong>Health Data:</strong> Pregnancy status, dietary preferences, and other health-related inputs voluntarily provided by users.</li>
    <li><strong>Usage Data:</strong> Information about how users interact with the App, including device type, operating system, and feature usage.</li>
    <li><strong>Device Identifiers and IP Address:</strong> For security, diagnostics, and personalization.</li>
    <li><strong>Location Data:</strong> We may collect GPS or IP-based location data, with user permission, to provide localized services or health insights.</li>
    <li><strong>Cookies and Tracking:</strong> See Section 10 for more detail.</li>
  </ul>

  <h2>How We Use Your Information</h2>
  <ul>
    <li>Provide, operate and improve our services.</li>
    <li>Personalize recommendations based on health and usage data.</li>
    <li>Analyze app performance and user interaction to enhance features.</li>
    <li>Ensure security, prevent fraud, and comply with legal obligations.</li>
    <li>Send updates, promotional content, and user notifications (with opt-out options).</li>
    <li>Use aggregated and anonymized data to improve AI performance, product development, and public health insights (without identifying users).</li>
  </ul>

  <h2>Data Sharing and Third Parties</h2>
  <ul>
    <li>We do not sell your personal information.</li>
    <li>We may share limited data with trusted third-party service providers (e.g., cloud hosting, analytics, payment processors) only as needed to deliver core app functionality.</li>
    <li>These partners are contractually required to protect your data and use it solely for the intended services.</li>
    <li>We may disclose information if legally required or to protect legal rights or safety.</li>
    <li>Data used for analytics or research is anonymized and does not include personally identifiable details.</li>
  </ul>

  <h2>AI and Data Processing</h2>
  <ul>
    <li>GraviLog uses AI models to offer insights and content based on user inputs.</li>
    <li>These AI-driven features are for educational and informational support only and do not replace professional medical advice or diagnosis.</li>
    <li>AI interactions are stored temporarily to improve service quality but are not used for profiling beyond app functionality.</li>
  </ul>

  <h2>Data Security</h2>
  <ul>
    <li>We use encryption and industry-standard security protocols to protect user data during transmission and storage.</li>
    <li>Strict access controls and security procedures help prevent unauthorized access.</li>
    <li>While we strive to protect your information, no system is completely secure. Users acknowledge that they provide data at their own risk.</li>
    <li>In the event of a data breach, we will notify affected users in accordance with applicable laws.</li>
  </ul>

  <h2>Privacy, Data Protection, and Compliance</h2>
  <ul>
    <li>GraviLog is committed to protecting user privacy and complying with internationally recognized data protection standards and best practices, including GDPR and CCPA.</li>
    <li>All data is stored and processed using high-level security technologies, including encryption and strict access controls.</li>
    <li>Medical and personal information will not be shared with any third party without the user’s explicit consent, except where required by law or for legitimate medical purposes within the scope of the platform's services.</li>
    <li>While GraviLog strives to adhere to the highest standards of privacy, the system is not specifically designed to comply with all aspects of HIPAA. Use of the platform is at the user’s discretion with awareness of this limitation.</li>
    <li>By using our services, you agree to the collection, use, and storage of your data in accordance with the Privacy Policy.</li>
  </ul>

  <h2>User Rights</h2>
  <p>Users have the right to:</p>
  <ul>
    <li>Access, correct, or delete their personal information.</li>
    <li>Withdraw consent for data processing at any time (subject to legal limitations).</li>
    <li>Request a copy of their personal data (data portability).</li>
    <li>Limit or object to certain data processing activities.</li>
  </ul>
  <p>To exercise these rights, contact us at: <a href="mailto:support@gravilog.com">support@gravilog.com</a></p>

  <h2>Data Retention</h2>
  <ul>
    <li>Personal data is retained only as long as necessary for service provision, support, or compliance with legal obligations.</li>
    <li>Upon account deletion, associated personal data is permanently erased unless legally required to retain it (e.g., for regulatory purposes).</li>
    <li>Backup files and access logs may be retained for up to 90 days for security, recovery, and audit purposes.</li>
  </ul>

  <h2>Cookies and Tracking Technologies</h2>
  <ul>
    <li>We use cookies and similar technologies to enhance app performance, provide personalized experiences, and track usage for internal analytics.</li>
    <li>These may be used both in the GraviLog mobile app and on our website.</li>
    <li>Some third-party services (e.g., Firebase, analytics SDKs) may also set cookies.</li>
    <li>Users can manage or disable cookie tracking via their device or browser settings.</li>
  </ul>

  <h2>Policy Updates</h2>
  <p>We reserve the right to update this Privacy Policy. Continued use of our services through the App/website constitutes acceptance of the revised policy.</p>

  <h2>Contact Information</h2>
  <p>For questions or requests related to this Privacy Policy, contact us at: <a href="mailto:support@gravilog.com">support@gravilog.com</a></p>

    """,
    "ar": """
 <h1>سياسة الخصوصية</h1>

  <h2>المقدمة</h2>
  <p>مرحباً بك في سجل الحمل (GraviLog). خصوصيتك تهمنا، ونحن ملتزمون بحماية معلوماتك الشخصية. توضح سياسة الخصوصية هذه كيف نقوم بجمع بياناتك واستخدامها وحمايتها عند استخدامك لخدماتنا.</p>

  <h2>المعلومات التي نقوم بجمعها</h2>
  <ul>
    <li>المعلومات الشخصية: الاسم، عنوان البريد الإلكتروني، تفاصيل الاتصال، ومعلومات الدفع (إن وجدت).</li>
    <li>البيانات الصحية: حالة الحمل، التفضيلات الغذائية، ومدخلات صحية أخرى يتم تقديمها طوعاً من قبل المستخدمين.</li>
    <li>بيانات الاستخدام: معلومات حول كيفية تفاعل المستخدمين مع التطبيق، بما في ذلك نوع الجهاز، نظام التشغيل، واستخدام الميزات.</li>
    <li>معرفات الجهاز وعنوان IP: لأغراض الأمان، والتشخيص، والتخصيص.</li>
    <li>بيانات الموقع الجغرافي: قد نقوم بجمع بيانات الموقع (مثل GPS أو عنوان IP) بإذن المستخدم، لتقديم خدمات أو رؤى صحية مخصصة.</li>
    <li>ملفات تعريف الارتباط وتقنيات التتبع: انظر القسم 10 للمزيد من التفاصيل.</li>
  </ul>

  <h2>كيفية استخدام معلوماتك</h2>
  <ul>
    <li>تقديم وتشغيل وتحسين خدماتنا.</li>
    <li>تخصيص التوصيات بناءً على البيانات الصحية وسلوك الاستخدام.</li>
    <li>تحليل أداء التطبيق وتفاعل المستخدمين لتحسين الميزات.</li>
    <li>ضمان الأمان، ومنع الاحتيال، والامتثال للالتزامات القانونية.</li>
    <li>إرسال التحديثات، والمحتوى الترويجي، والإشعارات (مع خيارات إلغاء الاشتراك).</li>
    <li>استخدام البيانات المجمعة والمجهولة الهوية لتحسين أداء الذكاء الاصطناعي، وتطوير المنتجات، وتقديم رؤى للصحة العامة (دون التعرف على المستخدمين).</li>
  </ul>

  <h2>مشاركة البيانات والأطراف الخارجية</h2>
  <ul>
    <li>لا نقوم ببيع معلوماتك الشخصية.</li>
    <li>قد نشارك بيانات محدودة مع مزودي خدمات موثوقين من الأطراف الثالثة فقط حسب الحاجة لتوفير وظائف التطبيق الأساسية.</li>
    <li>يُطلب من هؤلاء الشركاء حماية بياناتك واستخدامها فقط في إطار الخدمات المحددة.</li>
    <li>قد نفصح عن المعلومات إذا طُلب منا ذلك قانونياً أو لحماية الحقوق القانونية أو السلامة.</li>
    <li>البيانات المستخدمة في التحليلات أو البحث تكون مجهولة الهوية ولا تحتوي على تفاصيل تعريفية للمستخدمين.</li>
  </ul>

  <h2>الذكاء الاصطناعي ومعالجة البيانات</h2>
  <p>يستخدم سجل الحمل نماذج الذكاء الاصطناعي لتقديم رؤى ومحتوى بناءً على مدخلات المستخدم. هذه الميزات هي لأغراض تعليمية فقط ولا تُعد بديلاً عن الاستشارة الطبية. يتم تخزين التفاعلات مؤقتاً لتحسين الجودة، دون استخدام لتحديد الهوية.</p>

  <h2>أمان البيانات</h2>
  <ul>
    <li>نستخدم تقنيات التشفير وبروتوكولات الأمان المعتمدة في المجال لحماية بيانات المستخدم أثناء نقلها وتخزينها.</li>
    <li>يتم تطبيق ضوابط صارمة على الوصول للحماية من الوصول غير المصرح به.</li>
    <li>لا يوجد نظام آمن بنسبة 100٪ ويُقر المستخدم بمسؤوليته عند تقديم البيانات.</li>
    <li>في حال حدوث خرق، سيتم إخطار المستخدمين المتأثرين وفقاً للقوانين المعمول بها.</li>
  </ul>

  <h2>الخصوصية والامتثال</h2>
  <p>يلتزم سجل الحمل (GraviLog) بأفضل الممارسات والمعايير الدولية في حماية البيانات مثل GDPR وCCPA. لا تُشارك البيانات الطبية أو الشخصية بدون موافقة، ما لم يقتضِ القانون ذلك. المنصة غير مصممة للامتثال الكامل لمعايير HIPAA.</p>

  <h2>حقوق المستخدمين</h2>
  <ul>
    <li>الوصول إلى معلوماتهم وتصحيحها أو حذفها.</li>
    <li>سحب الموافقة على المعالجة في أي وقت (مع مراعاة القيود القانونية).</li>
    <li>طلب نسخة من البيانات (قابلية نقل البيانات).</li>
    <li>تقييد أو الاعتراض على بعض أنشطة المعالجة.</li>
    <li>للتواصل: <a href="mailto:support@gravilog.com">support@gravilog.com</a></li>
  </ul>

  <h2>الاحتفاظ بالبيانات</h2>
  <ul>
    <li>يتم الاحتفاظ بالبيانات فقط حسب الحاجة للخدمة أو للامتثال القانوني.</li>
    <li>عند حذف الحساب، يتم حذف جميع البيانات ما لم يكن هناك سبب قانوني للاحتفاظ بها.</li>
    <li>قد يتم الاحتفاظ بنسخ احتياطية لمدة تصل إلى 90 يوماً لأغراض الأمان واستعادة النظام.</li>
  </ul>

  <h2>ملفات تعريف الارتباط وتقنيات التتبع</h2>
  <ul>
    <li>نستخدم ملفات تعريف الارتباط لتحسين الأداء، وتقديم تجارب مخصصة، وتحليل الاستخدام.</li>
    <li>قد تستخدم بعض الخدمات الخارجية ملفات تعريف ارتباط أيضاً (مثل Firebase).</li>
    <li>يمكن إدارة هذه الإعدادات من خلال الجهاز أو المتصفح.</li>
  </ul>

  <h2>تحديثات سياسة الخصوصية</h2>
  <p>نحتفظ بحق تحديث هذه السياسة. استمرار استخدامك للخدمة يُعد قبولاً للسياسة المحدثة.</p>

  <h2>معلومات التواصل</h2>
  <p>لأي استفسارات أو طلبات تتعلق بسياسة الخصوصية، يُرجى التواصل عبر البريد الإلكتروني: <a href="mailto:support@gravilog.com">support@gravilog.com</a></p>
    """
  };

  @override
  Widget build(BuildContext context) {
    return context.gradientScaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.loading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Html(
                data: htmlData[controller.currentLanguage.value],
              ),
            ),
          );
        }),
      ),
    );
  }
}

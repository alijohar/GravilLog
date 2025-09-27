import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/term_of_use_controller.dart';

class TermsOfUseView extends StatelessWidget {
  TermsOfUseView({super.key});

  TermsOfUseController controller = Get.find();

  final htmlData = {
    "en": """
  <h1>Terms of Use</h1>

  <h2>Introduction</h2>
  <p>Welcome to GraviLog. These Terms of Use ("Terms") govern your access to and use of the GraviLog mobile application ("App") and website ("Website"). By using our services, you agree to abide by these Terms. If you do not agree, you must discontinue use immediately.</p>

  <h2>Definitions</h2>
  <ul>
    <li><strong>GraviLog:</strong> A mobile application and website offering health and pregnancy-related information.</li>
    <li><strong>User:</strong> Any individual who accesses and uses GraviLog.</li>
    <li><strong>Company:</strong> The legal entity that owns and operates GraviLog.</li>
    <li><strong>Services:</strong> All features, subscriptions, information, AI-generated recommendations or other, and interactions provided through the App and Website.</li>
    <li><strong>EMR (Electronic Medical Record):</strong> A cloud-based system that digitizes and stores medical records for pregnant women, utilized by healthcare professionals, including OB/GYNs, for patient monitoring and care.</li>
  </ul>

  <h2>Medical Disclaimer</h2>
  <p>The content provided on GraviLog is for informational purposes only and is not a substitute for professional medical advice. Users should consult with a qualified healthcare provider before making any medical decisions. The AI-powered features or others, including pregnancy predictions, ultrasound assessments, and ECG analysis, provide general insights and should not be relied upon for medical diagnoses or treatments.</p>

  <h2>Eligibility and Proper Use Conditions</h2>
  <ul>
    <li>Users must be 18 years of age or older.</li>
    <li>It is prohibited to use any of the platform's services for illegal or unauthorized purposes.</li>
    <li>You agree to provide accurate and up-to-date information and maintain the confidentiality of your login credentials.</li>
  </ul>

  <h2>Privacy, Data Protection, and Compliance</h2>
  <p>GraviLog is committed to protecting user privacy and complying with international data protection standards including GDPR and CCPA. All data is encrypted and strictly access-controlled. Medical and personal data will only be shared with user consent, or where legally required. The platform is not fully HIPAA-compliant and users use it with this knowledge.</p>

  <h2>Subscription and Payments</h2>
  <ul>
    <li>Some features require a paid subscription.</li>
    <li>Subscriptions auto-renew unless canceled in advance.</li>
    <li>Refunds are subject to our refund policy.</li>
    <li>Nutrition services are billed according to the selected plan.</li>
  </ul>

  <h2>Intellectual Property Rights</h2>
  <p>All content is the property of GraviLog or its licensors. You may not copy or redistribute any content without permission.</p>

  <h2>Prohibited Conduct</h2>
  <ul>
    <li>No offensive, misleading, or illegal content.</li>
    <li>No tampering or unauthorized access.</li>
    <li>Violation of terms may result in account termination without notice.</li>
  </ul>

  <h2>Termination</h2>
  <p>We may suspend or terminate your access at any time for violations or other reasons. You may stop using the service at any time.</p>

  <h2>Disclaimer</h2>
  <p>GraviLog is not liable for damages arising from use of the service. All services are provided “as is”. Users should consult healthcare professionals before relying on content, meals, or advice provided through GraviLog.</p>

  <h2>AI and Third-Party Integrations</h2>
  <p>AI-generated responses may not always be accurate. Third-party tools may be integrated, and data shared under strict policies.</p>

  <h2>User Responsibilities</h2>
  <p>Users must provide truthful information and not misuse the platform.</p>

  <h2>EMR Use Terms</h2>
  <ul>
    <li>Healthcare professionals must maintain confidentiality of records.</li>
    <li>Use must comply with data protection laws.</li>
    <li>GraviLog is not responsible for unauthorized access unless caused by GraviLog’s own failure.</li>
  </ul>

  <h2>Liability Limitations</h2>
  <p>To the extent allowed by law, GraviLog is not liable for indirect or consequential damages, data loss, or reliance on AI content. Use of the platform is at your own risk.</p>

  <h2>Governing Law and Jurisdiction</h2>
  <p>These terms are governed by the laws of the country where GraviLog is headquartered. Disputes will be resolved through mediation or arbitration first.</p>

  <h2>Updates and Modifications</h2>
  <p>We may update these Terms at any time. Continued use implies acceptance.</p>

  <h2>Contact Information</h2>
  <p>For inquiries, contact: <a href="mailto:support@gravilog.com">support@gravilog.com</a></p>
  """,
    "ar": """
<h1>شروط الاستخدام</h1>

<h2>المقدمة</h2>
<p>مرحبًا بك في سجل الحمل (GraviLog). تنظم هذه الشروط والأحكام "الشروط" وصولك إلى نظام سجل الحمل واستخدامك له، سواء من خلال التطبيق أو الموقع الإلكتروني. باستخدامك لخدماتنا، فإنك توافق على الالتزام بهذه الشروط. إذا لم تكن موافقًا، يُرجى التوقف عن استخدام الخدمة فورًا.</p>

<h2>التعريفات</h2>
<ul>
  <li><strong>سجل الحمل:</strong> تطبيق وموقع إلكتروني يقدمان معلومات تتعلق بالصحة والحمل.</li>
  <li><strong>المستخدم:</strong> أي فرد يصل إلى سجل الحمل ويستخدمه.</li>
  <li><strong>الشركة:</strong> الكيان القانوني الذي يملك ويدير سجل الحمل.</li>
  <li><strong>الخدمات:</strong> جميع الميزات والاشتراكات والمعلومات والتوصيات الناتجة عن الذكاء الاصطناعي أو غيره، والتفاعلات المقدمة من خلال التطبيق والموقع.</li>
  <li><strong>السجل الطبي الإلكتروني (EMR):</strong> نظام قائم على الحوسبة السحابية يقوم برقمنة وحفظ السجلات الطبية للنساء الحوامل، ويُستخدم من قبل المتخصصين في الرعاية الصحية، بما في ذلك أطباء النساء والتوليد، لمتابعة حالة المرضى وتقديم الرعاية الطبية.</li>
</ul>

<h2>إخلاء المسؤولية الطبية</h2>
<p>المحتوى المقدم في سجل الحمل هو لأغراض معلوماتية فقط ولا يُعد بديلاً عن الاستشارة الطبية المتخصصة. يجب على المستخدمين استشارة مقدم رعاية صحية مؤهل قبل اتخاذ أي قرارات طبية. الميزات المدعومة بالذكاء الاصطناعي أو غيره، بما في ذلك توقعات الحمل، وتقييمات الموجات فوق الصوتية، وتحليل تخطيط القلب، توفر رؤى عامة ولا ينبغي الاعتماد عليها للتشخيص أو العلاج الطبي.</p>

<h2>شروط الأهلية والاستخدام السليم</h2>
<ul>
  <li>يجب أن يكون المستخدمون بعمر 18 عامًا أو أكثر.</li>
  <li>يُحظر استخدام أي من خدمات المنصة لأي أغراض غير قانونية أو غير مصرح بها.</li>
  <li>توافق على تقديم معلومات دقيقة وحديثة وتحمل المسؤولية الكاملة عن سرية بيانات الدخول الخاصة بك.</li>
</ul>

<h2>الخصوصية وحماية البيانات والامتثال</h2>
<p>يلتزم سجل الحمل (GraviLog) بحماية خصوصية المستخدمين والامتثال للمعايير الدولية مثل GDPR وCCPA. يتم تشفير البيانات والتحكم في الوصول إليها بصرامة. لا يتم مشاركة البيانات الطبية أو الشخصية إلا بموافقة المستخدم أو إذا تطلب القانون ذلك. المنصة ليست متوافقة بالكامل مع HIPAA، ويستخدمها المستخدم على علم بذلك.</p>

<h2>الاشتراكات والمدفوعات</h2>
<ul>
  <li>تتطلب بعض الميزات اشتراكًا مدفوعًا.</li>
  <li>يتم تجديد الاشتراكات تلقائيًا ما لم يتم إلغاؤها مسبقًا.</li>
  <li>يتم تطبيق سياسة الاسترداد الخاصة بنا على المبالغ المستردة.</li>
  <li>يتم احتساب رسوم خدمات التغذية حسب الخطة المختارة.</li>
</ul>

<h2>حقوق الملكية الفكرية</h2>
<p>جميع المحتويات مملوكة لسجل الحمل أو الجهات المرخصة له. لا يجوز نسخ أو إعادة توزيع أي محتوى بدون إذن.</p>

<h2>السلوك المحظور</h2>
<ul>
  <li>يُمنع المحتوى المسيء أو المضلل أو غير القانوني.</li>
  <li>يُمنع التلاعب أو الوصول غير المصرح به.</li>
  <li>قد يتم إنهاء الحساب في حال انتهاك الشروط دون إشعار.</li>
</ul>

<h2>الإنهاء</h2>
<p>يجوز لنا تعليق أو إنهاء وصولك في أي وقت نتيجة الانتهاكات أو لأسباب أخرى. يمكنك التوقف عن استخدام الخدمة في أي وقت.</p>

<h2>إخلاء المسؤولية</h2>
<p>لا تتحمل سجل الحمل أي مسؤولية عن الأضرار الناتجة عن استخدام الخدمة. يتم تقديم الخدمات "كما هي". يجب استشارة متخصصين قبل الاعتماد على أي محتوى أو توصيات.</p>

<h2>الذكاء الاصطناعي والربط مع البرامج الخارجية</h2>
<p>قد لا تكون الردود التي يولدها الذكاء الاصطناعي دقيقة دائمًا. قد يتم دمج أدوات تابعة لجهات خارجية ومشاركة البيانات بموجب سياسات صارمة.</p>

<h2>مسؤوليات المستخدم</h2>
<p>يجب على المستخدمين تقديم معلومات صادقة وعدم إساءة استخدام المنصة.</p>

<h2>شروط استخدام السجل الطبي الإلكتروني (EMR)</h2>
<ul>
  <li>يجب على المتخصصين في الرعاية الصحية الحفاظ على سرية السجلات.</li>
  <li>يجب أن يكون الاستخدام متوافقًا مع قوانين حماية البيانات.</li>
  <li>لا تتحمل سجل الحمل المسؤولية عن الوصول غير المصرح به إلا إذا كان بسبب خلل منها.</li>
</ul>

<h2>حدود المسؤولية</h2>
<p>في حدود القانون، لا تتحمل سجل الحمل مسؤولية الأضرار غير المباشرة أو الخسائر أو الاعتماد على المحتوى المدعوم بالذكاء الاصطناعي. استخدامك للمنصة على مسؤوليتك الخاصة.</p>

<h2>القانون والاختصاص القضائي</h2>
<p>تخضع هذه الشروط لقوانين الدولة التي يقع فيها المقر الرئيسي لسجل الحمل. تُحل النزاعات عبر الوساطة أو التحكيم أولاً.</p>

<h2>التحديثات والتعديلات</h2>
<p>يجوز لنا تحديث هذه الشروط في أي وقت. استمرار استخدامك للخدمة يعني موافقتك على الشروط المحدثة.</p>

<h2>معلومات الاتصال</h2>
<p>للاستفسارات، يرجى التواصل معنا عبر البريد الإلكتروني: <a href="mailto:support@gravilog.com">support@gravilog.com</a></p>
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

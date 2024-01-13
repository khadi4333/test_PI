import 'package:get/get.dart';

class LocalString extends Translations {
  Map<String, Map<String, String>> get keys => {
        'en_An': {
          'hello': 'Hello',
          'message': 'Welcome',
          'sub':'subscribe us now',
          'changelong': 'change Language'
        },
        'en_Ar': {
          'hello': 'أهلا',
          'message': 'مرحبًا',
          'sub': 'اشترك الآن',
          'changelong': 'تغيير اللغة'
        },
        'en_Fr': {
          'hello': 'Bonjour bonjour',
          'message': 'Bienvenue',
          'sub': 'Abonnez-vous maintenant',
          'changelong': 'changer de langue'
        }
      };
}

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'ar', 'zh_Hans', 'ru', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? arText = '',
    String? zh_HansText = '',
    String? ruText = '',
    String? frText = '',
  }) =>
      [enText, esText, arText, zh_HansText, ruText, frText][languageIndex] ??
      '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SplashScreen
  {
    'lnyxzvw4': {
      'en': 'Register',
      'ar': 'يسجل',
      'es': 'Registro',
      'fr': 'Enregistrer',
      'ru': 'регистр',
      'zh_Hans': '登记',
    },
    'smcyw0pe': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Connexion',
      'ru': 'Авторизоваться',
      'zh_Hans': '登录',
    },
    'txwymda9': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // Login
  {
    'e4x01h41': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse e-mail',
      'ru': 'Адрес электронной почты',
      'zh_Hans': '电子邮件地址',
    },
    'q7z7h35q': {
      'en': 'Your email...',
      'ar': 'بريدك الالكتروني...',
      'es': 'Tu correo electrónico...',
      'fr': 'Votre e-mail...',
      'ru': 'Ваш адрес электронной почты...',
      'zh_Hans': '你的邮件...',
    },
    'w91ob5aq': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'ru': 'Пароль',
      'zh_Hans': '密码',
    },
    'mlugae8h': {
      'en': 'Enter your password here...',
      'ar': 'أدخل كلمة المرور الخاصة بك هنا ...',
      'es': 'Ingrese su contraseña aquí...',
      'fr': 'Entrez votre mot de passe ici...',
      'ru': 'Введите свой пароль здесь...',
      'zh_Hans': '在这里输入您的密码...',
    },
    'r18lc0up': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Connexion',
      'ru': 'Авторизоваться',
      'zh_Hans': '登录',
    },
    'ux39wobp': {
      'en': 'Don’t have an account yet? ',
      'ar': 'لا تملك حسابا حتى الآن؟',
      'es': '¿Aún no tienes una cuenta?',
      'fr': 'Vous n\'avez pas encore de compte?',
      'ru': 'У вас еще нет аккаунта?',
      'zh_Hans': '还没有账户？',
    },
    '013ez5lw': {
      'en': 'Register',
      'ar': 'يسجل',
      'es': 'Registro',
      'fr': 'Enregistrer',
      'ru': 'регистр',
      'zh_Hans': '登记',
    },
    's7bqwr7q': {
      'en': 'Please fill in a valid email address...',
      'ar': 'من فضلك املأ ببريد الكترونى صالح...',
      'es':
          'Por favor, introduzca una dirección de correo electrónico válida...',
      'fr': 'Veuillez saisir une adresse e-mail valide...',
      'ru': 'Пожалуйста, заполните действующий адрес электронной почты...',
      'zh_Hans': '请填写一个有效的电子邮件地址...',
    },
    '6aierhcx': {
      'en': 'That password doesn\'t match.',
      'ar': 'كلمة المرور هذه غير متطابقة.',
      'es': 'Esa contraseña no coincide.',
      'fr': 'Ce mot de passe ne correspond pas.',
      'ru': 'Этот пароль не подходит.',
      'zh_Hans': '该密码不匹配。',
    },
    'vii4koue': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // SkinColor
  {
    'vzalxeun': {
      'en': 'Tone, choose one:',
      'ar': 'نغمة ، اختر واحدة:',
      'es': 'Tono, elige uno:',
      'fr': 'Tonalité, choisissez-en une :',
      'ru': 'Тон, выберите один:',
      'zh_Hans': '语气，任选其一：',
    },
    'zp1690gj': {
      'en': '--',
      'ar': '-',
      'es': '--',
      'fr': '--',
      'ru': '--',
      'zh_Hans': '--',
    },
  },
  // Register
  {
    'foyk8rpz': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
      'ru': 'Полное имя',
      'zh_Hans': '全名',
    },
    'pvqj4fxi': {
      'en': 'Enter your name here...',
      'ar': 'أدخل اسمك هنا...',
      'es': 'Introduzca su nombre aquí...',
      'fr': 'Entrez votre nom ici...',
      'ru': 'Введите ваше имя здесь...',
      'zh_Hans': '在这里输入你的名字...',
    },
    'rv5cxh5a': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse e-mail',
      'ru': 'Адрес электронной почты',
      'zh_Hans': '电子邮件地址',
    },
    'kx7b7fca': {
      'en': 'Enter your email here...',
      'ar': 'أدخل عنوان بريدك الإلكتروني هنا...',
      'es': 'Introduzca su correo electrónico aquí...',
      'fr': 'Entrez votre email ici...',
      'ru': 'Введите свой адрес электронной почты здесь...',
      'zh_Hans': '在此处输入您的电子邮件...',
    },
    'kcdir8sv': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'ru': 'Пароль',
      'zh_Hans': '密码',
    },
    'zp9polng': {
      'en': 'Enter your password here...',
      'ar': 'أدخل كلمة المرور الخاصة بك هنا ...',
      'es': 'Ingrese su contraseña aquí...',
      'fr': 'Entrez votre mot de passe ici...',
      'ru': 'Введите свой пароль здесь...',
      'zh_Hans': '在这里输入您的密码...',
    },
    'w3i0bxpb': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
      'es': 'confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
      'ru': 'Подтвердите пароль',
      'zh_Hans': '确认密码',
    },
    '4v9g9tgl': {
      'en': 'Confirm password here...',
      'ar': 'أكد كلمة المرور هنا ...',
      'es': 'Confirmar contraseña aquí...',
      'fr': 'Confirmez le mot de passe ici...',
      'ru': 'Подтвердите пароль здесь...',
      'zh_Hans': '在这里确认密码...',
    },
    '2ubxzv2j': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
      'ru': 'Зарегистрироваться',
      'zh_Hans': '创建账户',
    },
    'a6r9h36i': {
      'en': 'Already have an account?',
      'ar': 'هل لديك حساب؟',
      'es': '¿Ya tienes una cuenta?',
      'fr': 'Vous avez déjà un compte?',
      'ru': 'У вас уже есть аккаунт?',
      'zh_Hans': '已有帐户？',
    },
    'exzd5kvy': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Connexion',
      'ru': 'Авторизоваться',
      'zh_Hans': '登录',
    },
    'hei6cqr0': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // Disability
  {
    'j52w0iuh': {
      'en': 'Please type any disabilities here:',
      'ar': 'الرجاء كتابة أي إعاقات هنا:',
      'es': 'Escriba cualquier discapacidad aquí:',
      'fr': 'Veuillez saisir tout handicap ici :',
      'ru': 'Пожалуйста, введите любые ограничения здесь:',
      'zh_Hans': '请在此处输入任何残疾：',
    },
    'v00foiyu': {
      'en': 'Disability',
      'ar': 'عجز',
      'es': 'Discapacidad',
      'fr': 'Invalidité',
      'ru': 'Инвалидность',
      'zh_Hans': '失能',
    },
    '9ml0x6su': {
      'en': '--',
      'ar': '-',
      'es': '--',
      'fr': '--',
      'ru': '--',
      'zh_Hans': '--',
    },
  },
  // EditProfile
  {
    'ttzcovgw': {
      'en': 'Update Account Information',
      'ar': 'تحديث معلومات الحساب',
      'es': 'Actualizar información de la cuenta',
      'fr': 'Mettre à jour les informations du compte',
      'ru': 'Обновить информацию об учетной записи',
      'zh_Hans': '更新账户信息',
    },
    '538h33m6': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
      'ru': 'Полное имя',
      'zh_Hans': '全名',
    },
    '123724x6': {
      'en': 'Please enter your full name...',
      'ar': 'من فضلك ادخل اسمك الكامل...',
      'es': 'Por favor ingresa tu nombre completo...',
      'fr': 'S\'il vous plait entrez votre nom entier...',
      'ru': 'Пожалуйста введите свое полное имя...',
      'zh_Hans': '请输入您的全名...',
    },
    'w3dcuc34': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse e-mail',
      'ru': 'Адрес электронной почты',
      'zh_Hans': '电子邮件地址',
    },
    'c6s07j0h': {
      'en': 'Your email...',
      'ar': 'بريدك الالكتروني...',
      'es': 'Tu correo electrónico...',
      'fr': 'Votre e-mail...',
      'ru': 'Ваш адрес электронной почты...',
      'zh_Hans': '你的邮件...',
    },
    'vik7okle': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'es': 'Guardar cambios',
      'fr': 'Sauvegarder les modifications',
      'ru': 'Сохранить изменения',
      'zh_Hans': '保存更改',
    },
    '78tcpl3f': {
      'en': 'Please fill in a valid email address...',
      'ar': 'من فضلك املأ ببريد الكترونى صالح...',
      'es':
          'Por favor, introduzca una dirección de correo electrónico válida...',
      'fr': 'Veuillez saisir une adresse e-mail valide...',
      'ru': 'Пожалуйста, заполните действующий адрес электронной почты...',
      'zh_Hans': '请填写一个有效的电子邮件地址...',
    },
    'hv1zrp0y': {
      'en': 'Please fill in a valid email address...',
      'ar': 'من فضلك املأ ببريد الكترونى صالح...',
      'es':
          'Por favor, introduzca una dirección de correo electrónico válida...',
      'fr': 'Veuillez saisir une adresse e-mail valide...',
      'ru': 'Пожалуйста, заполните действующий адрес электронной почты...',
      'zh_Hans': '请填写一个有效的电子邮件地址...',
    },
    '5khubme1': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
      'ru': 'Редактировать профиль',
      'zh_Hans': '编辑个人资料',
    },
    'lb8zt3dj': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // Features
  {
    'pdwx8rq6': {
      'en': 'Features',
      'ar': 'سمات',
      'es': 'Características',
      'fr': 'Caractéristiques',
      'ru': 'Функции',
      'zh_Hans': '特征',
    },
    '0b2l02w0': {
      'en': 'Feature 1',
      'ar': 'ميزة 1',
      'es': 'Característica 1',
      'fr': 'Caractéristique 1',
      'ru': 'Особенность 1',
      'zh_Hans': '特点 1',
    },
    'ceaw49il': {
      'en': 'Freckles',
      'ar': 'النمش',
      'es': 'pecas',
      'fr': 'Taches de rousseur',
      'ru': 'Веснушки',
      'zh_Hans': '雀斑',
    },
    'n0wqz89t': {
      'en': 'Feature 2',
      'ar': 'ميزة 2',
      'es': 'Característica 2',
      'fr': 'Caractéristique 2',
      'ru': 'Особенность 2',
      'zh_Hans': '特征2',
    },
    'savyyxv2': {
      'en': 'Acne scars',
      'ar': 'ندبات حب الشباب',
      'es': 'Cicatrices de acné',
      'fr': 'Cicatrices d\'acné',
      'ru': 'Шрамы от прыщей',
      'zh_Hans': '痤疮疤痕',
    },
    'gkk4cg2m': {
      'en': 'Feature 3',
      'ar': 'ميزة 3',
      'es': 'Característica 3',
      'fr': 'Caractéristique 3',
      'ru': 'Особенность 3',
      'zh_Hans': '特色三',
    },
    's890chax': {
      'en': 'Dry skin',
      'ar': 'جلد جاف',
      'es': 'Piel seca',
      'fr': 'Peau sèche',
      'ru': 'Сухая кожа',
      'zh_Hans': '皮肤干燥',
    },
    'feohg242': {
      'en': 'Feature 4',
      'ar': 'ميزة 4',
      'es': 'Característica 4',
      'fr': 'Caractéristique 4',
      'ru': 'Особенность 4',
      'zh_Hans': '特点 4',
    },
    'zp7j4fo0': {
      'en': 'Dry lips',
      'ar': 'شفاه جافة',
      'es': 'Labios secos',
      'fr': 'Lèvres sèches',
      'ru': 'Сухие губы',
      'zh_Hans': '嘴唇干燥',
    },
    'jmtb9tql': {
      'en': 'Feature 5',
      'ar': 'ميزة 5',
      'es': 'Característica 5',
      'fr': 'Caractéristique 5',
      'ru': 'Особенность 5',
      'zh_Hans': '特点 5',
    },
    '95x3p98v': {
      'en': 'Skin tags',
      'ar': 'علامات الجلد',
      'es': 'Etiquetas de la piel',
      'fr': 'Acrochordons',
      'ru': 'Метки на коже',
      'zh_Hans': '皮肤标签',
    },
    'vfuyq9sk': {
      'en': 'Feature 6',
      'ar': 'ميزة 6',
      'es': 'Característica 6',
      'fr': 'Caractéristique 6',
      'ru': 'Особенность 6',
      'zh_Hans': '特征 6',
    },
    'bwfxahft': {
      'en': 'example',
      'ar': 'مثال',
      'es': 'ejemplo',
      'fr': 'exemple',
      'ru': 'пример',
      'zh_Hans': '例子',
    },
    'fmff9jap': {
      'en': 'Feature 7',
      'ar': 'ميزة 7',
      'es': 'Característica 7',
      'fr': 'Caractéristique 7',
      'ru': 'Особенность 7',
      'zh_Hans': '特点 7',
    },
    'k1m8gbxl': {
      'en': 'example',
      'ar': 'مثال',
      'es': 'ejemplo',
      'fr': 'exemple',
      'ru': 'пример',
      'zh_Hans': '例子',
    },
    'dmq6wyj5': {
      'en': 'Feature 8',
      'ar': 'ميزة 8',
      'es': 'Característica 8',
      'fr': 'Caractéristique 8',
      'ru': 'Особенность 8',
      'zh_Hans': '专题八',
    },
    '7z5x6u86': {
      'en': 'example',
      'ar': 'مثال',
      'es': 'ejemplo',
      'fr': 'exemple',
      'ru': 'пример',
      'zh_Hans': '例子',
    },
    'f8zp09gg': {
      'en': 'Feature 9',
      'ar': 'ميزة 9',
      'es': 'Característica 9',
      'fr': 'Caractéristique 9',
      'ru': 'Особенность 9',
      'zh_Hans': '专题 9',
    },
    'vpgp4glf': {
      'en': 'example',
      'ar': 'مثال',
      'es': 'ejemplo',
      'fr': 'exemple',
      'ru': 'пример',
      'zh_Hans': '例子',
    },
    '28yv1eoc': {
      'en': 'Feature 10',
      'ar': 'ميزة 10',
      'es': 'Característica 10',
      'fr': 'Caractéristique 10',
      'ru': 'Особенность 10',
      'zh_Hans': '专题 10',
    },
    'h29m8dc8': {
      'en': 'example',
      'ar': 'مثال',
      'es': 'ejemplo',
      'fr': 'exemple',
      'ru': 'пример',
      'zh_Hans': '例子',
    },
    'kbt01zj8': {
      'en': 'Other:',
      'ar': 'آخر:',
      'es': 'Otro:',
      'fr': 'Autre:',
      'ru': 'Другой:',
      'zh_Hans': '其他：',
    },
    '0b3u7u8z': {
      'en': 'type below',
      'ar': 'اكتب أدناه',
      'es': 'escriba a continuación',
      'fr': 'tapez ci-dessous',
      'ru': 'введите ниже',
      'zh_Hans': '在下面输入',
    },
    'oemevj2a': {
      'en': 'Type other here:',
      'ar': 'اكتب غير ذلك هنا:',
      'es': 'Escriba otro aquí:',
      'fr': 'Tapez autre ici :',
      'ru': 'Введите другое здесь:',
      'zh_Hans': '在这里输入其他：',
    },
    '09y80t3a': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // MyProfileSHOWSWHOUR
  {
    'b4ebihob': {
      'en': 'Welcome',
      'ar': 'مرحباً',
      'es': 'Bienvenido',
      'fr': 'Accueillir',
      'ru': 'Добро пожаловать',
      'zh_Hans': '欢迎',
    },
    'rivwzks6': {
      'en': 'Account Information',
      'ar': 'معلومات الحساب',
      'es': 'Información de la cuenta',
      'fr': 'Information sur le compte',
      'ru': 'Информация Об Учетной Записи',
      'zh_Hans': '帐户信息',
    },
    'lklzhrxn': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
      'ru': 'Редактировать профиль',
      'zh_Hans': '编辑个人资料',
    },
    'fkzvfuwb': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
      'ru': 'Изменить пароль',
      'zh_Hans': '更改密码',
    },
    'ceqghqy4': {
      'en': 'Switch to Dark Mode',
      'ar': 'قم بالتبديل إلى الوضع الداكن',
      'es': 'Cambiar al modo oscuro',
      'fr': 'Passer en mode sombre',
      'ru': 'Переключиться в темный режим',
      'zh_Hans': '切换到深色模式',
    },
    '6708ef4n': {
      'en': 'Switch to Light Mode',
      'ar': 'قم بالتبديل إلى وضع الإضاءة',
      'es': 'Cambiar al modo de luz',
      'fr': 'Passer en mode lumière',
      'ru': 'Переключиться в светлый режим',
      'zh_Hans': '切换到灯光模式',
    },
    'ycwkqb5t': {
      'en': 'Skin tone',
      'ar': 'لون البشرة',
      'es': 'Tono de piel',
      'fr': 'Teint',
      'ru': 'Оттенок кожи',
      'zh_Hans': '肤色',
    },
    '2m4u4da8': {
      'en': 'Features',
      'ar': 'سمات',
      'es': 'Características',
      'fr': 'Caractéristiques',
      'ru': 'Функции',
      'zh_Hans': '特征',
    },
    'ablwo5s4': {
      'en': 'Disabilities',
      'ar': 'إعاقات',
      'es': 'discapacidades',
      'fr': 'Handicapées',
      'ru': 'Инвалиды',
      'zh_Hans': '残疾',
    },
    'm8n6mh1x': {
      'en': 'Show my products\n',
      'ar': 'عرض منتجاتي',
      'es': 'mostrar mis productos',
      'fr': 'Afficher mes produits',
      'ru': 'Показать мои продукты',
      'zh_Hans': '显示我的产品',
    },
    'dugibiob': {
      'en': 'Log Out',
      'ar': 'تسجيل خروج',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
      'ru': 'Выйти',
      'zh_Hans': '登出',
    },
    'a53f9ztf': {
      'en': 'App Version v0.0',
      'ar': 'إصدار التطبيق v0.0',
      'es': 'Versión de la aplicación v0.0',
      'fr': 'Version de l\'application v0.0',
      'ru': 'Версия приложения v0.0',
      'zh_Hans': '应用程序版本 v0.0',
    },
    'xdcuaugy': {
      'en': '--',
      'ar': '-',
      'es': '--',
      'fr': '--',
      'ru': '--',
      'zh_Hans': '--',
    },
  },
  // ChangePassword
  {
    'mx12k9n9': {
      'en':
          'Enter your email and we will send a reset password link to your email for you to update it.',
      'ar':
          'أدخل بريدك الإلكتروني وسنرسل لك رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني لتحديثه.',
      'es':
          'Ingrese su correo electrónico y le enviaremos un enlace de restablecimiento de contraseña a su correo electrónico para que lo actualice.',
      'fr':
          'Entrez votre e-mail et nous vous enverrons un lien de réinitialisation du mot de passe sur votre e-mail pour que vous puissiez le mettre à jour.',
      'ru':
          'Введите свой адрес электронной почты, и мы отправим ссылку для сброса пароля на ваш адрес электронной почты, чтобы вы могли его обновить.',
      'zh_Hans': '输入您的电子邮件，我们将向您的电子邮件发送一个重置密码链接，供您更新。',
    },
    '644nspwc': {
      'en': 'Email address here...',
      'ar': 'عنوان البريد الإلكتروني هنا ...',
      'es': 'Dirección de correo electrónico aquí...',
      'fr': 'Adresse mail ici...',
      'ru': 'Адрес электронной почты здесь...',
      'zh_Hans': '电子邮件地址在这里...',
    },
    'n45gcpue': {
      'en': 'We will send a link to your email...',
      'ar': 'سنرسل رابط إلى بريدك الإلكتروني ...',
      'es': 'Te enviaremos un enlace a tu correo...',
      'fr': 'Nous vous enverrons un lien sur votre e-mail...',
      'ru': 'Мы вышлем ссылку на вашу электронную почту...',
      'zh_Hans': '我们将发送一个链接到您的电子邮件...',
    },
    'oiy012iq': {
      'en': 'Send Link',
      'ar': 'أرسل الرابط',
      'es': 'Enviar enlace',
      'fr': 'Envoyer un lien',
      'ru': 'Отправить ссылку',
      'zh_Hans': '发送链接',
    },
    'kyoxw788': {
      'en': 'Please fill in a new password..',
      'ar': 'الرجاء إدخال كلمة مرور جديدة ..',
      'es': 'Por favor ingrese una nueva contraseña..',
      'fr': 'Veuillez saisir un nouveau mot de passe..',
      'ru': 'Пожалуйста, введите новый пароль..',
      'zh_Hans': '请填写新密码..',
    },
    '1v5pk8jg': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
      'ru': 'Изменить пароль',
      'zh_Hans': '更改密码',
    },
    'yxoibe06': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'ru': 'Дом',
      'zh_Hans': '家',
    },
  },
  // Listofproducts
  {
    'ehb6gd9y': {
      'en': 'Search between your tailored products...',
      'ar': 'ابحث بين منتجاتك المصممة ...',
      'es': 'Busca entre tus productos a medida...',
      'fr': 'Cherchez entre vos produits sur mesure...',
      'ru': 'Поиск между вашими индивидуальными продуктами...',
      'zh_Hans': '在您定制的产品之间搜索...',
    },
    'phxct1fl': {
      'en': 'Men',
      'ar': 'رجال',
      'es': 'Hombres',
      'fr': 'Hommes',
      'ru': 'Люди',
      'zh_Hans': '男士',
    },
    'jxrmwa0r': {
      'en': 'Categories',
      'ar': 'فئات',
      'es': 'Categorías',
      'fr': 'Catégories',
      'ru': 'Категории',
      'zh_Hans': '类别',
    },
    'ugbw0tj1': {
      'en': 'Double Wear',
      'ar': 'ارتداء مزدوج',
      'es': 'Doble desgaste',
      'fr': 'Double usure',
      'ru': 'Двойная одежда',
      'zh_Hans': '双重磨损',
    },
    'ypohi24j': {
      'en': 'Advanced Night Repair Serum Duo',
      'ar': 'سيروم الإصلاح الليلي المتقدم الثنائي',
      'es': 'Dúo Sérum Reparador de Noche Avanzado',
      'fr': 'Duo Sérum Réparateur de Nuit Avancé',
      'ru': 'Усовершенствованная ночная восстанавливающая сыворотка Duo',
      'zh_Hans': 'Advanced Night Repair 精华二重奏',
    },
    '7e91tb0m': {
      'en': 'Advanced Night Repair Eye Supercharged Gel-Creme',
      'ar': 'كريم جل متطور لإصلاح البشرة الليلي',
      'es': 'Advanced Night Repair Eye Supercharged Gel-Creme',
      'fr': 'Gel-crème suralimenté pour les yeux Advanced Night Repair',
      'ru':
          'Гель-крем для кожи вокруг глаз Advanced Night Repair с суперзарядом',
      'zh_Hans': 'Advanced Night Repair 眼部增压凝胶霜',
    },
    'dfdo6531': {
      'en': 'Revitalizing Supreme+ Moisturizer',
      'ar': 'كريم التنشيط الفائق + المرطب',
      'es': 'Hidratante Revitalizante Supreme+',
      'fr': 'Hydratant Suprême+ Revitalisant',
      'ru': 'Восстанавливающий увлажняющий крем Supreme+',
      'zh_Hans': '活肤 Supreme+ 保湿霜',
    },
    '7jo1o7it': {
      'en': 'The Firming Routine',
      'ar': 'روتين الثبات',
      'es': 'La rutina reafirmante',
      'fr': 'La routine raffermissante',
      'ru': 'Укрепляющая процедура',
      'zh_Hans': '紧致护理',
    },
    'r3obbowv': {
      'en': 'Power Nap Facial',
      'ar': 'جلسة Power Nap للوجه',
      'es': 'Siesta energética facial',
      'fr': 'Soin du visage sieste',
      'ru': 'Power Nap для лица',
      'zh_Hans': '小睡面部护理',
    },
    '1vh61wb1': {
      'en': 'Advanced Night Repair Serum\nLimited Edition Bottle',
      'ar': 'مصل الإصلاح الليلي المتقدم\nزجاجة إصدار محدود',
      'es': 'Sérum Reparador de Noche Avanzado\nBotella de edición limitada',
      'fr': 'Sérum Réparateur de Nuit Avancé\nBouteille en édition limitée',
      'ru':
          'Усовершенствованная ночная восстанавливающая сыворотка\nБутылка ограниченного выпуска',
      'zh_Hans': '高级夜间修复精华素\n限量版瓶',
    },
    'kkcy7iak': {
      'en': 'Women',
      'ar': 'نحيف',
      'es': 'Mujer',
      'fr': 'Femmes',
      'ru': 'Женщины',
      'zh_Hans': '女性',
    },
    't7lt9uti': {
      'en': 'Categories',
      'ar': 'فئات',
      'es': 'Categorías',
      'fr': 'Catégories',
      'ru': 'Категории',
      'zh_Hans': '类别',
    },
    'br0e6aq7': {
      'en': 'Major Eye Impact Trio',
      'ar': 'ميجور آي إمباكت تريو',
      'es': 'Trío Major Eye Impact',
      'fr': 'Trio Impact Majeur sur les Yeux',
      'ru': 'Трио Major Eye Impact',
      'zh_Hans': '主要的眼睛影响三重奏',
    },
    'bmsxylx3': {
      'en': 'Revitalizing Supreme+ Bright',
      'ar': 'تنشيط سوبريم + برايت',
      'es': 'Revitalizante Supreme+ Bright',
      'fr': 'Revitalisant Supreme+ Bright',
      'ru': 'Восстанавливающий Supreme+ Bright',
      'zh_Hans': '活肤至尊+亮白',
    },
    '2nw490c4': {
      'en': 'Revitalizing Supreme+\nYouth Power Soft Milky Lotion Moisturizer',
      'ar': 'تنشيط سوبريم +\nمرطب لوشن حليبي ناعم من يوث باور',
      'es':
          'Revitalizante Supremo+\nCrema hidratante de loción lechosa suave Youth Power',
      'fr':
          'Suprême Revitalisant+\nLotion lactée douce et hydratante Youth Power',
      'ru':
          'Восстанавливающий Supreme+\nУвлажняющий лосьон Youth Power Soft Milky',
      'zh_Hans': '焕活至尊+\nYouth Power Soft Milky Lotion 保湿霜',
    },
    'w2unt3j7': {
      'en': 'The Radiance Routine\nResilience Multi-Effect Skincare Set',
      'ar': 'روتين التألق\nمجموعة مرنة للعناية بالبشرة متعددة التأثيرات',
      'es':
          'La rutina de resplandor\nSet de cuidado de la piel multiefectos Resilience',
      'fr': 'La Routine Éclat\nCoffret de soins multi-effets Resilience',
      'ru':
          'Процедура сияния\nМногоцелевой набор для ухода за кожей Resilience',
      'zh_Hans': '辐射程序\nResilience 多效护肤套装',
    },
    'gg7vheu3': {
      'en':
          'Resilience Multi-Effect Night Moisturizer\nTri-Peptide Face and Neck Creme',
      'ar': 'مرطب ليلي متعدد التأثيرات\nكريم ثلاثي الببتيد للوجه والرقبة',
      'es':
          'Hidratante de noche multiefectos Resilience\nCrema Tri-Péptido para Rostro y Cuello',
      'fr':
          'Hydratant de nuit multi-effets Resilience\nCrème Tri-Peptide Visage et Cou',
      'ru':
          'Ночное увлажняющее средство с мультиэффектом Resilience\nТрипептидный крем для лица и шеи',
      'zh_Hans': '弹性多效夜间保湿霜\n三胜肽面颈霜',
    },
    '5bygvq4b': {
      'en': 'Perfectly Clean\nMulti-Action Foam Cleanser/Purifying Mask',
      'ar': 'نظيفة تماما\nمنظف رغوي متعدد المفعول / قناع منقي',
      'es':
          'Perfectamente limpio\nEspuma limpiadora/mascarilla purificante multiacción',
      'fr':
          'Parfaitement propre\nMousse Nettoyante Multi-Actions/Masque Purifiant',
      'ru':
          'Идеально чистый\nМногофункциональная очищающая пенка/очищающая маска',
      'zh_Hans': '完美清洁\n多效泡沫洁面乳/净化面膜',
    },
    'kke8put8': {
      'en':
          'Perfectionist Pro Serum\nRapid Firm + Lift Treatment with Acetyl Hexapeptide-8',
      'ar':
          'سيروم برو بيرفكشنست\nعلاج Rapid Firm + Lift باستخدام Acetyl Hexapeptide-8',
      'es':
          'Suero Perfectionist Pro\nTratamiento Rapid Firm + Lift con Acetil Hexapéptido-8',
      'fr':
          'Sérum Pro Perfectionniste\nRapid Firm + Lift Treatment avec Acetyl Hexapeptide-8',
      'ru':
          'Перфекционист Про Сыворотка\nПроцедура Rapid Firm + Lift с ацетилгексапептидом-8',
      'zh_Hans': '完美主义者专业精华素\nAcetyl Hexapeptide-8 快速紧致提拉护理',
    },
    'xi31wg9i': {
      'en': 'Fragrance',
      'ar': 'العطر',
      'es': 'Fragancia',
      'fr': 'Fragrance',
      'ru': 'Аромат',
      'zh_Hans': '香味',
    },
    'nw7ve08s': {
      'en': 'Categories',
      'ar': 'فئات',
      'es': 'Categorías',
      'fr': 'Catégories',
      'ru': 'Категории',
      'zh_Hans': '类别',
    },
    'd08mabwu': {
      'en': 'Bronze Lumière',
      'ar': 'برونزية لوميير',
      'es': 'Lumiere de bronce',
      'fr': 'Lumière Bronze',
      'ru': 'Бронзовый Люмьер',
      'zh_Hans': '青铜卢米埃',
    },
    '9vk5ydrn': {
      'en': 'Beautiful Magnolia',
      'ar': 'ماغنوليا الجميلة',
      'es': 'hermosa magnolia',
      'fr': 'Beau magnolia',
      'ru': 'Красивая магнолия',
      'zh_Hans': '美丽的玉兰',
    },
    '8sgvgb1f': {
      'en': 'Beautiful Magnolia\nRomantic Dreams',
      'ar': 'ماغنوليا الجميلة\nأحلام رومانسية',
      'es': 'hermosa magnolia\nSueños Románticos',
      'fr': 'Beau magnolia\nRêves romantiques',
      'ru': 'Красивая магнолия\nРомантические мечты',
      'zh_Hans': '美丽的玉兰\n浪漫的梦想',
    },
    'ag3ncsom': {
      'en': 'Beautiful Magnolia\nDare to Love Set',
      'ar': 'ماغنوليا الجميلة\nيجرؤ على الحب مجموعة',
      'es': 'hermosa magnolia\nJuego Atrévete a Amar',
      'fr': 'Beau magnolia\nEnsemble Osez Aimer',
      'ru': 'Красивая магнолия\nНе бойтесь любить набор',
      'zh_Hans': '美丽的玉兰\n敢爱套装',
    },
    '6d6aqh3e': {
      'en': 'Beautiful Magnolia\nEau de Parfum Spray Fragrance Set',
      'ar': 'ماغنوليا الجميلة\nمجموعة عطر بخاخ ماء عطر',
      'es': 'hermosa magnolia\nJuego de fragancias en spray Eau de Parfum',
      'fr': 'Beau magnolia\nCoffret Eau de Parfum Vaporisateur',
      'ru':
          'Красивая Магнолия\nНабор ароматов в виде спрея в концентрации Eau de Parfum',
      'zh_Hans': '美丽的玉兰\nEau de Parfum 喷雾香氛套装',
    },
    'hw8yrx3i': {
      'en': 'Beautiful Magnolia Eau de Parfum Spray\nWonderland Edition',
      'ar': 'عطر ماجنوليا الجميل أو دو برفوم بخاخ\nطبعة العجائب',
      'es':
          'Hermosa Magnolia Eau de Parfum Spray\nEdición del país de las maravillas',
      'fr':
          'Belle Eau de Parfum Vaporisateur Magnolia\nÉdition pays des merveilles',
      'ru': 'Beautiful Magnolia Eau de Parfum Спрей\nИздание страны чудес',
      'zh_Hans': 'Beautiful Magnolia 香水喷雾\n仙境版',
    },
    '8j43ijay': {
      'en': 'Beautiful Magnolia L’Eau\nEau de Toilette Spray',
      'ar': 'ماغنوليا لو الجميلة\nرذاذ ماء تواليت',
      'es': 'Hermosa Magnolia L\'Eau\nAerosol agua de colonia',
      'fr': 'Magnifique Magnolia L\'Eau\nEau de Toilette Vaporisateur',
      'ru': 'Прекрасная Магнолия L’Eau\nТуалетная вода-спрей',
      'zh_Hans': '美丽的 Magnolia L\'Eau\n淡香水喷雾',
    },
    'i72neyg4': {
      'en': 'Categories',
      'ar': 'فئات',
      'es': 'Categorías',
      'fr': 'Catégories',
      'ru': 'Категории',
      'zh_Hans': '类别',
    },
    'erpi4xpp': {
      'en': 'Shop',
      'ar': 'محل',
      'es': 'Comercio',
      'fr': 'Boutique',
      'ru': 'Магазин',
      'zh_Hans': '店铺',
    },
  },
  // emptyList_tasks
  {
    '3jka1n2b': {
      'en': 'You don\'t have any tasks',
      'ar': 'ليس لديك أي مهام',
      'es': 'no tienes tareas',
      'fr': 'Vous n\'avez aucune tâche',
      'ru': 'У вас нет задач',
      'zh_Hans': '你没有任何任务',
    },
    'ei8gp4l0': {
      'en': 'Create tasks by tapping the button below.',
      'ar': 'أنشئ المهام من خلال النقر على الزر أدناه.',
      'es': 'Cree tareas tocando el botón de abajo.',
      'fr': 'Créez des tâches en appuyant sur le bouton ci-dessous.',
      'ru': 'Создавайте задачи, нажав на кнопку ниже.',
      'zh_Hans': '通过点击下面的按钮创建任务。',
    },
    '86rlmsjp': {
      'en': 'Create Task',
      'ar': 'إنشاء مهمة',
      'es': 'Crear tarea',
      'fr': 'Créer une tâche',
      'ru': 'Создать задачу',
      'zh_Hans': '创建任务',
    },
  },
  // CreateTask_Edit
  {
    'cwfe8q7b': {
      'en': 'Add Task',
      'ar': 'إضافة مهمة',
      'es': 'Agregar tarea',
      'fr': 'Ajouter une tâche',
      'ru': 'Добавить задачу',
      'zh_Hans': '添加任务',
    },
    'caitchsu': {
      'en': 'Fill out the details below to add a new task.',
      'ar': 'املأ التفاصيل أدناه لإضافة مهمة جديدة.',
      'es':
          'Complete los detalles a continuación para agregar una nueva tarea.',
      'fr':
          'Remplissez les détails ci-dessous pour ajouter une nouvelle tâche.',
      'ru': 'Заполните данные ниже, чтобы добавить новую задачу.',
      'zh_Hans': '填写以下详细信息以添加新任务。',
    },
    'b94uldwk': {
      'en': 'Task Name',
      'ar': 'اسم المهمة',
      'es': 'Nombre de la tarea',
      'fr': 'Nom de la tâche',
      'ru': 'Название задачи',
      'zh_Hans': '任务名称',
    },
    '06kb7fi5': {
      'en': 'Enter your task here....',
      'ar': 'أدخل مهمتك هنا ....',
      'es': 'Ingrese su tarea aquí....',
      'fr': 'Entrez votre tâche ici....',
      'ru': 'Введите свою задачу здесь....',
      'zh_Hans': '在这里输入你的任务....',
    },
    'co1u91tq': {
      'en': 'Details',
      'ar': 'تفاصيل',
      'es': 'Detalles',
      'fr': 'Détails',
      'ru': 'Подробности',
      'zh_Hans': '细节',
    },
    'nsoveaw9': {
      'en': 'Enter a description here...',
      'ar': 'أدخل وصفًا هنا ...',
      'es': 'Introduce una descripción aquí...',
      'fr': 'Entrez une description ici...',
      'ru': 'Введите описание здесь...',
      'zh_Hans': '在此处输入描述...',
    },
    're3k6r73': {
      'en': 'Current Due Date',
      'ar': 'تاريخ الاستحقاق الحالي',
      'es': 'Fecha de vencimiento actual',
      'fr': 'Date d\'échéance actuelle',
      'ru': 'Текущая дата выполнения',
      'zh_Hans': '当前截止日期',
    },
    'j8xawh7q': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'ru': 'Отмена',
      'zh_Hans': '取消',
    },
    '5w4wcqxk': {
      'en': 'Update Task',
      'ar': 'تحديث المهمة',
      'es': 'Actualizar tarea',
      'fr': 'Mettre à jour la tâche',
      'ru': 'Обновление задачи',
      'zh_Hans': '更新任务',
    },
  },
  // Miscellaneous
  {
    '3gvh7ntd': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    '2r9oaeqd': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    '5yfcqbeg': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    'hvdlqzio': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    'ksl9c5tn': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    'vn9rap5p': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    'c7v2t2m1': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    '8vt0xv9m': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    '15n7to9a': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    '091d86bj': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    'wo6dw89d': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    '4d0gu5zm': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    '4b95kcho': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    'su8twk17': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    '49cijwuv': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    'kt1u9c0h': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    '291m1rn0': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    'b4begtav': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    'gr8csbdj': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
    '2x956ehc': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));

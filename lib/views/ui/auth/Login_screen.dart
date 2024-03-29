import 'package:online_shop/utils/exports.dart';
import 'package:online_shop/views/ui/auth/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final TextEditingController email = TextEditingController();
final TextEditingController password = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    email;
    password;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginNotifier>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50.h,
        backgroundColor: Colors.black,
      ),
      body: Form(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/bg.jpg')),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ReusableText(
                  text: "Welcome!",
                  style: appStyle(30.sp, Colors.white, FontWeight.w600, 1)),
              ReusableText(
                  text: "Fill in your details to login into your account",
                  style: appStyle(14.sp, Colors.white, FontWeight.normal, 1)),
              SizedBox(
                height: 50.h,
              ),
              CustomTextField(
                  keyboard: TextInputType.emailAddress,
                  validator: (email) {
                    return null;
                  },
                  hintText: "Email",
                  controller: email),
              SizedBox(
                height: 15.h,
              ),
              CustomTextField(
                  obscureText: loginNotifier.isObsecure,
                  suffixIcon: IconButton(
                      onPressed: () {
                        loginNotifier.isObsecure = !loginNotifier.isObsecure;
                      },
                      icon: loginNotifier.isObsecure
                          ? const Icon((Icons.visibility_off))
                          : const Icon(Icons.visibility)),
                  validator: (p0) {
                    return null;
                  },
                  hintText: "Password",
                  controller: password),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        (MaterialPageRoute(
                            builder: ((context) => const RegisterScreen()))));
                  },
                  child: ReusableText(
                      text: "Register",
                      style:
                          appStyle(14.sp, Colors.white, FontWeight.normal, 1)),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              GestureDetector(
                onTap: () {
                  final LoginModel model =
                      LoginModel(email: email.text, password: password.text);
                  loginNotifier.userlogin(model).then((response) {
                    if (response == true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => MainScreen())));
                    } else {
                      print('error');
                    }
                  });
                },
                child: Container(
                  height: 55.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: ReusableText(
                        text: "L O G I N",
                        style:
                            appStyle(16.sp, Colors.black, FontWeight.bold, 1)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

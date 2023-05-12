// Textfield(text: 'Name', icon: Icons.person,controller:name,validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter your name';
//                           }
//                           return null;
//                         },),
        
//                       SizedBox(height: 3.h,),
        
//                 Textfield(text: 'Email address',icon: Icons.email, controller: email,validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter your email';
//                           } else if (!GetUtils.isEmail(value)) {
//                             return 'Please enter a valid email';
//                           }
//                           return null;
//                         },),
        
//                 SizedBox(height:3.h),
//                 Textfield(text: 'Password',icon: Icons.visibility_off_rounded, controller: password,validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter your password';
//                           } else if (value.length < 6) {
//                             return 'Password should be at least 6 characters';
//                           }
//                           return null;
//                         },),
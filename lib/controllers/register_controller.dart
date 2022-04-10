
import 'package:borderpay/model/datamodels/register_model.dart';
import 'package:borderpay/repo/auth_repo/auth_repo.dart';
import 'package:borderpay/repo/auth_repo/auth_repo_impl.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  AuthRepo networkHandler = AuthRepoImpl();
  final registerDataList = RegisterModel(status: false,response: null).obs;
  var isLoading = false.obs;


  hitRegister(body) async {
    try {
      isLoading(true);
      var res = await networkHandler.registerUser(body);
      print('controller *******');
      if(res!=null){
        RegisterModel loginModel = registerModelFromJson(res);
        registerDataList.value = loginModel;
        registerDataList.refresh();
      }
    }
    finally{
      isLoading(false);
    }
  }
}

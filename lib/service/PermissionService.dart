import 'package:permission_handler/permission_handler.dart';

class PermissionService{
  Future<bool> askPermission() async {
    print("Begin Ask Permission");
    List<PermissionGroup> allow = [
      PermissionGroup.camera,
      PermissionGroup.storage,
      PermissionGroup.location,
    ];
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions(allow);
    /*for(var i=0;i<allow.length;i++){
      PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts);
      if(permission)
    }*/
    return true;
  }
}
import 'package:flutter/material.dart';
import 'package:w4_practice/2_download_app/ui/theme/theme.dart';
 
import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;
 
 // TODO

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(      
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.greyLight
        ),
        child: ListTile(
          title: Text(controller.ressource.name,
          style: AppTextStyles.label.copyWith(color: AppColors.text),
          ),
          subtitle: Text(controller.ressource.size.toString(),
          style: AppTextStyles.label.copyWith(color: AppColors.textLight),),
          trailing: Icon(controller.getIcon(controller.status),
          color: AppColors.text),
          

        ),
      ),
      
    );
     
    // TODO
  }
}

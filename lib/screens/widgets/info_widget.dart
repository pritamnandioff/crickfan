import 'package:flutter/material.dart';
import 'package:info_popup/info_popup.dart';

import '../../const.dart';

class InfoWidget extends StatelessWidget {
  final IconData icon;
  final String info;
  const InfoWidget({super.key, required this.icon, required this.info});

  @override
  Widget build(BuildContext context) {
    return InfoPopupWidget(
      contentTitle: info,
      arrowTheme: const InfoPopupArrowTheme(
        color: Colors.white,
        arrowDirection: ArrowDirection.up,
      ),
      contentTheme: const InfoPopupContentTheme(
        infoContainerBackgroundColor: Colors.black,
        infoTextStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.all(8),
        contentBorderRadius: BorderRadius.all(Radius.circular(10)),
        infoTextAlign: TextAlign.center,
      ),
      dismissTriggerBehavior: PopupDismissTriggerBehavior.onTapContent,
      areaBackgroundColor: Colors.transparent,
      indicatorOffset: Offset.zero,
      contentOffset: Offset.zero,
      onControllerCreated: (controller) {
        print('Info Popup Controller Created');
      },
      onAreaPressed: (InfoPopupController controller) {
        print('Area Pressed');
      },
      infoPopupDismissed: () {
        print('Info Popup Dismissed');
      },
      onLayoutMounted: (Size size) {
        print('Info Popup Layout Mounted');
      },
      child: Icon(
        icon,
        color: kWhite,
      ),
    );
  }
}

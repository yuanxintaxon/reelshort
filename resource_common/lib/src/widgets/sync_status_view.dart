import 'package:flutter/cupertino.dart';
import 'package:resource_common/resource_common.dart';

class SyncStatusView extends StatelessWidget {
  const SyncStatusView({
    super.key,
    required this.isFailed,
    required this.statusStr,
  });
  final bool isFailed;
  final String statusStr;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
        decoration: BoxDecoration(
          color: isFailed ? Styles.c_FFE1DD : Styles.c_F2F8FF,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isFailed
                ? (ImageRes.syncFailed.toImage
                  ..width = 12
                  ..height = 12)
                : SizedBox(
                    width: 12,
                    height: 12,
                    child: CupertinoActivityIndicator(
                      color: Styles.c_000000,
                      radius: 6,
                    ),
                  ),
            4.hSpace,
            statusStr.toText
              ..style =
                  (isFailed ? Styles.ts_FF381F_12sp : Styles.ts_000000_12sp),
          ],
        ),
      );
}

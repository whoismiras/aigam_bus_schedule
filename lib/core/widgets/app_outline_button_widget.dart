import 'package:bus_schedule/core/config/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

/// outline button with text and function parameters
class AppOutlineButtonWidget extends StatelessWidget {
  const AppOutlineButtonWidget({
    this.onPressed,
    required this.text,
    this.url,
    super.key,
  });

  final Function()? onPressed;
  final String text;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed ??
          () => launchUrl(
                Uri.parse(url ?? 'https://aigam.ru'),
                mode: LaunchMode.platformDefault,
              ),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.gray,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 16,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

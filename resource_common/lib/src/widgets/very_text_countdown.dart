import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resource_common/resource_common.dart';

class VeryTextCountdown extends StatefulWidget {
  final DateTime targetDate;
  final TextStyle style;

  const VeryTextCountdown(
      {super.key, required this.targetDate, required this.style});

  @override
  _VeryTextCountdownState createState() => _VeryTextCountdownState();
}

class _VeryTextCountdownState extends State<VeryTextCountdown> {
  late Timer _timer;
  Duration _timeDifference = const Duration();
  var daysTensController = StreamController<int>();
  var daysOnesController = StreamController<int>();
  var hoursTensController = StreamController<int>();
  var hoursOnesController = StreamController<int>();
  var minutesTensController = StreamController<int>();
  var minutesOnesController = StreamController<int>();
  var secondsTensController = StreamController<int>();
  var secondsOnesController = StreamController<int>();

  @override
  void initState() {
    super.initState();
    _updateTimeDifference();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTimeDifference();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    daysTensController.close();
    daysOnesController.close();
    hoursTensController.close();
    hoursOnesController.close();
    minutesTensController.close();
    minutesOnesController.close();
    secondsTensController.close();
    secondsOnesController.close();
    super.dispose();
  }

  void _updateTimeDifference() {
    final now = DateTime.now();
    final difference = widget.targetDate.difference(now);
    if (difference.isNegative) {
      _timer.cancel();
    } else {
      _timeDifference = difference;
      daysTensController.add(_timeDifference.inDays ~/ 10);
      hoursTensController.add(_timeDifference.inHours.remainder(24) ~/ 10);
      minutesTensController.add(_timeDifference.inMinutes.remainder(60) ~/ 10);
      secondsTensController.add(_timeDifference.inSeconds.remainder(60) ~/ 10);

      daysOnesController.add(_timeDifference.inDays % 10);
      hoursOnesController.add(_timeDifference.inHours.remainder(24) % 10);
      minutesOnesController.add(_timeDifference.inMinutes.remainder(60) % 10);
      secondsOnesController.add(_timeDifference.inSeconds.remainder(60) % 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*
            Column(
              children: [
                Row(
                  children: [
                    _container(daysTensController),
                    2.hSpace,
                    _container(daysOnesController),
                  ],
                ),
                2.vSpace,
                _label(StrRes.days.capitalizeFirstLetterOnly),
              ],
            ),
            */
            Row(
              children: [
                _container(hoursTensController),
                _container(hoursOnesController),
                "h".toText..style = widget.style,
              ],
            ),
            3.hSpace,
            Row(
              children: [
                _container(minutesTensController),
                _container(minutesOnesController),
                "m".toText..style = widget.style,
              ],
            ),

            /*
            Column(
              children: [
                Row(
                  children: [
                    _container(secondsTensController),
                    2.hSpace,
                    _container(secondsOnesController),
                  ],
                ),
                2.vSpace,
                _label(StrRes.seconds.capitalizeFirstLetterOnly),
              ],
            ),
            */
          ],
        ),
      ],
    );
  }

  Widget _container(StreamController<int> controller) {
    return StreamBuilder<int>(
      stream: controller.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return "".toText..style = widget.style;
        } else if (snapshot.hasError) {
          return "".toText..style = widget.style;
        } else if (!snapshot.hasData) {
          return "".toText..style = widget.style;
        } else {
          return "${snapshot.data}".toText..style = widget.style;
        }
      },
    );
  }

  Widget _label(String label) =>
      label.toText..style = Styles.ts_8E8E8E_12sp_regular;
}

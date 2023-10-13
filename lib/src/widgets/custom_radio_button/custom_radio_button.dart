import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wellbeing_checkup/src/features/check_up/domain/select_option.dart';
import 'package:wellbeing_checkup/src/tools/tools.dart';

class CustomRadioButton extends StatefulWidget {
  final List<SelectOption> options;
  final SelectOption answer;
  final Function onTap;
  final bool enabled;

  const CustomRadioButton(
      {super.key,
      required this.options,
      required this.answer,
      required this.onTap,
      required this.enabled});

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.options
            .map((e) => Material(
                  borderRadius: dimens.borderRadiusContainer(20),
                  child: InkWell(
                    borderRadius: dimens.borderRadiusContainer(20),
                    onTap: () => widget.onTap(e),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: e.value == widget.answer.value
                                  ? customColors.blue
                                  : widget.enabled
                                      ? customColors.black
                                      : customColors.black.withOpacity(.2)),
                          color: e.value == widget.answer.value
                              ? customColors.blue
                              : customColors.white),
                      child: SvgPicture.asset(
                        icons.check,
                        width: 6,
                        height: 6,
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wellbeing_checkup/src/widgets/custom_checkbox/custom_checkbox/custom_checkbox_state.dart';
import 'package:wellbeing_checkup/src/widgets/custom_text.dart';

import '../../../tools/tools.dart';
import 'custom_checkbox_controller.dart';

typedef Callback = void Function(String optionId);

class CustomCheckbox extends ConsumerStatefulWidget {
  /// Id especifico del widget
  final String id;

  /// Marcar como deshabilitado
  final bool disabled;

  /// Nombre de la opción
  final String name;

  /// Minutos de la opción
  final int minutes;

  /// Minutos de la opción
  final String images;

  /// Callback que devuelve el taskId de la opciones seleccionadas
  final Callback callback;

  const CustomCheckbox(
      {Key? key,
      required this.id,
      this.disabled = false,
      required this.name,
      required this.minutes,
      required this.images,
      required this.callback})
      : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends ConsumerState<CustomCheckbox> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      ref
          .watch(customCheckboxController(widget.id).notifier)
          .setDisabled(widget.disabled);
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(customCheckboxController(widget.id).notifier);
    var state = ref.watch(customCheckboxController(widget.id));
    return Material(
      borderRadius: dimens.borderRadiusContainer(8),
      color: state.isDisabled ? customColors.disable : customColors.white,
      child: InkWell(
          borderRadius: dimens.borderRadiusContainer(8),
          onTap: state.isDisabled
              ? null
              : () {
                  controller.toogleSelected();
                  widget.callback(widget.id);
                },
          child: Container(
            width: (dimens.fullWidth(context) - 48) / 2,
            height: dimens.fullWidth(context) * .6,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: state.isDisabled
                    ? customColors.disable
                    : customColors.white,
                borderRadius: dimens.borderRadiusContainer(8),
                border: Border.all(color: getBorderColorByState(state))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: dimens.fullWidth(context) * .3,
                      child: CustomText(
                        widget.name,
                        textColor: state.isSelected
                            ? customColors.blue
                            : customColors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SvgPicture.asset(
                      state.isDisabled ? icons.lock : icons.info,
                      width: 12,
                    )
                  ],
                ),
                CustomText(
                  '${widget.minutes} minute',
                  fontSize: 12,
                  textColor: customColors.grey,
                ),
                const SizedBox(height: 5),
                Expanded(
                    child: Center(
                  child: Image.asset(
                    widget.images,
                    alignment: Alignment.center,
                  ),
                ))
              ],
            ),
          )),
    );
  }
}

Color getBorderColorByState(CustomCheckboxState state) {
  if (state.isDisabled) {
    return customColors.disable;
  } else if (state.isSelected) {
    return customColors.blue;
  } else {
    return customColors.lightGrey;
  }
}

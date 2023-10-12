import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wellbeing_checkup/src/tools/tools.dart';
import 'package:wellbeing_checkup/src/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  /// Titulo del botón
  final String label;

  /// Color del botón
  final Color? color;

  /// Color de la animación de carga
  final Color? loadingColor;

  /// Color de la animación de carga
  final Color? textColor;

  /// Ancho del botón
  final double? height;

  /// Largo del botóm
  final double? width;

  /// Función que se ejecuta cuando el botón es presionado
  final Function onPressed;

  /// Habilitar animación de carga
  final bool? isLoading;

  const CustomButton({
    super.key,
    required this.label,
    this.color,
    this.height,
    this.width,
    required this.onPressed,
    this.isLoading = false,
    this.loadingColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: dimens.borderRadiusContainer(10),
      color: color ?? customColors.purple,
      child: InkWell(
        borderRadius: dimens.borderRadiusContainer(10),
        onTap: (isLoading == false) ? () => onPressed() : null,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        radius: 0,
        child: Container(
          alignment: Alignment.center,
          height: height ?? 45,
          width: width,
          child: !isLoading!
              ? CustomText(
                  label,
                  textColor: textColor ?? customColors.white,
                  fontWeight: FontWeight.w700,
                )
              : Center(
                  child: SpinKitWave(
                    color: loadingColor ?? customColors.white,
                    size: 12,
                  ),
                ),
        ),
      ),
    );
  }
}

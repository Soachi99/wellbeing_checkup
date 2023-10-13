// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:wellbeing_checkup/src/tools/tools.dart';
import 'package:wellbeing_checkup/src/widgets/custom_text.dart';

class ResultPage extends ConsumerWidget {
  final int result;
  const ResultPage({required this.result, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: customColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                "Test Result",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 31,
              ),
              SizedBox(
                height: dimens.fullHeight(context) * .75,
                child: Stack(
                  children: [
                    Container(
                      height: dimens.fullHeight(context) * .7,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border.all(color: customColors.lightGrey),
                          borderRadius: dimens.borderRadiusContainer(8),
                          color: customColors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: CustomText(
                              'Wellbeing',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              textColor: customColors.purple,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ResultContainer(result: result),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(
                                'Results',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                textColor: customColors.purple,
                              ),
                              CustomText(
                                'About Test',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                textColor: customColors.black,
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                          const CustomText(
                            'Your score for wellbeing is 80. The WHO-5 is a measure of quality of life, higher scores represent a better quality of life',
                            fontSize: 16,
                            height: 1.2,
                          ),
                          const SizedBox(height: 16),
                          const Center(
                            child: CustomText(
                              'For more information, check about test',
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const IndicatorContainer(),
                          const SizedBox(height: 16),
                          const Center(
                            child: CustomText(
                              'Your privacy is important to us, and your information is stored anonymously',
                              fontSize: 14,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 10,
                      child: InkWell(
                        onTap: () => context.go(Routes.rootRoute),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: customColors.purple,
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: customColors.white,
                            ),
                            child: SvgPicture.asset(
                              icons.next,
                              height: 20,
                              width: 20,
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IndicatorContainer extends StatelessWidget {
  const IndicatorContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(color: customColors.blue, width: 2),
          borderRadius: dimens.borderRadiusContainer(8),
          color: customColors.white),
      child: Row(
        children: [
          SizedBox(
            width: dimens.fullWidth(context) * .5,
            child: const CustomText(
              'Your indicator will expire soon, next testing window opens in...',
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  '11',
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  textColor: customColors.blue,
                ),
                const CustomText('days')
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ResultContainer extends StatelessWidget {
  final int result;

  const ResultContainer({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: dimens.fullWidth(context) * .6,
        child: Stack(
          children: [
            Center(
                child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Image.asset(images.wellbeingResult))),
            Positioned(
                right: 0,
                top: 0,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: customColors.blue),
                  child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: customColors.white,
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: customColors.lightBlue,
                        ),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: CustomText(
                            result.toString(),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            textColor: customColors.blue,
                          ),
                        )),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}

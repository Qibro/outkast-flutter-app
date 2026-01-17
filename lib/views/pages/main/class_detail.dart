import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/controllers/main/class_detail_controller.dart';
import 'package:outkast/core/theme/app_pallette.dart';
import 'package:outkast/core/theme/app_theme.dart';
import 'package:outkast/views/widgets/app_bar_widget.dart';
import 'package:outkast/views/widgets/badge_slot.dart';
import 'package:outkast/views/widgets/reservation_detail.dart';
import 'package:outkast/views/widgets/reservation_success.dart';

class ClassDetail extends StatefulWidget {
  const ClassDetail({super.key});

  @override
  State<ClassDetail> createState() => _ClassDetailState();
}

class _ClassDetailState extends State<ClassDetail> {
  final ClassDetailController classDetailController = Get.put(
    ClassDetailController(),
  );

  @override
  void initState() {
    super.initState();
    classDetailController.fetchClassById(Get.arguments.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderSection(context),
                  _buildInfoGrid(),
                  _buildInformationSection(),
                  SizedBox(height: 100),
                ],
              ),
            ),
            _buildAppBar(),
            _buildReserveButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBarWidget(title: 'Class Detail');
  }

  Widget _buildHeaderSection(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Background Image
        Container(
          height: screenHeight * 0.6,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image1.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.1),
                ],
              ),
            ),
          ),
        ),
        // Class Info Overlay
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        classDetailController.classData.value?.activity ?? '',
                        style: AppStyle.titleMainBold(22),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Monday, 2 September 2024',
                        style: AppStyle.textMedium(14),
                      ),
                      Text(
                        '${classDetailController.classData.value?.start ?? ''} - ${classDetailController.classData.value?.end ?? ''}',
                        style: AppStyle.textMedium(14),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: BadgeSlot(
                    slots: classDetailController.classData.value?.slots ?? 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoGrid() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppPallette.overlayColor2,
              border: Border.all(width: 0.5, color: AppPallette.darkGreyColor),
            ),
            child: Column(
              children: [
                Text('Instructor', style: AppStyle.textSemiBold(14)),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, color: Colors.white, size: 18),
                    SizedBox(width: 4),
                    Text(
                      classDetailController.classData.value?.instructor ?? '',
                      style: AppStyle.textSemiBold(16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppPallette.overlayColor2,
              border: Border.all(width: 0.5, color: AppPallette.darkGreyColor),
            ),
            child: Column(
              children: [
                Text('Location', style: AppStyle.textSemiBold(14)),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Colors.white, size: 18),
                    SizedBox(width: 4),
                    Text(
                      classDetailController.classData.value?.location ?? '',
                      style: AppStyle.textSemiBold(16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInformationSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Information', style: AppStyle.textMedium(18)),
          const SizedBox(height: 12),
          Text(
            '${classDetailController.classData.value?.activity ?? ''} is a high-energy, empowering cardio workout inspired by martial arts. This fiercely effective program draws from a variety of disciplines like karate, boxing, taekwondo, muay thai, and capoeira, challenging you to',
            style: AppStyle.textMedium(14),
          ),
        ],
      ),
    );
  }

  Widget _buildReserveButton(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: AppPallette.backgroundColor,
          border: Border.all(color: AppPallette.darkGreyColor, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ElevatedButton(
            onPressed: () {
              ReservationBottomSheet.show(
                context: context,
                classData: classDetailController.classData.value!,
                onConfirm: () {
                  classDetailController.reserveClassById(
                    id:
                        classDetailController.classData.value?.id.toString() ??
                        '',
                    onSuccess: () {
                      Get.back(); // Close the reservation bottom sheet
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        ReservationSuccessBottomSheet.show(
                          context: context,
                          classData: classDetailController.classData.value!,
                          onGoToReservation: () {
                            Get.back();
                          },
                        );
                      });
                    },
                    onError: (e) {
                      Get.snackbar(
                        'Error',
                        e,
                        backgroundColor: Colors.red.withOpacity(0.8),
                        colorText: AppPallette.whiteColor,
                      );
                    },
                  );
                },
              );
            },
            style: AppStyle.elevatedButtonStyle(),
            child: Text(
              'Reserve',
              style: AppStyle.titleMainBold(16, AppPallette.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}

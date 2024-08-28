import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/services/firebase_service.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/enums.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MiddleSection extends StatefulWidget {
  final PlatformView platformView;
  final ScrollController scrollController;

  const MiddleSection(
    this.platformView, {
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  _MiddleSectionState createState() => _MiddleSectionState();
}

class _MiddleSectionState extends State<MiddleSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  final FirestoreService _fireStoreService = FirestoreService();
  late Future<CalendarDataSource> _calendarDataSourceFuture;
  bool dateSelected = true;
  DateTime selectedDate = DateTime.now();
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();

    _calendarDataSourceFuture =
        _fireStoreService.fetchAppointmentsForCalendar();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime
          ? startTime ?? TimeOfDay.now()
          : endTime ?? TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          startTime = pickedTime;
        } else {
          endTime = pickedTime;
        }
      });
    }
  }

  void _submitAppointment(String name, String surname, String email) {
    if (startTime != null && endTime != null) {
      final DateTime startDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        startTime!.hour,
        startTime!.minute,
      );
      final DateTime endDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        endTime!.hour,
        endTime!.minute,
      );

      final Appointment appointment = Appointment(
        startTime: startDateTime,
        endTime: endDateTime,
        subject: '$name $surname - $email',
        color: Colors.blue,
      );

      _fireStoreService.saveAppointment(appointment).then((success) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Appointment saved successfully!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to save appointment.')),
          );
        }
        setState(() {
          dateSelected = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: switch (widget.platformView) {
        PlatformView.mobile => ScreenConfig.getVerticalPadding(context, 2),
        PlatformView.web => ScreenConfig.getVerticalPadding(context, 15),
      },
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SelectableText(
                        'Book an online session',
                        style: GoogleFonts.lora(
                          fontSize: switch (widget.platformView) {
                            PlatformView.mobile => 23,
                            PlatformView.web => 35,
                          },
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      SizedBox(
                        height: switch (widget.platformView) {
                          PlatformView.mobile =>
                            ScreenConfig.getHeightPercentage(context, 2),
                          PlatformView.web =>
                            ScreenConfig.getHeightPercentage(context, 5),
                        },
                      ),
                      Padding(
                        padding: switch (widget.platformView) {
                          PlatformView.mobile =>
                            ScreenConfig.getHorizontalPadding(context, 5),
                          PlatformView.web =>
                            ScreenConfig.getPadding(context, 20, 1),
                        },
                        child: SizedBox(
                          width: switch (widget.platformView) {
                            PlatformView.mobile =>
                              ScreenConfig.getWidthPercentage(context, 80),
                            PlatformView.web =>
                              ScreenConfig.getWidthPercentage(context, 40),
                          },
                          child: SelectableText(
                            "Ready to take your Flutter and React Native skills to the next level? "
                            "Book an online session with us today and gain expert guidance tailored to your specific needs. "
                            "Whether you're just starting out or looking to optimize and scale your existing projects, "
                            "we're here to help you navigate the complexities of mobile development. "
                            "Unlock new possibilities, overcome challenges, and accelerate your success with personalized advice and cutting-edge insights. "
                            "Schedule your session now and start building with confidence.",
                            style: GoogleFonts.lora(
                              fontSize: switch (widget.platformView) {
                                PlatformView.mobile => 14,
                                PlatformView.web => 17,
                              },
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade700,
                              height: 1.8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenConfig.getHeightPercentage(context, 5),
                      ),
                      FutureBuilder<CalendarDataSource>(
                        future: _calendarDataSourceFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text("Error loading calendar data");
                          } else {
                            return Container(
                              width: switch (widget.platformView) {
                                PlatformView.mobile =>
                                  ScreenConfig.getWidthPercentage(
                                    context,
                                    60,
                                  ),
                                PlatformView.web =>
                                  ScreenConfig.getWidthPercentage(
                                    context,
                                    40,
                                  ),
                              },
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 5,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: SfCalendar(
                                headerStyle: CalendarHeaderStyle(
                                    textStyle: GoogleFonts.lora()),
                                view: CalendarView.month,
                                monthViewSettings: MonthViewSettings(
                                    monthCellStyle: MonthCellStyle(
                                        textStyle: GoogleFonts.lora())),
                                todayTextStyle: GoogleFonts.lora(),
                                firstDayOfWeek: 1,
                                initialSelectedDate: DateTime.now(),
                                dataSource: snapshot.data,
                                cellBorderColor: Colors.transparent,
                                backgroundColor: Colors.white,
                                onTap: (CalendarTapDetails details) {
                                  if (details.targetElement ==
                                      CalendarElement.calendarCell) {
                                    _selectTime(context, true).then((_) {
                                      if (startTime != null) {
                                        _selectTime(context, false).then((_) {
                                          if (endTime != null) {
                                            setState(() {
                                              dateSelected = false;
                                              selectedDate =
                                                  details.date ?? selectedDate;
                                            });
                                          }
                                        });
                                      }
                                    });
                                  }
                                },
                                selectionDecoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.3),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(color: Colors.grey, width: 2),
                                ),
                                monthCellBuilder: (BuildContext context,
                                    MonthCellDetails details) {
                                  final bool isSelected =
                                      details.date == DateTime.now();
                                  return Container(
                                    decoration: isSelected
                                        ? BoxDecoration(
                                            color: Colors.grey.shade700,
                                            shape: BoxShape.circle)
                                        : null,
                                    child: Center(
                                      child: Text(
                                        details.date.day.toString(),
                                        style: GoogleFonts.lora(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: isSelected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                      Offstage(
                        offstage: dateSelected,
                        child: _buildBookingForm(context),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBookingForm(BuildContext context) {
    final _nameController = TextEditingController();
    final _surnameController = TextEditingController();
    final _emailController = TextEditingController();

    return Container(
      width: ScreenConfig.getHeightPercentage(context, 75),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: GoogleFonts.lora(),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _surnameController,
                  decoration: InputDecoration(
                    labelText: 'Surname',
                    labelStyle: GoogleFonts.lora(),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: GoogleFonts.lora(),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _submitAppointment(
                        _nameController.text,
                        _surnameController.text,
                        _emailController.text,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      child: Text(
                        'Submit',
                        style: GoogleFonts.lora(
                          fontSize: ScreenConfig.getHeightPercentage(
                            context,
                            1.8,
                          ),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black.withOpacity(0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

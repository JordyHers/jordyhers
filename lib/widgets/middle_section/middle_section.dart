import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jordyhers/services/firebase_service.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart';
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
  late Animation<double> _rotationAnimation;
  final FirestoreService _fireStoreService = FirestoreService();
  final CalendarController _calendarController = CalendarController();
  late Future<CalendarDataSource> _calendarDataSourceFuture;
  bool dateSelected = true;
  DateTime selectedDate = DateTime.now();
  DateTime displayedMonth = DateTime.now(); // Added to track displayed month
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  bool _animationTriggered = false;
  bool emailValid = true;
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(1, 0), // Start from right
      end: Offset(0, 0), // End at center
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0.1, end: 0.0).animate(
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

    widget.scrollController.addListener(_scrollListener);

    _calendarDataSourceFuture =
        _fireStoreService.fetchAppointmentsForCalendar();
  }

  void _scrollListener() {
    if (!_animationTriggered &&
        widget.scrollController.offset >= kBookSessionOffset - 600) {
      _controller.forward();
      setState(() {
        _animationTriggered = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _calendarController.dispose();
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: startTime ?? TimeOfDay(hour: 9, minute: 0),
    );
    if (pickedTime != null) {
      if (pickedTime.hour >= 9 && pickedTime.hour < 17) {
        setState(() {
          startTime = pickedTime;
          endTime = TimeOfDay(
            hour: (pickedTime.hour + ((pickedTime.minute + 35) ~/ 60)) % 24,
            minute: (pickedTime.minute + 35) % 60,
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Please select a time between 9 AM and 5 PM.')),
        );
      }
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

  String _formatSelectedDate() {
    final DateFormat formatter = DateFormat('EEEE, d MMMM yyyy');
    return formatter.format(selectedDate);
  }

  void _moveToPreviousMonth() {
    setState(() {
      _calendarController.backward?.call();
      displayedMonth = DateTime(
        displayedMonth.year,
        displayedMonth.month - 1,
        1,
      );
    });
  }

  void _moveToNextMonth() {
    setState(() {
      _calendarController.forward?.call();
      displayedMonth = DateTime(
        displayedMonth.year,
        displayedMonth.month + 1,
        1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: switch (widget.platformView) {
        PlatformView.mobile => ScreenConfig.getHorizontalPadding(context, 10),
        PlatformView.web => ScreenConfig.getHorizontalPadding(context, 15),
      },
      child: Stack(
        children: [
          RotationTransition(
            turns: _rotationAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  width: switch (widget.platformView) {
                    PlatformView.mobile =>
                      ScreenConfig.getWidthPercentage(context, 90),
                    PlatformView.web =>
                      ScreenConfig.getWidthPercentage(context, 80),
                  },
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
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
                            color: Colors.white,
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
                              ScreenConfig.getHorizontalPadding(context, 2),
                            PlatformView.web =>
                              ScreenConfig.getHorizontalPadding(context, 20),
                          },
                          child: SizedBox(
                            width: switch (widget.platformView) {
                              PlatformView.mobile =>
                                ScreenConfig.getWidthPercentage(context, 80),
                              PlatformView.web =>
                                ScreenConfig.getWidthPercentage(context, 60),
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
                                color: Colors.grey.shade300,
                                height: 1.8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenConfig.getHeightPercentage(context, 5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: _moveToPreviousMonth,
                            ),
                            Text(
                              DateFormat.yMMMM().format(displayedMonth),
                              style: GoogleFonts.lora(
                                fontSize: switch (widget.platformView) {
                                  PlatformView.mobile => 18,
                                  PlatformView.web => 22,
                                },
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward,
                                  color: Colors.white),
                              onPressed: _moveToNextMonth,
                            ),
                          ],
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
                                  controller: _calendarController,
                                  headerStyle: CalendarHeaderStyle(
                                      textStyle: GoogleFonts.lora()),
                                  view: CalendarView.month,
                                  initialDisplayDate: displayedMonth,
                                  monthViewSettings: MonthViewSettings(
                                    monthCellStyle: MonthCellStyle(
                                      textStyle: GoogleFonts.lora(),
                                    ),
                                    showTrailingAndLeadingDates: false,
                                  ),
                                  todayTextStyle: GoogleFonts.lora(),
                                  firstDayOfWeek: 1,
                                  initialSelectedDate: DateTime.now(),
                                  dataSource: snapshot.data,
                                  cellBorderColor: Colors.transparent,
                                  backgroundColor: Colors.white,
                                  onTap: (CalendarTapDetails details) {
                                    if (details.date != null &&
                                        details.date!.isAfter(DateTime.now()) &&
                                        details.date!.weekday != 6 &&
                                        details.date!.weekday != 7) {
                                      _selectTime(context).then((_) {
                                        if (startTime != null) {
                                          setState(() {
                                            dateSelected = false;
                                            selectedDate = details.date!;
                                          });
                                        }
                                      });
                                    }
                                  },
                                  monthCellBuilder: (BuildContext context,
                                      MonthCellDetails details) {
                                    final bool isPast =
                                        details.date.isBefore(DateTime.now());
                                    final bool isWeekend =
                                        details.date.weekday == 6 ||
                                            details.date.weekday == 7;
                                    return Container(
                                      decoration: details.date == selectedDate
                                          ? BoxDecoration(
                                              color: Colors.grey.shade700,
                                              shape: BoxShape.circle,
                                            )
                                          : null,
                                      child: Center(
                                        child: Text(
                                          details.date.day.toString(),
                                          style: GoogleFonts.lora(
                                            color: isPast || isWeekend
                                                ? Colors.grey.shade400
                                                : details.date == selectedDate
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontWeight: isPast
                                                ? FontWeight.normal
                                                : FontWeight.bold,
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
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingForm(BuildContext context) {
    final _nameController = TextEditingController();
    final _surnameController = TextEditingController();

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
                if (startTime != null && selectedDate != null) ...[
                  Text(
                    'Your booking online session will be reserved for: ${_formatSelectedDate()}',
                    style: GoogleFonts.lora(
                      color: Colors.black,
                      fontSize: ScreenConfig.getHeightPercentage(context, 2),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Time: ${startTime!.format(context)} - ${endTime!.format(context)}',
                    style: GoogleFonts.lora(
                      color: Colors.black,
                      fontSize: ScreenConfig.getHeightPercentage(context, 2),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
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
                  onChanged: (value) {
                    setState(() {
                      emailValid = EmailValidator.validate(value);
                    });
                  },
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: emailValid
                        ? () {
                            _submitAppointment(
                              _nameController.text,
                              _surnameController.text,
                              _emailController.text,
                            );
                          }
                        : null,
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
                      disabledBackgroundColor: Colors.grey,
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

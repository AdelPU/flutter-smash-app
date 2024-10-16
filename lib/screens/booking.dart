import 'package:flutter/material.dart';
import 'package:smash/widgets/booking/court_grid.dart';
import 'package:smash/widgets/booking/days_grid.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() {
    return _BookingScreenState();
  }
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? _selectedDate;
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now().add(const Duration(days: 0));
    // To trigger fadeIn animation
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1;
      });
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeIn,
            child: Flex(
              direction: Axis.vertical,
              children: [
                Container(
                  width: double.infinity,
                  // padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 0.5,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'lib/assets/images/padel_booking.webp',
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8,
                                bottom: 8,
                              ),
                              child: Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: List.generate(
                                  4,
                                  (i) => Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: DaysGrid(
                                      date:
                                          DateTime.now().add(Duration(days: i)),
                                      isSelected: _selectedDate!.day ==
                                          DateTime.now()
                                              .add(Duration(days: i))
                                              .day,
                                      onTap: () {
                                        setState(
                                          () {
                                            if (_selectedDate!.day ==
                                                DateTime.now()
                                                    .add(Duration(days: i))
                                                    .day) {
                                              return;
                                            } else {
                                              _selectedDate = DateTime.now()
                                                  .add(Duration(days: i));
                                            }
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Container(
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 20,
                      //     vertical: 6,
                      //   ),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(8),
                      //     color:
                      //         Theme.of(context).colorScheme.primary.withOpacity(0.8),
                      //   ),
                      //   child: Text(
                      //     'Padel',
                      //     style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      //           color: Theme.of(context).colorScheme.onPrimary,
                      //         ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                CourtGrid(
                  day: _selectedDate!,
                  
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

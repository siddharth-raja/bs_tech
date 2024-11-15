import 'package:flutter/material.dart';

class TimeSlotSelector extends StatefulWidget {
  final List<String> timeSlots;
  final Function(String) onTimeSelected;

  const TimeSlotSelector({
    super.key,
    required this.timeSlots,
    required this.onTimeSelected,
  });

  @override
  TimeSlotSelectorState createState() => TimeSlotSelectorState();
}

class TimeSlotSelectorState extends State<TimeSlotSelector> {
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Visit Hours',
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.timeSlots.length,
            itemBuilder: (context, index) {
              String time = widget.timeSlots[index];
              bool isSelected = time == selectedTime;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTime = time;
                  });
                  widget.onTimeSelected(time);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color.fromRGBO(113, 114, 222, 1) : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      time,
                      style: TextStyle(
                        fontSize: 16,
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

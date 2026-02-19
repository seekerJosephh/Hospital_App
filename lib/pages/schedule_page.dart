import 'package:flutter/material.dart';
import 'package:hospital/core/constants/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

// pubspec.yaml: table_calendar: ^3.1.2 (or latest)

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  // Dummy upcoming appointments – replace with real data/API later
  final List<Map<String, dynamic>> _appointments = [
    {
      'time': '09:30 AM',
      'doctor': 'Dr. Pang Chetra',
      'specialty': 'Cardiologist',
      'type': 'Follow-up Checkup',
      'status': 'Confirmed',
    },
    {
      'time': '02:15 PM',
      'doctor': 'Dr. Vaamana',
      'specialty': 'Dentist',
      'type': 'Cleaning & Checkup',
      'status': 'Pending',
    },
    {
      'time': '04:00 PM',
      'doctor': 'Dr. Nihal',
      'specialty': 'Cardiologist',
      'type': 'ECG Review',
      'status': 'Confirmed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Schedule',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined,
                color: Color(0xFF26A69A)),
            onPressed: () {
              // Optional: jump to today
              setState(() {
                _focusedDay = DateTime.now();
                _selectedDay = DateTime.now();
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Open book appointment flow / modal
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Open Book Appointment flow...')),
          );
        },
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Book New',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
      ),
      body: Column(
        children: [
          // Calendar
          Card(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() => _calendarFormat = format);
                }
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: const Color(0xFF26A69A).withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: const BoxDecoration(
                  color: Color(0xFF26A69A),
                  shape: BoxShape.circle,
                ),
                outsideDaysVisible: false,
                weekendTextStyle: const TextStyle(color: Colors.redAccent),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: const Color(0xFF26A69A).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                formatButtonTextStyle:
                    const TextStyle(color: Color(0xFF26A69A)),
                leftChevronIcon:
                    const Icon(Icons.chevron_left, color: Color(0xFF26A69A)),
                rightChevronIcon:
                    const Icon(Icons.chevron_right, color: Color(0xFF26A69A)),
              ),
            ),
          ),

          // Upcoming Appointments Section
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedDay == null
                      ? 'Upcoming Appointments'
                      : 'Appointments on ${DateFormat('MMM d, yyyy').format(_selectedDay!)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: View full schedule / calendar list
                  },
                  child: const Text(
                    'See all',
                    style: TextStyle(
                        color: Color(0xFF26A69A), fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: _appointments.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month_outlined,
                            size: 80, color: Colors.grey.shade400),
                        const SizedBox(height: 16),
                        Text(
                          'No appointments scheduled',
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _appointments.length,
                    itemBuilder: (context, index) {
                      final appt = _appointments[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 1,
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xFF26A69A).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.medical_services_outlined,
                              color: Color(0xFF26A69A),
                              size: 28,
                            ),
                          ),
                          title: Text(
                            appt['time'],
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 17),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                appt['doctor'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                '${appt['specialty']} • ${appt['type']}',
                                style: TextStyle(
                                    color: Colors.grey[700], fontSize: 13),
                              ),
                            ],
                          ),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: appt['status'] == 'Confirmed'
                                  ? Colors.green.shade100
                                  : Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              appt['status'],
                              style: TextStyle(
                                color: appt['status'] == 'Confirmed'
                                    ? Colors.green.shade800
                                    : Colors.orange.shade800,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          onTap: () {
                            // TODO: Open appointment detail
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendario Semanal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WeeklyCalendar(),
    );
  }
}

// Modelo para eventos
class Event {
  final String title;
  final String time;
  final Color color;
  final int dayIndex;
  final int hour;
  final String description;

  Event({
    required this.title,
    required this.time,
    required this.color,
    required this.dayIndex,
    required this.hour,
    this.description = '',
  });
}

class WeeklyCalendar extends StatefulWidget {
  @override
  _WeeklyCalendarState createState() => _WeeklyCalendarState();
}

class _WeeklyCalendarState extends State<WeeklyCalendar> {
  DateTime selectedDate = DateTime.now();
  DateTime? selectedDay;

  final List<String> weekdays = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom'];
  final List<String> months = [
    "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
    "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
  ];

  // Lista de eventos de ejemplo
  List<Event> events = [
    Event(
      title: "Reunión de equipo",
      time: "09:00",
      color: Colors.purple,
      dayIndex: 0,
      hour: 1,
      description: "Reunión semanal del equipo de desarrollo",
    ),
    Event(
      title: "Almuerzo",
      time: "12:30",
      color: Colors.orange,
      dayIndex: 1,
      hour: 4,
      description: "Almuerzo con cliente importante",
    ),
    Event(
      title: "Gym",
      time: "18:00",
      color: Colors.green,
      dayIndex: 2,
      hour: 10,
      description: "Entrenamiento en el gimnasio",
    ),
    Event(
      title: "Presentación",
      time: "14:00",
      color: Colors.blue,
      dayIndex: 3,
      hour: 6,
      description: "Presentación del proyecto final",
    ),
  ];

  List<DateTime> getWeekDays(DateTime date) {
    int daysFromMonday = date.weekday - 1;
    DateTime monday = date.subtract(Duration(days: daysFromMonday));
    return List.generate(7, (i) => monday.add(Duration(days: i)));
  }

  bool isToday(DateTime date) {
    DateTime now = DateTime.now();
    return date.day == now.day && date.month == now.month && date.year == now.year;
  }

  bool isWeekend(DateTime date) {
    return date.weekday == 6 || date.weekday == 7;
  }

  List<Event> getEventsForDay(int dayIndex) {
    return events.where((event) => event.dayIndex == dayIndex).toList();
  }

  Event? getEventForHour(int hour, int dayIndex) {
    try {
      return events.firstWhere((event) => event.dayIndex == dayIndex && event.hour == hour);
    } catch (e) {
      return null;
    }
  }

  void _showEventDetails(Event event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: event.color,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 10),
              Expanded(child: Text(event.title)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hora: ${event.time}',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              if (event.description.isNotEmpty) ...[
                SizedBox(height: 8),
                Text(event.description),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  void _addEvent() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String title = '';
        String time = '';
        int selectedDay = 0;
        int selectedHour = 0;
        Color selectedColor = Colors.purple;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              title: Text('Agregar Evento'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Título del evento',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onChanged: (value) => title = value,
                    ),
                    SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Hora (ej: 14:30)',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onChanged: (value) => time = value,
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<int>(
                            decoration: InputDecoration(
                              labelText: 'Día',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            value: selectedDay,
                            items: weekdays.asMap().entries.map((entry) {
                              return DropdownMenuItem(
                                value: entry.key,
                                child: Text(entry.value),
                              );
                            }).toList(),
                            onChanged: (value) => setState(() => selectedDay = value!),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: DropdownButtonFormField<int>(
                            decoration: InputDecoration(
                              labelText: 'Hora',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            value: selectedHour,
                            items: List.generate(12, (i) => i).map((hour) {
                              return DropdownMenuItem(
                                value: hour,
                                child: Text('${hour + 8}:00'),
                              );
                            }).toList(),
                            onChanged: (value) => setState(() => selectedHour = value!),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      children: [
                        Colors.purple, Colors.blue, Colors.green, Colors.orange,
                        Colors.red, Colors.teal, Colors.pink, Colors.indigo
                      ].map((color) => GestureDetector(
                        onTap: () => setState(() => selectedColor = color),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: selectedColor == color 
                                ? Border.all(color: Colors.black, width: 2)
                                : null,
                          ),
                        ),
                      )).toList(),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (title.isNotEmpty && time.isNotEmpty) {
                      setState(() {
                        events.add(Event(
                          title: title,
                          time: time,
                          color: selectedColor,
                          dayIndex: selectedDay,
                          hour: selectedHour,
                        ));
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Agregar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> weekDays = getWeekDays(selectedDate);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "${months[weekDays.first.month - 1]} ${weekDays.first.year}",
              style: TextStyle(
                color: Colors.black87, 
                fontWeight: FontWeight.bold, 
                fontSize: 18
              ),
            ),
            Text(
              "${weekDays.first.day} - ${weekDays.last.day}",
              style: TextStyle(
                color: Colors.grey[600], 
                fontSize: 13
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.black87, size: 28),
          onPressed: () => setState(() => selectedDate = selectedDate.subtract(Duration(days: 7))),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.today, color: Colors.purple, size: 24),
            onPressed: () => setState(() => selectedDate = DateTime.now()),
          ),
          IconButton(
            icon: Icon(Icons.chevron_right, color: Colors.black87, size: 28),
            onPressed: () => setState(() => selectedDate = selectedDate.add(Duration(days: 7))),
          ),
        ],
      ),
      body: Column(
        children: [
          // Encabezado de días mejorado
          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 2)
                )
              ]
            ),
            child: Row(
              children: [
                SizedBox(width: 50),
                ...weekDays.asMap().entries.map((entry) {
                  int index = entry.key;
                  DateTime day = entry.value;
                  bool isToday = this.isToday(day);
                  bool isWeekend = this.isWeekend(day);
                  
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedDay = day),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                        decoration: BoxDecoration(
                          color: selectedDay == day 
                              ? Colors.purple.withOpacity(0.1)
                              : isToday 
                                  ? Colors.purple.withOpacity(0.05)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: selectedDay == day
                              ? Border.all(color: Colors.purple, width: 2)
                              : null,
                        ),
                        child: Column(
                          children: [
                            Text(
                              weekdays[day.weekday - 1],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: isWeekend ? Colors.red[400] : Colors.grey[700],
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: isToday 
                                    ? Colors.purple
                                    : selectedDay == day
                                        ? Colors.purple.withOpacity(0.2)
                                        : Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  "${day.day}",
                                  style: TextStyle(
                                    color: isToday || selectedDay == day
                                        ? Colors.white
                                        : isWeekend
                                            ? Colors.red[400]
                                            : Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),

          // Grid de horas y eventos mejorado
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(12, (hour) {
                  return Container(
                    height: 90,
                    child: Row(
                      children: [
                        // Columna de horas mejorada
                        Container(
                          width: 50,
                          alignment: Alignment.topCenter,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "${hour + 8}:00",
                              style: TextStyle(
                                fontSize: 11, 
                                color: Colors.grey[600], 
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                        // Celdas de los días mejoradas
                        Expanded(
                          child: Row(
                            children: List.generate(7, (index) {
                              Event? event = getEventForHour(hour, index);
                              
                              return Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.grey[200]!,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: event != null
                                      ? GestureDetector(
                                          onTap: () => _showEventDetails(event),
                                          child: Container(
                                            margin: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: event.color.withOpacity(0.15),
                                              borderRadius: BorderRadius.circular(6),
                                              border: Border.all(
                                                color: event.color.withOpacity(0.3),
                                                width: 1,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(4),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    event.title,
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w600,
                                                      color: event.color.withOpacity(0.8),
                                                    ),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    event.time,
                                                    style: TextStyle(
                                                      fontSize: 9,
                                                      color: event.color.withOpacity(0.7),
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            // Aquí podrías agregar lógica para crear eventos al tocar
                                          },
                                          child: Container(),
                                        ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEvent,
        backgroundColor: Colors.purple,
        child: Icon(Icons.add, color: Colors.white),
        elevation: 4,
      ),
    );
  }
}

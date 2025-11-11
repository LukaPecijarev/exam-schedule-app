import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({
    Key? key,
    required this.exam,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPast = exam.isPast();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали за испит'),
        backgroundColor: isPast ? Colors.green[700] : Colors.orange[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Card(
                  elevation: 4,
                  color: isPast ? Colors.green[50] : Colors.yellow[50],
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Icon(
                          Icons.school,
                          size: 60,
                          color: isPast ? Colors.green[600] : Colors.orange[600],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          exam.subject,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: isPast ? Colors.green[900] : Colors.orange[900],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Датум и време секција
              _buildDetailSection(
                title: 'Датум и време',
                icon: Icons.calendar_today,
                iconColor: isPast ? Colors.grey : Colors.orange,
                children: [
                  _buildDetailRow(
                    'Датум:',
                    exam.getFormattedDate(),
                    isPast,
                  ),
                  const SizedBox(height: 8),
                  _buildDetailRow(
                    'Време:',
                    exam.getFormattedTime(),
                    isPast,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              if (!isPast)
                _buildDetailSection(
                  title: 'Преостанато време',
                  icon: Icons.timer,
                  iconColor: Colors.green,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.hourglass_bottom,
                            color: Colors.green,
                            size: 30,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              exam.getTimeRemaining(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              else
                _buildDetailSection(
                  title: 'Статус',
                  icon: Icons.check_circle,
                  iconColor: Colors.grey,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.grey,
                            size: 30,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Испитот е завршен',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20),

              _buildDetailSection(
                title: 'Простории',
                icon: Icons.location_on,
                iconColor: isPast ? Colors.grey : Colors.orange[700]!,
                children: [
                  ...exam.rooms.map(
                    (room) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isPast ? Colors.grey[200] : Colors.yellow[50], // ПРОМЕНА ОВДЕ
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isPast ? Colors.grey[400]! : Colors.orange[200]!, // ПРОМЕНА ОВДЕ
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.meeting_room,
                              color: isPast ? Colors.grey : Colors.orange[700], // ПРОМЕНА ОВДЕ
                            ),
                            const SizedBox(width: 12),
                            Text(
                              room,
                              style: TextStyle(
                                fontSize: 16,
                                color: isPast ? Colors.grey[700] : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailSection({
    required String title,
    required IconData icon,
    required Color iconColor,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: iconColor, size: 28),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }

  Widget _buildDetailRow(String label, String value, bool isPast) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isPast ? Colors.grey[700] : Colors.black87,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: isPast ? Colors.grey[600] : Colors.black87,
          ),
        ),
      ],
    );
  }
}
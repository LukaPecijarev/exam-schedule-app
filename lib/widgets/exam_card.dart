import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({
    Key? key,
    required this.exam,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPast = exam.isPast();

    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: isPast
                  ? [Colors.green[100]!, Colors.green[50]!]
                  : [Colors.yellow[100]!, Colors.yellow[50]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              color: isPast ? Colors.green[400]! : Colors.orange[400]!,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: isPast ? Colors.green[600] : Colors.orange[600],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.book_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: isPast ? Colors.green[700] : Colors.orange[700],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isPast ? Icons.check : Icons.schedule,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                Text(
                  exam.subject,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isPast ? Colors.green[900] : Colors.orange[900],
                    height: 1.2,
                  ),
                ),
                
                const Spacer(),


                _buildInfoRow(
                  icon: Icons.calendar_today,
                  text: exam.getFormattedDate(),
                  isPast: isPast,
                ),
                const SizedBox(height: 10), 

                // Време
                _buildInfoRow(
                  icon: Icons.access_time,
                  text: exam.getFormattedTime(),
                  isPast: isPast,
                ),
                const SizedBox(height: 10),

                // Простории
                _buildInfoRow(
                  icon: Icons.location_on,
                  text: exam.rooms.join(' • '),
                  isPast: isPast,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String text,
    required bool isPast,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10), 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isPast ? Colors.green[700] : Colors.orange[700],
            size: 14,
          ),
          const SizedBox(width: 12), 
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../../core/extensions/int_extension.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/client_model.dart';

class ClientCard extends StatelessWidget {
  final ClientModel client;
  final VoidCallback? onTap;
  final VoidCallback? onNewQuote;

  const ClientCard({
    super.key,
    required this.client,
    this.onTap,
    this.onNewQuote,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Initials Box
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: client.avatarColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    client.initials,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: AppColors.darkBorder,
                    ),
                  ),
                ),
                14.hSpace,
                // Client Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              client.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${client.quotesCount} Quotes',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      2.vSpace,
                      Text(
                        client.company,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      6.vSpace,
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: 14, color: Colors.grey.shade500),
                          4.hSpace,
                          Expanded(
                            child: Text(
                              client.address,
                              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      6.vSpace,
                      Row(
                        children: [
                          Icon(Icons.phone_outlined, size: 13, color: Colors.grey.shade500),
                          4.hSpace,
                          Text(
                            client.phone,
                            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                          ),
                          12.hSpace,
                          Icon(Icons.email_outlined, size: 13, color: Colors.grey.shade500),
                          4.hSpace,
                          Expanded(
                            child: Text(
                              client.email,
                              style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
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

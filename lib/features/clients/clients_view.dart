import 'package:flutter/material.dart';
import '../../core/constant/app_button.dart';
import '../../core/extensions/int_extension.dart';
import '../../core/extensions/theme_extensions.dart';
import '../../core/theme/app_colors.dart';
import '../../models/client_model.dart';
import '../../services/client_service.dart';
import '../auth/widgets/app_textfield.dart';
import 'widgets/add_client_sheet.dart';
import 'widgets/client_card.dart';
import 'widgets/client_details_sheet.dart';

class ClientsView extends StatefulWidget {
  const ClientsView({super.key});

  @override
  State<ClientsView> createState() => _ClientsViewState();
}

class _ClientsViewState extends State<ClientsView> {
  final ClientService _clientService = ClientService();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openAddClientSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddClientSheet(
        onClientAdded: (_) => setState(() {}),
      ),
    );
  }

  void _openClientDetails(ClientModel client) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ClientDetailsSheet(client: client),
    );
  }

  @override
  Widget build(BuildContext context) {
    final clients = _clientService.searchClients(_searchQuery);

    final metrics = [
      {"title": "Active Clients", "number": "${_clientService.totalClientsCount}", "color": AppColors.darkBorder},
      {"title": "Avg. Quote Vol.", "number": "\$${(_clientService.averageQuoteVolume / 1000).toStringAsFixed(1)}k", "color": AppColors.darkBorder},
      {"title": "Retention Rate", "number": "94%", "color": const Color(0xff16A34A)},
      {"title": "Total Estimates", "number": "842", "color": AppColors.darkBorder},
    ];

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "My Clients",
          style: context.text.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add, color: AppColors.darkBorder, size: 26),
            tooltip: "Add Client",
            onPressed: _openAddClientSheet,
          ),
          12.hSpace,
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Manage your professional network and historical client data. Search by name, company, or location.",
                style: context.text.labelLarge!.copyWith(color: Colors.grey.shade600),
              ),
              16.vSpace,
              // Add Client Button
              AppButton(
                text: "👨🏻‍💼 ADD NEW CLIENT",
                backgroundColor: AppColors.darkBorder,
                textColor: Colors.white,
                onPressed: _openAddClientSheet,
              ),
              16.vSpace,
              // Search Field
              AppTextField(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search clients by name, address, company...",
                onChanged: (val) => setState(() => _searchQuery = val),
              ),
              16.vSpace,
              // Metrics Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: metrics.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.8,
                ),
                itemBuilder: (context, index) {
                  final m = metrics[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300, width: 1.2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          m["title"] as String,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        6.vSpace,
                        Text(
                          m["number"] as String,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: m["color"] as Color,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              20.vSpace,
              // Client list count
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${clients.length} ${clients.length == 1 ? "Client" : "Clients"}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkBorder,
                    ),
                  ),
                ],
              ),
              12.vSpace,
              // Client Cards
              if (clients.isEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.people_outline, size: 40, color: Colors.grey.shade400),
                      12.vSpace,
                      const Text(
                        "No clients found",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      4.vSpace,
                      Text(
                        "Add a new client using the button above.",
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: clients.length,
                  itemBuilder: (context, index) {
                    final c = clients[index];
                    return ClientCard(
                      client: c,
                      onTap: () => _openClientDetails(c),
                    );
                  },
                ),
              24.vSpace,
            ],
          ),
        ),
      ),
    );
  }
}

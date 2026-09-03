import 'package:flutter/material.dart';
import '../../../core/constant/app_button.dart';
import '../../../core/extensions/int_extension.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/client_model.dart';
import '../../../services/client_service.dart';
import '../../clients/widgets/add_client_sheet.dart';

class StepProjectSetup extends StatefulWidget {
  final String quoteNumber;
  final ClientModel? selectedClient;
  final String projectName;
  final String siteAddress;
  final ValueChanged<ClientModel?> onClientChanged;
  final ValueChanged<String> onProjectNameChanged;
  final ValueChanged<String> onSiteAddressChanged;
  final VoidCallback onNext;

  const StepProjectSetup({
    super.key,
    required this.quoteNumber,
    required this.selectedClient,
    required this.projectName,
    required this.siteAddress,
    required this.onClientChanged,
    required this.onProjectNameChanged,
    required this.onSiteAddressChanged,
    required this.onNext,
  });

  @override
  State<StepProjectSetup> createState() => _StepProjectSetupState();
}

class _StepProjectSetupState extends State<StepProjectSetup> {
  final ClientService _clientService = ClientService();
  late TextEditingController _projectController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _projectController = TextEditingController(text: widget.projectName);
    _addressController = TextEditingController(text: widget.siteAddress);
  }

  @override
  void dispose() {
    _projectController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _openAddClientSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddClientSheet(
        onClientAdded: (newClient) {
          widget.onClientChanged(newClient);
          if (_addressController.text.isEmpty) {
            _addressController.text = newClient.address;
            widget.onSiteAddressChanged(newClient.address);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final clients = _clientService.clients;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section 1: Client Selection
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300, width: 1.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.darkBorder.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(Icons.person, color: AppColors.darkBorder, size: 20),
                    ),
                    8.hSpace,
                    const Text(
                      "CLIENT SELECTION",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.8,
                        color: Color(0xff181C1E),
                      ),
                    ),
                  ],
                ),
                16.vSpace,
                // Client Dropdown / Selector with isExpanded to avoid overflow
                DropdownButtonFormField<ClientModel>(
                  initialValue: widget.selectedClient,
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: "Select Client",
                    prefixIcon: const Icon(Icons.business),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  items: clients.map((c) {
                    return DropdownMenuItem<ClientModel>(
                      value: c,
                      child: Text(
                        '${c.name} (${c.company})',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    );
                  }).toList(),
                  onChanged: (val) {
                    widget.onClientChanged(val);
                    if (val != null && _addressController.text.isEmpty) {
                      _addressController.text = val.address;
                      widget.onSiteAddressChanged(val.address);
                    }
                  },
                ),
                12.vSpace,
                // Or Add New Client
                OutlinedButton.icon(
                  onPressed: _openAddClientSheet,
                  icon: const Icon(Icons.person_add_alt, size: 18),
                  label: const Text("Add New Client"),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 44),
                    side: const BorderSide(color: AppColors.darkBorder),
                    foregroundColor: AppColors.darkBorder,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ),
          16.vSpace,
          // Section 2: Project Info
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300, width: 1.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.darkBorder.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(Icons.assignment, color: AppColors.darkBorder, size: 20),
                    ),
                    8.hSpace,
                    const Text(
                      "PROJECT INFORMATION",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.8,
                        color: Color(0xff181C1E),
                      ),
                    ),
                  ],
                ),
                16.vSpace,
                // Quote Ref Number (Readonly)
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.quoteNumber),
                  decoration: InputDecoration(
                    labelText: "Quote Reference #",
                    prefixIcon: const Icon(Icons.tag),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                14.vSpace,
                // Project Name
                TextField(
                  controller: _projectController,
                  decoration: InputDecoration(
                    labelText: "Project Title / Scope",
                    hintText: "e.g., Facility HVAC Overhaul",
                    prefixIcon: const Icon(Icons.work_outline),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  onChanged: widget.onProjectNameChanged,
                ),
                14.vSpace,
                // Site Address
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: "Project Site Address",
                    hintText: "e.g., 99 Technology Way, Seattle, WA",
                    prefixIcon: const Icon(Icons.location_on_outlined),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  onChanged: widget.onSiteAddressChanged,
                ),
              ],
            ),
          ),
          24.vSpace,
          // Next Button
          AppButton(
            text: "NEXT: LINE ITEMS →",
            backgroundColor: AppColors.darkBorder,
            textColor: Colors.white,
            onPressed: () {
              if (widget.selectedClient == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please select or add a client.")),
                );
                return;
              }
              if (_projectController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please enter a project title.")),
                );
                return;
              }
              widget.onNext();
            },
          ),
          16.vSpace,
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/constant/app_button.dart';
import '../../../core/extensions/int_extension.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/client_model.dart';
import '../../../services/client_service.dart';

class AddClientSheet extends StatefulWidget {
  final ValueChanged<ClientModel>? onClientAdded;

  const AddClientSheet({super.key, this.onClientAdded});

  @override
  State<AddClientSheet> createState() => _AddClientSheetState();
}

class _AddClientSheetState extends State<AddClientSheet> {
  final ClientService _clientService = ClientService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _companyController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter client contact name.")),
      );
      return;
    }

    final name = _nameController.text.trim();
    final nameParts = name.split(' ');
    String initials = 'CL';
    if (nameParts.length >= 2) {
      initials = '${nameParts[0][0]}${nameParts[1][0]}'.toUpperCase();
    } else if (name.isNotEmpty) {
      initials = name.substring(0, name.length >= 2 ? 2 : 1).toUpperCase();
    }

    final newClient = ClientModel(
      id: 'c-${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      company: _companyController.text.trim().isNotEmpty
          ? _companyController.text.trim()
          : '$name Enterprise',
      email: _emailController.text.trim().isNotEmpty
          ? _emailController.text.trim()
          : 'client@example.com',
      phone: _phoneController.text.trim().isNotEmpty
          ? _phoneController.text.trim()
          : '+1 (555) 000-0000',
      address: _addressController.text.trim().isNotEmpty
          ? _addressController.text.trim()
          : 'Seattle, WA',
      initials: initials,
      quotesCount: 0,
      totalBilled: 0.0,
      avatarColor: const Color(0xffE6E8F8),
    );

    _clientService.addClient(newClient);
    widget.onClientAdded?.call(newClient);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            16.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Add New Client",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff181C1E),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            16.vSpace,
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Full Name",
                prefixIcon: const Icon(Icons.person_outline),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            12.vSpace,
            TextField(
              controller: _companyController,
              decoration: InputDecoration(
                labelText: "Company / Organization Name",
                prefixIcon: const Icon(Icons.business_outlined),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            12.vSpace,
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email Address",
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            12.vSpace,
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Phone Number",
                prefixIcon: const Icon(Icons.phone_outlined),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            12.vSpace,
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: "Street / Site Address",
                prefixIcon: const Icon(Icons.location_on_outlined),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            20.vSpace,
            AppButton(
              text: "CREATE CLIENT RECORD 👨🏻‍💼",
              backgroundColor: AppColors.darkBorder,
              textColor: Colors.white,
              onPressed: _onSave,
            ),
          ],
        ),
      ),
    );
  }
}

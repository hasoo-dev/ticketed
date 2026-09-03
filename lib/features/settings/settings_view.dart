import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constant/app_button.dart';
import '../../core/extensions/int_extension.dart';
import '../../core/extensions/theme_extensions.dart';
import '../../core/routes/routes_name.dart';
import '../../core/theme/app_colors.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _notificationsEnabled = true;
  bool _autoBackup = true;
  bool _taxInclusive = false;
  String _selectedCurrency = 'USD (\$)';
  String _companyName = 'Apex Industrial Contracting';
  String _email = 'apex.contracts@industrial.com';
  String _phone = '+1 (555) 100-9900';
  String _taxRate = '8.0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Settings & Profile",
          style: context.text.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header Card
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300, width: 1.2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 36,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage("assets/images/ic_profile.webp"),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: AppColors.darkBorder,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.edit, color: Colors.white, size: 14),
                          ),
                        ),
                      ],
                    ),
                    16.hSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Apex Construction",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff181C1E),
                            ),
                          ),
                          4.vSpace,
                          Text(
                            _companyName,
                            style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                          ),
                          6.vSpace,
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color(0xffDCFCE7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              "PRO LICENSED TIER",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: Color(0xff16A34A),
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              20.vSpace,
              // Business Details Section
              _buildSectionTitle("BUSINESS PROFILE"),
              _buildSettingsCard([
                _buildListTile(
                  icon: Icons.business,
                  title: "Company Name",
                  subtitle: _companyName,
                  onTap: () => _editDialog("Company Name", _companyName, (val) => setState(() => _companyName = val)),
                ),
                const Divider(height: 1),
                _buildListTile(
                  icon: Icons.email_outlined,
                  title: "Business Email",
                  subtitle: _email,
                  onTap: () => _editDialog("Business Email", _email, (val) => setState(() => _email = val)),
                ),
                const Divider(height: 1),
                _buildListTile(
                  icon: Icons.phone_outlined,
                  title: "Business Phone",
                  subtitle: _phone,
                  onTap: () => _editDialog("Business Phone", _phone, (val) => setState(() => _phone = val)),
                ),
                const Divider(height: 1),
                _buildListTile(
                  icon: Icons.handyman_outlined,
                  title: "Primary Specialization",
                  subtitle: "General Contractor / HVAC Overhaul",
                  onTap: () => context.push(RoutesName.trade),
                ),
              ]),
              20.vSpace,
              // Estimation Defaults
              _buildSectionTitle("ESTIMATION DEFAULTS"),
              _buildSettingsCard([
                _buildListTile(
                  icon: Icons.percent,
                  title: "Default Sales Tax",
                  subtitle: "$_taxRate%",
                  onTap: () => _editDialog("Default Tax Rate (%)", _taxRate, (val) => setState(() => _taxRate = val)),
                ),
                const Divider(height: 1),
                _buildListTile(
                  icon: Icons.attach_money,
                  title: "Currency",
                  subtitle: _selectedCurrency,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (ctx) => Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("Select Currency", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            12.vSpace,
                            ListTile(
                              title: const Text("USD ()"),
                              onTap: () {
                                setState(() => _selectedCurrency = "USD (\$)");
                                Navigator.pop(ctx);
                              },
                            ),
                            ListTile(
                              title: const Text("CAD ()"),
                              onTap: () {
                                setState(() => _selectedCurrency = "CAD (\$)");
                                Navigator.pop(ctx);
                              },
                            ),
                            ListTile(
                              title: const Text("EUR (€)"),
                              onTap: () {
                                setState(() => _selectedCurrency = "EUR (€)");
                                Navigator.pop(ctx);
                              },
                            ),
                            ListTile(
                              title: const Text("GBP (£)"),
                              onTap: () {
                                setState(() => _selectedCurrency = "GBP (£)");
                                Navigator.pop(ctx);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text("Tax Inclusive Pricing", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  subtitle: Text("Display estimates with tax pre-calculated", style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                  value: _taxInclusive,
                  activeThumbColor: AppColors.darkBorder,
                  onChanged: (val) => setState(() => _taxInclusive = val),
                ),
              ]),
              20.vSpace,
              // App Preferences
              _buildSectionTitle("PREFERENCES & DATA"),
              _buildSettingsCard([
                SwitchListTile(
                  title: const Text("Estimate Status Notifications", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  subtitle: Text("Alerts when a client views or signs quotes", style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                  value: _notificationsEnabled,
                  activeThumbColor: AppColors.darkBorder,
                  onChanged: (val) => setState(() => _notificationsEnabled = val),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text("Cloud Auto-Backup", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  subtitle: Text("Sync client records and templates securely", style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                  value: _autoBackup,
                  activeThumbColor: AppColors.darkBorder,
                  onChanged: (val) => setState(() => _autoBackup = val),
                ),
              ]),
              20.vSpace,
              // Support & About
              _buildSectionTitle("ABOUT & LEGAL"),
              _buildSettingsCard([
                _buildListTile(
                  icon: Icons.help_outline,
                  title: "Help & Contractor Documentation",
                  subtitle: "Guides, tutorials, and support center",
                  onTap: () {},
                ),
                const Divider(height: 1),
                _buildListTile(
                  icon: Icons.privacy_tip_outlined,
                  title: "Privacy Policy & Terms of Service",
                  subtitle: "Industrial security & data protection",
                  onTap: () {},
                ),
                const Divider(height: 1),
                _buildListTile(
                  icon: Icons.info_outline,
                  title: "App Version",
                  subtitle: "Ticketed Pro v1.0.0 (Build 2026.1)",
                  onTap: null,
                ),
              ]),
              24.vSpace,
              // Sign Out Button
              AppButton(
                text: "SIGN OUT OF TICKETED 🚪",
                backgroundColor: Colors.red.shade600,
                textColor: Colors.white,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("Sign Out?"),
                      content: const Text("Are you sure you want to sign out of your Ticketed workspace?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text("Cancel"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                          onPressed: () {
                            Navigator.pop(ctx);
                            context.go(RoutesName.auth);
                          },
                          child: const Text("Sign Out", style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2,
          color: AppColors.darkBorder,
        ),
      ),
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300, width: 1.2),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(children: children),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.darkBorder, size: 22),
      title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
      trailing: onTap != null ? const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey) : null,
      onTap: onTap,
    );
  }

  void _editDialog(String fieldName, String currentValue, ValueChanged<String> onSaved) {
    final controller = TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Edit $fieldName"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: fieldName,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkBorder),
            onPressed: () {
              onSaved(controller.text.trim());
              Navigator.pop(ctx);
            },
            child: const Text("Save", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/extensions/int_extension.dart';
import '../../core/extensions/theme_extensions.dart';
import '../../core/routes/routes_name.dart';
import '../../core/theme/app_colors.dart';
import '../../services/quote_service.dart';
import '../quotes/widgets/quote_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final QuoteService _quoteService = QuoteService();

  @override
  void initState() {
    super.initState();
    _quoteService.addListener(_onServiceUpdate);
  }

  @override
  void dispose() {
    _quoteService.removeListener(_onServiceUpdate);
    super.dispose();
  }

  void _onServiceUpdate() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final recentQuotes = _quoteService.quotes.take(4).toList();
    final pendingCount = _quoteService.pendingQuotesCount;
    final acceptedSum = _quoteService.acceptedSumThisMonth;

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Ticketed", style: context.text.headlineMedium!.copyWith(fontWeight: FontWeight.bold)),
        actions: [
          GestureDetector(
            onTap: () {
              context.push(RoutesName.settings);
            },
            child: const CircleAvatar(
              maxRadius: 20,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/ic_profile.webp"),
            ),
          ),
          const SizedBox(width: 14),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, Apex Construction",
                style: context.text.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "Ready for today's industrial estimations.",
                style: context.text.bodyLarge!.copyWith(color: Colors.grey.shade600),
              ),
              20.vSpace,
              // Metric 1: Pending Quotes
              _buildStatsContainer(
                title: "PENDING QUOTES",
                subtitle: "$pendingCount",
                branding: "+3 since yesterday",
                icon: Icons.trending_up_sharp,
                iconColor: const Color(0xffD97706),
              ),
              12.vSpace,
              // Metric 2: Accepted Volume
              _buildStatsContainer(
                title: "ACCEPTED THIS MONTH",
                subtitle: '\$${acceptedSum.toStringAsFixed(0)}',
                icon: Icons.check_circle_rounded,
                iconColor: const Color(0xff16A34A),
                branding: "Goal: \$35k reached by 81%",
              ),
              24.vSpace,
              // Recent Quotes Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent Estimates",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff181C1E),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(RoutesName.newQuote);
                    },
                    child: const Text("+ New Quote"),
                  ),
                ],
              ),
              12.vSpace,
              // Quote Cards List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recentQuotes.length,
                itemBuilder: (context, index) {
                  final quote = recentQuotes[index];
                  return QuoteCard(
                    quote: quote,
                    onTap: () {
                      context.push(RoutesName.quotePreview, extra: quote);
                    },
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

  Widget _buildStatsContainer({
    required String title,
    required String subtitle,
    required IconData icon,
    required String branding,
    required Color iconColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1.2, color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
              letterSpacing: 1.5,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ),
          10.vSpace,
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: AppColors.darkBorder,
            ),
          ),
          10.vSpace,
          Row(
            children: [
              Icon(icon, color: iconColor, size: 18),
              6.hSpace,
              Text(
                branding,
                style: TextStyle(
                  color: iconColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

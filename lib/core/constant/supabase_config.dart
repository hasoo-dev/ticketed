class SupabaseConfig {
  // Replace these with your actual Supabase URL and Anon Key.
  // If left blank or placeholder, the app will fall back to "Offline Demo Mode" automatically.
  static String supabaseUrl = ''; 
  static String supabaseAnonKey = '';

  static bool get isConfigured => 
      supabaseUrl.isNotEmpty && 
      supabaseAnonKey.isNotEmpty && 
      !supabaseUrl.contains('PLACEHOLDER') &&
      !supabaseAnonKey.contains('PLACEHOLDER');
}

void main() {
  // List of email addresses to check
  const emails = [
    'rajath@gmail.com',
    'rajath@outlook.com', 
    'rajath@analogdata.ai', 
    'rajath@analogdata.io',
  ];
  
  // List of known email domains
  const knownDomains = ['gmail.com', 'outlook.com'];

  // DECLARATIVE APPROACH (Functional Programming)
  // 1. Find emails with unknown domains
  final unknownEmails = emails
      .where((email) => !knownDomains.any((domain) => email.endsWith(domain)));
  print('Unknown Emails: $unknownEmails');
  // Output: (rajath@analogdata.ai, rajath@analogdata.io)

  // 2. Extract just the domain names of unknown emails
  final unknownDomains = emails
      .where((email) => !knownDomains.any((domain) => email.endsWith(domain)))
      .map((email) => email.split('@').last);
  print('Unknown Domains: $unknownDomains');
  // Output: (analogdata.ai, analogdata.io)

  // IMPERATIVE APPROACH (Traditional way)
  print('\n--- Imperative Version ---');
  
  // 1. Find emails with unknown domains
  final List<String> imperativeUnknownEmails = [];
  for (final email in emails) {
    bool isKnown = false;
    for (final domain in knownDomains) {
      if (email.endsWith(domain)) {
        isKnown = true;
        break;
      }
    }
    if (!isKnown) {
      imperativeUnknownEmails.add(email);
    }
  }
  print('Unknown Emails (imperative): $imperativeUnknownEmails');

  // 2. Extract just the domain names
  final List<String> imperativeUnknownDomains = [];
  for (final email in imperativeUnknownEmails) {
    final domain = email.split('@').last;
    imperativeUnknownDomains.add(domain);
  }
  print('Unknown Domains (imperative): $imperativeUnknownDomains');
}
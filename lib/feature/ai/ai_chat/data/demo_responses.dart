class AIResponseTemplate {
  const AIResponseTemplate({
    required this.keywords,
    required this.response,
    this.isCritical = false,
    this.suggestedSpecialty,
  });

  final List<String> keywords;
  final String response;
  final bool isCritical;
  final String? suggestedSpecialty;

  bool matches(String input) {
    final normalisedInput = input.toLowerCase();
    return keywords.any((keyword) {
      final normalisedKeyword = keyword.toLowerCase().trim();
      if (normalisedKeyword.isEmpty) return false;
      if (normalisedInput.contains(normalisedKeyword)) return true;

      final parts = normalisedKeyword.split(RegExp(r'\s+'));
      return parts.every(
        (part) => part.isNotEmpty && normalisedInput.contains(part),
      );
    });
  }
}

const List<AIResponseTemplate> demoResponseTemplates = [
  AIResponseTemplate(
    keywords: [
      'stomach pain',
      'stomach ache',
      'abdominal pain',
      'belly pain',
      'tummy pain',
    ],
    response:
        'Stomach pain accompanied by tenderness or vomiting can be serious. '
        'Consider light meals and hydration, but reach out to a specialist if it persists.',
    isCritical: true,
    suggestedSpecialty: 'Gastroenterologist',
  ),
  AIResponseTemplate(
    keywords: [
      'headache',
      'migraine',
      'head pain',
      'head hurts',
      'head hurting',
    ],
    response:
        'Try resting in a quiet room, stay hydrated, and document triggers. '
        'If headaches become frequent or intense, consult a neurologist.',
    suggestedSpecialty: 'Neurologist',
  ),
  AIResponseTemplate(
    keywords: [
      'fever',
      'chills',
      'high temperature',
      'temperature rising',
    ],
    response:
        'Monitor your temperature every few hours and stay hydrated. '
        'Seek urgent care if the fever exceeds 103°F or lasts beyond three days.',
    isCritical: true,
    suggestedSpecialty: 'General Physician',
  ),
  AIResponseTemplate(
    keywords: [
      'cough',
      'dry cough',
      'persistent cough',
      'coughing a lot',
    ],
    response:
        'A persistent cough can be allergy related or viral. Use warm fluids and a humidifier. '
        'If breathing becomes difficult, contact a pulmonologist.',
    suggestedSpecialty: 'Pulmonologist',
  ),
  AIResponseTemplate(
    keywords: [
      'sore throat',
      'throat pain',
      'throat hurts',
      'throat burning',
    ],
    response:
        'Gargle salt water twice a day and avoid irritants. Consider a throat swab '
        'if symptoms continue beyond a week.',
    suggestedSpecialty: 'ENT',
  ),
  AIResponseTemplate(
    keywords: [
      'chest pain',
      'chest tightness',
      'pressure in chest',
    ],
    response:
        'Chest pain can signal cardiac issues. Limit exertion immediately and seek emergency care if pain radiates to your arm or jaw.',
    isCritical: true,
    suggestedSpecialty: 'Cardiologist',
  ),
  AIResponseTemplate(
    keywords: [
      'shortness of breath',
      'breathless',
      'hard to breathe',
      'can\'t breathe',
    ],
    response:
        'Difficulty breathing warrants immediate attention. Sit upright, focus on steady breaths, '
        'and contact emergency services if symptoms escalate.',
    isCritical: true,
    suggestedSpecialty: 'Pulmonologist',
  ),
  AIResponseTemplate(
    keywords: [
      'skin rash',
      'itchy skin',
      'red spots',
      'skin irritation',
    ],
    response:
        'Keep the area clean and avoid scratching. Cooling compresses may help. '
        'If the rash spreads rapidly, seek dermatology input.',
    suggestedSpecialty: 'Dermatologist',
  ),
  AIResponseTemplate(
    keywords: [
      'joint pain',
      'knee pain',
      'arthritis',
      'achy joints',
    ],
    response:
        'Use gentle stretching and warm compresses. If joints stay swollen or stiff, '
        'schedule a visit with a rheumatologist.',
    suggestedSpecialty: 'Rheumatologist',
  ),
  AIResponseTemplate(
    keywords: [
      'back pain',
      'lower back',
      'spine pain',
      'back hurting',
    ],
    response:
        'Maintain proper posture and try light mobility exercises. Persistent back pain may need evaluation by an orthopedist.',
    suggestedSpecialty: 'Orthopedist',
  ),
  AIResponseTemplate(
    keywords: [
      'allergy',
      'allergic reaction',
      'sneezing',
      'allergic to',
    ],
    response:
        'Antihistamines and avoiding triggers can help. If swelling or breathing issues occur, treat it as an emergency.',
    isCritical: true,
    suggestedSpecialty: 'Allergist',
  ),
  AIResponseTemplate(
    keywords: [
      'insomnia',
      'sleep trouble',
      'can\'t sleep',
      'sleep issues',
    ],
    response:
        'Create a calming bedtime routine and limit screens before sleep. '
        'If insomnia lasts more than three weeks, consult a sleep specialist.',
    suggestedSpecialty: 'Sleep Medicine',
  ),
  AIResponseTemplate(
    keywords: [
      'anxiety',
      'panic',
      'anxious',
      'panic attack',
    ],
    response:
        'Practice paced breathing and jot down triggers. Professional counseling can build long-term coping strategies.',
    suggestedSpecialty: 'Psychiatrist',
  ),
  AIResponseTemplate(
    keywords: [
      'depression',
      'low mood',
      'hopeless',
      'feeling down',
    ],
    response:
        'You are not alone. Reach out to a trusted person and consider talking with a mental health professional soon.',
    suggestedSpecialty: 'Psychiatrist',
  ),
  AIResponseTemplate(
    keywords: [
      'fatigue',
      'tired all the time',
      'always tired',
      'low energy',
    ],
    response:
        'Track your sleep, hydration, and diet. Persistent fatigue may need blood work to rule out deficiencies.',
    suggestedSpecialty: 'General Physician',
  ),
  AIResponseTemplate(
    keywords: [
      'nausea',
      'vomiting',
      'feeling sick',
      'queasy',
    ],
    response:
        'Sip clear fluids slowly and avoid heavy meals. Contact a doctor if vomiting persists or signs of dehydration appear.',
    suggestedSpecialty: 'Gastroenterologist',
  ),
  AIResponseTemplate(
    keywords: [
      'dizzy',
      'lightheaded',
      'spinning head',
      'vertigo',
    ],
    response:
        'Sit or lie down immediately to avoid injury. If dizziness repeats frequently, seek evaluation for inner ear or circulatory causes.',
    suggestedSpecialty: 'Neurologist',
  ),
  AIResponseTemplate(
    keywords: [
      'diarrhea',
      'loose motion',
      'loose stools',
      'upset stomach',
    ],
    response:
        'Hydrate with oral rehydration salts and avoid dairy temporarily. '
        'If there is blood or high fever, get medical attention promptly.',
    suggestedSpecialty: 'Gastroenterologist',
  ),
  AIResponseTemplate(
    keywords: [
      'eye irritation',
      'red eye',
      'itchy eye',
      'eye infection',
    ],
    response:
        'Rinse gently with clean water and avoid rubbing. Persistent redness can indicate infection—reach out to an ophthalmologist.',
    suggestedSpecialty: 'Ophthalmologist',
  ),
  AIResponseTemplate(
    keywords: [
      'high blood pressure',
      'hypertension',
      'bp high',
    ],
    response:
        'Monitor your readings twice daily, reduce sodium intake, and stay active. '
        'Consult your physician to adjust or start medication if levels stay elevated.',
    suggestedSpecialty: 'Cardiologist',
  ),
];

const String defaultAIResponse =
    'Thanks for the information. I\'ll continue analysing it and guide you with next steps soon.';

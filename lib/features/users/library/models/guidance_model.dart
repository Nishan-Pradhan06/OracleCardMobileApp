class GuidanceListModel {
  final String title;
  final String dateTime;
  final String description;
  final bool isLock;

  GuidanceListModel({
    required this.title,
    required this.dateTime,
    required this.description,
    required this.isLock,
  });
}

final List<GuidanceListModel> guidanceList = [
  GuidanceListModel(
    title: 'Trust Your Intuition',
    isLock: false,
    dateTime: 'Today',
    description:
        'Your angels are guiding you to trust your inner wisdom. The answers you seek are already within you, waiting to be acknowledged. Take time to quiet your mind and listen to the subtle whispers of your soul. Your intuition is a powerful compass that will never lead you astray. When you face decisions, big or small, pause and check in with your inner guidance. How does each option feel in your body? Does it bring a sense of expansion and peace, or contraction and unease? Your body knows what your mind may not yet recognize. Trust that you are being supported and guided every step of your journey. The universe conspires in your favor when you align with your true self. Have faith in your path, even when it seems unclear from your current perspective.',
  ),
  GuidanceListModel(
    title: 'Embrace Change',
    isLock: false,

    dateTime: 'Today',
    description:
        'I woke up feeling refreshed and pulled The Sun card. Its energy reminded me to lean into joy, optimism, and gratitude as I began the day. '
        'The warmth of the card felt like a gentle nudge to focus not on what’s missing but on what is already beautiful in my life.\n\n'
        'As I prepared for the day ahead, I felt lighter, as if the simple act of breathing in the morning air could fill me with strength. '
        'Sometimes happiness comes not from big events but from the little details we choose to notice.\n\n'
        'This morning, I am grateful for:\n'
        '- The refreshing sleep that left me energized\n'
        '- The bright sunlight pouring through my window\n'
        '- The chance to start this day with a positive outlook\n\n'
        'The Sun reminded me that each day is an invitation to shine my own light.',
  ),
  GuidanceListModel(
    title: 'Gratitude Practice',
    isLock: true,

    dateTime: 'Yesterday, 8:15 PM',
    description:
        'This week has been challenging, and I found myself pulled in many directions. When I paused for reflection, I pulled a card that urged me to lean into my intuition. '
        'At first, I questioned whether I was capable of trusting my inner voice, but as the week unfolded, I noticed how often my instincts quietly guided me.\n\n'
        'Even in difficult moments, I found that my intuition helped me make choices that felt more aligned with my truth. '
        'This card reminded me that not everything needs external validation — sometimes the answers lie within.\n\n'
        'This week, I am grateful for:\n'
        '- The moments of clarity when I listened to my gut feelings\n'
        '- The lessons I learned from facing obstacles head-on\n'
        '- The comfort of knowing growth often comes through challenges\n\n'
        'Looking back, I realize that even when life feels uncertain, trusting myself is a powerful compass.',
  ),
  GuidanceListModel(
    title: 'Inner Peace',
    isLock: true,

    dateTime: 'Monday, 5:45 PM',
    description:
        'Today was hectic and full of responsibilities. By the time evening arrived, I felt mentally and physically drained. '
        'When I pulled The Hermit card, its message of retreat and solitude struck me deeply. '
        'It reminded me that rest is not a weakness but a necessity for growth.\n\n'
        'As I sat quietly, I realized how important it is to disconnect from the noise and reconnect with myself. '
        'The Hermit encouraged me to embrace stillness, even if just for a few moments, so that I could find clarity beyond the chaos of the day.\n\n'
        'Tonight, I am grateful for:\n'
        '- The quiet moments of peace after a long day\n'
        '- The wisdom that comes when I listen to myself\n'
        '- The reminder that slowing down is part of the journey\n\n'
        'The Hermit showed me that sometimes, solitude is the light that guides us back home to ourselves.',
  ),
];

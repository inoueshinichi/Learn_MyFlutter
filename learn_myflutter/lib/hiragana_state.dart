/*状態を示すクラス*/

sealed class HiraganaAppState {
  const HiraganaAppState();
}


class HiraganaInput extends HiraganaAppState {
  const HiraganaInput(): super();
}


class HiraganaLoading extends HiraganaAppState {
  const HiraganaLoading(): super();
}


class HiraganaData extends HiraganaAppState {
  const HiraganaData(this.sentence);

  final String sentence;
}


class CoffeeShop {
  static int _priceCappucino = 10;
  static int _priceLatte = 20;

  CoffeeShop() {
    cappucino = 'Cappucino';
    latte = 'Latte';
  }

  CoffeeShop.owner() {
    cappucino = 'Cappucino';
    latte = 'Latte';
    isOwner = true;
  }

  String cappucino = 'Cappucino';
  String latte = 'Latte';
  bool isOwner = false;

  set priceCappucino(int price) {
    if (isOwner) {
      _priceCappucino = price;
    }
  }

  int get priceCappucino {
    return _priceCappucino;
  }

  set priceLatte(int price) {
    if (isOwner) {
      _priceLatte = price;
    }
  }

  int get priceLatte {
    return _priceLatte;
  }

  int sellCappucino() {
    print('Selling a cappucino');
    return priceCappucino;
  }

  int sellLatte() {
    print('Selling a latte');
    return priceLatte;
  }
}

class SliderModel {
  String name;
  String priceColor;
  String volume;
  String change;
  String price;

  SliderModel(this.name, this.priceColor, this.volume, this.change, this.price);
}

List<SliderModel> coins = coinData
    .map((item) => SliderModel(item['name'], item['priceColor'], item['volume'],
        item['change'], item['price']))
    .toList();

var coinData = [
  {
    "name": "Dogecoin",
    "kBackgroundColor": 0xFF96a824,
    "priceColor": "Tüm Zamanları\nEn yükseği \nYayında",
    "volume": "2.3G DOGE",
    "change": "%-11.8",
    "price": "2.1601 TL"
  },
  {
    "name": "Bittorent",
    "kBackgroundColor": 0xFF63812a,
    "priceColor": "Yekta Kopan ile \nYarının Dünyası \nYayında",
    "volume": "38G BTT",
    "change": "%24.4",
    "price": "0.07865 TL"
  },
  {
    "name": "Chiliz",
    "kBackgroundColor": 0xFF6dc2b7,
    "priceColor": "Serdar Kuzuluoğlu ile \nParibu Sözlük",
    "volume": "430M CHZ",
    "change": "%-1.9",
    "price": "4.9520 TL"
  },
  {
    "name": "Holo",
    "kBackgroundColor": 0xFF63812a,
    "priceColor": "Barış Özcan \nNFT ile 'kripto' sanat'ı \nanlattı",
    "volume": "10G HOT",
    "change": "%7.7",
    "price": "0.15997 TL"
  },
];

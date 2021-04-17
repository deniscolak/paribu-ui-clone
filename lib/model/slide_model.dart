class SliderModel {
  String image;
  String text;
  String altText;
  String bAltText;
  String miniSlider;
  int kBackgroundColor;

  SliderModel(this.image, this.text, this.altText, this.bAltText,
      this.miniSlider, this.kBackgroundColor);
}

List<SliderModel> slides = slideData
    .map((item) => SliderModel(item['image'], item['text'], item['altText'],
        item['bAltText'], item['miniSlider'], item['kBackgroundColor']))
    .toList();

var slideData = [
  {
    "image": "assets/slides/mSlider2.png",
    "kBackgroundColor": 0xFF96a824,
    "text": "Tüm Zamanları\nEn yükseği \nYayında",
    "altText": "Konuklar, Mert Fırat \nve İsmail Polat",
    "bAltText": "Şimdi İzle",
    "miniSlider": "assets/slides/deposit.png"
  },
  {
    "image": "assets/slides/mSlider4.png",
    "kBackgroundColor": 0xFF63812a,
    "text": "Yekta Kopan ile \nYarının Dünyası \nYayında",
    "altText": "Konuklar, Mert Fırat \nve İsmail Polat",
    "bAltText": "Şimdi İzle",
    "miniSlider": "assets/slides/verification.png"
  },
  {
    "image": "assets/slides/mSlider3.png",
    "kBackgroundColor": 0xFF6dc2b7,
    "text": "Serdar Kuzuluoğlu ile \nParibu Sözlük",
    "altText": "Konuklar, Mert Fırat \nve İsmail Polat",
    "bAltText": "Şimdi İzle",
    "miniSlider": "assets/slides/register.png"
  },
  {
    "image": "assets/slides/mSlider5.png",
    "kBackgroundColor": 0xFF63812a,
    "text": "Barış Özcan \nNFT ile 'kripto' sanat'ı \nanlattı",
    "altText": "Konuklar, Mert Fırat \nve İsmail Polat",
    "bAltText": "Şimdi İzle",
    "miniSlider": "assets/slides/deposit.png"
  },
  {
    "image": "assets/slides/mSlider4.png",
    "kBackgroundColor": 0xFF63812a,
    "text": "Yekta Kopan ile \nYarının Dünyası \nYayında",
    "altText": "Konuklar, Mert Fırat \nve İsmail Polat",
    "bAltText": "Şimdi İzle",
    "miniSlider": "assets/slides/verification.png"
  },
];

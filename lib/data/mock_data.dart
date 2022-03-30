import 'package:onlineshop/models/products_model.dart';

class MockData {
  static List<ModelProducts> phonedata = [
    ModelProducts(
        name: "Phone 12 mini ",
        price: "540",
        img:
            "https://kattabozor.s3.eu-central-1.amazonaws.com/ri/204ca3f8b0fc15594ae50c32dbc25e8240bc9884da69d67f0091054e1885e0e5_wjEWHI_480l.jpg",
        description: "Available. Released 2020, November 13",
        description2:
            "A superpowerful chip. 5G speed. An advanced dual‑camera system. A Ceramic Shield front that's tougher than any smartphone glass. And a bright, beautiful OLED display. iPhone 12 has it all — in two great sizes."),
    ModelProducts(
        name: "Samsung S21 Ultra",
        price: "1000",
        img:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAVs0KjF_UaNCGkdLhgAdo3_Fl9H1trky3EA&usqp=CAU",
        description: "Epic in every way",
        description2:
            """The highest resolution photos and video on a smartphone. Galaxy's fastest processor yet. A battery that goes all-day—and then some.2 First ever S Pen compatibility.3, 4 A striking new design."""),
    ModelProducts(
        name: "Google P6 Pro ",
        price: "800",
        img:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmXwaIBXrNi5OfkSrREtgDn6z6B8xCsEV5AA&usqp=CAU",
        description: "The new Pixel 6 phones are here.",
        description2:
            "Powered by Google Tensor, Google’s first custom-built processor, they’re fast and secure. And they adapt to you.")
  ];
  static List<ModelProducts> wearabledata = [
    ModelProducts(
        name: "Apple Watch",
        price: "550",
        img:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-QVWG8BT-W80Nc2aoKH5w6ZB0XS8L4xO1aw&usqp=CAU",
        description: "Full screen ahead.",
        description2:
            """Family Setup Your family joined at the wrist. Now family members who don‘t have an iPhone can stay in touch with Apple Watch."""),
    ModelProducts(
      name: "Galaxy Watch",
      price: "300",
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhlykvljrjhChkucEQxtUZDw3xby9iIykzvw&usqp=CAU",
      description: "A Galaxy within reach",
      description2:
          "Find the Galaxy smartwatch that fits your healthy, stylish lifestyle. Plus, customize your style with new watchband colors and more in our Bespoke Studio",
    )
  ];
  static List<ModelProducts> laptopdata = [
    ModelProducts(
        name: "Apple Macbook",
        price: "1250",
        img:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRX42UzL3YD1O2t807uAsXmfBnkSb9moe9eyA&usqp=CAU",
        description: "All systems Pro.",
        description2:
            """ The Apple M1 chip gives the 13‑inch MacBook Pro speed and power beyond belief. With up to 2.8x CPU performance. Up to 5x the graphics speed. An advanced Neural Engine for up to 11x faster machine learning. And up to 20 hours of battery life so you can go all day. It’s our most popular pro notebook, taken to a whole new level.
"""),
    ModelProducts(
        name: "Acer",
        price: "550",
        img:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTa2Nek4AqAnYxarWursx-gtMnstjTWja7prg&usqp=CAU",
        description: "Acer  ENDURO Urban",
        description2:
            "With an antimicrobial coating5, a bright screen, and long battery life, this slender and durable laptop is always ready to take you on new adventures far and wide. The Acer ENDURO Urban N3 combines highly technical features with a day-to-day style that lets you get away from the city and back into nature.")
  ];

  static List<ModelProducts> drondata = [
    ModelProducts(
        name: "DJI Mini 2",
        price: "499",
        img:
            "https://i.pcmag.com/imagery/reviews/05XLyr5lHmUwD3twXxlUFzv-1.fit_lim.size_238x139.v1604954082.jpg",
        description: "All systems Pro.",
        description2: """Folded: 138×81×58 mm (L×W×H)
Unfolded: 159×203×56 mm (L×W×H)
Unfolded (with propellers): 245×289×56 mm (L×W×H).
"""),
    ModelProducts(
        name: "DJI Air 2S",
        price: "990",
        img:
            "https://i.pcmag.com/imagery/reviews/03SBVB3dvq5wKhOWeatb9Ad-17.fit_lim.size_238x139.v1618346354.jpg",
        description: "DJI Air 2S",
        description2:
            "Folded: 180×97×77 mm (length×width×height) Unfolded: 183×253×77 mm (length×width×height).")
  ];
}

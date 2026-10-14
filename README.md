# Mini Katalog Uygulaması

Flutter Günlük Eğitim kapsamında geliştirilen, temel widget yapısı, sayfa
geçişleri (Navigator), veri modeli oluşturma (JSON simülasyonu ile
`fromJson`/`toJson`) ve basit state yönetimi mantığını gösteren bir
mobil katalog uygulaması taslağıdır.

## Kısa Açıklama

Uygulama; ürünleri `GridView` ile listeler, ürüne tıklandığında
`Navigator` ve **Route Arguments** kullanılarak ürün detay sayfasına
geçiş yapılır, ürünler sepete eklenebilir ve basit bir "checkout"
(sipariş) simülasyonu yapılabilir. Ürün verileri gerçek bir API yerine
`assets/data/products.json` dosyasından okunarak API çağrısı simüle
edilmiştir (bkz. proje raporu, madde 4-5). Her ürünün kart, detay ve
sepet ekranlarında gösterilen bir görseli vardır (`Image.network` ile
yüklenir; internet yoksa otomatik olarak ikona düşer, bkz. "Ürün
Görselleri" bölümü).

## Kullanılan Flutter Sürümü

- **Flutter SDK:** 3.22.x (Dart 3.4+)
- Ek paket kullanılmamıştır; yalnızca `material.dart` (Flutter'ın
  standart kütüphaneleri: `dart:convert`, `flutter/services.dart`,
  `flutter/foundation.dart`) kullanılmıştır.

## Ürün Görselleri

Her ürünün `products.json` içinde bir `imageUrl` alanı vardır. Bu
görseller, ürün adı ve rengine göre otomatik oluşturulan placeholder
(yer tutucu) görsellerdir — gerçek marka/ürün fotoğrafı kullanılmamıştır
(telif hakkı sorunlarını önlemek için). Görsel yüklenirken veya internet
yokken ürünün kategorisine uygun bir Material ikonuna otomatik olarak
geçiş yapılır, böylece uygulama çevrimdışıyken de çökmeden çalışır.

> **Önemli — Android internet izni:** `flutter create .` komutuyla
> oluşturulan varsayılan `android/app/src/main/AndroidManifest.xml`
> dosyasında internet izni bazı durumlarda (özellikle release modda)
> tanımlı olmayabilir. Görsellerin her koşulda yüklenebilmesi için
> `<manifest>` etiketinin hemen içine şu satırı eklemeniz önerilir:
> ```xml
> <uses-permission android:name="android.permission.INTERNET"/>
> ```
> Debug modda (`flutter run`) genelde bu izin otomatik sağlanır, bu
> yüzden emulator'de görselleri görmeniz için ekstra bir şey yapmanız
> gerekmeyebilir.

Kendi ürün görsellerinizi kullanmak isterseniz `imageUrl` alanına
kendi görsel linkinizi yazmanız yeterlidir; kod tarafında herhangi bir
değişiklik gerekmez.

## Proje Yapısı

```
mini_katalog/
├── assets/
│   └── data/
│       └── products.json        # Simüle edilmiş "API" verisi
├── lib/
│   ├── main.dart                 # Uygulama girişi ve route tanımları
│   ├── models/
│   │   └── product.dart          # Product veri modeli (fromJson/toJson)
│   ├── services/
│   │   ├── product_service.dart  # JSON'dan veri okuma (API simülasyonu)
│   │   └── cart_service.dart     # Sepet state yönetimi
│   ├── screens/
│   │   ├── home_screen.dart          # Ana sayfa - ürün listesi (GridView)
│   │   ├── product_detail_screen.dart# Ürün detay sayfası
│   │   └── cart_screen.dart          # Sepet sayfası
│   └── widgets/
│       └── product_card.dart     # Ürün kartı widget'ı
└── pubspec.yaml
```

## Çalıştırma Adımları

1. Flutter SDK'nın bilgisayarınızda kurulu olduğundan emin olun:
   ```
   flutter --version
   ```
2. Proje klasörüne girin:
   ```
   cd mini_katalog
   ```
3. Bağımlılıkları yükleyin:
   ```
   flutter pub get
   ```
4. Bir Android Emulator başlatın (Android Studio üzerinden) veya
   fiziksel bir cihaz bağlayın.
5. Uygulamayı çalıştırın:
   ```
   flutter run
   ```

## Öğrenilen / Uygulanan Konular

- Stateless & Stateful widget mantığı
- `Text`, `Container`, `Row`, `Column`, `Card`, `ListTile`, `Chip`
- `Navigator.push` / `pushNamed` ile sayfa geçişleri ve **Route
  Arguments** (ürün nesnesinin bir sayfadan diğerine taşınması)
- JSON verisinin `dart:convert` ile parse edilmesi ve model sınıfına
  dönüştürülmesi (`fromJson` / `toJson`)
- `GridView.builder` ile kart tabanlı ürün listeleme
- Basit arama/filtreleme mantığı
- `ValueNotifier` ile basit state güncelleme (sepet sayacı, sepete
  ekleme/çıkarma)
- Asset yönetimi (`pubspec.yaml` içinde `assets/data/products.json`
  tanımlanması ve `rootBundle` ile okunması)

## Not

Bu proje bir eğitim/demo çalışmasıdır ve gerçek bir e-ticaret
altyapısına bağlı değildir. Gerçek bir API'ye bağlanmak isterseniz
`http` paketini ekleyip [Fake Store API](https://fakestoreapi.com/products)
veya [DummyJSON](https://dummyjson.com/products) kullanabilirsiniz.

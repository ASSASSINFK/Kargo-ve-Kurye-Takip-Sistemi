# Kargo-ve-Kurye-Takip-Sistemi

📌 Projenin Amacı Kargo operasyonlarındaki şube kabul, hat aktarması, kurye dağıtımı ve müşteri teslimat süreçlerini tek bir merkezde toplayan operasyonel bir altyapıdır. Sistem; göndericiyi, şube çalışanını ve sahada görev yapan kuryeyi kopuk süreçlerden kurtarıp aynı veritabanında buluşturur.

## 🗄️ Veri Tabanı Mimarisi (17 Tablo)
Sistem 4 ana modülde gruplandırılmıştır:
- **Müşteri ve Lokasyon:** `Musteriler`, `Adresler`, `Sehirler`, `Ilceler`
- **Personel ve Filo:** `Subeler`, `Departmanlar`, `Personeller`, `Araclar`, `Arac_Bakim_Loglari`
- **Operasyon:** `Kargolar`, `Kargo_Tipleri`, `Kargo_Durum_Sozlugu`, `Kargo_Hareket_Loglari`, `Kurye_Zimmetleri`
- **Finans:** `Fiyat_Tarifeleri`, `Odeme_Tipleri`, `Faturalar`

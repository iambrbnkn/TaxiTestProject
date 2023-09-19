# TaxiTestProject
# Описание
- Проект написан на UIKit
- Использована архитеутра MVVM
- Адаптивная верстка интерфейса кодом
- Работа с сетью URLSession
- Работа с изображениями Kingfisher
- При загрузке изображение кешируется и храниться в памяти в течении 10 минут
- Индикатор загрузки изображения при работе с экраном детальной информации, при ошибке - дефолтное изображение
- Активити индикатор на время загрузки главной
- PTR для обновления главной
- UICollectionView на главной
- Odata на главной если нет сети

# Задание

- Необходимо написать приложение, которое загружает с сервера JSON-файл, разбирает его и выводит на экран отсортированный по убыванию даты список с информацией об активных заказах в службе такси.
- В каждом элементе списка должны отображаться:
  - Начальный адрес
  - Конечный адрес
  - Дата поездки
  - Стоимость заказа
- По нажатию на элемент списка необходимо показать экран с детализацией, где, помимо перечисленных выше полей, должны отображаться время заказа, а также информация о машине и водителе.
- При разработке приложения необходимо использовать архитектуру VIPER
- Приложение должно поддерживать iOS 13.0+ и быть оформлено в соответствии с руководством iOS Human Interface Guidelines. Язык программирования для реализации тестового задания – Swift 5.3+
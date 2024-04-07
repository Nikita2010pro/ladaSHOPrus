class LadaCar {
  final String name;
  final List<String> imageUrl;
  final String price;
  final String description;
  final String youtubeVideo;
  bool isLiked = false;
  bool inBasket = false;
  int countInBasket = 1;

  LadaCar({required this.name, required this.imageUrl, required this.price, required this.description, required this.youtubeVideo});
}

List<LadaCar> ladaCars = [
  LadaCar(
    name: 'Lada VESTA',
    imageUrl: [
      'https://plusauto.moscow/uploads/used_car/3685/images/gal_medium_ac_279dbe70b0f2da7b4d9b458a9e4ac1ef_1649199776.jpg',
      'https://plusauto.moscow/uploads/used_car/3685/images/gal_medium_ac_a2f205e4aac4dc2a772343c7e8950943_1649199776.jpg',
      'https://plusauto.moscow/uploads/used_car/3685/images/gal_medium_ac_e9b120c835a1417efddcdcf9e7c4dafe_1649199776.jpg',
    ],
    price: '1 733 900',
    description: 'Энергичный дизайн LADA Vesta нового поколения стал еще привлекательней. Развитый рельеф бамперов создает современный и динамичный образ автомобиля, а новая светодиодная оптика делает седан по-настоящему заметным. LADA Vesta вызывает удивительное чувство единения с автомобилем. Водительское место привычно и комфортно настроено. Пассажиры могут вытянуть ноги и поставить свои гаджеты на подзарядку. В салоне удобно и в ежедневных поездках, и в дальних путешествиях: в неё хочется возвращаться снова и снова.',
    youtubeVideo: 'https://www.youtube.com/watch?v=aBZfXiZBRTk'
  ),
  LadaCar(
    name: 'Lada XRAY',
    imageUrl: [
      'https://avtodelkino.ru/wp-content/uploads/2016/02/xray-series.jpg',
      'https://avatars.mds.yandex.net/get-autoru-vos/3923961/5fde86e24c8ce62546d711a067b1ca66/1200x900n',
      'https://kuznitsaspb.ru/wp-content/uploads/6/b/9/6b9c41d412ab6cd1fd7e1cbc42ecd7e6.jpeg',
    ],
    price: '1.106.900',
    description: 'Безопасный автомобиль – тот, который заметен на дороге. LADA XRAY никогда не потеряется в потоке, благодаря ярким светодиодным дневным ходовым огням. Светодиодная полоска выполняет и стилевую функцию, подсвечивая хромированный «Икс» передка.',
      youtubeVideo: 'https://www.youtube.com/watch?v=O_Dw-3NOzDk'
  ),
  LadaCar(
    name: 'Lada LARGUS',
    imageUrl: [
      'https://avtodozorshop.ru/wp-content/uploads/5/a/d/5ad48b1a6ef96e7f10e901ec1d07c25f.jpeg',
      'https://www.pro-lada.ru/upload/webp/iblock/177/0cxfone13qd766o0r1gdz2n3ymd8sqoi.webp',
      'https://www.pro-lada.ru/upload/webp/iblock/bf9/mapckxcrqv2ua1l8g9d6v9q8klw7egum.webp',
    ],
    price: '1.300.900',
    description: 'Семейный, любимый, вместительный универсал LADA Largus стал еще удобней. Теплее зимой, эффективней в городе, тише и комфортней на шоссе. Современный интерьер и яркая внешность — это новый LADA Largus! Обязательно купите, если любите семью свою!',
      youtubeVideo: 'https://www.youtube.com/watch?v=e5xNAWMaK60'
  ),
  LadaCar(
    name: 'Lada GRANTA',
    imageUrl: [
      'https://avatars.dzeninfra.ru/get-zen_doc/3845269/pub_61b310352e4d8013b9bf1c44_61b315202e4d8013b9c2e49a/scale_2400',
      'https://avatars.dzeninfra.ru/get-zen_doc/5227693/pub_61b310352e4d8013b9bf1c44_61b310e8ccba271966754a70/scale_2400',
      'https://avatars.dzeninfra.ru/get-zen_doc/5235248/pub_61b310352e4d8013b9bf1c44_61b3155387b1ae3a9831b405/scale_2400',
    ],
    price: '399.920',
    description: 'Народный автомобиль стал ярче и привлекательнее: седан Granta в новом кузове получил черты современной ДНК стиля LADA.X-образная графика переднего бампера, выразительная светотехника, рельеф багажника и, конечно, множество практичных улучшений не оставят равнодушными почитателей бренда. В наших автосалонах новая модель доступна с автоматической и механической коробкой переключения передач.',
      youtubeVideo: 'https://www.youtube.com/watch?v=lnE6C45V6I4'
  ),
  LadaCar(
      name: 'VESTA SPORTLINE',
      imageUrl: [
        'https://www.avtogermes.ru/images/models/exterior/73244c686e59e0f82e93db46de2fd4d0.jpg',
        'https://static.lada.ru/images/v6/cars/about/vesta_new/with_benefit/vsws_main_header_d_2024_200.webp',
        'https://motor.ru/imgs/2023/10/23/11/6191426/6f90eecc43be1e4b4eac5772c965d2ae94d79eb3.jpg',
      ],
      price: '2.350.900 ₽',
      description: 'Каждый маршрут становится гоночной трассой. Каждый водитель может быть самым быстрым. Силуэт — занижен, колея — расширена. Автомобиль со спортивным характером выделяется в потоке. Его слышно: выпуск настроен на свободное дыхание мотора. Под скорость создан и кузов: испытан в аэротрубе и оснащен тщательно проработанным обвесом.',
      youtubeVideo: 'https://www.youtube.com/watch?v=9qVk5tH9nsM'
  ),
  LadaCar(
    name: 'Lada NIVA LEGEND',
    imageUrl: [
      'https://ivanglazunov.ru/wp-content/uploads/0/3/c/03c426d2330f4918b4033a00cfdfa9e9.jpeg',
      'https://5koleso.ru/wp-content/uploads/2022/06/lada_niva_legend_2022-03.jpg',
      'https://www.ixbt.com/img/n1/news/2023/11/1/0e57de710591484a79d649dd83dc9c9630bfc84f%20copy_large.jpg',
    ],
    price: '1.198.900',
    description: 'Максимальную проходимость модели LADA Niva Legend в сочетании с дорожным комфортом обеспечивают следующие характеристики: Колеса с литыми дисками и шинами с активным грунтовым протектором.Самоблокирующиеся дифференциалы винтового типа в переднем и заднем мостах.Усиленный задний мост.Увеличенный дорожный просвет.',
      youtubeVideo: 'https://www.youtube.com/watch?v=9qVk5tH9nsM'
  ),
  LadaCar(
    name: 'Lada NIVA TRAVEL',
    imageUrl: [
      'https://www.wyborkierowcow.pl/wp-content/uploads/2021/03/lada-niva-travel-cennik-otwarcie.jpg',
      'https://allroader.ru/wp-content/uploads/2021/02/2A1A417D-056B-4D42-BAD9-3F5C3E3C6A59.jpeg',
      'https://carexpert.ru/img/int1200/vaznii21-01.jpg',
    ],
    price: '998.900',
    description: 'Легендарная LADA Niva Travel — машина, которая гармонично дополняет и природный ландшафт, и городской пейзаж. Полноприводный автомобиль в новом кузове остался таким же узнаваемым: это и его решительный характер, и готовность покорять просторы, и открытость приключениям.',
      youtubeVideo: 'https://www.youtube.com/watch?v=Uw12NidOHZE'
  ),
];


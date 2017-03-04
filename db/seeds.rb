# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ani1 = Anime.create(
	title: "Крутой учитель Онидзука",
	manufacturer: "Япония",
	animeType: "ТВ",
	date: "1999",
	description: "Онидзука Эйкити («22 года, холост», - как он сам любит представляться) - настоящий ужас на двух колесах, член нагоняющей ужас на горожан банды мотоциклистов, решает переквалифицироваться в… школьного учителя. Ведь в любом учебном заведении полным-полно аппетитных старшеклассниц в коротеньких юбочках! Но чем глубже примеривший необычную",
	subscribers: "2"
)

ani2 = Anime.create(
	title: "Код Гиас: Восставший Лелуш",
	manufacturer: "США",
	animeType: "ТВ+ОВА",
	date: "2008",
	description: "В Японии, захваченной и переименованной в «Зону 11», вместе с младшей сестрой живёт старшеклассник Лелуш – изгнанный сын Императора, потерявший мать и право на престол. Юноша отличается от сверстников не только происхождением",
	subscribers: "1"
)

ani3 = Anime.create(
	title: "Стальной алхимик",
	manufacturer: "Японии",
	animeType: "ОВА",
	date: "2009",
	description: "Нарушив главный запрет Алхимии и попытавшись воскресить маму, талантливые братья Элрики заплатили высокую цену: младший, Альфонс, потерял тело, и теперь его душа прикреплена к стальным доспехам, а старший, Эдвард, лишился руки и ноги",
	subscribers: "10"
)

ani4 = Anime.create(
	title: "Врата Штейна [ТВ]",
	manufacturer: "Россия",
	animeType: "ТВ",
	date: "2012",
	description: "Акихабара – интереснейшее место, где обитают самые разные люди – от слегка сдвинутых по фазе до больных на всю голову. Именно такая компания собралась в «Лаборатории проблем времени», что над лавкой старых телевизоров.",
	subscribers: "15"
)

ani5 = Anime.create(
	title: "Кланнад [ТВ-2]",
	manufacturer: "Япония",
	animeType: "ТВ",
	date: "2010",
	description: "Сериал берет новый старт там, где окончился первый сезон. Миновали летние каникулы, подходит к концу последний школьный год большинства основных героев. Томоя Окадзаки сделал выбор и теперь живет у своей девушки, Нагисы Фурукавы",
	subscribers: "15"
)

gen1 = Genre.create(
	name: "Хентай"
)

gen2 = Genre.create(
	name: "Романтика"
)

gen3 = Genre.create(
	name: "Драма"
)

ser1 = Series.create(
	video: "url123",
	number: "1",
	anime: ani1
)

ani1.item_lists.create(genre: gen1)
ani2.item_lists.create(genre: gen2)
ani3.item_lists.create(genre: gen3)
ani4.item_lists.create(genre: gen2)
ani5.item_lists.create(genre: gen1)

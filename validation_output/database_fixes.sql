-- UNESCO Heritage Database Fixes
-- Generated: 2026-01-15T18:28:14.521582
-- REVIEW CAREFULLY BEFORE APPLYING

BEGIN TRANSACTION;

-- [ID 3] Historic Centres of Berat and Gjirokastra : Update description_ro
UPDATE museum_item SET
  description_ro = 'Berat și Gjirokastra sunt rare exemple arhitecturale ale perioadei otomane. 

Situat în centrul Albaniei, Berat este martorul coexistenței mai multor comunități culturale și religioase de-a lungul secolelor. Castelul cunoscut local sub numele de Kala, construit în mare parte în secolul 13, precum și numeroase moschei construite în era otomană ce a început în anul 1417.

Gjirokastra, pe valea râului Drinos din sudul Albaniei, prezintă mai multe șiruri de case cu două etaje construite în sec. 17. Orașul conține și un bazar, o moschee din sec. 18 și două biserici din aceeași perioadă.'
WHERE id = 3;

-- [ID 217] Paphos: Update description_ro
UPDATE museum_item SET
  description_ro = 'Paphos a fost locuit încă din neolitic. A fost centrul unui cult al Afroditei și a unor divinități pre-elenice ale fertilității.

Locul de naștere legendar al Afroditei era pe insulă, acolo unde micenienii au construit un templu în sec. 12 î.Hr.

Rămășițele vilelor, palatelor, teatrelor, fortărețelor și mormintelor arată importanța arhitecturală și istorică a sitului.

Mozaicele din Nea Paphos sunt printre cele mai frumoase din lume.'
WHERE id = 217;

-- [NEW] Qinghai Hoh Xil: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Qinghai Hoh Xil',
  'Qinghai Hoh Xil, located in the northeastern extremity of the Qinghai-Tibetan Plateau, is the largest and highest plateau in the world. This extensive area of alpine mountains and steppe systems is situated more than 4,500 m above sea level, where sub-zero average temperatures prevail all year-round. The site’s geographical and climatic conditions have nurtured a unique biodiversity. More than one third of the plant species, and all the herbivorous mammals are endemic to the plateau. The property secures the complete migratory route of the Tibetan antelope, one of the endangered large mammals that are endemic to the plateau.
Description is available under license CC-BY-SA IGO 3.0',
  'Qinghai Hoh Xil, situat în extremitatea nord-estică a Podișului Qinghai-Tibetan, este cel mai mare și cel mai înalt platou din lume. Această zonă extinsă de munți alpini și sisteme de stepă este situată la peste 4.500 m deasupra nivelului mării, unde temperaturile medii sub zero predomină pe tot parcursul anului. Condițiile geografice și climatice ale sitului au alimentat o biodiversitate unică. Mai mult de o treime din speciile de plante și toate mamiferele erbivore sunt endemice platoului. Proprietatea asigură ruta de migrație completă a antilopei tibetane, una dintre mamiferele mari pe cale de dispariție, care sunt endemice în platou.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Qinghai Hoh Xil se trouve à l’extrémité nord-est du vaste plateau Qinghai-Tibet, le plus grand et le plus haut plateau du monde. Cette vaste région de montagnes alpines et de steppes est située à plus de 4 500 m d’altitude au-dessus du niveau de la mer, où les températures moyennes annuelles sont en-dessous de zéro. La formation géographique et les conditions climatiques ont engendré une biodiversité unique. Plus d’un tiers des espèces de plantes et tous les mammifères herbivores sont endémiques du plateau. Le bien préserve la totalité de la voie de migration de l’antilope du Tibet, l’une des espèces de grands mammifères en danger, qui est endémique du plateau.
Description is available under license CC-BY-SA IGO 3.0',
  'La región de Qinghai Hoh Xil se halla al nordeste del Qinhai-Tibet, el altiplano más vasto y alto del mundo. Abarca un extenso territorio de montañas alpinas y estepas situadas a más de 4.500 metros de altura, en las que reina un clima frío con temperaturas medias anuales por debajo de 0º. La diversidad biológica del sitio es única en su género, debido a sus condiciones climáticas y su configuración geográfica. Más de un tercio de las especies vegetales y la totalidad de los mamíferos herbívoros de esta región mesetaria son endémicos. El sitio preserva íntegramente la ruta migratoria del antílope tibetano, un gran mamífero endémico de este altiplano que se halla en peligro de extinción.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1540_0001-400-400-20250922154048.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Fanjingshan: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Fanjingshan',
  'Located within the Wuling mountain range in Guizhou Province (south-west China), Fanjingshan ranges in altitude between 500 metres and 2,570 metres above sea level, favouring highly diverse types of vegetation and relief. It is an island of metamorphic rock in a sea of karst, home to many plant and animal species that originated in the Tertiary period, between 65 million and 2 million years ago. The property’s isolation has led to a high degree of biodiversity with endemic species, such as the Fanjingshan Fir (Abies fanjingshanensis) and the Guizhou Snub-nosed Monkey (Rhinopithecus brelichi), and endangered species, such as the Chinese Giant Salamander (Andrias davidianus), the Forest Musk Deer (Moschus berezovskii) and Reeve’s Pheasant (Syrmaticus reevesii). Fanjingshan has the largest and most contiguous primeval beech forest in the subtropical region.
Description is available under license CC-BY-SA IGO 3.0',
  'Situat în lanțul muntos Wuling din provincia Guizhou (sud-vestul Chinei), Fanjingshan are o altitudine între 500 de metri și 2.570 de metri deasupra nivelului mării, favorizând tipuri foarte diverse de vegetație și relief. Este o insulă de rocă metamorfică într-o mare de carstică, adăpostește numeroase specii de plante și animale care și-au luat naștere în perioada terțiară, între 65 de milioane și 2 milioane de ani în urmă. Izolarea proprietății a condus la un grad ridicat de biodiversitate cu specii endemice, cum ar fi bradul Fanjingshan (Abies fanjingshanensis) și maimuța cu nasul strâns din Guizhou (Rhinopithecus brelichi), precum și specii pe cale de dispariție, cum ar fi salamandra gigantică chinezească (Andrias davidianus), Reischusus și berezevs (Moușchus) Fazanul (Syrmaticus reevesii). Fanjingshan are cea mai mare și cea mai învecinată pădure primitivă de fag din regiunea subtropicală.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Situé dans la chaîne de montagnes de Wuling, dans la province du Guizhou (sud-ouest de la Chine), Fanjingshan se caractérise par une amplitude altitudinale qui va de 2 570 à 500 m au-dessus du niveau de la mer, ce qui favorise l''existence de types de végétation et de relief très diversifiés. C''est une île de roches métamorphiques dans un océan de karst qui abrite encore de nombreuses espèces animales et végétales dont l''origine remonte au tertiaire, il y a entre 65 millions et deux millions d''années. L''isolement a favorisé un haut degré de biodiversité avec des espèces endémiques, comme le sapin de Fanjingshan (Abies fanjingshanensis) et le rhinopithèque jaune doré du Guizhou (Rhinopithecus brelichi), ou menacées, comme la salamandre géante de Chine (Andrias davidianus), le porte-musc nain (Moschus berezovskii) ou le faisan vénéré (Syrmaticus reevesii). Fanjingshan abrite la forêt primaire de hêtres la plus vaste et la plus continue de la région subtropicale.
Description is available under license CC-BY-SA IGO 3.0',
  'Situada al sudoeste de China, en la Provincia de Guizhou, la cadena montañosa de Wuling alberga el sitio de Fanjinshan. La altitud máxima de este sitio alcanza los 2.570 metros sobre el nivel del mar y la mínima es de unos 500 metros, debido a lo cual las configuraciones de su relieve y los tipos de vegetación son sumamente variados. Geológicamente, Fanjinshan es una isla de rocas metamórficas en medio de un océano cárstico que alberga numerosas especies de flora y fauna cuyo origen se remonta a la Era Terciaria (entre 65 y 2 millones de años atrás). El aislamiento del sitio ha hecho que su grado de diversidad biológica sea muy elevado y que esté poblado por especies endémicas, como el mono chato gris de pelo dorado de Guizhou (rhinopithecus brelichi) y el abeto de Fanjinshan (abies fanjingshanensis), o en peligro de extinción, como la salamandra gigante de China (andrias davidianus), el ciervo almizclero enano (moschus berezovskii) y el faisán venerado (syrmaticus reevesii). Además, en Fanjinshan crece el hayedo primario más extenso y continuo de toda la región subtropical.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Расположенный в горной цепи Улин в провинции Гуйчжоу (на юго-западе Китая), объект Фаньцзиншань характеризуется амплитудой высот от 500 до 2570 метров над уровнем моря, что создает благоприятные условия для разнообразных видов растительности и типов рельефа. Фаньцзиншань представляет остров метаморфических горных пород в океане карста, служащего средой обитания многочисленных видов флоры и фауны, происхождение которых восходит к Третичному периоду (от 65 до 2 млн. лет назад). Изоляция способствовала развитию высокого уровня биоразнообразия, в том числе таких эндемичных видов, как Фаньцзиншаньская пихта (Abies fanjingshanensis) и золотисто-желтый Гуйчжоуский ринопитек (Rhinopithecus brelichi), а также виды, находящиеся под угрозой исчезновения, такие как Китайская исполинская саламандра (Andrias davidianus), кабарга березовского (Moschus berezovskii) и пёстрый китайский фазан (Syrmaticus reevesii). В Фаньцзиншане произрастают самые большие девственные буковые леса в субтропическом регионе.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '梵净山位于武陵山脉的贵州省境内部分，海拔高度介于500-2570米之间，有着极度丰富的植被和地貌。这处遗产地就像是喀斯特海洋中的一个变质岩岛屿，从第三纪（6500-200万年前）开始起源于这里的诸多动植物以这里为家园。其隔离特性带来了高度的生物多样性，包括特有物种梵净山冷杉和贵州仰鼻猴，以及濒危物种如中国大鲵、林麝和白冠长尾雉。梵净山拥有亚热带地区最大、最接近原始状态的山毛榉林。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يتميز جبل فان جينغ شان، الموجود في سلسلة جبال فولينغ في مقاطعة قويتشو (جنوب غرب الصين)، بارتفاعه الذي يتراوح بين 2570 و500 متر فوق مستوى سطح البحر، الأمر الذي يعزز تنوع الأصناف النباتية والتضاريس الجغرافية الموجودة في المنطقة. إذ يعدّ الموقع جزيرة من الصخور المتحولة في محيط كارستي، وما زال يحتوي حتى يومنا هذا على أنواع عديدة من الحيوانات والنباتات التي يعود أصلها إلى الفترة الجيولوجية للعصر الثالث أي ما بين 65 مليون على 2 مليون سنة مضت. وقد شجع وجوده في منطقة منعزلة على إيجاد درجة عالية من التنوع البيولوجي المتجسّد في مجموعة من الأصناف المستوطنة، ومنها مثلاً: شجرة فان جينغ شان، وفصيلة القردة الصفر الذهبية في مقاطعة قويتشو، بالإضافة إلى الأصناف المهددة، ومنها مثلاً: السمندل العملاق في الصين والأيائل المسكية الصغيرة. كما يحتوي الموقع على غابة الزان الأولية القديمة التي تعدّ الأكبر والأوسع في المنطقة شبه المدارية.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1559_0001-400-400-20180221141800.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Archaeological Ruins of Liangzhu City: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Archaeological Ruins of Liangzhu City',
  'Located in the Yangtze River Basin on the south-eastern coast of the country, the archaeological ruins of Liangzhu (about 3,300-2,300 BCE) reveal an early regional state with a unified belief system based on rice cultivation in Late Neolithic China. The property is composed of four areas – the Area of Yaoshan Site, the Area of High-dam at the Mouth of the Valley, the Area of Low-dam on the Plain and the Area of City Site. These ruins are an outstanding example of early urban civilization expressed in earthen monuments, urban planning, a water conservation system and a social hierarchy expressed in differentiated burials in cemeteries within the property.
Description is available under license CC-BY-SA IGO 3.0',
  'Situate în bazinul râului Yangtze, pe coasta de sud-est a țării, ruinele arheologice din Liangzhu (aproximativ 3.300-2.300 î.Hr.) dezvăluie un stat regional timpuriu cu un sistem de credință unificat bazat pe cultivarea orezului în China neolitică târzie. Proprietatea este compusă din patru zone – zona sitului Yaoshan, zona barajului înalt de la gura văii, zona barajului mic de pe câmpie și zona orașului. Aceste ruine sunt un exemplu remarcabil de civilizație urbană timpurie exprimată în monumente de pământ, planificare urbană, un sistem de conservare a apei și o ierarhie socială exprimată în înmormântări diferențiate în cimitire din cadrul proprietății.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Situées dans le delta du Yangzi Jiang, sur la côte sud-est du pays, les ruines archéologiques de Liangzhu (environ 3 300-2 300 AEC) révèlent un ancien État régional au système de croyance unifié, fondé sur la riziculture, dans la Chine du Néolithique tardif. Le site se compose de quatre zones : le site de Yaoshan, la zone du barrage supérieur à l’embouchure de la vallée, la zone du barrage inférieur dans la plaine, et la cité. Ces ruines constituent un exemple exceptionnel de civilisation urbaine ancienne s’exprimant notamment par des monuments en terre, une planification urbaine, un système de conservation de l’eau et une hiérarchie sociale qui se traduit par une différenciation des sépultures.
Description is available under license CC-BY-SA IGO 3.0',
  'Situados en la costa sudoriental del país, en el delta del río Yangtsé, los vestigios arqueológicos de Liangzhu datan del periodo 3300-2300 a.C., esto es, de la era del neolítico tardío en China. Este sitio pone de manifiesto que en esta región ya existía entonces un antiguo Estado con una economía basada en el cultivo del arroz y un conjunto de creencias unificado. El sitio comprende cuatro partes: la zona de Yaoshan; la presa de contención superior, situada en la embocadura del valle; la presa inferior, situada en la llanura; y el lugar de asentamiento de la ciudad propiamente dicho. Estos vestigios constituyen un ejemplo excepcional de una antigua civilización urbana caracterizada por la construcción de obras y monumentos con tierra, la práctica de un urbanismo planificado, la creación de un sistema de conservación del agua y el establecimiento de una jerarquía social patentizada por la diferenciación de las sepulturas.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Руины древнего города Лянчжу, относящегося к периоду позднего неолита в Китае (около 3300-2300 гг. до н.э.), расположены в дельте реки Янцзы на юго-восточном побережье страны. Лянчжу – древнее региональное государство c единой системой верований, в основе которых лежало выращивание риса. Данный объект Всемирного наследия состоит из четырех зон: Яошань, плотина в верхнем устье реки, плотина в нижнем устье реки и древний город. Руины Лянчжу являются выдающимся примером древней городской цивилизации. Город имел развитую систему водоснабжения и городского планирования, земляные памятники, а также социальную иерархию, о чем свидетельствуют различия в погребальных памятниках.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '位于中国东南沿海长江三角洲的良渚古城遗址（约公元前3300-2300年）向人们展示了新石器时代晚期一个以稻作农业为支撑、具有统一信仰的早期区域性国家。该遗址由4个部分组成：瑶山遗址区、谷口高坝区、平原低坝区和城址区。通过大型土质建筑、城市规划、水利系统以及不同墓葬形式所体现的社会等级制度，这些遗址成为早期城市文明的杰出范例。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'تعود آثار مدينة ليانغتشو (3300-2300 عام قبل الميلاد)، الواقعة على ضفاف نهر يانغتسي على الساحل الجنوبي الشرقي للبلاد، إلى ولاية إقليمية كان يسودها نظام موحد للمعتقدات، يقوم على زراعة الأرز في أواخر العصر الحجري الحديث في الصين. ويتكون الموقع من أربع مناطق: موقع يوشان، ومنطقة السد العلوي عند مصب الوادي، ومنطقة السد السفلي في السهل والمدينة. وتقدّم هذه الآثار مثالاً بارزاً على التمدن الحضري في العصور القديمة، والتي تبرزها الآثار البرية، وعناصر التخطيط الحضري، ونظام الحفاظ على المياه، والتسلسل الهرمي الاجتماعي الذي يتجسد في الفروق الواضحة في المقابر.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1592_0001-400-400-20180301113717.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Migratory Bird Sanctuaries along the Coast of Yellow Sea-Bohai Gulf of China: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Migratory Bird Sanctuaries along the Coast of Yellow Sea-Bohai Gulf of China',
  'The Migratory Bird Sanctuaries along the Coast of Yellow Sea-Bohai Gulf of China is a serial extension of the property of the same name already inscribed on the World Heritage List. As part of the world’s largest intertidal wetland system, this area within the Yellow Sea Ecoregion supports crucial habitats for birds migrating on the East Asian-Australasian Flyway which spans some 25 countries from the Arctic to South-East Asia and Australasia. The wetlands serve a unique ecological function as indispensable stopover sites for many millions of waterbirds and represent a significant example of the shared natural heritage embodied in migratory birds.
Description is available under license CC-BY-SA IGO 3.0',
  'Sanctuarele de păsări migratoare de-a lungul coastei Mării Galbene-Golful Bohai din China este o extensie în serie a proprietății cu același nume, deja înscrisă pe Lista Patrimoniului Mondial. Ca parte a celui mai mare sistem de zone umede intertidale din lume, această zonă din cadrul ecoregiunii Mării Galbene susține habitate cruciale pentru păsările care migrează pe calea de zbor Est-Asia-Australasia, care se întinde pe aproximativ 25 de țări din Arctic până în Asia de Sud-Est și Australasia. Zonele umede îndeplinesc o funcție ecologică unică ca locuri de oprire indispensabile pentru multe milioane de păsări de apă și reprezintă un exemplu semnificativ de moștenire naturală comună întruchipată de păsările migratoare.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Les Sanctuaires d’oiseaux migrateurs le long du littoral de la mer Jaune et du golfe de Bohai de Chine sont une extension en série du bien du même nom déjà inscrit sur la Liste du patrimoine mondial. Faisant partie du plus grand système de zones humides intertidales du monde, cette zone de l’écorégion de la mer Jaune abrite des habitats essentiels pour les oiseaux migrateurs de la voie de migration Asie de l’Est-Australasie, laquelle s’étend sur quelque 25 pays, de l’Arctique à l’Asie du Sud-Est et à l’Australasie. Ces zones humides remplissent une fonction écologique unique en tant qu’aires de repos indispensables pour des millions d’oiseaux d’eau et représentent un exemple d’importance mondiale du patrimoine naturel commun incarné par les oiseaux migrateurs.
Description is available under license CC-BY-SA IGO 3.0',
  'El Santuario de aves migratorias en el litoral del Mar Amarillo y del Golfo Bohai de China es una extensión en serie del sitio homónimo que ya está inscrito en la Lista del Patrimonio Mundial. Esta zona, que se encuentra en la Ecorregión del Mar Amarillo, forma parte del mayor sistema de humedales intermareales del mundo. Es el sustento de hábitats fundamentales para las aves migratorias que utilizan la ruta de migración desde Asia oriental a Australasia, que se extiende por unos 25 países desde el Ártico hasta Asia Sudoriental y Australasia. Los humedales cumplen una función ecológica única como lugares de parada indispensables para millones de aves acuáticas, y representan un ejemplo significativo del patrimonio natural compartido que encarnan las aves migratorias.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Этот объект является расширением одноименного серийного объекта, уже включенного в Список всемирного наследия. Являясь частью крупнейшей в мире системы приливно-отливных водно-болотных угодий, эта территория в экорегионе Желтого моря служит важнейшей средой обитания для птиц, мигрирующих по Восточно-Азиатско-Австралийскому пролетному пути, который охватывает около 25 стран от Арктики до Юго-Восточной Азии и Австралазии. Водно-болотные угодья играют уникальную экологическую роль, являясь незаменимыми местами остановки для миллионов водоплавающих птиц. Они представляют собой важный пример общего природного наследия, воплощенного в перелетных птицах.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '中国黄（渤）海候鸟栖息地通过了第一期（2019年）和第二期（2024年）的分期申报程序，由十二个组成部分构成，位于世界上最大的潮间带湿地系统中，也是生物多样性最丰富的地区之一。这一自然遗产为400 多种鸟类提供了栖息地。它地处黄海生态区，是东亚-澳大利西亚迁飞通道上不可替代的枢纽，凭借其独特的生态功能成为了候鸟向北/向南迁徙过程中不可或缺的停歇地和中转站。黄海和渤海湾是数百万水鸟迁徙的咽喉瓶颈地带，占东亚-澳大利西亚航道迁徙总量的 10%以上。中国黄（渤）海候鸟栖息地是人与候鸟共享自然遗产案例中的全球典范。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يُعتبر موقع "محميات الطيور المهاجرة على طول ساحل البحر الأصفر في خليج بوهاي الصيني" توسيعاً متسلسلاً لمساحة الموقع المُدرج بالفعل تحت نفس الاسم في قائمة التراث العالمي. وتعتبر هذه المنطقة جزءاً من أكبر نظام للأراضي الرطبة الوحلية الواقعة تحت تأثير المد والجزر على مستوى العالم، وتقع داخل المنطقة الإيكولوجية للبحر الأصفر، وتساعد في الإبقاء على موائل في غاية الأهمية للطيور المهاجرة على طول مسار الهجرة من شرق آسيا وأستراليا الذي يمتد فيما يقرب من 25 بلداً امتداداً من القطب الشمالي وانتهاء بجنوب شرق آسيا وأستراليا. تؤدي الأراضي الرطبة دوراً بيئياً منقطع النظير باعتبارها محطات توقف لا غنى عنها لملايين الطيور المائية وتقّدم مثالاً هاماً على التراث الطبيعي المشترك الذي تجسده الطيور المهاجرة.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1606_0015-400-400-20221005164634.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Quanzhou: Emporium of the World in Song-Yuan China: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Quanzhou: Emporium of the World in Song-Yuan China',
  'The serial site of Quanzhou illustrates the city’s vibrancy as a maritime emporium during the Song and Yuan periods (10th - 14th centuries AD) and its interconnection with the Chinese hinterland. Quanzhou thrived during a highly significant period for maritime trade in Asia. The site encompasses religious buildings, including the 11th century AD Qingjing Mosque, one of the earliest Islamic edifices in China, Islamic tombs, and a wide range of archaeological remains: administrative buildings, stone docks that were important for commerce and defence, sites of ceramic and iron production, elements of the city’s transportation network, ancient bridges, pagodas, and inscriptions. Known as Zayton in Arabic and western texts of the 10th to 14th centuries AD.
Description is available under license CC-BY-SA IGO 3.0',
  'Situl în serie al Quanzhou ilustrează vitalitatea orașului ca un emporiu maritim în timpul perioadelor Song și Yuan (secolele 10-14 d.Hr.) și interconectarea sa cu hinterlandul chinez. Quanzhou a prosperat într-o perioadă foarte semnificativă pentru comerțul maritim din Asia. Situl cuprinde clădiri religioase, inclusiv Moscheea Qingjing din secolul al XI-lea d.Hr., una dintre cele mai vechi edificii islamice din China, morminte islamice și o gamă largă de vestigii arheologice: clădiri administrative, docuri de piatră care au fost importante pentru comerț și apărare, locuri de producție de ceramică și fier, elemente ale rețelei de transport a orașului, inscripții antice, pagode, inscripții antice. Cunoscut ca Zayton în textele arabe și occidentale din secolele al X-lea până la al XIV-lea d.Hr.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le site en série de Quanzhou illustre le dynamisme de la ville en tant qu’emporium maritime pendant les périodes Song et Yuan (Xe-XIVe siècles de notre ère) et ses interconnexions avec l’arrière-pays chinois. Quanzhou a prospéré pendant une période très importante pour le commerce maritime en Asie. Le site comprend des édifices religieux, notamment la mosquée Qingjing, du XIe siècle, l’un des premiers édifices islamiques de Chine, des tombes islamiques et un large éventail de vestiges archéologiques : bâtiments administratifs, quais en pierre qui étaient importants pour le commerce et la défense, sites de production de céramique et de fer, éléments du réseau de transport de la ville, ponts anciens, pagodes et inscriptions. La ville était connue sous le nom de Zayton dans des textes arabes et occidentaux du Xe au XIVe siècle de notre ère.
Description is available under license CC-BY-SA IGO 3.0',
  'Los componentes de este sitio ilustran la vitalidad de la ciudad de Quanzhou como emporio marítimo en la época de las dinastías Song y Yuan (siglos X a XIV de nuestra era), y también como punto de conexión con la China continental. Conocida con el nombre de Zayton en los textos árabes y europeos de los siglos X a XIV, Quanzhou posee antiguos edificios religiosos entre los que figura la mezquita de Qingjing (siglo XI), una de las primeras construcciones de culto musulmán de toda China. También cuenta con tumbas islámicas y con un vasto conjunto de vestigios arqueológicos de todo tipo: edificios administrativos, muelles y embarcaderos de piedra importantes para el comercio y la defensa, elementos de la red local de transportes y talleres de cerámica y metalurgia, así como inscripciones, pagodas y puentes antiguos.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Серийный объект Цюаньчжоу иллюстрирует динамику города как морского центра торговли в периоды Сун и Юань (X-XIV вв. н. э.) и его взаимосвязь с внутренними районами Китая. Цюаньчжоу процветал в весьма значительный период для морской торговли в Азии. На территории объекта расположены религиозные здания, в том числе мечеть Цинцзин XI века, одна из самых ранних исламских построек в Китае, исламские гробницы и широкий спектр археологических памятников: административные здания, каменные доки, имевшие важное значение для торговли и обороны, места производства керамики и железа, элементы транспортной сети города, древние мосты, пагоды и надписи. Цюаньчжоу был ранее известен как Зайтон в арабских и западных текстах Х-XIV веков.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '该遗址群体现了泉州在宋元时期（公元10-14世纪）作为世界海洋商贸中心的活力，及其与中国腹地的紧密联系。泉州在亚洲海运贸易的这个重要时期蓬勃发展。遗产地包括多座宗教建筑，如始建于公元11世纪的清净寺（中国最早的伊斯兰建筑之一）、伊斯兰教圣墓，以及大量考古遗迹，如行政建筑、具有重要商贸和防御意义的石码头、制瓷和冶铁生产遗址、城市交通网道的构成元素、古桥、宝塔和碑文。在公元10-14世纪的阿拉伯和西方文献中，泉州被称为刺桐。该遗产地还包括一座保留了部分原貌的元代寺庙，以及世界上仅存的摩尼石像。摩尼是摩尼教（又称琐罗亚斯德教）的创始人，该教约于公元6-7世纪传入中国。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يجسّد الموقع المتسلسل لمدينة تشانتشو الحيوية التي كانت تنعم بها المدينة كمركزٍ تجاريّ بحريّ خلال فترتَي حكم سُلالَتي سونغ ويوان بين القرنين العاشر والرابع عشر بعد الميلاد، فضلاً عن ضروب التواصل والترابط بين المدينة وبين الأراضي الصينيّة الداخلية النائية. وازدهرت مدينة تشانتشو خلال مرحلة بالغة الأهميّة على صعيد التجارة البحريّة في آسيا. ويحتضن الموقع جملةً من الصروح الدينيّة على غرار مسجد تشينغ جينغ (مسجد الأصحاب) الذي يعود تاريخه إلى القرن الحادي عشر وهو واحد من أقدم الصروح الإسلامية في الصين، ناهيك عن المقابر الإسلامية، وطيف واسع من البقايا الأثرية مثل المباني الإدارية، وأرصفة الموانئ الحجريّة الهامّة لأغراض التجارة والدفاع، ومواقع إنتاج السيراميك والحديد، وعناصر من شبكة النقل في المدينة، والجسور القديمة، والمعابد، والنقوش. كانت المدينة تُعرف باسم "زيتون" في النصوص العربية والغربية التي تعود إلى الفترة الممتدة من القرن العاشر إلى القرن الرابع عشر الميلادي.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1561_0023-400-400-20221005173322.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Cultural Landscape of Old Tea Forests of the Jingmai Mountain in Pu’er: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Cultural Landscape of Old Tea Forests of the Jingmai Mountain in Pu’er',
  'Located on Jingmai Mountain in southwestern China, this cultural landscape was developed over a thousand years by the Blang and Dai peoples following practices that began in the 10th century. The property is a tea production area comprised of traditional villages within old tea groves surrounded by forests and tea plantations. The traditional understorey cultivation of old tea trees is a method that responds to the specific conditions of the mountain’s ecosystem and subtropical monsoon climate, combined with a governance system maintained by the local Indigenous communities. Traditional ceremonies and festivities relate to the Tea Ancestor belief that spirits live in the tea plantations and in the local fauna and flora, a belief that is at the core of this cultural tradition.
Description is available under license CC-BY-SA IGO 3.0',
  'Situat pe Muntele Jingmai din sud-vestul Chinei, acest peisaj cultural a fost dezvoltat de-a lungul a o mie de ani de popoarele Blang și Dai, în urma unor practici care au început în secolul al X-lea. Proprietatea este o zonă de producție de ceai formată din sate tradiționale din vechile plantații de ceai, înconjurate de păduri și plantații de ceai. Cultivarea tradițională a arborilor bătrâni de ceai este o metodă care răspunde condițiilor specifice ale ecosistemului munților și climei musonice subtropicale, combinată cu un sistem de guvernare menținut de comunitățile indigene locale. Ceremoniile și festivitățile tradiționale se referă la credința strămoșilor de ceai că spiritele trăiesc în plantațiile de ceai și în fauna și flora locală, o credință care este la baza acestei tradiții culturale.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Situé dans la montagne Jingmai dans le sud-ouest de la Chine, ce paysage culturel a été façonné sur une période de mille ans par les Blang et les Dai, selon des pratiques qui remontent au Xe siècle. Le bien consiste en une zone de production de thé composée de villages traditionnels situés dans d’anciens théiers entourés de forêts et de plantations de thé. La culture traditionnelle de théiers anciens en sous-bois est une méthode qui répond aux conditions spécifiques de l’écosystème montagneux et du climat de mousson subtropical, associée à un système de gouvernance assuré par les communautés autochtones. Les cérémonies et festivités traditionnelles sont liées à la croyance aux Ancêtres du thé, selon laquelle des esprits vivent dans les plantations de thé ainsi que dans la faune et la flore locales, croyance qui est au cœur de cette tradition culturelle.
Description is available under license CC-BY-SA IGO 3.0',
  'Situado en la montaña Jingmai, en el suroeste de China, este paisaje cultural fue desarrollado durante todo un milenio por los pueblos Blang y Dai, siguiendo prácticas que comenzaron en el siglo X. El sitio es una zona de producción de té compuesta por aldeas tradicionales que se encuentran dentro de antiguos bosques rodeados de vegetación y plantaciones de té. El cultivo tradicional de viejos árboles de té en el sotobosque es un método que responde a las condiciones específicas del ecosistema de la montaña y al clima monzónico subtropical, combinados con un sistema de gobernanza que conservan las comunidades indígenas locales. Las ceremonias y fiestas tradicionales se relacionan con la creencia de que los espíritus viven en las plantaciones de té, así como en la fauna y flora locales, una creencia que se halla en la base de esta tradición cultural.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Этот культурный ландшафт, раскинувшийся на горе Цзинмай на юго-западе Китая, в течение тысячи лет осваивали народы Бланг и Дай, следуя традициям, зародившимся в X веке. На территории объекта расположены традиционные деревни, расположенные в древних чайных рощах, окруженных лесами и чайными плантациями. Традиционное выращивание древних чайных деревьев в подлеске — это метод, отвечающий специфическим условиям горной экосистемы и субтропического муссонного климата, в сочетании с системой управления, поддерживаемой местными коренными общинами. Традиционные церемонии и праздники связаны с верой предков в то, что духи живут на чайных плантациях, в местной фауне и флоре, и эта вера является основой данной культурной традиции.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '该文化景观位于中国云南景迈山，由当地布朗族、傣族民众遵循始于10世纪的实践，历经千余年培育而成。这里是一片茶乡，森林和茶园环绕的多个传统村落掩映在古茶树间。古茶树的传统林下栽培方式，因应山区生态系统和亚热带季风气候的特点，并与当地社区维护的管理体系相结合。人们笃信“茶祖”，他们相信茶树有灵、自然有灵，这里的传统仪式和节庆活动与这一信仰密切相关。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يقع هذا المنظر الطبيعي الثقافي على جبل جينغماي جنوب غرب الصين، وساهمت شعوب الداي والبلانغ بصقل هيئته على مدار ألف عام لما كانت تتبعه من ممارسات بدأت في القرن العاشر. ويعتبر الموقع بمنزلة منطقة لإنتاج الشاي، ويتألف من قرى تقليدية داخل بساتين الشاي القديمة وتحيط به الغابات ومزارع الشاي. وتواجه طريقة الزراعة التقليدية لأشجار الشاي القديمة ظروف النظام البيئي للجبال ومناخ الرياح الموسمية شبه الاستوائية، وذلك بفضل نظام حوكمة تضطلع مجتمعات الشعوب الأصلية بالحفاظ عليه. إنّ الاحتفالات والمهرجانات التقليدية مرتبطة بأحد معتقدات الأسلاف عن الشاي، إذ كانوا يعتقدوا أنّ الأرواح تعيش في مزارع الشاي وفي الحيوانات والنباتات المحلية، ويتمحور هذا التقليد الثقافي حول هذا الاعتقاد.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1665_0003-400-400-20231020101434.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Badain Jaran Desert - Towers of Sand and Lakes: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Badain Jaran Desert - Towers of Sand and Lakes',
  'Located in the Alashan Plateau in the hyper-arid and temperate desert region of northwestern China, the Badain Jaran Desert is a meeting point for three sandy regions of China and is the country’s third largest desert and second largest drifting desert. The property stands out with its high density of mega-dunes, intersected with inter-dunal lakes. It displays spectacular ongoing geological and geomorphic features of desert landscapes and landforms which may well be unparalleled. Noteworthy features, among others, include the world’s tallest, stabilized sand mega-dune (relative relief of 460 m); the highest concentration of inter-dunal lakes; and the largest expanse of so-called singing sands (describing the resonance caused for example by wind moving dry and loose sand) and wind-eroded landforms. The varied landscape also results in a high level of habitat diversity, and hence of biodiversity.
Description is available under license CC-BY-SA IGO 3.0',
  'Situat în Podișul Alashan, în regiunea deșertică hiperaridă și temperată din nord-vestul Chinei, deșertul Badain Jaran este un punct de întâlnire pentru trei regiuni nisipoase ale Chinei și este al treilea deșert ca mărime din țară și al doilea ca mărime în derivă. Proprietatea se remarcă prin densitatea mare de mega-dune, intersectate cu lacuri interdunale. Afișează trăsături geologice și geomorfice spectaculoase ale peisajelor și formelor de relief ale deșertului, care ar putea fi de neegalat. Caracteristicile demne de remarcat, printre altele, includ cea mai înaltă mega-dună de nisip stabilizat din lume (relief relativ de 460 m); cea mai mare concentrație de lacuri interdunale; și cea mai mare întindere de așa-numitele nisipuri cântătoare (care descriu rezonanța cauzată, de exemplu, de mișcarea vântului de nisip uscat și afanat) și forme de relief erodate de vânt. Peisajul variat are ca rezultat, de asemenea, un nivel ridicat de diversitate a habitatelor și, prin urmare, de biodiversitate.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Situé sur le plateau d’Alashan, dans la région désertique hyperaride et tempérée du nord-ouest de la Chine, le désert de Badain se trouve à la croisée de trois régions sableuses de Chine et c’est le troisième plus grand désert et le deuxième plus grand désert mouvant du pays. Ce bien se distingue par la densité élevée de ses mégadunes et ses lacs interdunaires. Il expose les caractéristiques géologiques et géomorphologiques permanentes et spectaculaires de paysages et de formes de relief désertiques qui pourraient bien être sans égales. Parmi ses caractéristiques remarquables, on peut citer entre autres la mégadune stabilisée la plus haute du monde (relief relatif de 460 m), la plus grande concentration de lacs interdunaires, et la plus vaste étendue de sables dits « chantants » (pour qualifier le son du sable sec et meuble déplacé par le vent) et des reliefs érodés par le vent. Le paysage varié explique aussi l’importante diversité des habitats et, par extension, de la biodiversité.
Description is available under license CC-BY-SA IGO 3.0',
  'El Desierto de Badain Jaran, situado en la meseta de Alashan, en la región desértica hiperárida y templada del noroeste de China, es un punto de encuentro de tres regiones arenosas de China. Constituye el tercer desierto más grande del país y el segundo mayor desierto de arena movediza. Este desierto se distingue por la alta densidad de sus megadunas y sus lagos interdunares. Presenta unas espectaculares características geológicas y geomórficas permanentes y paisajes desérticos y accidentes geográficos que puede que sean incomparables. Destacan, entre otros, la megaduna de arena estabilizada más alta del mundo (460 m de relieve relativo), la mayor concentración de lagos interdunales y la mayor extensión de las llamadas “arenas cantarinas” (que describen la resonancia causada, por ejemplo, por el viento al mover arena seca y suelta) y de accidentes geográficos erosionados por el viento. La variedad del paisaje también se traduce en una gran diversidad de hábitats y, por tanto, de biodiversidad.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Пустыня Бадын-Джаран расположена на Алашанском плато в сверхзасушливом и умеренном пустынном регионе северо-западного Китая. Она является точкой пересечения трех песчаных зон Китая, третьей по величине пустыней страны и второй по величине пустыней с дрейфующими песками. Объект отличает высокая плотность мегадюн, между которыми расположены озера. На его территории находятся пустынные ландшафты и формы рельефа с впечатляющими геологическими и геоморфологическими характеристиками, возможно, не имеющими аналогов. В частности, здесь находится самая высокая в мире неподвижная песчаная мегадюна (относительная высота — 460 м), а также сосредоточена самая высокая концентрация междюнных озер. Кроме того, здесь расположено самое большое количество так называемых «поющих песков» (так называют резонанс, возникающий, например, при ветровых колебаниях сухого и сыпучего песка) и рельефа, образованного в результате ветровой эрозии. Благодаря разнообразному ландшафту на территории района также сохраняется широкий спектр сред обитания, что способствует поддержанию биоразнообразия.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '巴丹吉林沙漠地处阿拉善高原，属中国西北极干旱的温带荒漠地区，是中国第三大沙漠和第二大流动沙漠。该地区以连绵起伏的高大沙山和丘间众多湖泊而闻名，展示了沙漠景观不断变换的地质和地貌特征，令人叹为观止，全球少有沙漠可以比肩。巴丹吉林沙漠的重要标志包括世界最高的固定沙山（相对高度达460米）、最密集的沙漠湖泊、最广阔的鸣沙区域，以及多样的风蚀地貌。如此多样化的景观展示了巴丹吉林沙漠非凡的自然美学价值，代表地球上重要、典型且持续的风沙地貌发展过程，从而也造就了丰富多彩的生物栖息地。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'تقع صحراء باداين جاران في هضبة ألاشان في منطقة صحراوية وشبه صحراوية شديدة الجفاف شمال غرب الصين. وتُعتبر هذه الصحراء نقطة التقاء لثلاث مناطق رملية صينية، وهي ثالث أكبر صحراء في الصين وثاني أكبر صحراء للتزلج على الرمال. ويتميز الموقع بكثرة الكثبان الرملية الضخمة والبحيرات الموزعة بين الكثبان. تُظهر الصحراء تضاريس وملامح جيولوجية مذهلة ودائمة للمناظر الطبيعية والتضاريس الصحراوية التي ربما تكون منقطعة النظير. وتشمل السمات الجديرة بالذكر، من بين جملة أمور أخرى، أعلى الكثبان الرملية الثابتة في العالم (بفارق ارتفاع نسبي يبلغ 460 متراً بين أعلى وأدنى نقطة)؛ أكبر تجمع للبحيرات الواقعة بين الكثبان الرملية؛ وأكبر مساحة للأصوات المعروفة باسم "غناء الكثبان الرملية" (وهي ظاهرة صدى الصوت الناتج عن حركة الرمال الجافة وغير المتماسكة بفعل الرياح على سبيل المثال) والتضاريس التي تعرضت للتعرية بسبب الرياح. ويُسهم تنوع التضاريس إسهاماً كبيراً أيضاً في إثراء تنوع الموائل الأمر الذي يُسفر في نهاية المطاف عن ازدهار التنوع البيولوجي.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1638_0015-400-400-20240604175853.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Beijing Central Axis: A Building Ensemble Exhibiting the Ideal Order of the Chinese Capital: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Beijing Central Axis: A Building Ensemble Exhibiting the Ideal Order of the Chinese Capital',
  'Running north to south through the heart of historical Beijing, the Central Axis consists of former imperial palaces and gardens, sacrificial structures, and ceremonial and public buildings. Together they bear testimony to the evolution of the city and exhibits evidence of the imperial dynastic system and urban planning traditions of China. The location, layout, urban pattern, roads and design showcase the ideal capital city as prescribed in the Kaogongji, an ancient text known as the Book of Diverse Crafts. The area, between two parallel rivers, has been settled for about 3,000 years, but the Central Axis itself originated during the Yuan Dynasty (1271-1368) that established its capital, Dadu, in the northern part. The property also features later historical structures built during the Ming Dynasty (1368-1644) and improved during the Qing Dynasty (1636-1912).
Description is available under license CC-BY-SA IGO 3.0',
  'Mergând de la nord la sud prin inima orașului istoric Beijing, Axa Centrală este formată din foste palate și grădini imperiale, structuri de sacrificiu și clădiri ceremoniale și publice. Împreună, ei depun mărturie despre evoluția orașului și prezintă dovezi ale sistemului dinastic imperial și ale tradițiilor de planificare urbană din China. Locația, aspectul, modelul urban, drumurile și designul prezintă capitala ideală, așa cum este prescris în Kaogongji, un text antic cunoscut sub numele de Cartea Meșteșugurilor Diverse. Zona, cuprinsă între două râuri paralele, este așezată de aproximativ 3.000 de ani, însă Axa Centrală însăși și-a luat naștere în timpul dinastiei Yuan (1271-1368) care și-a stabilit capitala, Dadu, în partea de nord. Proprietatea prezintă, de asemenea, structuri istorice ulterioare construite în timpul dinastiei Ming (1368-1644) și îmbunătățite în timpul dinastiei Qing (1636-1912).
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'L’Axe central de Beijing, qui traverse le cœur historique du nord au sud, est constitué d’anciens palais et jardins impériaux, de structures sacrificielles et d’édifices cérémoniels et publics. Cet ensemble témoigne de l’évolution de la ville d’un système dynastique impérial à l’ère moderne et des traditions urbanistiques de la Chine. La situation, le tracé, le schéma urbain et la conception mettent en lumière le paradigme de la capitale idéale prescrit dans le Kaogongji, un texte ancien connu sous le nom de Livre des divers métiers. La zone du bien, située entre deux rivières parallèles, a été occupée pendant près de 3 000 ans, mais l’Axe central lui-même a pris corps sous la dynastie Yuan (1271-1368) qui fonda Dadu, sa capitale, dans la section septentrionale. Le bien présente également des structures historiques ultérieures construites sous la dynastie Ming (1368-1644) et améliorées sous la dynastie Qing (1636-1912).
Description is available under license CC-BY-SA IGO 3.0',
  'El Eje central, que atraviesa el centro histórico de Beijing de norte a sur, está formado por antiguos palacios y jardines imperiales, estructuras sacrificiales y edificios ceremoniales y públicos. El conjunto es testimonio de la evolución de la ciudad y evidencia el sistema dinástico imperial y las tradiciones urbanísticas de China. La ubicación, el trazado, el patrón urbano, las calles y el diseño muestran la capital ideal según lo que prescribe el Kaogongji, un antiguo texto conocido como el Libro de los Diversos Oficios. La zona, situada entre dos ríos paralelos, ha estado poblada desde hace unos 3000 años, pero el Eje central propiamente dicho se originó durante la dinastía Yuan (1271-1368), que estableció su capital, Dadu, en la parte norte. El sitio también cuenta con estructuras históricas posteriores construidas durante la dinastía Ming (1368-1644) y mejoradas durante la dinastía Qing (1636-1912).
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Центральная ось, простирающаяся с севера на юг через сердце исторического Пекина, включает бывшие императорские дворцы и сады, жертвенные сооружения, а также церемониальные и общественные здания. В совокупности комплекс этих строений свидетельствует об эволюции города, отражает устройство императорской династической системы и градостроительные традиции Китая. Расположение, планировка, городская структура, дороги и дизайн представляют собой пример идеального столичного города, который описан в «Као-гун цзи» — древнем тексте, известном как «Записи о проверке качества работы ремесленников». Хотя территория между двумя параллельными реками была заселена около 3 000 лет назад, сама Центральная ось возникла во времена правления династии Юань (1271–1368), которая основала свою столицу Даду в северной части. На территории также находятся более поздние исторические сооружения, построенные во времена правления династии Мин (1368–1644) и усовершенствованные в эпоху династии Цин (1636–1912).
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '北京中轴线位于北京老城的中心，呈南北走向，由古代皇家宫苑建筑、古代皇家祭祀建筑、古代城市管理设施、国家礼仪和公共建筑以及居中道路遗存等5大类15个遗产构成要素共同组成组成。它们共同见证了北京城从帝国王都到现代首都的历史变革，并展现了中国城市规划传统。其选址、布局、城市规划、道路和设计，整体展现了中国古籍《考工记》所载的理想都城规划范式。这一地区位于两条平行河流之间，已有约3000年的人类聚居历史，而中轴线本身起源于定都北方的元朝（1271-1368年）。中轴线上的许多古建筑兴建于明朝（1368-1644年），完善于清朝（1635-1912年）。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يتجه المحور المركزي من الشمال إلى الجنوب ماراً في قلب بيجين التاريخية، وهو يتألف من القصور والحدائق الإمبراطورية والبنى المخصصة للأضاحي والمباني العامة وتلك المخصصة للاحتفالات في عهد سابق. ويشهد هذا المجمَّع على تطور المدينة ويعرض أدلة على نظام السلالات الإمبراطورية وعلى تقاليد التخطيط الحضري في الصين. ويعرض الموقع والتخطيط والنمط الحضري والطرقات والتصميم المدينة العاصمة النموذجية كما ورد وصفها في كتاب "كاوغونجي" القديم المعروف بأنه كتاب الصناعات الحرفية المتنوعة. وقد استوطن البشر في المنطقة الواقعة بين النهرين المتوازيين منذ 3000 عام تقريباً، ولكن المحور المركزي نفسه برز خلال عصر سلالة يوان (1271-1368) التي أنشأت عاصمتها دادو في الجزء الشمالي. ويتضمن هذا الموقع أيضاً بنى تاريخية من فترة لاحقة بُنيت في أثناء حكم سلالة مينغ (1368-1644) وأُدخلت عليها تحسينات خلال حكم سلالة تشينغ (1636-1912).
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1714_0004-400-400-20240607152723.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Xixia Imperial Tombs: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Xixia Imperial Tombs',
  'Located in the foothills of the southern Helan Mountains in Ningxia, this necropolis is the imperial cemetery of the Xixia Dynasty. It includes nine imperial mausoleums, 271 subordinate tombs, a northern architectural complex, and 32 flood control structures. Founded by the Tanguts in 1038, the Xixia Dynasty lasted until its destruction by Genghis Khan’s Mongol army in 1227. Positioned along the Silk Road, it became a multicultural civilization modelled on Chinese imperial traditions, with Buddhism at its core. The property reflects the dynasty’s religious and socio-political legacy.
Description is available under license CC-BY-SA IGO 3.0',
  'Situată la poalele din sudul Munților Helan din Ningxia, această necropolă este cimitirul imperial al dinastiei Xixia. Include nouă mausolee imperiale, 271 de morminte subordonate, un complex arhitectural nordic și 32 de structuri de control al inundațiilor. Fondată de Tanguts în 1038, dinastia Xixia a durat până la distrugerea sa de către armata mongolă a lui Genghis Khan în 1227. Poziționată de-a lungul Drumului Mătăsii, a devenit o civilizație multiculturală după modelul tradițiilor imperiale chineze, cu budismul în centrul său. Proprietatea reflectă moștenirea religioasă și socio-politică a dinastiei.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Située en pied de la partie méridionale des monts Helan, dans la région de Ningxia Hui, cette nécropole est le lieu de sépulture impérial de la dynastie Xixia. Elle abrite neuf mausolées impériaux, 271 tombes annexes, un complexe architectural septentrional et de trente-deux ouvrages de protection contre les eaux de ruissellement. Fondé en 1038 par le peuple tangoute, la dynastie des Xixia perdura jusqu’à sa destruction par l’armée mongole de Gengis Khan, en 1227. Située le long de la route de la soie, elle est devenue une civilisation multiculturelle modelée sur les traditions impériales chinoises, dont le bouddhisme était une composante essentielle. Ce bien reflète l''héritage religieux et sociopolitique de cette dynastie.
Description is available under license CC-BY-SA IGO 3.0',
  'Situada en las estribaciones de la parte sur de las montañas Helan, en la región Hui de Ningxia, esta necrópolis es el cementerio imperial de la dinastía Xixia. Incluye nueve mausoleos imperiales, 271 tumbas secundarias, un complejo arquitectónico en el norte y 32 estructuras de control de inundaciones. La dinastía Xixia, fundada por los tanguts en 1038, duró hasta su destrucción por el ejército mongol de Genghis Khan en 1227. Su localización en la Ruta de la Seda la convirtió en una civilización multicultural inspirada en las tradiciones imperiales chinas con el budismo como eje central. El sitio refleja el legado religioso y sociopolítico de la dinastía.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Этот некрополь расположен у подножия южной части гор Хэланьшань в Нинся-Хуэйском автономном районе и служил императорским кладбищем династии Си Ся (Западного Ся). Он включает девять императорских мавзолеев, 271 сопровождающую гробницу, северный архитектурный комплекс и 32 сооружения для защиты от наводнений. Династия Си Ся, основанная тангутами в 1038 году, была уничтожена в 1227 году монгольской армией Чингисхана. Расположение на Шёлковом пути обусловило развитие мультикультурной цивилизации, основанной на китайских имперских традициях, с буддизмом в качестве центральной религиозной системы. Объект отражает религиозное и социально-политическое наследие династии.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '西夏陵位于中国宁夏回族自治区、贺兰山南段东麓，是西夏王朝的皇室陵园，包括9座帝王陵墓、271座陪葬墓、5.7公顷北端建筑群以及32处防洪工程遗址。西夏王朝于1032年由党项人建立，一直延续至1227年被成吉思汗的蒙古军队灭亡。王朝扼守古丝绸之路要道，其效法中原王朝制度，形成以佛教信仰为核心、多元文化并存的文明。该遗址生动展现了西夏王朝的宗教与社会政治传统。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'تُعدّ هذه المدينة الجنائزية، الكائنة عند سفوح جبل هيلان الجنوبي في نينغشيا هوي، المقبرة الملكية لسلالة شياشيا الحاكمة، وتضم تسعة أضرحة ملكية، و271 قبراً لأفراد ليسوا من الحكام الرئيسيين، ولكن كانت لهم صلة وثيقة بالأسرة الحاكمة، ومجمعاً معمارياً في الجهة الشمالية، و32 منشأة للسيطرة على الفيضانات. أسس شعب التانغوت سلالة شيا شيا في عام 1038، وبقيت قائمة حتى دمّرها جيش جنكيز خان المغولي عام 1227. وباتت، بفضل موقعها على طول طريق الحرير، حضارة متعددة الثقافات ترتكز على التقاليد الملكية الصينية، وفي مقدمتها التقاليد البوذية. تجسّد هذه الأضرحة الإرث الديني والاجتماعي والسياسي للسلالة الحاكمة.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1736_0001-400-400-20250616145549.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Los Katíos National Park: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Los Katíos National Park',
  'Extending over 72,000 ha in north-western Colombia, Los Katios National Park comprises low hills, forests and humid plains. An exceptional biological diversity is found in the park, which is home to many threatened animal species, as well as many endemic plants.
Description is available under license CC-BY-SA IGO 3.0',
  'Întinzându-se peste 72.000 ha în nord-vestul Columbiei, Parcul Național Los Katios cuprinde dealuri joase, păduri și câmpii umede. O diversitate biologică excepțională se găsește în parc, care găzduiește multe specii de animale amenințate, precum și multe plante endemice.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Couvrant 72 000 ha dans le nord-ouest de la Colombie, le parc de Los Katios comprend des collines basses, des forêts et des plaines humides. Il présente une diversité biologique exceptionnelle et sert d''habitat à plusieurs espèces animales menacées, ainsi qu''à de nombreuses plantes endémiques.
Description is available under license CC-BY-SA IGO 3.0',
  'Situado en el noroeste de Colombia, el parque de los Katios se extiende por unas 72.000 hectí¡reas y estí¡ formado por cerros bajos, bosques y llanuras húmedas. Su diversidad biológica es excepcional y alberga varias especies animales en peligro de extinción, así­ como numerosas plantas endémicas.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Лос-Катиос, занимающий территорию 72 тыс. га, располагается на северо-западе Колумбии и включает низкие холмы, лесные массивы и влажные равнины. В парке, который отличается исключительно высоким биоразнообразием, обитает множество редких животных и отмечен целый ряд эндемичных растений.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '洛斯卡蒂奥斯国家公园位于哥伦比亚的西北部，占地72 000公顷，包括许多低矮的丘陵、森林和沼泽地。公园里有众多生物物种，已成为许多濒临灭绝动物和当地特有植物的家园。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'コロンビア北西部、パナマ国境近くに広がる7万2000haにもおよぶ広大な国立公園。丘陵地帯、森林、湿原と変化に富んだ環境で、きわめて多種多様な生物が見られる。昆虫、両生類、爬虫類のほか、ナマケモノ、クモザル、ジャガーなど、数多くの絶滅危惧種が生息するほか、この地に特有な植物も数多く見られる。',
  '',
  '',
  '',
  'يمتد منتزه لوس كاتيوس على مساحة 72000 هكتار في شمال غرب كولومبيا وهو يتضمّن هضاباً منخفضة وغابات وسهولا رطبة. ويتمتّع بتنوّع بيولوجي استثنائي ويأوي العديد من الأصناف الحيوانيّة المهددة والنباتات المستوطنة.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0711_0007-400-400-20151104121656.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] San Agustín Archaeological Park: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'San Agustín Archaeological Park',
  'The largest group of religious monuments and megalithic sculptures in South America stands in a wild, spectacular landscape. Gods and mythical animals are skilfully represented in styles ranging from abstract to realist. These works of art display the creativity and imagination of a northern Andean culture that flourished from the 1st to the 8th century.
Description is available under license CC-BY-SA IGO 3.0',
  'Cel mai mare grup de monumente religioase și sculpturi megalitice din America de Sud se află într-un peisaj sălbatic și spectaculos. Zeii și animalele mitice sunt reprezentate cu pricepere în stiluri de la abstract la realist. Aceste opere de artă arată creativitatea și imaginația unei culturi andine de nord care a înflorit din secolul I până în secolul al VIII-lea.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Dans un paysage sauvage impressionnant se dresse le plus grand ensemble de monuments religieux et de sculptures mégalithiques d''Amérique du Sud. Divinités et animaux mythiques sont représentés avec une parfaite maîtrise dans des styles allant de l''abstraction au réalisme. Ces œuvres d''art témoignent de la créativité et de l''imagination d''une culture du nord des Andes qui connut son apogée du Ie r au VIIIe siècle.
Description is available under license CC-BY-SA IGO 3.0',
  'En este parque se yergue, en medio de un paisaje natural impresionante, el mayor conjunto de monumentos religiosos y esculturas megalíticas de Sudamérica. Las representaciones de deidades y bestias mitológicas están ejecutadas con gran maestría en diferentes estilos, que van desde la abstracción al realismo. Estas obras de arte muestran la fuerza creadora e imaginativa de una cultura de la región andina septentrional que floreció entre los siglos I y VIII.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Крупнейшая в Южной Америке группа религиозных памятников и мегалитических скульптур находится посреди пустынного живописного ландшафта. Боги и мифические животные мастерски представлены в различных стилях – от абстракции до реализма. Эти произведения искусства свидетельствуют о высоком творческом потенциале культуры, процветавшей в районе Северных Анд в I-VIII вв.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '在南美洲一片原始壮观的风景区内矗立着最大的宗教建筑和巨石雕塑群。精湛地雕刻了众神和传说中的动物，从抽象主义到现实主义，风格各异。这些艺术杰作显示了1至8世纪盛极一时的北安第斯文化的创造力和想象力。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '美しい風景のなかに、数多くの宗教的記念物と石像が並んでいる。これらは1世紀～8世紀に発展した北アンデス文化が残したもので、神話の中の神々や動物が抽象・具象のさまざまなスタイルで表現され、この文化の豊かな創造性を示す証拠となっている。',
  '',
  '',
  '',
  'تجثم أمام منظر طبيعي متوحّش في سحره المجموعة الأكبر من التحف الدينيّة والمنحوتات المغليتيّة لأمريكا الجنوبيّة. ويجسد هذا المنظر أبلغ تجسيد للآلهة والحيوانات الأسطوريّة في أساليب تتراوح بين الغموض والواقع. وتشهد هذه التحف الفنيّة على خيال ثقافة شمال الآنديز وإبداعها وهي التي بلغت ذروتها بين القرنين الأوّل والثامن.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0744_0001-400-400-20080618154303.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Chiribiquete National Park – “The Maloca of the Jaguar”: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Chiribiquete National Park – “The Maloca of the Jaguar”',
  'Chiribiquete National Park, the largest protected area in Colombia, is the confluence point of four biogeographical provinces: Amazon, Andes, Orinoco and Guyana. As such, the National Park guarantees the connectivity and preservation of the biodiversity of these provinces, constituting itself as an interaction scenario in which flora and fauna diversity and endemism have flourished. One of the defining features of Chiribiquete is the presence of tepees (table-top mountains), sheer-sided sandstone plateaux that outstand in the forest and result in dramatic scenery that is reinforced by its remoteness, inaccessibility and exceptional conservation. Over 75,000 figures have been made by indigenous people on the walls of the 60 rock shelters from 20,000 BCE, and are still made nowadays by the uncontacted peoples protected by the National Park. These paintings depict hunting scenes, battles, dances and ceremonies, as well as fauna and flora species, with a particular the worship of the jaguar, a symbol of power and fertility. The indigenous communities, which are not directly present on the site, consider Chiribiquete as a sacred place that cannot be visited and that should be preserved unaltered.
Description is available under license CC-BY-SA IGO 3.0',
  'Parcul Național Chiribiquete, cea mai mare zonă protejată din Columbia, este punctul de confluență a patru provincii biogeografice: Amazon, Anzi, Orinoco și Guyana. Ca atare, Parcul Național garantează conectivitatea și conservarea biodiversității acestor provincii, constituindu-se ca un scenariu de interacțiune în care diversitatea și endemismul florei și faunei au înflorit. Una dintre trăsăturile definitorii ale Chiribiquete este prezența tipilor (munti de masă), platouri de gresie cu laturi abrupte care ies în evidență în pădure și au ca rezultat un peisaj dramatic, care este întărit de îndepărtarea, inaccesibilitatea și conservarea excepțională. Peste 75.000 de figuri au fost realizate de indigeni pe pereții celor 60 de adăposturi stânci din 20.000 î.Hr. și sunt încă realizate în zilele noastre de popoarele necontactate protejate de Parcul Național. Aceste picturi înfățișează scene de vânătoare, bătălii, dansuri și ceremonii, precum și specii de faună și floră, cu în special venerarea jaguarului, simbol al puterii și fertilității. Comunitățile indigene, care nu sunt prezente direct pe sit, consideră Chiribiquete un loc sacru care nu poate fi vizitat și care trebuie păstrat nealterat.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le parc national de Chiribiquete, la plus grande aire protégée de la Colombie, est le point de confluence de quatre provinces biogéographiques : Amazon, Andes, Orinoco et Guyanes. En tant que tel, le parc national garantit la connectivité et la préservation de la biodiversité de ces provinces, en se constituant comme un scénario d''interaction dans lequel la diversité de la flore et de la faune et de l''endémisme ont prospéré. Une des caractéristiques déterminantes de Chiribiquete est la présence de tepuys (montagnes tabulaires), des plateaux de grès aux parois abruptes qui dominent la forêt et offrent un paysage spectaculaire rehaussé par son isolement, son inaccessibilité et sa conservation exceptionnelle. Plus de 75 000 peintures ont été réalisés par les peuples autochtones sur les parois des 60 abris sous roche datant de 20 000 ans avant notre ère, et le sont encore de nos jours par les peuples isolés protégés par le parc national. Ces peintures représentent des scènes de chasse, des batailles, des danses et des cérémonies, ainsi que des espèces de faune et de flore, avec notamment le culte du jaguar, symbole du pouvoir et de la fertilité. Les communautés autochtones, qui ne sont pas directement présentes sur le bien, considèrent Chiribiquete comme un lieu sacré qui ne peut pas être visité et qui devrait être préservé sans modification.
Description is available under license CC-BY-SA IGO 3.0',
  'Situado al noroeste de la Amazonia colombiana, el Parque Nacional de Chiribiquete es el territorio natural protegido más extenso de todo el país. Una característica del sitio es la presencia de tepuyes, grandes formaciones rocosas elevadas y aisladas, de pendiente vertical y cimas planas, que dominan la jungla. En las paredes de unas 60 grutas situadas al pie de estas elevaciones hay más de 75.000 pinturas cuya ejecución se remonta a unos 20.000 años antes de nuestra era. Presuntamente relacionadas con un culto al jaguar, símbolo de potencia y fertilidad, esas expresiones pictóricas representan escenas cinegéticas, guerreras, danzantes y ceremoniales. Las comunidades indígenas que no se hallan directamente presentes en este sitio lo consideran territorio sagrado.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Расположенный в северо-западной части колумбийской Амазонии, Национальный парк Чирибикете является крупнейшим заповедным районом страны. Одной из особенностей этого парка являются тепуи (слово индейского происхождения, означающее «гора») – песчаные плато с крутыми склонами, возвышающиеся над лесом. Более 75 тыс. наскальных рисунков, относящихся к периоду около 20 тыс. летдо нашей эры, вплоть до настоящего времени, покрывают стены 60 скальных пещер, расположенных у подножия тепуй. Связанные с предполагаемым культом ягуара, символом мощи и плодородия, эти рисунки изображают сцены охоты, битв, танцев и церемоний. Коренные общины, не проживающие непосредственно на территории объекта, считают этот регион священным.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '奇里科克国家公园是哥伦比亚最大的保护区，位于该国西北部的亚马逊地区。公园的特色之一是俯瞰森林、四周陡峭的砂岩高原tepuis（印第安语，意为桌面山脉）。在Tepuis基座周围的60个岩棚石壁上有超过7.5万幅岩画，时间跨度从2万年前到现在。这些绘画描绘的是狩猎、战斗、舞蹈和仪式场景，相信与美洲豹崇拜有关，美洲豹是力量和生育力的象征。土著人民视这里为圣地，遗产地没有土著社区的直观迹象。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'تعدّ حديقة شيريبيكيت الوطنية، الواقعة في الجزء الشمالي الغربي من منطقة الأمازون الكولومبية، أكبر منطقة محمية في البلد. وتتميّز بمجموعة من السمات ومنها مثلاً وجود قمة "تيبوأوس"، وهي كلمة بلغة الأمريكيين الهنود وتعني "جبل"، بالإضافة إلى هضاب الحجار الرملية في المنحدرات المنتشرة في جميع أنحاء الغابة. وهناك أكثر من 75 ألف لوحة تشكلت في الفترة الممتدة منذ 20 ألف عام قبل الميلاد وحتى يومنا هذا، على جدران 60 ملاذاً من الملاذات الصخرية المحيطة بقاع هذه الجبال. وتجسّد هذه الرسومات المرتبطة بإحدى عقائد الكاغوار، والتي ترمز للقوة والخصوبة، مشاهد صيد ومعارك ورقص واحتفالات. وتعتبر هذه المنطقة مقدسة بالنسبة للمجتمعات المحلية غير الممثلة على القائمة تمثيلاً مباشراً. وستستمر أعمال الدورة الثانية والأربعين للجنة التراث العالمي حتى تاريخ 4 تموز/يوليو.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1174_0003-400-400-20180307123653.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Forest Massif of Odzala-Kokoua: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Forest Massif of Odzala-Kokoua',
  'This property is an excellent example, at an exceptionally large-scale, of the process of post-glacial forest recolonization of savanna ecosystems. It is therefore ecologically significant as a convergence point of multiple ecosystem types (Congolese Forest, Lower Guinean Forest and Savanna). The broad range of age classifications across the forest succession spectrum contributes to the park’s highly distinct ecology, incorporating a broad range of remarkable ecological processes. It is one of the most important strongholds for forest elephants in Central Africa, and is recognized as the park with the richest primate diversity in the region.
Description is available under license CC-BY-SA IGO 3.0',
  'Această proprietate este un exemplu excelent, la o scară excepțional de mare, al procesului de recolonizare a pădurilor postglaciare a ecosistemelor de savană. Prin urmare, este semnificativ din punct de vedere ecologic ca punct de convergență al mai multor tipuri de ecosisteme (Pădurea Congoleză, Pădurea Guineei Inferioare și Savana). Gama largă de clasificări de vârstă din spectrul de succesiune a pădurilor contribuie la ecologia extrem de distinctă a parcului, încorporând o gamă largă de procese ecologice remarcabile. Este unul dintre cele mai importante bastione pentru elefanții de pădure din Africa Centrală și este recunoscut ca parcul cu cea mai bogată diversitate de primate din regiune.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Ce bien représente un excellent exemple, à une échelle exceptionnellement vaste, du processus de reconquête postglaciaire de la forêt sur les écosystèmes de savane. Il est donc écologiquement important en tant que point de convergence de types d’écosystèmes multiples (forêt congolaise, forêt basse-guinéenne et savane). La vaste gamme des classes d’âge à travers le spectre de la succession forestière contribue à l’écologie très distincte du parc, intégrant un vaste éventail de processus écologiques remarquables. C’est l’un des bastions les plus importants des éléphants de forêt en Afrique centrale, et il est reconnu comme le parc ayant la diversité de primates la plus riche d’Afrique centrale.
Description is available under license CC-BY-SA IGO 3.0',
  'Este sitio es un excelente ejemplo, a una escala excepcional, del proceso de recolonización forestal postglaciar de los ecosistemas de sabana. Por lo tanto, es ecológicamente significativo como punto de convergencia entre múltiples tipos de ecosistemas (bosque congoleño, bosque de la Baja Guinea y sabana). La amplia gama de clasificaciones de edad a lo largo del espectro de sucesión forestal contribuye a la ecología altamente diferenciada del parque, que incorpora una amplia variedad de procesos ecológicos notables. Es uno de los reductos más importantes para los elefantes de bosque en África Central, y está reconocido como el parque con la diversidad de primates más rica de la región.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Этот объект является прекрасным примером исключительно масштабного процесса послеледниковой лесной реколонизации экосистем саванны. Поэтому он экологически значим как место слияния нескольких типов экосистем (Конголезский лес, Нижнегвинейский лес и Саванна). Широкий диапазон возрастных классификаций в сукцессионном ряде лесов обусловливает весьма своеобразную экологию парка, включающую широкий спектр удивительных экологических процессов. Он является одной из важнейших территорий для обитания лесных слонов в Центральной Африке и признан парком с самым богатым разнообразием приматов в регионе.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '这一遗产地是处规模极大的类别典型，展现了冰期后森林回迁形成稀树草原生态系统的进程。作为多个生态系统类型（刚果森林、下几内亚森林和稀树草原）的交汇点，它具有重要的生态意义。这里的森林广泛覆盖了演替过程中的众多年代，使公园呈现高度独特的生态环境，蕴含突出且多样的生态进程。该遗产地是森林象最重要的中非栖息地之一，也是本地区灵长类动物多样性最丰富的公园。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'إنّ هذا الموقع الواسع النطاق خير مثال استثنائي على عملية إعادة انتشار نظم السافانا البيئية في الغابات بعد العصر الجليدي، الأمر الذي يكسبه أهمية بيئية باعتباره بوتقة تنصهر فيها أنواع متعددة من النظم البيئية (مثل الغابات الكونغولية وغابات غينيا السفلى والسافانا). تساهم المجموعة الواسعة من الحدود العمرية عبر طيف تعاقب الغابات في بلورة التنوع البيئي المميز الذي يكتنزه المنتزه، والذي يضم مجموعة واسعة من العمليات البيئية الرائعة. وهو واحد من أهم معاقل أفيال الغابات في وسط أفريقيا، ومعترف به كمنتزه يحتوي على أغنى تنوع من فصائل الرئيسيات في المنطقة.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0692_0010-400-400-20231020121419.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Area de Conservación Guanacaste: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Area de Conservación Guanacaste',
  'The Area de Conservación Guanacaste (inscribed in 1999), was extended with the addition of a 15,000 ha private property, St Elena. It contains important natural habitats for the conservation of biological diversity, including the best dry forest habitats from Central America to northern Mexico and key habitats for endangered or rare plant and animal species. The site demonstrates significant ecological processes in both its terrestrial and marine-coastal environments.
Description is available under license CC-BY-SA IGO 3.0',
  'Area de Conservación Guanacaste (înscrisă în 1999), a fost extinsă cu adăugarea unei proprietăți private de 15.000 ha, St Elena. Conține habitate naturale importante pentru conservarea diversității biologice, inclusiv cele mai bune habitate de pădure uscată din America Centrală până în nordul Mexicului și habitate cheie pentru speciile de plante și animale rare sau pe cale de dispariție. Situl demonstrează procese ecologice semnificative atât în ​​mediul său terestru, cât și în mediul marin-costor.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'La Zone de conservation de Guanacaste, inscrite en 1999, a été étendue pour inclure une aire de 15 000 ha, Sta Elena qui appartenait à un particulier. La zone comprend des habitats naturels importants pour la conservation de la diversité biologique, notamment les meilleurs habitats de forêt sèche de la zone allant de l’Amérique centrale au nord du Mexique, ainsi que des habitats clés pour des espèces animales et végétales rares ou menacées. Sur ce site se déroulent des processus écologiques importants tant dans les milieux terrestres que côtiers ou marins.
Description is available under license CC-BY-SA IGO 3.0',
  'Inscrito en la Lista del Patrimonio Mundial en 1999, este sitio se amplió posteriormente, para abarcar la zona de Santa Elena, una zona suplementaria de 15.000 hectáreas perteneciente a un particular. El área de conservación posee hábitats naturales importantes para la preservación de la diversidad biológica. Entre ellos figuran los mejores hábitats de bosque seco de toda la región que se extiende desde Centroamérica al norte de México, así como otros que son esenciales para la conservación de especies animales y vegetales, raras o en peligro de extinción. En este sitio tienen lugar procesos ecológicos de gran importancia, tanto en el medio ambiente terrestre como en el costero y marino.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Территория, характеризующаяся высоким биоразнобразием, включает участки сухих тропических лесов – ярких образцов экосистем данного типа на пространстве от Центральной Америки и до севера Мексики. Здесь сохраняются ключевые местообитания редких и исчезающих видов растений и животных. В наземных экосистемах, равно как и в прибрежной зоне, можно наблюдать протекание важных экологических процессов. Впервые занесенный в Список всемирного наследия в 1999 г., этот объект в 2004 г. был расширен за счет включения небольшого участка площадью 15 тыс. га в районе залива Санта-Елена.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '此保护区于1999年被列入世界遗产，现新增一块面积达15 000公顷的私人土地——圣艾雷那(St Elena)。这里有着保护生物多样性的重要自然栖息地，包括从中美洲蔓延到墨西哥北部的最佳旱地森林栖息地，以及一些濒危或珍稀动植物的主要栖息地。这个地方的陆地和海岸环境展示了重要的生态过程。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'コスタリカ北西部、ニカラグア国境に近い保護地域。コスタリカにある約60の国立公園・自然保護区のうち6国立公園・自然保護区を含む。パナマ運河地帯とメキシコの間の原生のままの太平洋岸生態系、現在では世界に唯一残されているメキシコ北部に至る中米の完璧な乾燥熱帯林地域、標高差と多様かつ広大な地勢が生み出すさまざまな生態系など、生物多様性を誇る保護区として貴重な存在である。',
  '',
  '',
  '',
  'أُدرجت منطقة غواناكاست المحميّة عام 1999 على قائمة التراث العالمي وتوسّع نطاقها ليشمل سنتا إيلينا، وهي مساحة تمتد على 15000 هكتار وكانت ملكاً خاصاً. وتتضمّن المنطقة الموائل الطبيعيّة المهمّة لحماية التنوّع البيولوجي، خصوصاً أفضل موائل الغابة القاحلة في المنطقة الممتدة من أمريكا الوسطى إلى شمال المكسيك والموائل الأساسيّة لأصناف حيوانيّة ونباتيّة نادرة أو مهدّدة. وهذا الموقع هو موئل العمليّات البيئية المهمّة في الأوساط البريّة والساحليّة أو البحريّة.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0928_0017-400-400-20130919151557.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Taï National Park: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Taï National Park',
  'This park is one of the last major remnants of the primary tropical forest of West Africa. Its rich natural flora, and threatened mammal species such as the pygmy hippopotamus and 11 species of monkeys, are of great scientific interest.
Description is available under license CC-BY-SA IGO 3.0',
  'Acest parc este una dintre ultimele rămășițe majore ale pădurii tropicale primare din Africa de Vest. Flora sa naturală bogată și speciile de mamifere amenințate, cum ar fi hipopotamul pigmeu și 11 specii de maimuțe, sunt de mare interes științific.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Ce parc constitue l''un des derniers vestiges importants de la forêt tropicale primaire en Afrique de l''Ouest. Sa riche flore naturelle et ses espèces de mammifères menacées, comme l''hippopotame pygmée et onze espèces de singes, présentent un grand intérêt scientifique.
Description is available under license CC-BY-SA IGO 3.0',
  'Este parque es uno de los últimos vestigios importantes del bosque tropical primario del África Occidental. Su rica flora natural y sus especies de mamíferos en peligro de extinción –como el hipopótamo pigmeo y once variedades de monos– le confieren un gran interés científico.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Здесь сохранились наиболее крупные в Западной Африке массивы первичных влажно-тропических лесов. Большой научный интерес представляют богатая флора этого парка, исчезающие животные, например, карликовый бегемот, а также самые разнообразные приматы.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '这个公园是西非剩下的最后的原始热带森林之一，有丰富的自然植物和濒于灭绝的哺乳动物种类，例如矮种河马和11种猴子，都具有很高的科学研究价值。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يُشكّل هذا المنتزه أحد آخر مخلّفات الغابة الإستوائيّة الأوليّة المهمّة في إفريقيا الغربيّة. ولأصنافه النباتيّة الغنيّة والثديية المهددة مثل فرس النهر القزمة وأحد عشر صنفاً من القردة أهميّةً علميّةً كبيرةً.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/activity_578-384-216-20250313153707.jpg',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Comoé National Park: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Comoé National Park',
  'One of the largest protected areas in West Africa, this park is characterized by its great plant diversity. Due to the presence of the Comoé river, it contains plants which are normally only found much farther south, such as shrub savannahs and patches of thick rainforest.
Description is available under license CC-BY-SA IGO 3.0',
  'Una dintre cele mai mari arii protejate din Africa de Vest, acest parc se caracterizează prin marea sa diversitate de plante. Datorită prezenței râului Comoe, acesta conține plante care se găsesc în mod normal doar mult mai la sud, cum ar fi savanele cu arbuști și pete de pădure tropicală deasă.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Ce parc, qui est l''une des zones protégées les plus vastes de l''Afrique de l''Ouest, se caractérise par la très grande diversité de sa végétation. La Comoé qui coule dans le parc explique que l''on y trouve des associations de plantes que l''on ne rencontre normalement que beaucoup plus au sud, comme les savanes arbustives et des îlots de forêt dense humide.
Description is available under license CC-BY-SA IGO 3.0',
  'Este parque es una de las zonas protegidas más vastas del África Occidental y se caracteriza por la gran diversidad de su vegetación. Debido a la presencia del rio Comoé, es posible encontrar en él asociaciones vegetales que sólo se suelen dar más al sur, como sabanas arbustivas e islotes de selva densa húmeda.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Одна из крупнейших охраняемых природных территорий в Западной Африке выделяется разнообразием растительного мира. Вдоль реки Комоэ сюда из более южных районов распространяются кустарниковые саванны и влажно-тропические леса.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '这个公园是西非最大的保护区之一，其特点是植物的品种极为繁多。由于科莫埃河的灌溉，这里的植物一般只存在于南方地区，如热带大草原和浓密雨林中的灌木。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يتميّز هذا المنتزه، وهو يُعتبر أحدى أكبر مناطق إفريقيا الغربيّة المحميّة حجماً، بتنوّع نباته. ونهر كوموي الذي يجري في المنتزه يعلّل سبب وجود تجمّعات نباتيّة لا نجدها عادةً إلاّ في أقاصي الجنوب مثل سافانا الاعياص وجزيرات من غابات كثيفة رطبة.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/activity_578-384-216-20250313153707.jpg',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Sudanese style mosques in northern Côte d’Ivoire: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Sudanese style mosques in northern Côte d’Ivoire',
  'The eight Sudanese-style mosques located in Tengréla, Kouto, Sorobango, Samatiguila, Nambira, Kong, and Kaouara are characterized by earthen construction, projecting frameworks, vertical buttresses crowned with pottery or ostrich eggs, and high or low minarets in the form of a truncated pyramid. They present an interpretation of an architectural style that originated between the 12th and 14th centuries in the city of Djenné, which was then part of the Mali Empire and whose prosperity came from the trade of gold and salt across the Sahara to North Africa. It is especially from the 15th century that this style spread southwards, from the desert regions to the Sudanese savannah, adopting lower forms with stronger buttresses, to meet the requirements of a more humid climate. These mosques are the best preserved of the twenty that have survived in Côte d''Ivoire, out of several hundred that still existed at the beginning of the 20th century. The Sudanese style that characterizes these mosques, and which is unique to the savannah region of West Africa, developed between the eleventh and nineteenth centuries, when Islamic merchants and scholars spread southward from the Mali Empire, extending the trans-Saharan trade routes into the woodlands. The mosques are not only very important physical evidence of the trans-Saharan trade that fostered the expansion of Islam and Islamic culture, but are also a tangible expression of the fusion of two architectural forms that have endured over time: the Islamic form practiced by the Arab-Berbers and that of the indigenous animist communities.
Description is available under license CC-BY-SA IGO 3.0',
  'Cele opt moschei în stil sudanez situate în Tengréla, Kouto, Sorobango, Samatiguila, Nambira, Kong și Kaouara se caracterizează prin construcție de pământ, cadre proeminente, contraforturi verticale încoronate cu ouă de ceramică sau de struț și minarete înalte sau joase sub formă de piramidă trunchiată. Ele prezintă o interpretare a unui stil arhitectural care a apărut între secolele al XII-lea și al XIV-lea în orașul Djenné, care atunci făcea parte din Imperiul Mali și a cărui prosperitate provenea din comerțul cu aur și sare din Sahara până în Africa de Nord. În special din secolul al XV-lea, acest stil s-a răspândit spre sud, din regiunile deșertice până în savana sudaneză, adoptând forme mai joase cu contraforturi mai puternice, pentru a satisface cerințele unui climat mai umed. Aceste moschei sunt cele mai bine conservate dintre cele douăzeci care au supraviețuit în Coasta de Fildeș, dintre câteva sute care mai existau la începutul secolului al XX-lea. Stilul sudanez care caracterizează aceste moschei și care este unic în regiunea savanei din Africa de Vest, s-a dezvoltat între secolele al XI-lea și al XIX-lea, când comercianții și savanții islamici s-au răspândit spre sud din Imperiul Mali, extinzând rutele comerciale transsahariene în păduri. Moscheile nu sunt doar o dovadă fizică foarte importantă a comerțului trans-saharian care a favorizat expansiunea islamului și a culturii islamice, ci sunt și o expresie tangibilă a fuziunii a două forme arhitecturale care au rezistat de-a lungul timpului: forma islamică practicată de arabo-berberi și cea a comunităților animiste indigene.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Les huit mosquées de style soudanais situées dans les localités de Tengréla, Kouto, Sorobango, Samatiguila, Nambira, Kong et Kaouara sont caractérisées par une construction en terre, des charpentes en saillie, des contreforts verticaux couronnés de poteries ou d’œufs d’Autruche, et par des minarets élevés ou moins importants à la forme d’une pyramide tronquée. Elles présentent une interprétation d’un style architectural dont l’origine se situerait entre les XIIe et XIVe siècles dans la ville de Djenné, qui faisait alors partie de l’empire du Mali et dont la prospérité provenait du commerce de l’or et du sel, à travers le Sahara vers l’Afrique du Nord. C’est surtout à partir du XVe siècle que ce style s’est répandu vers le Sud, des régions désertiques à la savane soudanaise, en adoptant des formes plus basses avec des contreforts plus solides, pour répondre aux exigences d’un climat plus humide. Ces mosquées sont les mieux conservées sur les vingt qui ont subsisté en Côte d’Ivoire, sur plusieurs centaines qui existaient encore au début du XXe siècle. Le style soudanais qui caractérise ces mosquées et qui est propre à la région de la savane de l’Afrique de l’Ouest, s’est développé entre les XIe et XIXe siècles, lorsque les marchands et les érudits de l’islam se sont dispersés vers le Sud à partir de l’empire du Mali, prolongeant les routes commerciales transsahariennes jusque dans la zone boisée. Les mosquées constituent non seulement des témoins matériels très importants du commerce transsaharien qui favorisa l’expansion de l’islam et de la culture islamique, mais aussi sont l’expression tangible de la fusion des de deux formes architecturales qui ont duré dans le temps : celle islamique pratiquée par les arabo-berbères et celle des communautés autochtones animistes.
Description is available under license CC-BY-SA IGO 3.0',
  'Las ocho pequeñas mezquitas de adobe, situadas en Tengréla, Kouto, Sorobango, Samatiguila, M’Bengué, Kong y Kaouara se caracterizan por sus maderas salientes, sus contrafuertes verticales coronados por cerámica o huevos de avestruz y sus minaretes en forma de huso. Presentan una interpretación de un estilo arquitectónico originado, según se cree, en torno al siglo XIV en la ciudad de Djenné, entonces parte del Imperio de Malí, que prosperó gracias al comercio de oro y sal a través del Sáhara hasta el norte de África. Sobre todo a partir del siglo XVI, el estilo se extendió hacia el sur desde las regiones desérticas hasta la sabana sudanesa, haciéndose más bajo y desarrollando contrafuertes más robustos en respuesta a la humedad del clima. Estas mezquitas son las mejor preservadas de las veinte que se conservan en Côte d’Ivoire, donde existían cientos de ellas a principios del siglo pasado. El estilo sudanés característico de las mezquitas, específico de la región de la sabana de África Occidental, se desarrolló entre los siglos XVII y XIX, cuando los comerciantes y estudiosos se extendieron hacia el sur desde el Imperio de Malí, ampliando las rutas mercantiles transaharianas hacia la zona de la selva. Presentan testimonios muy importantes del comercio transahariano que facilitó la expansión del Islam y de la cultura islámica y reflejan una fusión de formas arquitectónicas islámicas y locales en un estilo muy característico que ha persistido en el tiempo.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Восемь небольших глинобитных мечетей в городах Тингрела, Куто, Соробанго, Саматигила, М''Бенге, Конг и Кауара характеризуются выступающими деревянными балками, вертикальными контрфорсами, увенчанными предметами керамики или страусиными яйцами, а также сужающимися минаретами. Они представляют собой интерпретацию архитектурного стиля, возникшего примерно в XIV веке в городе Дженне, который тогда входил в состав Малийской империи и процветал благодаря торговле золотом и солью с Северной Африкой через Сахару. В частности, с XVI века стиль распространился на юг из пустынных регионов в суданскую саванну, в то время как постройки становились ниже, с более широкими контрфорсами, в связи с более влажным климатом. Мечети являются лучше всего сохранившимися из 20 подобных построек в Кот-д’Ивуаре, где в начале прошлого века существовали сотни подобных зданий. Отличительный суданский стиль мечетей, характерный для региона саванн в Западной Африке, развился между XVII и XIX веками, когда торговцы и ученые начали расселяться к югу от Малийской империи, расширяя транссахарские торговые маршруты в лесную зону. Они представляют собой весьма важные свидетельства транссахарской торговли, которая способствовала распространению ислама и исламской культуры, и отражают слияние исламских и местных архитектурных форм в весьма своеобразном стиле, сохранившемся с течением времени.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '这8座小型土坯清真寺分别位于腾格雷拉省、库托省、索罗邦戈省、萨马蒂吉拉省、姆本格省、孔格省和卡瓦拉省。这些清真寺的特点包括外突的木杆，顶部带有陶器或鸵鸟蛋装饰的垂直扶壁，以及锥形宣礼塔。它们展示了一种特有的建筑风格，据信该风格起源于14世纪前后马里帝国的杰内城（Djenné），该国因与北非的跨撒哈拉沙漠的盐与黄金贸易而兴盛。尤其自16世纪以来，这种风格从沙漠地区向南传播到苏丹大草原。为了适应当地更潮湿的气候，建筑高度降低，并出现了更坚固的支撑。上世纪初科特迪瓦有数百座类似风格的清真寺，仅有20座留存至今，遗产地由其中保存最为完好的8座组成。这些清真寺具有独特的苏丹风格，为西非萨瓦纳地区所特有。伴随着商人和学者从马里帝国向南扩散，将跨撒哈拉的商贸路线延伸到了森林地区，这种风格在17-19世纪间发展起来。它们是促进了伊斯兰教和伊斯兰文化发展的跨撒哈拉贸易的重要见证，体现了伊斯兰建筑和当地建筑形式的融合，其风格极为独特，经久不衰。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'تتميّز الجوامع الثمانية الصغيرة المبنيّة من الطوب في تنغريلا وكوتو وسوروبانجو وساماتيغيلا ومبنغوي وكونغ وكاوارا، بما تكتنزه من إطارات خشبية بارزة، ودعامات عمودية يعلوها الفخار أو بيض النعام، ومآذن مستدقة الأطراف. وتُجسّد هذه المساجد طرازاً معمارياً يُعتقد أنّه نشأ في القرن الرابع عشر، وتحديداً في مدينة جينيه التي كانت آنذاك جزءاً من إمبراطورية مالي، والتي ذاقت طعم الازدهار بفضل قوافل تجّار الذهب والملح العابرين الذين اعتادوا عبور الصحراء متجهين نحو شمال أفريقيا. وسرعان ما انتشر هذا الطراز المعماري جنوباً، امتداداً من المناطق الصحراوية ووصولاً إلى منطقة السافانا السودانية، وذلك اعتباراً من القرن السادس عشر بالتحديد. وأضحى يعتمد استخدام هياكل أقل ارتفاعاً ودعامات أكثر سمكاً وصلابةً كي تصمد في وجه المناخ الأكثر رطوبة في تلك المناطق. وتُعتبر هذه المساجد من الصروح التي حوفظ عليها على أفضل وجه من بين الصروح العشرين الأخرى في كوت ديفوار بعد أن كان عددها بالمئات في مطلع القرن الماضي. وتبلور الطراز السوداني المميّز للمساجد، الخاص بمنطقة السافانا غرب أفريقيا، بين القرنَين السابع عشر والتاسع عشر بفعل موجات التجار والعُلماء المتجهين جنوباً من إمبراطورية مالي. أسفرت هذه الموجات عن تمديد الطرق التجارية العابرة للصحراء نحو المناطق الحرجية. وتقف شاهداً بالغ الأهمية على التجارة العابرة للصحراء والتي يسّرت انتشار الإسلام والثقافة الإسلامية، فضلاً عن كونها تُجسّد التداخل والاندماج بين أشكال العمارة الإسلامية والمحليّة في طراز مميز لم تشبه شائبة مع مرور الزمن.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1648_0011-400-400-20211207165615.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Episcopal Complex of the Euphrasian Basilica in the Historic Centre of Poreč: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Episcopal Complex of the Euphrasian Basilica in the Historic Centre of Poreč',
  'The group of religious monuments in Porec, where Christianity was established as early as the 4th century, constitutes the most complete surviving complex of its type. The basilica, atrium, baptistery and episcopal palace are outstanding examples of religious architecture, while the basilica itself combines classical and Byzantine elements in an exceptional manner.
Description is available under license CC-BY-SA IGO 3.0',
  'Grupul de monumente religioase din Porec, unde creștinismul a fost înființat încă din secolul al IV-lea, constituie cel mai complet complex supraviețuitor de acest tip. Bazilica, atriumul, baptisteriul și palatul episcopal sunt exemple remarcabile de arhitectură religioasă, în timp ce bazilica în sine combină elementele clasice și bizantine într-o manieră excepțională.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le groupe de monuments religieux de Porec, lieux de culte de la chrétienté dès le IVe siècle, constitue l''ensemble préservé le plus complet de ce type. La basilique, l''atrium, le baptistère et le palais épiscopal sont de remarquables exemples d''architecture religieuse, tandis que la basilique elle-même associe de manière exceptionnelle des éléments classiques et byzantins.
Description is available under license CC-BY-SA IGO 3.0',
  'Lugares de culto de la cristiandad desde el siglo IV, los monumentos religiosos de Poreč forman el conjunto conservado más completo en su género. La basílica, el atrio, el baptisterio y el palacio episcopal son ejemplos notables de arquitectura religiosa. En la basílica se puede observar una asociación excepcional entre elementos clásicos y bizantinos.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Группа религиозных памятников в городе Пореч, где христианство установилось еще в IV в., является самым целостным из всех дошедших до наших дней подобных ансамблей. Базилика, атриум, баптистерий, епископский дворец – все это выдающиеся примеры религиозной архитектуры. В архитектуре базилики своеобразно сочетаются классические и византийские элементы.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '波雷奇的宗教建筑群是基督教徒于4世纪初建造的，是同类建筑中保存最完整的建筑群。长方形的大教堂、正厅、洗礼池和主教殿是宗教建筑的典型代表，同时长方形的大教堂本身还以一种特殊的方式融合了古典与拜占庭风格。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'この聖堂の起源はキリスト教がこの地に伝わった４世紀に溯るが、これは５世紀の聖堂に代えて司教エウフラシウスが６世紀に建立したもの。聖堂全体に同時代のラヴェンナの影響が強く見られる。中央アプシスと勝利門のモザイクは保存が良好である。',
  '',
  '',
  '',
  'تشكّل مجموعة النصب التاريخيّة في بوريك، دار عبادة الديانة المسيحيّة منذ القرن الرابع، المجموعة الأكثر شموليّةً المحفوظة من هذا النوع. وتشكّل البازيليك والساحة وبيت العماد والقصر الأسقفي أمثلةً استثنائيّةً عن الهندسة الدينيّة في حين أنّ البازيليك نفسها تجمع بصورة استثنائيّة بين عناصر كلاسيكيّة وبيزنطيّة.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0809_0003-400-400-20151104150413.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] The Cathedral of St James in Šibenik: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'The Cathedral of St James in Šibenik',
  'The Cathedral of St James in Šibenik (1431-1535), on the Dalmatian coast, bears witness to the considerable exchanges in the field of monumental arts between Northern Italy, Dalmatia and Tuscany in the 15th and 16th centuries. The three architects who succeeded one another in the construction of the Cathedral - Francesco di Giacomo, Georgius Mathei Dalmaticus and Niccolò di Giovanni Fiorentino - developed a structure built entirely from stone and using unique construction techniques for the vaulting and the dome of the Cathedral. The form and the decorative elements of the Cathedral, such as a remarkable frieze decorated with 71 sculptured faces of men, women, and children, also illustrate the successful fusion of Gothic and Renaissance art.
Description is available under license CC-BY-SA IGO 3.0',
  'Catedrala Sf. Iacob din Šibenik (1431-1535), de pe coasta Dalmației, mărturisește schimburile considerabile în domeniul artelor monumentale dintre Italia de Nord, Dalmația și Toscana din secolele XV și XVI. Cei trei arhitecți care s-au succedat în construcția Catedralei - Francesco di Giacomo, Georgius Mathei Dalmaticus și Niccolò di Giovanni Fiorentino - au dezvoltat o structură construită în întregime din piatră și folosind tehnici de construcție unice pentru boltirea și cupola Catedralei. Forma și elementele decorative ale Catedralei, cum ar fi o friză remarcabilă decorată cu 71 de chipuri sculptate de bărbați, femei și copii, ilustrează, de asemenea, fuziunea reușită a artei gotice și renascentiste.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'La cathédrale Saint-Jacques (1431 - 1535) à Šibenik, sur la côte dalmate, témoigne des échanges considérables qui se sont déroulés entre l''Italie du Nord, la Dalmatie et la Toscane du XVe au XVIe siècle dans les domaine des arts monumentaux. Les trois architectes qui se sont succédés sur le chantier de la cathédrale – Francesco di Giacomo, Georgius Mathei Dalmaticus et Niccolò di Giovanni Fiorentino – ont développé une structure bâtie entièrement en pierre et des techniques de constructions uniques, notamment pour les voûtes et la coupole de l''édifice. La forme et les éléments décoratifs de la cathédrale, telle cette remarquable frise ornée de soixante et onze portraits sculptés de femmes, d''hommes et d''enfants, illustrent également la fusion réussie de l''art gothique et de la Renaissance.
Description is available under license CC-BY-SA IGO 3.0',
  'Construida entre 1431 y 1535, la catedral de Šibenik, ciudad de la costa dálmata, atestigua los importantes intercambios en el ámbito de las artes monumentales que se dieron entre el norte de Italia, la Toscana y Dalmacia desde el siglo XVI hasta el XVII. Los tres arquitectos que se sucedieron en la dirección de las obras –Francesco di Giacomo, Georgius Mathei Dalmaticus y Niccolo Giovanni Fiorentino– levantaron una estructura edificada con piedra en su totalidad y elaboraron técnicas arquitectónicas excepcionales para levantar las bóvedas y la cúpula. La forma de esta catedral y su ornamentación –por ejemplo, el hermoso friso con 75 figuras esculpidas de hombres, mujeres y niños– ejemplifican una lograda fusión del arte gótico y el renacentista.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Собор Св. Иакова в Шибенике, построенный в 1431-1535 гг. на побережье Далмации, демонстрирует тесную взаимосвязь, которая существовала в XV-XVI вв. в области монументального искусства между Северной Италией, Далмацией и Тосканой. Три архитектора, сменявшие друг друга в строительстве собора, Франческо ди Джакомо, Юрай Далматинец и Никола Флорентинец, воздвигли здание целиком из камня, применяя уникальную строительную технологию при сооружении сводов и купола. Форма и декоративные элементы собора, такие как замечательный фриз с 71 скульптурным изображением лиц мужчин, женщин и детей, также иллюстрируют успешное слияние стиля готики с искусством Возрождения.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '西贝尼克的圣詹姆斯大教堂（1431年至1535年）位于达尔马提亚海岸(Dalmatian coast)，见证了15和16世纪意大利北部、达尔马提亚与托斯卡纳之间建筑艺术领域的大规模交流。弗兰切斯科迪·贾科莫(Francesco di Giacomo)、佐治鸠斯·马赛·达尔马提库斯(Georgius Mathei Dalmaticus)和尼科络·帝·乔万尼·菲奥伦提诺(Niccolò di Giovanni Fiorentino)三位建筑师相继负责大教堂的建设工作。他们发明了一种结构，完全由岩石构成，并采用了独特的建筑技巧修建大教堂的拱顶和圆顶。大教堂的形式和装饰要素，例如由71个形态各异的男人、女人、孩子脸装饰的教堂中眉，展现了哥特艺术与文艺复兴艺术的成功融合。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'クロアチア南西部、ダルマティア地方の沿岸部に位置する。聖ヤコブ大聖堂は、15～16世紀、北イタリアやトスカーナ地方、ダルティア地方における相互交流の影響や相乗効果を如実に物語っている。1431～1535年の間に大聖堂建設を次々に継承していった3名の建築家は、特異な構造や技法を開発し、この大聖堂をヨーロッパでも有数の建築物の一つとした。鐘塔や装飾類などはゴシック様式とルネサンス様式が見事に融合している。',
  '',
  '',
  '',
  'تشكّل كاتدرائيّة القديس يعقوب (1431-1535) في مدينة سيبنيك القائمة على الساحل الدالماتي شهادةً على حلقات التبادل المهمّة التي جرت بين إيطاليا الشماليّة ودالماتيا وتوسكانا بين القرنين الخامس والسادس عشر في حقل فنّ التحف. وتعاقب على العمل في الكاتدرائية المهندسون فرانشيسكو دي جياكونو وجورجيوس ماتاي دالماتيكوس ونيكولو دي جيوفاني فيورنتينو وقد أعدّوا هيكليّةً مبنيّةً بالكامل من الصخر ومن تقنيّات البناء الفريدة من نوعها، خصوصاً بالنسبة إلى قناطر المبنى وقبّته. ويُشكّل شكل الكاتدرائيّة وزينتها، على غرار ذاك الإفريز المزيّن بأحد وسبعين رسماً منحوتاً من نساء ورجال وأطفال، الاندماج الناجح بين الطراز القوطي والنهضة.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0963_0003-400-400-20151104164519.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Venetian Works of Defence between the 16th and 17th Centuries:Stato da Terra– WesternStato da Mar: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Venetian Works of Defence between the 16th and 17th Centuries:Stato da Terra– WesternStato da Mar',
  'This property consists of 6 components of defence works in Italy, Croatia and Montenegro, spanning more than 1,000 km between the Lombard region of Italy and the eastern Adriatic Coast. The fortifications throughout the Stato da Terra protected the Republic of Venice from other European powers to the northwest and those of the Stato da Mar protected the sea routes and ports in the Adriatic Sea to the Levant. They were necessary to support the expansion and authority of the Serenissima. The introduction of gunpowder led to significant shifts in military techniques and architecture that are reflected in the design of so-called alla moderna / bastioned, fortifications, which were to spread throughout Europe.
Description is available under license CC-BY-SA IGO 3.0',
  'Această proprietate constă din 6 componente ale lucrărilor de apărare din Italia, Croația și Muntenegru, care se întind pe mai mult de 1.000 km între regiunea lombardă a Italiei și coasta de est a Adriaticii. Fortificațiile din Stato da Terra au protejat Republica Veneția de alte puteri europene din nord-vest, iar cele ale Stato da Mar au protejat rutele maritime și porturile din Marea Adriatică până la Levant. Erau necesare pentru a sprijini expansiunea și autoritatea Serenissimai. Introducerea prafului de pușcă a dus la schimbări semnificative în tehnicile și arhitectura militare care se reflectă în proiectarea așa-numitelor fortificații alla moderna / bastioned, care urmau să se răspândească în toată Europa.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Ce bien consiste en 6 éléments d’ouvrage de défense situés en Italie, en Croatie et au Monténégro, qui se répartissent sur plus de 1 000 km entre la région lombarde, en Italie, et la côte orientale de l’Adriatique. Les fortifications du Stato da Terra protégeaient la République de Venise, au nord-ouest, des autres puissances européennes, et celles du Stato da Mar, les routes maritimes et les ports de la mer Adriatique vers le Levant. Elles furent nécessaires pour soutenir l’expansion et le pouvoir de la Sérénissime. L’introduction de la poudre à canon entraîna d’importants changements dans les techniques et l’architecture militaires qui se reflètent dans la conception des fortifications alla moderna (ou bastionnées) qui allaient se répandre dans toute l’Europe.
Description is available under license CC-BY-SA IGO 3.0',
  'Este sitio consta de 6 fortificaciones castrenses situadas en Croacia, Italia y Montenegro que se extienden a lo largo de más de 1.000 kilómetros, desde la Lombardía italiana hasta la costa oriental del Mar Adriático. Las fortificaciones terrestres del “Stato da Terra” defendían el flanco noroeste de la Serenísima República de Venecia, mientras que las navales del “Stato da Mar” protegían sus puertos y las rutas marítimas que iban del Adriático hasta Bizancio y el Cercano Oriente para apoyar el poderío y la expansión de la Serenísima. Con el uso innovador de la artillería en el arte de la guerra la concepción de la arquitectura y las técnicas castrenses se modificó profundamente, dando lugar a la construcción de fortificaciones “alla moderna” (esto es, con baluartes) que más tarde se extenderían por toda
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1533_0001-400-400-20230109203151.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Viñales Valley: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Viñales Valley',
  'The Viñales valley is encircled by mountains and its landscape is interspersed with dramatic rocky outcrops. Traditional techniques are still in use for agricultural production, particularly of tobacco. The quality of this cultural landscape is enhanced by the vernacular architecture of its farms and villages, where a rich multi-ethnic society survives, illustrating the cultural development of the islands of the Caribbean, and of Cuba.
Description is available under license CC-BY-SA IGO 3.0',
  'Valea Viñales este înconjurată de munți, iar peisajul său este presărat cu aflorințe stâncoase dramatice. Tehnicile tradiționale sunt încă utilizate pentru producția agricolă, în special pentru tutun. Calitatea acestui peisaj cultural este sporită de arhitectura vernaculară a fermelor și a satelor sale, unde supraviețuiește o societate multietnică bogată, ilustrând dezvoltarea culturală a insulelor din Caraibe și a Cubei.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'La vallée fertile de Viñales est encerclée de montagnes et son paysage est parsemé d''affleurements rocheux spectaculaires. Les techniques agricoles traditionnelles y sont toujours utilisées, en particulier pour la production de tabac. C''est un paysage culturel enrichi par l''architecture traditionnelle de ses fermes et villages. Une riche société pluriethnique s''y perpétue, illustrant le développement culturel des îles caraïbes et de Cuba en particulier.
Description is available under license CC-BY-SA IGO 3.0',
  'Rodeado de montañas, el fértil valle de Viñales está sembrado de espectaculares afloramientos rocosos. Sus habitantes siguen utilizando técnicas agrícolas tradicionales, en particular para la producción del tabaco. La riqueza de su paisaje cultural se ve realzada por la arquitectura tradicional de sus granjas y aldeas, donde perduran todavía las características una sociedad pluriétnica de peculiar riqueza, muy ilustrativa del desarrollo cultural de las islas caribeñas en general y de Cuba en particular.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Ландшафт долины Виньялес, окруженной со всех сторон горами, расчленен выразительными скальными образованиями. Здесь все еще используются традиционные методы сельскохозяйственного производства, особенно в табаководстве. Ценность этого культурного ландшафта увеличивается за счет традиционной народной архитектуры ферм и деревень. Сохранившееся тут многонациональное сообщество свидетельствует о богатой этнокультурной истории Кубы и других островов Карибского моря.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '比尼亚莱斯山谷群山环绕，山谷风景与裸露的岩石交相辉映。农业生产，尤其是烟草种植业中，仍然在采用传统技术。农场和村庄的当地建筑大大提升了这一文化景观的内涵，一个富裕的多民族社会在此繁衍，诠释了加勒比海岛屿和古巴的文化发展。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'キューバ西部の拠点ビナル・デル・リオから北へ約30km。周辺には多くの洞窟があり、そのひとつ、かなり大きなインディアナの洞窟にはかつて先住民がここに住み、植民地時代には奴隷の隠れ家、独立戦争時代には革命家の隠れ家であった。この渓谷における活発な経済的・社会的営みにも関わらず、数世代にわたる農民たちはその営みと自然の美に見事な調和と均衡を保ち続け、相異なる諸文化の融合をなし遂げてきた。',
  '',
  '',
  '',
  'يقع وادي فينياليس الخصب في منخفض تحيطه الجبال من كلّ من حدبٍ وصوب وفي منظر طبيعي مرصّعٍ بالنتوءات الصخريّة الأخاذة. ما زالت التقنيّات الزراعيّة التقلييّة تُستخدم في الوادي خصوصاً لصناعة التبغ. وهذا منظر طبيعي ثقافي تغنيه هندسة المزارع والقرى التقليديّة حيث يعيش فيه خالداً مجتمع متعدد الإثنيّات يجسّد التطوّر الثقافي لجزر الكاريبي وخصوصاً كوبا.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0840_0011-400-400-20151104164840.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Historic Centre of Český Krumlov: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Historic Centre of Český Krumlov',
  'Situated on the banks of the Vltava river, the town was built around a 13th-century castle with Gothic, Renaissance and Baroque elements. It is an outstanding example of a small central European medieval town whose architectural heritage has remained intact thanks to its peaceful evolution over more than five centuries.
Description is available under license CC-BY-SA IGO 3.0',
  'Situat pe malul râului Vltava, orașul a fost construit în jurul unui castel din secolul al XIII-lea cu elemente gotice, renascentiste și baroc. Este un exemplu remarcabil de mic oraș medieval central european al cărui patrimoniu arhitectural a rămas intact datorită evoluției sale pașnice de-a lungul a peste cinci secole.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Sur les rives de la Vltava, cette ville a été édifiée autour d''un château du XIIIe siècle comportant des éléments gothiques, Renaissance et baroques. C''est un exemple exceptionnel de petite ville médiévale d''Europe centrale qui s''est développée paisiblement pendant cinq siècles, conservant ainsi un patrimoine architectural intact.
Description is available under license CC-BY-SA IGO 3.0',
  'Situada a orillas del río Moldava, esta ciudad se edificó en torno a un castillo del siglo XIII que posee elementos arquitectónicos de estilo gótico, renacentista y barroco. Český Krumlov es un ejemplo de pequeña ciudad medieval de Europa Central único en su género, ya que su apacible desarrollo ha permitido conservar intacto su patrimonio por espacio de más de cinco siglos.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Город на берегах реки Влтавы возник вокруг замка XIII в., сочетающего элементы готики, Возрождения и барокко. Это выдающийся пример небольшого средневекового центральноевропейского города, архитектурное наследие которого сохранилось благодаря мирному развитию в течение пяти столетий.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '这个城镇位于瓦尔塔瓦河(Vltava river)畔，围绕一座13世纪城堡而建。这座城堡融合了哥特式、文艺复兴式以及巴洛克式风格。这是中世纪中欧小城的杰出典范，经历五个多世纪的和平发展，其建筑古迹被原封不动地保留了下来。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'شُيدت هذه المدينة على ضفاف نهر فلتافا حول قصر يرقى الى القرن الثالث عشر ويتضمن عناصر تنتمي الى الفن القوطي وفن عصر النهضة وفن الباروك. وتشكل المدينة مثالاُ فريداً للمدينة الصغيرة التي نشأت في أوروبا الوسطى في القرون الوسطى ونمت بهدوء طيلة خمسة قرون، مع حفاظها على تراث معماري لم يمس.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0617_0001-400-400-20151104165045.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Historic Centre of Telč: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Historic Centre of Telč',
  'The houses in Telc, which stands on a hilltop, were originally built of wood. After a fire in the late 14th century, the town was rebuilt in stone, surrounded by walls and further strengthened by a network of artificial ponds. The town''s Gothic castle was reconstructed in High Gothic style in the late 15th century.
Description is available under license CC-BY-SA IGO 3.0',
  'Casele din Telc, care se află pe un deal, au fost inițial construite din lemn. După un incendiu la sfârșitul secolului al XIV-lea, orașul a fost reconstruit în piatră, înconjurat de ziduri și întărit în continuare printr-o rețea de iazuri artificiale. Castelul gotic al orașului a fost reconstruit în stil înalt gotic la sfârșitul secolului al XV-lea.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'La ville est située sur une colline et ses maisons étaient à l''origine construites en bois. Après un incendie à la fin du XIVe siècle, elle a été reconstruite en pierre, entourée de murailles et renforcée par un réseau de bassins. Le château gothique de la ville a été reconstruit dans le style du premier art gothique à la fin du XVe siècle.
Description is available under license CC-BY-SA IGO 3.0',
  'Los edificios de esta ciudad, situada en lo alto de una colina, fueron construidos en madera en un principio. Después de un incendio sobrevenido a finales del siglo XIV, fue reconstruida en piedra y rodeada de murallas, reforzándose sus defensas con una red de lagunas artificiales. El castillo se reedificó a finales del siglo XV en el estilo del Alto Gótico.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Дома Тельча, расположенного на возвышении, изначально были построены из дерева. После пожара в конце XIV в. город был отстроен в камне, окружен стенами и в дальнейшем защищен цепью прудов. Готический замок города был реконструирован в стиле высокой готики в конце XV в.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '泰尔奇的建筑坐落于小山顶上，房屋最初为木结构。自14世纪末的一场大火之后，小镇以石头为材料进行了重建。整座城池有城墙环绕，另外还有人工河网增加了其防卫功能。城镇的哥特式城堡重建于15世纪晚期，采用了新哥特式风格。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'تقبع هذه المدينة على هضبة، وكانت منازلها مصنوعة أساساً من الخشب قبل أن تُستعمل الحجارة في اعادة بنائها إثر اندلاع حريق التهمها في نهاية القرن الرابع عشر. وقد أعيد تشييد قصرها القوطي حسب الفن القوطي الأول في نهاية القرن الخامس عشر.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0621_0013-400-400-20140623151316.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Pilgrimage Church of St John of Nepomuk at Zelená Hora: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Pilgrimage Church of St John of Nepomuk at Zelená Hora',
  'This pilgrimage church, built in honour of St John of Nepomuk, stands at Zelená Hora, not far from Ždár nad Sázavou in Moravia. Constructed at the beginning of the 18th century on a star-shaped plan, it is the most unusual work by the great architect Jan Blazej Santini, whose highly original style falls between neo-Gothic and Baroque.
Description is available under license CC-BY-SA IGO 3.0',
  'Această biserică de pelerinaj, construită în cinstea Sfântului Ioan de Nepomuk, se află la Zelená Hora, nu departe de Ždár nad Sázavou în Moravia. Construită la începutul secolului al XVIII-lea pe un plan în formă de stea, este cea mai neobișnuită lucrare a marelui arhitect Jan Blazej Santini, al cărui stil extrem de original se încadrează între neogotic și baroc.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'À Zelená Hora, non loin de Ždár nad Sázavou en Moravie, s’élève l’église de pèlerinage construite à la gloire de saint Jean Népomucène. Édifiée au début du XVIIIe siècle sur un plan en étoile, c’est l’œuvre la plus originale du grand architecte Jan Blazej Santini dont le style extrêmement personnel se situe entre le néo-gothique et le baroque.
Description is available under license CC-BY-SA IGO 3.0',
  'En la localidad morava de Zelená Hora, no lejos de Ždár nad Sázavou, se yergue esta iglesia de peregrinaje construida en honor de San Juan Nepomuceno. Edificado a principios del siglo XVIII con una planta en estrella de cinco puntas, este templo es la obra más original del gran arquitecto Jan Blazej Santini, cuyo estilo sumamente personal oscila entre el neogótico y el barroco.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Эта паломническая церковь, построенная в честь Св. Яна Непомуцкого, расположена на Зеленой Горе неподалеку от города Ждяр-над-Сазавоу в Моравии. Сооруженная в начале XVIII в. с планом в форме звезды, она является самой необыкновенной работой великого архитектора Джованни Сантини, чей весьма оригинальный стиль сочетает черты неоготики и барокко.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '在泽列纳霍拉(Zelena Hora)，离摩拉维亚的萨扎瓦河畔日贾尔不远，坐落着这座为纪念内波穆克圣约翰(St John of Nepomuk)而修建的朝圣教堂。教堂建于18世纪初，为星型式样，是伟大的建筑师扬·布拉泽伊·圣蒂尼(Jan Blazej Santini)大师的举世之作，设计风格承前启后，衔接了新哥特式与巴洛克式两种风格。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'ゼレナー・ホラはプラハ南東のボヘミアモラビア高地に位置する。1393年に殉教したプラハ大司教代理の聖ヤン・ネポムクゆかりのベネディクト会カトリック教会で、建築家サンティニにより、18世紀初めに建設された。聖ヤンが没した年齢53歳にちなんで、教会の中央の礼拝堂は五角形の星形ドームに三角形の窓をもつ。',
  '',
  '',
  '',
  'في زيلينا هورا وعلى مسافة ليست بعيدة عن الجبل الأخضر (جديار ناد سازافو) في مورافيا، ترتفع كنيسة حج شيدت تمجيداً للقديس يان نيبوموتسكي في القرن الثامن عشر. وتشكل هذه الكنيسة التي بنيت وفقاً لمخطط بشكل نجمة التحفة الأكثر غرابة للمهندس المعماري الشهير جيوفانني بلاسي سانتيني الذي يتأرجح أسلوبه البالغ الخصوصية بين القوطي الجديد والباروك.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0690_0003-400-400-20150518200756.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Kutná Hora: Historical Town Centre with the Church of St Barbara and the Cathedral of Our Lady at Sedlec: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Kutná Hora: Historical Town Centre with the Church of St Barbara and the Cathedral of Our Lady at Sedlec',
  'Kutná Hora developed as a result of the exploitation of the silver mines. In the 14th century it became a royal city endowed with monuments that symbolized its prosperity. The Church of St Barbara, a jewel of the late Gothic period, and the Cathedral of Our Lady at Sedlec, which was restored in line with the Baroque taste of the early 18th century, were to influence the architecture of central Europe. These masterpieces today form part of a well-preserved medieval urban fabric with some particularly fine private dwellings.
Description is available under license CC-BY-SA IGO 3.0',
  'Kutná Hora s-a dezvoltat ca urmare a exploatării minelor de argint. In secolul al XIV-lea a devenit un oras regal inzestrat cu monumente care ii simbolizau prosperitatea. Biserica Sf. Barbara, o bijuterie a perioadei gotice târzii, și Catedrala Maicii Domnului din Sedlec, care a fost restaurată în conformitate cu gustul baroc de la începutul secolului al XVIII-lea, urmau să influențeze arhitectura Europei centrale. Aceste capodopere fac astăzi parte dintr-o țesătură urbană medievală bine conservată, cu unele locuințe private deosebit de frumoase.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Née de l''exploitation de mines d''argent, Kutná Hora devint, au XIVe siècle, une ville royale dotée de monuments symbolisant sa prospérité. L''église Sainte-Barbe, joyau du gothique finissant, et la cathédrale Notre-Dame de Sedlec, restaurée dans le goût baroque au début du XVIIIe siècle, influencèrent l''architecture d''Europe centrale. Ces chefs-d''œuvre s''insèrent aujourd''hui dans un tissu urbain médiéval préservé qui frappe par la richesse de ses demeures privées.
Description is available under license CC-BY-SA IGO 3.0',
  'Kutná Hora debió su prosperidad a la explotación de las minas de plata de sus alrededores, llegando a adquirir el título de ciudad real en el siglo XIV. Entre los monumentos testigos de su riqueza figuran la iglesia de Santa Bárbara, joyel del gótico tardío, y la catedral de Nuestra Señora de Sedlec, restaurada en el estilo barroco imperante a comienzos del siglo XVIII, que ejercieron una influencia considerable en la arquitectura de Europa Central. Estas dos obras maestras se insertan en el tejido urbano admirablemente conservado de la ciudad medieval, que cuenta con algunas mansiones particulares magníficas.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Кутна-Гора развивалась благодаря эксплуатации серебряных рудников. В XIV в. она стала королевским городом, богатом памятниками, которые символизировали его процветание. Церковь Св. Варвары, «жемчужина» периода поздней готики, и собор Богоматери в Седлеце, который был перестроен в соответствии со вкусами барокко начала XVIII в., оказали влияние на архитектуру Центральной Европы. Эти шедевры сегодня являются частью хорошо охраняемой средневековой городской застройки, включающей также много замечательных частных домов.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '库特纳霍拉(Kutná Hora)是随银矿的开采而发展起来的。14世纪时，这里是一座皇城，城中的许多建筑都代表了其曾经的繁荣兴盛。圣芭芭拉教堂(Church of St Barbara)，是代表晚期哥特式建筑风格的一颗璀璨明珠，而塞得莱茨(Sedlec)的圣母玛利亚大教堂(the Cathedral of Our Lady)又保留了18世纪早期巴洛克风格，这些都影响了中欧的建筑风格。这些建筑杰作同城中一些精致的私人宅邸一起，向我们展现了一幅保存完好的中世纪都市画面。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'プラハの東約60kmにある、かつてのボヘミア王国第2の中世都市。銀の採掘で発展し、講堂や貨幣鋳造所が残っている。14世紀には記念碑的建造物が多く造られ、後期ゴシック様式の聖バルバラ協会は4世紀末から160年の年月をかけて完成し、見事な飛梁で知られる。郊外のセレドレッツには、18世紀初期のバロック様式に修復された聖母マリア大聖堂が残っている。',
  '',
  '',
  '',
  'نشأت مدينة كوتنا هورا من استغلال مناجم الفضة، وأصبحت في القرن الرابع عشر مدينة ملكية مزوّدة بأبنية ترمز الى ازدهارها. أما كنيسة سانتا باربرا التي تجسد تحفة من الطراز القوطي المزخرف وكاتدرائية السيدة في سدلك التي خضعت للترميم حسب طراز الباروك في بداية القرن الثامن عشر، فقد خلّفتا تأثيراً هاماً في هندسة أوروبا الوسطى. وتندرج هذه التحف اليوم في نسيج مدني من القرون الوسطى يذهل بغنى مساكنه الخاصة.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0732_0004-400-400-20150518200343.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Gardens and Castle at Kroměříž: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Gardens and Castle at Kroměříž',
  'Kroměříž stands on the site of an earlier ford across the River Morava, at the foot of the Chriby mountain range which dominates the central part of Moravia. The gardens and castle of Kroměříž are an exceptionally complete and well-preserved example of a European Baroque princely residence and its gardens.
Description is available under license CC-BY-SA IGO 3.0',
  'Kroměříž se află pe locul unui vad anterior peste râul Morava, la poalele lanțului muntos Chriby, care domină partea centrală a Moraviei. Grădinile și castelul din Kroměříž sunt un exemplu excepțional de complet și bine conservat de reședință princiară în stil baroc european și grădinile sale.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Kroměříž est situé sur un ancien gué traversant la Morava, au pied des monts Chriby, qui dominent le centre de la Moravie. Les jardins et le château de Kroměříž offrent un exemple exceptionnellement complet et bien conservé de résidence princière baroque européenne et de ses jardins.
Description is available under license CC-BY-SA IGO 3.0',
  'Situados junto a un antiguo vado del río Morava, al pie de la cadena montañosa de Chriby que domina el centro de Moravia, el castillo y los jardines de la ciudad de Kroměříž ofrecen un ejemplo excepcionalmente completo de residencia principesca barroca en admirable estado de conservación.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Кромериц расположен на месте существовавшей в прошлом переправы через реку Морава, у подножия горного массива Хржибы, возвышающегося над центральной частью Моравии. Сады и замок Кромерица – исключительный архитектурный ансамбль, хорошо сохранившийся образец величественной постройки в стиле европейского барокко с садами.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '克罗麦里兹坐落在横贯摩拉瓦河(the River Morava)的一处浅滩上，位于占据了摩拉维亚中心位置的赫日比山(Chriby mountain)山脚下。克罗麦里兹的花园和城堡是一处保存完好的欧洲巴洛克式的王族宅邸及花园的稀世典范。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'クロミェーシーッジは、モラヴィア中央部を走るフジビ山脈の麓を流れるモラヴァ川を渡る浅瀬に位置する。ここの庭園（｢宮殿の庭園｣と｢快楽の庭園｣）と宮殿は、ヨーロッパのバロック様式の風格ある邸宅と庭園が一体となった景観をなし、良好な状態で保存されてきたきわめて完全な例証である。特に宮殿はその原型のままで保全されており、その装飾は高度に原型をとどめている。また｢快楽の庭園｣はバロック庭園としての評価が高い。',
  '',
  '',
  '',
  'تقع كروميهرجيج على معبر قديم يجتاز منطقة مورافا أسفل جبال خرشيب المطلة على وسط مورافيا. وتجسد حدائق كروميهرجيج وقصرها مثالاً فريداً متكاملاً محفوظاً على مساكن الأمراء الأوروبية الباروكية الطراز وحدائقها.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0860_0001-400-400-20090917210244.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Holašovice Historic Village: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Holašovice Historic Village',
  'Holašovice is an exceptionally complete and well-preserved example of a traditional central European village. It has a large number of outstanding 18th- and 19th-century vernacular buildings in a style known as ''South Bohemian folk Baroque'', and preserves a ground plan dating from the Middle Ages.
Description is available under license CC-BY-SA IGO 3.0',
  'Holašovice este un exemplu excepțional de complet și bine conservat de sat tradițional central european. Are un număr mare de clădiri vernaculare remarcabile din secolele al XVIII-lea și al XIX-lea, într-un stil cunoscut sub numele de „baroc popular al Boemiei de Sud” și păstrează un plan de sol datând din Evul Mediu.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Holašovice est un exemple exceptionnellement complet et bien conservé de village traditionnel d''Europe centrale, contenant un grand nombre d''édifices vernaculaires de grande qualité des XVIIIe et XIXe siècles dans un style dit « baroque populaire du sud de la Bohême », et disposés selon un agencement datant du Moyen Âge.
Description is available under license CC-BY-SA IGO 3.0',
  'Holašovice es un ejemplo excepcionalmente completo de aldea tradicional de Europa central en admirable estado de conservación. Posee un gran número de edificios notables de los siglos XVIII y XIX construidos en el estilo autóctono denominado “barroco popular del sur de Bohemia”. La aldea ha conservado su trazado original que data de la Edad Media.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Голешовице – это исключительно целостный и хорошо сохранившийся образец традиционной центральноевропейской деревни. Здесь находится много выдающихся сельских зданий XVIII-XIX вв. в стиле, известном как "южно-чешское народное барокко", а также сохранилась средневековая планировка.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '霍拉索维采是完好保存的中欧传统村落的一个罕见标本，拥有许多18和19世纪的杰出本土建筑，采用了著名的“南波斯米亚民间巴洛克风格”(South Bohemian folk Baroque)，另外保存有一张始自中世纪的珍贵平面图。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '南ボヘミアの中心部に位置するホラショヴィツェは、中央ヨーロッパの伝統的な村落をきわめて完全に、かつ良好な状態で保存してきた良い例証である。そこには南ボヘミアのフォーク･バロックとして知られる、18～19世紀の固有の建築様式を持つ建造物が数多く保存されており、その原型は中世にまで遡ることができる。現時では120棟の民家や23の農場の付属建造物が、当時の特徴をよく示している。',
  '',
  '',
  '',
  'تشكل قرية هولاشوفيتسه نموذجاً فريداً متكاملاً ومحفوظاً للقرية التقليدية في اوروبا الوسطى، وهي تحوي عدداً كبيراً من الأبنية المحلية الرفيعة المستوى التي يعود تاريخها الى القرنين الثامن عشر والتاسع عشر وفق طراز يعرف "بالباروك الشعبي الخاص بجنوب بوهيميا" والمبنية حسب تنظيم يعود الى القرون الوسطى.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0861_0001-400-400-20151104165719.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Litomyšl Castle: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Litomyšl Castle',
  'Litomyšl Castle was originally a Renaissance arcade-castle of the type first developed in Italy and then adopted and greatly developed in central Europe in the 16th century. Its design and decoration are particularly fine, including the later High-Baroque features added in the 18th century. It preserves intact the range of ancillary buildings associated with an aristocratic residence of this type.
Description is available under license CC-BY-SA IGO 3.0',
  'Castelul Litomyšl a fost inițial un castel-arcade renascentist de tipul dezvoltat mai întâi în Italia și apoi adoptat și dezvoltat foarte mult în Europa centrală în secolul al XVI-lea. Designul și decorarea sa sunt deosebit de bune, inclusiv caracteristicile de mai târziu în stil baroc adăugate în secolul al XVIII-lea. Păstrează intactă gama de clădiri auxiliare asociate unei reședințe aristocratice de acest tip.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le château de Litomyšl est à l''origine un château à arcades Renaissance, style qui a vu le jour en Italie et qui fut adopté et largement développé en Europe centrale au XVIe siècle. Sa conception et sa décoration sont de haute qualité, y compris les ajouts de style baroque-classique tardif du XVIIIe siècle. Le château a conservé la totalité des bâtiments annexes qui sont associés à ce type de demeure aristocratique.
Description is available under license CC-BY-SA IGO 3.0',
  'El palacio de Litomyšl es un edificio con arquería inspirado en el estilo renacentista italiano, que fue adoptado y ampliamente desarrollado en Europa Central durante el siglo XVI. La magnificencia de su diseño y ornamentación es también característica de los elementos de estilo barroco-clásico tardío que fueron añadidos en el siglo XVIII. El castillo ha conservado la totalidad de los edificios anejos tradicionales en este tipo de mansiones aristocráticas.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Замок в Литомишле был первоначально создан как «замок с аркадами». Эта модель получила развитие сначала в Италии, а затем, в XVI в., была принята и широко использовалась в Центральной Европе. Особенно прекрасны добавленные в XVIII в. архитектурные решения и декоративное оформление, включая появившиеся позднее элементы высокого барокко. Замок сохранил в целости ряд служебных зданий, свойственных аристократической резиденции такого типа.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '利托米什尔城堡承袭了文艺复兴时期拱廊式城堡的建筑风格。这种最早成形于意大利的建筑风格，在16世纪的中欧被广泛采纳并得以充分发展。其图案和装潢，包括18世纪增添的鼎盛巴洛克式晚期的装饰物，都堪称极品。这座拱廊风貌的贵族宅邸及其附属建筑都原封不动地保留了下来。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'リトミシュルは、チェコ東北部、ボヘミア地方の都市。リトミシュル城は、16世紀にボヘミアやモラヴィアをはじめ中央ヨーロッパに広まったルネサンス様式建築のなかでも、他に比類のない威容を誇る柱廊付きの城郭である。その設計と装飾はきわめて高度なものであり、後に18世紀のバロック様式の特徴も付け加えられた。またこの種の貴族の館に付随する一連の建築物も原形のまま残されている。',
  '',
  '',
  '',
  'كان قصر ليتوميشل مزوداً بقناطر يعود طرازها الى عصر النهضة وهو طراز أبصر النور في ايطاليا واعتمد في اوروبا الوسطى حيث شهد تطوراً كبيراً في القرن السادس عشر. ويتميز تصميمه وزينته بمستوى رفيع بما في ذلك اضافات الطراز الباروكي الكلاسيكي الأخير في القرن الثامن عشر. وقد حافظ القصر على مجمل المباني الملحقة به والمنسجمة مع هذا النمط من المنازل الارستقراطية.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0901_0001-400-400-20090917164544.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Jewish Quarter and St Procopius' Basilica in Třebíč: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Jewish Quarter and St Procopius'' Basilica in Třebíč',
  'The ensemble of the Jewish Quarter, the old Jewish cemetery and the Basilica of St Procopius in Třebíč are reminders of the co-existence of Jewish and Christian cultures from the Middle Ages to the 20th century. The Jewish Quarter bears outstanding testimony to the different aspects of the life of this community. St Procopius'' Basilica, built as part of the Benedictine monastery in the early 13th century, is a remarkable example of the influence of Western European architectural heritage in this region.
Description is available under license CC-BY-SA IGO 3.0',
  'Ansamblul Cartierului Evreiesc, vechiul cimitir evreiesc și Bazilica Sfântul Procopie din Třebíč sunt amintiri ale coexistenței culturilor evreiești și creștine din Evul Mediu până în secolul al XX-lea. Cartierul Evreiesc aduce o mărturie remarcabilă asupra diferitelor aspecte ale vieții acestei comunități. Bazilica Sf. Procopie, construită ca parte a mănăstirii benedictine la începutul secolului al XIII-lea, este un exemplu remarcabil al influenței moștenirii arhitecturale vest-europene în această regiune.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'L’ensemble du quartier juif, du vieux cimetière juif et de la basilique Saint-Procope de Třebíč rappelle la coexistence des cultures chrétienne et juive du Moyen Âge au XXe  siècle. Le quartier juif est un témoignage exceptionnel des différents aspects de la vie de la communauté qui y résidait. La basilique Saint-Procope, construite à l’intérieur d’un monastère bénédictin au début du XIIIe  siècle, est un témoignage exceptionnel de l’influence du patrimoine architectural de l’Europe de l’Ouest dans cette région.
Description is available under license CC-BY-SA IGO 3.0',
  'El conjunto formado por el barrio y cementerio judíos de Třebíč, junto con la basílica de San Procopio, trae a la memoria la coexistencia entre las culturas judía y cristiana desde la Edad Media hasta el siglo XX. El barrio judío constituye un testimonio excepcional de los distintos aspectos de la vida de la comunidad que lo habitaba. Por otra parte, la basílica de San Procopio, edificada dentro de un monasterio benedictino de principios del siglo XIII, constituye un ejemplo notable de la influencia de la arquitectura de Europa Occidental en esta región.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Еврейский район, старое еврейское кладбище и базилика Св. Прокопа в Тршебиче напоминают о сосуществовании еврейской и христианской культур, начиная со Средних веков и до ХХ в. Еврейский район предоставляет уникальные свидетельства о различных аспектах жизни этой общины. Базилика Св. Прокопа, построенная как часть бенедиктинского монастыря в начале XIII в., является замечательным примером влияния западноевропейского архитектурного наследия в этом регионе.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '这里的犹太区、古老的犹太墓地和圣普罗皮乌斯大教堂表明，从中世纪到20世纪犹太教与基督教文化一直共生共存。犹太区是这一社区生活各个方面的显著证明。作为13世纪早期修道院的一部分，圣普罗科皮乌斯教堂是西欧建筑传统影响这一地区的一个典型例子。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'トジェビーチはチェコ西端部、スロバキアとオーストリア国境に近い小都市。この地にあるユダヤ人街、古いユダヤ墓地、そしてプロコピウス聖堂の3つが遺産の主要部分を構成する。いずれも中世から20世紀にかけてのユダヤ教文化とキリスト教文化の共存を象徴している。特にユダヤ人街は地域共同体のさまざまな様相や機能を明瞭に示し、13世紀初期にベネディクト修道会の一部として建立されたプロコピウス聖堂は、西欧建築の影響が明らかである。',
  '',
  '',
  '',
  'تعيد مجموعة الحي اليهودي والمقبرة اليهودية القديمة وبازيليك القديس بروكوبيوس ذكرى التعايش بين الثقافتين المسيحية واليهودية من القرون الوسطى الى القرن العشرين. ويشكل الحي اليهودي شاهداً فريداً على مختلف نواحي حياة المجتمع الذي كان يقطنه. أما بازيليك القديس بروكوبيوس التي شيدت داخل جدران دير بينيديكتي في مطلع القرن الثالث عشر فهي شاهد رائع على التأثير الذي خلّفه التراث المعماري الخاص بأوروبا الغربية في هذه المنطقة.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1078_0001-400-400-20090917205808.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Erzgebirge/Krušnohoří Mining Region: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Erzgebirge/Krušnohoří Mining Region',
  'Erzgebirge/Krušnohoří (Ore Mountains) spans a region in south-eastern Germany (Saxony) and north-western Czechia, which contains a wealth of several metals exploited through mining from the Middle Ages onwards. The region became the most important source of silver ore in Europe from 1460 to 1560. Mining was the trigger for technological and scientific innovations transferred worldwide. Tin was historically the second metal to be extracted and processed at the site. At the end of the 19th century, the region became a major global producer of uranium. The cultural landscape of the Ore Mountains has been deeply shaped by 800 years of almost continuous mining, from the 12th to the 20th century, with mining, pioneering water management systems, innovative mineral processing and smelting sites, and mining cities.
Description is available under license CC-BY-SA IGO 3.0',
  'Erzgebirge/Krušnohoří (Munții Metalici) se întinde pe o regiune din sud-estul Germaniei (Saxonia) și nord-vestul Cehiei, care conține o bogăție de mai multe metale exploatate prin minerit din Evul Mediu încoace. Regiunea a devenit cea mai importantă sursă de minereu de argint din Europa între 1460 și 1560. Mineritul a fost declanșatorul inovațiilor tehnologice și științifice transferate în întreaga lume. Din punct de vedere istoric, staniul a fost al doilea metal care a fost extras și prelucrat la fața locului. La sfârșitul secolului al XIX-lea, regiunea a devenit un mare producător mondial de uraniu. Peisajul cultural al Munților Metaliferi a fost profund modelat de 800 de ani de minerit aproape continuu, din secolul al XII-lea până în secolul al XX-lea, cu minerit, sisteme inovatoare de gestionare a apei, situri inovatoare de prelucrare și topire a mineralelor și orașe miniere.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le bien est situé dans le sud-est de l''Allemagne (Saxe) et le nord-ouest de la Tchéquie. Erzgebirge/Krušnohoří (monts Métallifères) contient une variété de métaux qui donnèrent lieu à une extraction minière dès le Moyen Âge. La région devint la plus importante source de minerai d''argent en Europe de 1460 à 1560. Le secteur minier fut à l''origine d''innovations technologiques scientifiques transférées dans le monde entier. L''étain fut historiquement le deuxième métal à avoir été extrait et traité sur ce site. A la fin du XIXe siècle, la région devint un important producteur mondial d''uranium. Mines, systèmes pionniers de gestion de l''eau, sites de traitement des minerais et de fonderie innovants, villes minières : le paysage culturel des monts Métallifères a été profondément façonné par 800 ans d''exploitation minière presque continue, du XIIe au XXe siècle.
Description is available under license CC-BY-SA IGO 3.0',
  'La región minera de Erzgebirge/Krušnohoří (los Montes Metalíferos) se halla al sudeste de Alemania, en Sajonia, y al nordeste de Chequia. Esta cadena montañosa transfronteriza posee una gran variedad de metales que se empezaron a extraer desde la Edad Media. Entre 1460 y 1560 se explotó en ella el yacimiento de plata más importante de Europa, lo que trajo consigo toda una serie de hallazgos tecnológicos. El segundo mineral importante extraído y procesado en este sitio fue el estaño. A finales del siglo XIX, la región fue una importante productora de uranio a nivel mundial. La explotación prácticamente ininterrumpida de los Montes Metalíferos durante ochocientos años, desde el siglo XII hasta el XX, ha dejado una profunda huella en el paisaje cultural de la región con la presencia de minas y ciudades mineras, así como de fundiciones, instalaciones innovadoras para el tratamiento de minerales y sistemas punteros de gestión de los recursos hídricos.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Этот горнодобывающий регион расположен на юго-востоке Германии (Саксония), и северо-западе Чешской Республики. Erzgebirge/Krušné hory (Рудные горы) являются месторождением различных металлов, добыча которых берет свое начало со времен Средневековья. С 1460 по 1560 годы регион был крупнейшим местом добычи серебряной руды и источником технологических инноваций в Европе. Исторически вторым по значимости полезным ископаемым, добываемым в этой области, было олово. В конце XIX века этот регион стал крупным мировым производителем урана. Культурный ландшафт Рудных гор сформировался под влиянием 800-летней непрерывной добычи полезных ископаемых (с XII по XX вв.) и характеризуется наличием шахт, шахтерских городов, инновационных участков по переработке и плавке руды, а также новаторских систем управления водными ресурсами.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '该矿区位于德国东南部（萨克森）和捷克西北部。厄尔士/克鲁什内山脉又称“金属山脉”，蕴藏着各种金属，当地的采矿活动可追溯至中世纪。在1460-1560年间，这里是欧洲最大的银矿开采地，触发了当时的技术革新。锡是在该矿区历史上第二种被提取和加工的金属。19世纪末，厄尔士/克鲁什内山脉矿区成为世界上重要的铀出产地。800年（12-20世纪）几乎从未间断的采矿活动在这里留下了矿山、先进的水利管理系统、创新的矿物加工和冶炼场地、矿区市镇等遗产，深刻影响了金属山脉的文化景观。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'تقع منطقة التعدين جنوب شرق ألمانيا (ساكسونيا) وشمال غرب تشيكيا. تحتوي سلسلة جبال الخام على مجموعة متنوعة من المعادن التي أدت إلى ظهور التعدين منذ العصور الوسطى. وسرعان ما أصبحت المنطقة في أواخر القرن التاسع عشر أكبر مصدر لمادة الفضة الخام في أوروبا بين عامي 1460 و1560. وساهمت في التوصل إلى العديد من الابتكارات التكنولوجية. وكان القصدير تاريخياً ثاني المعادن التي استُخرجت من هذا الموقع وخضعت للمعالجة. وأصبحت المنطقة في أواخر القرن التاسع عشر أحد المصادر الرئيسية العالمية لإنتاج اليورانيوم على مستوى العالم. وقد تشكّل هذا المشهد الثقافي على مدار 800عام من أنشطة التعدين المستمرة من القرن الثاني عشر إلى القرن العشرين، بما فيه من مناجم، والنظم الرائدة لإدارة المياه، ومواقع ابتارية لمعالجة الخامات وصهرها، ومدن التعدين.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1478_0014-400-400-20221005171129.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Landscape for Breeding and Training of Ceremonial Carriage Horses at Kladruby nad Labem: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Landscape for Breeding and Training of Ceremonial Carriage Horses at Kladruby nad Labem',
  'The property is situated on the Elbe (Labe) River flood plain where there is sandy soil, ox bow lakes and the relic of a riparian forest. The structure and functional use of plots of land (pastures, meadows, forests, fields, park), network of paths, avenues, trees in regimented lines and arranged clusters as well as the solitary trees, the network of watercourses, ensembles of buildings in the farmsteads and the overall composition including functional relations and links between these components - all this fully serves the needs of breeding and training of the Baroque draught horses of the Kladruber breed which were used during the ceremonies at the Habsburg Imperial Court. The composition of the landscape is the evidence of the intentional artistic approach to the landscape. The property is a rare example of the synthesis of two types of cultural landscape - living and organically developing landscape where its key function dominates and the manmade landscape intentionally designed and created using the principles of the French and English landscape architecture which is an outstanding example of the specialised decorative farm - ferme ornée. The Imperial Stud Farm was founded in 1579 and its landscape has been used for this purpose since then.
Description is available under license CC-BY-SA IGO 3.0',
  'Proprietatea este situată pe câmpia inundabilă a râului Elba (Labe), unde există sol nisipos, lacuri cu boi și relicva unei păduri riverane. Structura și utilizarea funcțională a terenurilor (pășuni, pajiști, păduri, câmpuri, parc), rețeaua de poteci, alei, copaci în linii regimentate și clustere aranjate, precum și arbori solitari, rețeaua de cursuri de apă, ansambluri de clădiri din ferme și compoziția generală, inclusiv relațiile funcționale și legăturile dintre aceste componente - toate acestea servesc la antrenamentul cailor crescuți. Rasa Kladruber care a fost folosită în timpul ceremoniilor de la Curtea Imperială Habsburgică. Compoziția peisajului este dovada abordării artistice intenționate a peisajului. Proprietatea este un exemplu rar al sintezei a două tipuri de peisaj cultural - peisaj viu și peisaj în curs de dezvoltare organic, unde funcția sa cheie domină și peisajul artificial conceput și creat în mod intenționat folosind principiile arhitecturii peisagistice franceze și engleze, care este un exemplu remarcabil al fermei decorative specializate - ferme ornée. Herghelia Imperială a fost fondată în 1579 și peisajul său a fost folosit în acest scop de atunci.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le bien est situé sur la plaine d''inondation du fleuve Elbe (Labe) où on trouve des sols sablonneux, des bras morts et des restes de la forêt riveraine. La structure et l''utilisation fonctionnelle des parcelles de terrain (pâturages, prés, forêts, champs, parc), du réseau de sentiers, des chemins, des rangées et des bouquets d''arbres ainsi que d''arbres solitaires, des réseaux de cours d''eau, des ensembles de bâtiments de fermes et la composition globale qui consiste à lier fonctionnellement ces éléments - tout cela répond pleinement aux besoins de l''élevage et de l''entraînement des chevaux de trait baroques de Kladruby qui ont été utilisés pendant des cérémonies à la cour impériale de Habsbourg. La composition du paysage témoigne de l''approche artistique intentionnelle de paysage. Le bien est un exemple rare de la synthèse de deux types de cultures du paysage - le paysage vivant en évolution organique respectant sa fonction clé et le paysage façonné par l''homme, conçu et créé intentionnellement conformément aux principes des architectures paysagères française et anglaise qui sont un exemple éminent de ferme décorative spécialisée – ferme ornée. Le haras impérial a été fondé en 1579 et son paysage a depuis servi à cette fin.
Description is available under license CC-BY-SA IGO 3.0',
  'Situado en la planicie del Elba, en los llanos arenosos de la comarca de Střední Polabí, este sitio abarca toda una serie de campos y pastos cercados, así como una zona boscosa y un conjunto de edificios concebido para la crianza y doma de los kladruber, caballos de tiro utilizados en las ceremonias de la corte imperial de los Habsburgo. En este lugar se creó un acaballadero imperial en 1579, una época en la que el caballo desempeñaba una función esencial no sólo en la agricultura y los transportes, sino también en los ejércitos y las ceremonias protocolarias de la aristocracia. Esta institución de cría caballar es una de las más importantes de Europa y sus actividades han perdurado hasta nuestros días.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Этот объект, расположенный в районе Средний Полаби на песчаной равнине реки Эльба, включает поля, огороженные пастбища, лесные массивы, а также здания, спроектированные с целью разведения и дрессуры лошадей кладрубской тяжелоупряжной породы, используемых в церемониях при императорском дворе Габсбургов. Императорский конный завод был основан в 1579 году, во времена, когда лошадь была основным транспортным средством, важным атрибутом аристократии, а также играла ключевую роль в сельском хозяйстве и военном деле. С тех пор завод является одним из ведущих учреждений по разведению лошадей в Европе.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '该遗产地位于易北河平原，是Střední Polabí地区的一处平坦沙地，内有田野、围栏牧场、森林及建筑物，其设计用途为驯养克拉德鲁伯马（哈布斯堡王室的仪式马车用马的一种）。王室种马场于1579建成并沿用至今，是欧洲最重要的马匹繁育场之一。在马场的发展时期，马匹不仅在运输、农业、军事等领域发挥着巨大的作用，也是贵族身份的象征。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يوجد هذا الموقع في سهل جبال الألب، في منطقة ستريتني بولابي، ويتكون من أرض رملية مسطحة تضم عدداً من الحقول والمراعي المسيّجة، ومنطقة من الغابات والمباني، المخصصة في المقام الأول لاستخدامها في تربية الخيول وتدريبها، ولا سيما خيول جر العربات خلال احتفالات البلاط الإمبراطوري لعائلة هابسبورغ المالكة. وقد شُيّد أوّل اسطبل إمبراطوري في عام 1579 ولا يزال قائماً حتى يومنا هذا. ويعد هذا الموقع واحداً من أهم مؤسسات تربية الخيول في أوروبا، وقد تم تطويرها في وقت كان للخيول فيه مكانة لأعمال النقل والزراعة والدعم العسكري وتمثيل الأرستقراطية.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1589_0006-400-400-20180613111159.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Žatec and the Landscape of Saaz Hops: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Žatec and the Landscape of Saaz Hops',
  'This cultural landscape has been shaped for centuries by the living tradition of cultivating and trading the world’s most renowned hop variety, used in beer production around the globe. The property includes particularly fertile hop fields near the river Ohře that have been farmed continuously for hundreds of years, as well as historic villages and buildings used for processing hops. The urban component of the property is represented by the medieval centre of Žatec with its southern extension, known as the “Prague Suburb” (Pražské předměstí) including numerous specific 19th to 20th-century industrial structures. Together, these illustrate the evolution of the agro-industrial processes and socio-economic system of growing, drying, certifying, and trading hops from the Late Middle Ages to the present.
Description is available under license CC-BY-SA IGO 3.0',
  'Acest peisaj cultural a fost modelat de secole de tradiția vie de cultivare și comercializare a celui mai renumit soi de hamei din lume, folosit în producția de bere de pe tot globul. Proprietatea include câmpuri de hamei deosebit de fertile din apropierea râului Ohře, care au fost cultivate continuu de sute de ani, precum și sate și clădiri istorice folosite pentru prelucrarea hameiului. Componenta urbană a proprietății este reprezentată de centrul medieval Žatec, cu extinderea sa sudică, cunoscută sub numele de „suburbia Praga” (Pražské předměstí), incluzând numeroase structuri industriale specifice din secolele XIX-XX. Împreună, acestea ilustrează evoluția proceselor agroindustriale și a sistemului socio-economic de cultivare, uscare, certificare și comercializare a hameiului din Evul Mediu târziu până în prezent.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Ce paysage culturel a été façonné par des siècles de tradition vivante de la culture et du commerce de la variété de houblon la plus réputée au monde, utilisée à l’échelle planétaire dans la production de la bière. Ce bien comprend des champs de houblon particulièrement fertiles près de la rivière Ohře qui sont cultivés sans interruption depuis des siècles, ainsi que des villages historiques et des bâtiments liés à la transformation du houblon. L´élément urbain du bien est representé par le centre médiéval de Žatec et son extension sud, dénommée « faubourg pragois » (Pražské předměstí) qui comprend de nombreuses structures industrielles spécifiques des XIXe et XXe siècles. L’ensemble illustre le développement des processus agro-industriels et du système socio-économique de la culture, du séchage, de la certification et du commerce du houblon, de la fin du Moyen Âge à nos jours.
Description is available under license CC-BY-SA IGO 3.0',
  'Este paisaje cultural ha sido moldeado durante siglos por la tradición viva de cultivar y comercializar la variedad de lúpulo más renombrada del mundo, utilizada en la producción de cerveza en todo el planeta. El sitio incluye campos de lúpulo particularmente fértiles cerca del río Ohře que se han cultivado sin interrupción durante cientos de años, así como pueblos históricos y edificios utilizados para procesar el lúpulo. Los elementos urbanos del bien incluyen el centro medieval de Žatec y su extensión industrial de los siglos XIX a XX, conocida como el “suburbio de Praga” (Pražské předměstí). El conjunto ilustra la evolución de los procesos agroindustriales y del sistema socioeconómico del cultivo, secado, certificación y comercio del lúpulo desde la Baja Edad Media hasta la actualidad.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Этот культурный ландшафт на протяжении многих веков формировался благодаря сохранившимся традициям выращивания и торговли самым известным в мире сортом хмеля, используемым для производства пива во всем мире. В состав территории входят особенно плодородные хмелевые поля у реки Огрже, которые непрерывно возделываются на протяжении сотен лет, а также исторические деревни и здания, используемые для переработки хмеля. К городским элементам территории относятся средневековый центр города Жатец и его промышленная часть XIX-XX веков, известная как «Пражское предместье» (Pražské předměstí). В совокупности они иллюстрируют эволюцию агропромышленных процессов и социально-экономической системы выращивания, сушки, сертификации и торговли хмелем с эпохи позднего средневековья до наших дней.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '这里有着世界最知名的、用于全球啤酒生产的啤酒花品种，其种植和交易历经数个世纪，已经发展成为这里的活态传统，进而塑造了当地的文化景观。该遗产包括奥赫热河附近极为肥沃、得到数百年持续耕种的啤酒花田，以及从事啤酒花加工的古老村庄及其建筑物。城市元素则包括扎泰茨的中世纪中心，和该城于19-20世纪扩展的工业新区。新区被称作“布拉格郊区”。以上区域共同展示了啤酒花的种植、干燥、认证和交易方面的农工进程和社会经济体系从中世纪晚期至今的演变。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'أخذ هذا المنظر الطبيعي الثقافي شكله على مرِّ القرون من التقاليد الحية لزراعة أشهر أنواع العالم من نبات الجنجل والتجارة بها، حيث يستخدم هذا النبات في صناعة مشروب البيرة في شتى أنحاء العالم. ويضم هذا الموقع حقولاً لزراعة نبات الجنجل وهي تمتاز بخصوبتها الفريدة وتقع قرب نهر أوهجه، وتُزرع هذه الحقول منذ مئات السنين، ويوجد في الموقع أيضاً قرى تاريخية ومبانٍ استُخدمت في تصنيع الجنجل. ويتألف الموقع من عناصر حضرية، من بينها مركز مدينة جاتتس من العصور الوسطى وتوسعها الصناعي الذي بني في القرنين التاسع عشر والعشرين والذي يُعرف باسم ضاحية براغ "Pražské předměstí". ويبين هذا الموقع بكل أركانه تطور العمليات الزراعية الصناعية والنظام الاجتماعي والاقتصادي لزراعة نبات الجنجل وتجفيفه وتوثيقه والتجارة به منذ أواخر العصور الوسطى وحتى وقتنا الحاضر.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1558_0002-400-400-20231020095348.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Mount Kumgang – Diamond Mountain from the Sea: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Mount Kumgang – Diamond Mountain from the Sea',
  'Mount Kumgang is a long-celebrated place of exceptional natural beauty, renowned for its near-white granite peaks, deep valleys, waterfalls, and pristine ecosystems, rising to nearly 1,600 metres. The mountain’s dramatic impact is enhanced through constantly changing weather patterns of mists, rain, sunshine and clouds. This sacred mountain is a key site of mountain Buddhism, with traditions dating back to the 5th century. This cultural landscape is home to ancient hermitages, temples, stupas, and stone carvings, many located in the Outer and Inner Kumgang Area. Three temples remain active today and bear exceptional testimony to centuries of Buddhist practice, with tangible and intangible heritage deeply intertwined with the landscape.
Description is available under license CC-BY-SA IGO 3.0',
  'Muntele Kumgang este un loc celebrat de mult timp de o frumusețe naturală excepțională, renumit pentru vârfurile sale de granit aproape alb, văile adânci, cascadele și ecosistemele curate, care se ridică la aproape 1.600 de metri. Impactul dramatic al muntelui este sporit prin schimbarea constantă a modelelor meteo de ceață, ploaie, soare și nori. Acest munte sacru este un loc cheie al budismului montan, cu tradiții care datează din secolul al V-lea. Acest peisaj cultural găzduiește schituri antice, temple, stupa și sculpturi în piatră, multe situate în zona exterioară și interioară Kumgang. Trei temple rămân active astăzi și oferă mărturie excepțională a secolelor de practică budistă, cu moștenirea materială și imaterială profund împletită cu peisajul.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le Mont Kumgang est un lieu célébré de longue date pour sa beauté naturelle exceptionnelle, ses paysages de sommets de granite presque blanc, de vallées plongeantes, de chutes d’eau et d’écosystèmes intacts s''élevant à près de 1 600 mètres au-dessus du niveau de la mer. L’impact spectaculaire de la montagne est renforcé par les changements constants des conditions météorologiques, caractérisées par la brume, la pluie, le soleil et les nuages. Cette montagne sacrée constitue un témoignage des traditions du bouddhisme de montagne, du Ve siècle de notre ère à nos jours. Ce paysage culturel abrite des temples, les ermitages, des stupas et des gravures sur pierre, pour la plupart situés dans les zones du Kumgang extérieur et intérieur. Trois temples sont toujours en activité actuellement et constituent un témoignage exceptionnel de siècles des pratiques bouddhistes, dont le patrimoine matériel et immatériel est profondément ancré dans le paysage.
Description is available under license CC-BY-SA IGO 3.0',
  'El monte Kumgang, de cerca de 1600 metros de altitud, es un lugar de una excepcional belleza natural, famoso por sus picos de granito casi blanco, valles profundos, cascadas y ecosistemas prístinos. El impacto dramático de la montaña se ve acentuado por patrones climáticos muy cambiantes de nieblas, lluvia, sol y nubes. Esta montaña sagrada es un sitio clave del budismo de montaña con tradiciones que datan del siglo V. Este paisaje cultural alberga antiguas ermitas, templos, estupas y tallas de piedra, en su mayoría ubicados en las zonas exterior e interior de Kumgang. Tres templos permanecen activos hoy en día y ofrecen un testimonio excepcional de siglos de práctica budista con un patrimonio tangible e intangible profundamente entrelazado con el paisaje.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Гора Кымгансан издавна славится своей исключительной природной красотой: практически белыми гранитными вершинами, глубокими ущельями, водопадами и нетронутыми экосистемами на высоте до 1600 метров. Впечатление, которое производит гора, усиливается из-за постоянно сменяющих друг друга погодных явлений: туманов, дождей, солнечного света и облачности. Эта священная гора является важным местом для горного буддизма, традиции которого восходят к V веку. Культурный ландшафт горы включает древние скиты, храмы, ступы и каменные резные изображения, многие из которых расположены во Внешнем и Внутреннем Кымгансане. Три храма остаются действующими по сей день и являются исключительным свидетельством многовековой буддийской практики. Здесь материальное и нематериальное наследие тесно переплетены с природной средой.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '金刚山历来因得天独厚的自然风光而为人称颂，其主峰海拔逾1600米。接近白色的花岗岩峰、深谷、飞瀑和原始生态系统久负盛名，雾、雨、晴、云变换不定的天气使山体景观更显磅礴。金刚山是山岳佛教的的重要圣地，相关历史可追溯至公元5世纪，留下诸多古代隐修所、寺庙、佛塔、石刻，多分布于外金刚、内金刚区域。3座至今仍在使用的寺庙，见证了几百年来的佛教实践，及其与当地景观深度融合的物质和非物质文化遗产。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'اكتسب جبل كومغانغ شهرته منذ فترة طويلة بفضل جماله الطبيعي الاستثنائي، وهو معروف بقممه الغرانيتية شبه البيضاء وأوديته السحيقة وشلالاته ونظمه الإيكولوجية البكر، ويبلغ ارتفاعه 1600 متر. ويتعزز المنظر المذهل لهذا الجبل بفضل أنماط الطقس دائمة التغير من ضباب ومطر وغيوم وشمس مشرقة. ويعتبر هذا الجبل المقدس موقعاً رئيسياً بالنسبة إلى الديانة البوذية المنتشرة عليه، حيث تعود تقاليدها إلى القرن الخامس الميلادي. ويضمُّ هذا المنظر الثقافي صوامع قديمة للرهبان ومعابد وأضرحة بوذية مقببة (stupa) وحجارة منحوتة، ويقع العديد منها في المنطقتين الداخلية والخارجية من جبل كومغانغ. ولا يزال هناك ثلاثة معابد تُمارَس فيها طقوس العبادة حتى يومنا هذا، وهي تقف شاهدة استثنائية على قرون من الطقوس البوذية، حيث يتداخل التراث المادي وغير المادي مع المنظر الطبيعي.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1642_0002-400-400-20250616142830.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Moravian Church Settlements: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Moravian Church Settlements',
  'This transnational serial property comprises four congregational settlements in four countries representing the transnational scope and consistency of the international Moravian community as a global network of the Moravian Church: Christiansfeld (Denmark), Herrnhut (Germany), Gracehill (United Kingdom of Great Britain and Northern Ireland) and Bethlehem (United States of America). These settlements were established according to overarching planning principles that reflected the ideals of the Moravian Church, as expressed in their plans and democratic organisation. Each architectural ensemble bears witness to the Moravian Church’s vision of a unified, coherent urban design, inspired by the concept of an “ideal city” developed by the Church during its formative phase in the 18th and beginning of the 19th enturies. Distinctive Moravian buildings include a particular type of Gemeinhaus (congregation building), church, choir houses, as well as a nearby God’s Acre (cemetery). Each settlement has its own architectural character based on an original Moravian Church Civic Baroque style but adapted to local conditions. Present today in each component part is an active congregation whose continuation of traditions forms a living Moravian heritage.
Description is available under license CC-BY-SA IGO 3.0',
  'Această proprietate în serie transnațională cuprinde patru așezări congregaționale din patru țări, reprezentând sfera transnațională și consistența comunității internaționale Moravie ca o rețea globală a Bisericii Morave: Christiansfeld (Danemarca), Herrnhut (Germania), Gracehill (Regatul Unit al Marii Britanii și Irlandei de Nord) și Bethlehem (Statele Unite ale Americii). Aceste așezări au fost înființate conform principiilor generale de planificare care reflectau idealurile Bisericii Morave, așa cum sunt exprimate în planurile și organizarea lor democratică. Fiecare ansamblu arhitectural depune mărturie pentru viziunea Bisericii Moravei despre un design urban unitar, coerent, inspirat de conceptul de „oraș ideal” dezvoltat de Biserică în timpul fazei sale formative în secolul al XVIII-lea și începutul secolului al XIX-lea. Clădirile distinctive din Moravia includ un anumit tip de Gemeinhaus (cladirea congregației), biserica, corurile, precum și un cimitir al lui Dumnezeu din apropiere. Fiecare așezare are propriul său caracter arhitectural bazat pe un stil baroc civic original al Bisericii Morave, dar adaptat condițiilor locale. Prezentă astăzi în fiecare parte componentă este o congregație activă a cărei continuare a tradițiilor formează o moștenire vie din Moravia.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Ce bien en série transnational comprend quatre établissements de congrégation dans quatre pays représentant la portée transnationale et la cohérence de la communauté morave internationale en tant que réseau mondial de l''Église morave : Christiansfeld (Danemark), Herrnhut (Allemagne), Gracehill (Royaume-Uni de Grande-Bretagne et d''Irlande du Nord) et Bethléem (États-Unis d''Amérique). Ces colonies ont été établies selon des principes de planification globaux qui reflétaient les idéaux de l''Église morave, tels qu''ils s''exprimaient dans leurs plans et leur organisation démocratique. Chaque ensemble architectural témoigne de la vision de l''Église morave d''une conception urbaine unifiée et cohérente, inspirée par le concept de « ville idéale » développé par l''Église durant sa phase de formation au XVIIIe siècle et au début du XIXe siècle. Les bâtiments moraves distinctifs comprennent un type particulier de Gemeinhaus (bâtiment de congrégation), d''église, de chorale, ainsi qu''un God''s Acre (cimetière) situé à proximité. Chaque village a son propre caractère architectural basé sur une église morave originale de style baroque civique, mais adaptée aux conditions locales. Aujourd''hui, dans chaque élément constitutif, il y a une congrégation active dont la continuation des traditions constitue un héritage morave vivant.
Description is available under license CC-BY-SA IGO 3.0',
  'Las Colonias de la iglesia morava es una extensión transnacional en serie de Christiansfeld, una colonia de la iglesia morava (Dinamarca), sitio que ya estaba inscrito en la Lista del Patrimonio Mundial. La extensión comprende tres municipios fundados en el siglo XVIII: Herrnhut (Alemania), Bethlehem (Estados Unidos de América) y Gracehill (Reino Unido de Gran Bretaña e Irlanda del Norte). Cada colonia presenta su propio carácter arquitectónico, basado en los ideales de la iglesia morava, pero adaptado a las condiciones locales. Juntas, las colonias representan el alcance transnacional y la coherencia de la comunidad morava internacional como red mundial. En cada parte del sitio existe una congregación activa donde las tradiciones se perpetúan y constituyen un patrimonio vivo moravo.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Поселения Моравской церкви — это транснациональное расширение серийного объекта Кристиансфельд, поселения Моравской церкви в Дании, уже включенного в Список всемирного наследия. Расширенный объект включает в себя три муниципалитета, основанных в XVIII веке: Хернхут (Германия), Бетлехем (Соединенные Штаты Америки) и Грейсхилл (Соединенное Королевство Великобритании и Северной Ирландии). Каждое поселение имеет свои архитектурные особенности, основанные на идеях Моравской церкви, но в то же время отражающие местную специфику. Все они образуют единую международную сеть общины Моравской церкви. В каждом из них проживает активная паства, продолжающая традиции Моравской церкви и ставшая живым наследием.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '摩拉维亚居留区是已列入《世界遗产名录》丹麦遗产“克里斯丁菲尔德，摩拉维亚居留区”的跨国系列扩展。此次扩展包括3座建于18世纪的城镇：德国的黑恩胡特、美国的伯利恒和英国的格雷斯希尔，每个居留区的建筑都在摩拉维亚教会理想风格的基础上结合当地条件而自成特色。它们共同代表了摩拉维亚国际社区这一全球网络超越国界、和谐一致的特性。居留区的每个组成部分都有一个活跃教会，会众让传统得以延续，并构成摩拉维亚活态遗产。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'تُعتبر مستعمرات الكنيسة المورافية امتداداً متسلسلاً عابراً للحدود لموقع "كريشتشانزفلد، مستعمرة تابعة للكنيسة المورافية" (الدنمارك)، المُدرج بالفعل في قائمة التراث العالمي. ويشمل الامتداد ثلاث بلديات أنشئت في القرن الثامن عشر، هي: بلدية هرنهوت (ألمانيا)، وبلدية بيت لحم (الولايات المتحدة الأمريكية)، وبلدية غرايسيهيل (المملكة المتحدة لبريطانيا العظمى وأيرلندا الشمالية). وتكتسي كل مستعمرة طابعاً معمارياً خاصاً قوامه مُثُل الكنيسة المورافية التي أُدخلت عليها بعض التعديلات للتكيف مع الظروف المحلية. وتجسد هذه البلديات مجتمعةً نطاق المجتمع المورافي الدولي واتساقه العابرين للحدود الوطنية باعتباره شبكة عالمية. وثمّة طائفة فاعلة في كل جزء من الأجزاء المكونة للموقع، والتي تحافظ على التقاليد وتمثل تراثاً مورافياً حياً.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1468_0030-400-400-20230711170108.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Kujataa Greenland: Norse and Inuit Farming at the Edge of the Ice Cap: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Kujataa Greenland: Norse and Inuit Farming at the Edge of the Ice Cap',
  'Kujataa is a subarctic farming landscape located in the southern region of Greenland. It bears witness to the cultural histories of the Norse farmer-hunters who started arriving from Iceland in the 10th century and of the Inuit hunters and Inuit farming communities that developed from the end of the 18th century. Despite their differences, the two cultures, European Norse and Inuit, created a cultural landscape based on farming, grazing and marine mammal hunting. The landscape represents the earliest introduction of farming to the Arctic, and the Norse expansion of settlement beyond Europe.
Description is available under license CC-BY-SA IGO 3.0',
  'Kujataa este un peisaj agricol subarctic situat în regiunea de sud a Groenlandei. Ea depune mărturie despre istoriile culturale ale fermierilor-vânători nordici care au început să sosească din Islanda în secolul al X-lea și ale vânătorilor inuiți și ale comunităților agricole inuite care s-au dezvoltat de la sfârșitul secolului al XVIII-lea. În ciuda diferențelor lor, cele două culturi, nordice europene și inuiți, au creat un peisaj cultural bazat pe agricultură, pășunat și vânătoare de mamifere marine. Peisajul reprezintă cea mai timpurie introducere a agriculturii în Arctica și expansiunea nordică a așezărilor dincolo de Europa.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Kujataa est un paysage agricole subarctique situé dans la région méridionale du Groenland. Il témoigne de l’histoire culturelle des fermier-chasseurs nordiques venus d’Islande à partir du Xe siècle, et de celle des chasseurs inuits et des communautés agricoles inuits qui se sont développés à partir de la fin du XVIIIe siècle. Malgré leurs différences, ces deux cultures –nordique d’Europe et inuit  – ont créé un paysage culturel fondé sur l’agriculture, le pâturage et la chasse aux mammifères marins. Ce paysage témoigne de la plus ancienne introduction de l’agriculture en Arctique et de l’installation d’un établissement nordique hors d’Europe.
Description is available under license CC-BY-SA IGO 3.0',
  'Kujataa es un paisaje agrícola subártico situado en la región sur de Groenlandia. Encierra testimonios de las historias culturales paleo-esquimales –de los pueblos cazadores-recolectores llegados de Islandia a partir del siglo X–,  y de las migraciones de granjeros nórdicos, de cazadores inuit y de las comunidades inuit que se desarrollaron a partir de finales del siglo XVIII. A pesar de sus diferencias, estas dos culturas –la nórdica groenlandesa y la europea inuit– y las condiciones ambientales específicas del lugar crearon un paisaje cultural basado en la agricultura, el pastoreo y la caza de mamíferos marinos. Este paisaje atestigua de la más antigua introducción de la agricultura en el Ártico y de la primera instalación de un asentamiento nórdico fuera de Europa.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1536_0008-400-400-20230222175858.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Aasivissuit – Nipisat. Inuit Hunting Ground between Ice and Sea: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Aasivissuit – Nipisat. Inuit Hunting Ground between Ice and Sea',
  'Located inside the Arctic Circle in the central part of West Greenland, the property contains the remains of 4,200 years of human history. It is a cultural landscape which bears witness to its creators’ hunting of land and sea animals, seasonal migrations and a rich and well-preserved tangible and intangible cultural heritage linked to climate, navigation and medicine. The features of the property include large winter houses and evidence of caribou hunting, as well as archaeological sites from Paleo-Inuit and Inuit cultures. The cultural landscape includes seven key localities, from Nipisat in the west to Aasivissuit, near the ice cap in the east. It bears testimony to the resilience of the human cultures of the region and their traditions of seasonal migration.
Description is available under license CC-BY-SA IGO 3.0',
  'Situată în interiorul Cercului Arctic, în partea centrală a Groenlandei de Vest, proprietatea conține rămășițele a 4.200 de ani de istorie umană. Este un peisaj cultural care mărturisește vânătoarea de animale terestre și marine de către creatorii săi, migrațiile sezoniere și un patrimoniu cultural material și imaterial bogat și bine conservat, legat de climă, navigație și medicină. Caracteristicile proprietății includ case mari de iarnă și dovezi ale vânătorii de caribou, precum și situri arheologice din culturile Paleo-Inuit și Inuit. Peisajul cultural cuprinde șapte localități cheie, de la Nipisat în vest până la Aasivissuit, în apropierea calotei glaciare din est. Ea depune mărturie despre rezistența culturilor umane din regiune și tradițiile lor de migrație sezonieră.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Se trouvant au nord du cercle arctique, dans la partie centrale de l’ouest du Groenland, le bien contient des vestiges de 4 200 ans d’histoire humaine. Les populations ont façonné un paysage culturel fondé sur la chasse aux animaux marins et terrestres, les modes saisonniers de migration et un patrimoine culturel matériel et immatériel riche et préservé, lié notamment au climat, à la navigation ou à la médecine. Parmi les caractéristiques du bien figurent de grandes maisons d’hiver et des traces de chasse au caribou ainsi que des gisements archéologiques des cultures paléo-inuite et inuite. Ce paysage culturel est présenté au travers de sept localités importantes, de Nipisat à l’ouest à Aasivissuit près de la calotte glacière, à l’est. Il démontre la résilience des cultures humaines de cette région et leurs traditions de migrations saisonnières.
Description is available under license CC-BY-SA IGO 3.0',
  'Situado en la parte central del noroeste de Groenlandia, este sitio posee vestigios ilustrativos de 4.200 años de la historia de sus poblaciones indígenas que han configurado todo un paisaje cultural con sus hábitos de caza de animales marinos y terrestres, sus migraciones estacionales y su rico e intacto patrimonio cultural inmaterial vinculado al clima, la navegación y la medicina. Elementos característicos de este sitio son las grandes casas para pasar la temporada invernal, las huellas de las partidas de caza del caribú y los yacimientos arqueológicos de la cultura inuit, tanto la prehistórica como la histórica. Integrado por siete localidades importantes, desde la de Nipisat, situada al oeste, hasta la de Aasivissuit, situada al este en las proximidades del casquete polar, el paisaje cultural de este sitio es una muestra de la perdurabilidad de las culturas humanas de Groenlandia y de sus ancestrales migraciones estacionales.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Расположенный к северу от полярного круга в центральной части Западной Гренландии, этот объект сохраняет следы 4200 лет человеческой истории. Коренные народы этого региона сформировали культурный ландшафт, в основе которого – охота на морских и наземных животных, сезонная миграция и сохранившееся богатое нематериальное культурное наследие. Они связаны с особенностями климата, навигацией и медициной. Среди характерных черт объекта - большие зимние дома и следы охоты на северных оленей карибу, а также залежи археологических артефактов, свидетельствующих о культуре палео-инуитов и современных инуитов. Этот культурный ландшафт сформировался и существует в семи важных локализациях - от острова Ниписат на западе до охотничьих угодий Осивиссуит на востоке, вблизи ледяной шапки. Объект Aasivissuit-Nipisat демонстрирует жизнеспособность человеческих культур в этом регионе и их традиции сезонной миграции.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '此处遗产地位于西格陵兰中部的北极圈内，这里有着4200年的人类历史遗迹。该文化景观见证其创造者对陆地和海洋动物的捕猎、季节性的迁徙，以及保存完好的气候、航海和医学方面丰富的物质和非物质文化遗产。该遗产地的特征包括大型冬季营房、驯鹿狩猎遗迹，以及古代因纽特人和因纽特文化的考古遗址。其文化景观包括7个主要地点，从西部的Nipisat到东部冰盖附近的Aasivissuit。它反映了该地区人类文化的复原力及季节性迁移的传统。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يوجد هذا الموقع شمال القطب الشمالي وتحديداً في الجزء الأوسط غرب جرينلاند، ويحتوي على آثار تجسّد 4200 عاماً من تاريخ البشرية. إذ ساهم السكان الذين تعاقبوا على المكان في تشكيل منظر ثقافي قائم على صيد الحيوانات البحرية والبرية، وأنماط الهجرة الموسمية وتراثاً ثقافيّاً غير مادياً غنياً وبحالة جيدة، ويرتبط على نحو خاص بالمناخ والملاحة والطب. ويتميز الموقع بمجموعة من العناصر من بينها مثلاً المنازل الشتوية الكبيرة وآثار لصيد الأيّل، بالإضافة إلى الرواسب الأثرية تعود لثقافة الإنويت والثقافة السابقة للإنويت. ويمتد هذا المنظر الثقافي عبر سبعة مجتمعات محلية هامة من نيبيسات غرباً حتى أيسيفيسوت بالقرب من الغطاء الجليدي شرقاً. ويًبرز الموقع التعاقب المستمر للثقافات البشريّة في هذه المنطقة وتقاليد هجراتهم الموسمية. 
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1557_0003-400-400-20180219145635.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Viking-Age Ring Fortresses: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Viking-Age Ring Fortresses',
  'These five archaeological sites comprise a system of monumental ring-shaped Viking-Age fortresses sharing a uniform geometric design. Constructed between about 970 and 980 CE, the fortresses at Aggersborg, Fyrkat, Nonnebakken, Trelleborg and Borgring were positioned strategically near important land and sea routes, and each made use of the natural topography of their surrounding landscape for defensive purposes. They are an emblematic demonstration of the centralized power of the Jelling Dynasty, and a testimony to the socio-political transformations that the Danish realm underwent in the late 10th century.
Description is available under license CC-BY-SA IGO 3.0',
  'Aceste cinci situri arheologice cuprind un sistem de fortărețe monumentale din epoca vikingă în formă de inel, care împărtășesc un design geometric uniform. Construite între anii 970 și 980 d.Hr., fortărețele de la Aggersborg, Fyrkat, Nonnebakken, Trelleborg și Borgring au fost poziționate strategic în apropierea unor rute maritime și terestre importante și fiecare a folosit topografia naturală a peisajului înconjurător în scopuri defensive. Ele sunt o demonstrație emblematică a puterii centralizate a dinastiei Jelling și o mărturie a transformărilor socio-politice pe care le-a suferit regatul danez la sfârșitul secolului al X-lea.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Ces cinq sites archéologiques comprennent un système de forteresses monumentales en forme d’anneau datant de l’âge des Vikings, qui partagent une conception géométrique uniforme. Construites entre environ 970 et 980 de notre ère, les forteresses d’Aggersborg, de Fyrkat, de Nonnebakken, de Trelleborg et de Borgring occupaient des positions stratégiques à proximité d’importantes voies terrestres et maritimes, et chacune a utilisé la topographie naturelle de son paysage environnant à des fins de défense. Elles sont une illustration emblématique du pouvoir centralisé de la dynastie de Jelling, et un témoignage des transformations sociopolitiques que le royaume danois a connues à la fin du Xe siècle.
Description is available under license CC-BY-SA IGO 3.0',
  'Estos cinco yacimientos arqueológicos comprenden un sistema de fortalezas monumentales en forma de anillo de la Edad Vikinga que comparten un diseño geométrico uniforme. Construidas entre 970 y 980 d.C., las fortalezas de Aggersborg, Fyrkat, Nonnebakken, Trelleborg y Borgring estaban estratégicamente situadas cerca de importantes rutas terrestres y marítimas, y aprovechaban la topografía natural del paisaje circundante con fines defensivos. Son una demostración emblemática del poder centralizado de la dinastía Jelling y un testimonio de las transformaciones sociopolíticas que experimentó el reino danés a finales del siglo X.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Эти пять археологических объектов представляют собой систему монументальных кольцеобразных крепостей эпохи викингов, имеющих единую геометрическую форму. Крепости Аггерсборг, Фюркат, Ноннебаккен, Треллеборг и Боргринг, построенные примерно в 970-980 гг. н.э., занимали стратегически важное положение вблизи важных сухопутных и морских путей и использовали естественный рельеф окружающего ландшафта в оборонительных целях. Они являются яркой демонстрацией централизованной власти династии Еллинга и свидетельством социально-политических преобразований, которым подверглось датское королевство в конце X века.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '维京时代的环形堡垒群由5处考古遗址共同构成，这些堡垒拥有同样的几何机构。它们建于公元970-980年间，分别位于阿格斯堡（Aggersborg）、菲尔卡特（Fyrkat）、诺内巴肯（Nonnebakken）、特雷勒堡（Trelleborg）、博尔格林（Borgring）的陆路和海路战略要塞，并将周围自然地貌融入防御工事。堡垒群体现了耶灵王朝的中央集权，见证了丹麦王国在10世纪末期经历的社会政治变革。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'تضم هذه المواقع الأثرية الخمسة مجموعة من الحصون من عصر الفايكنغ التي تأخذ شكلاً حَلَقياً ولها التصميم الهندسي ذاته. وقد بُنيت حصون أغرسبورغ وفيركات ونونباكن وترليبورغ وبورغرنغ بين عامَي 970 و980م تقريباً، وتتمتع بمواقع استراتيجية قرب الطرق البرية والبحرية، ويستخدم كل واحد من هذه الحصون التضاريس الطبيعية للأراضي المحيطة به في الأغراض الدفاعية. وهي دليل رمزي على السلطة المركزية التي تمتعت بها سلالة جلينغ، وشاهد على التحولات الاجتماعية والسياسية التي طرأت على المملكة الدانمركية في أواخر القرن العاشر.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1660_0001-400-400-20230523163405.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Galápagos Islands: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Galápagos Islands',
  'Situated in the Pacific Ocean some 1,000 km from the South American continent, these 19 islands and the surrounding marine reserve have been called a unique ‘living museum and showcase of evolution’. Located at the confluence of three ocean currents, the Galápagos are a ‘melting pot’ of marine species. Ongoing seismic and volcanic activity reflects the processes that formed the islands. These processes, together with the extreme isolation of the islands, led to the development of unusual animal life – such as the land iguana, the giant tortoise and the many types of finch – that inspired Charles Darwin’s theory of evolution by natural selection following his visit in 1835.
Description is available under license CC-BY-SA IGO 3.0',
  'Situate în Oceanul Pacific, la aproximativ 1.000 km de continentul sud-american, aceste 19 insule și rezervația marină din jur au fost numite un „muzeu viu și o vitrină a evoluției” unic. Situate la confluența a trei curenți oceanici, Galápagos sunt un „oală de topire” al speciilor marine. Activitatea seismică și vulcanică continuă reflectă procesele care au format insulele. Aceste procese, împreună cu izolarea extremă a insulelor, au condus la dezvoltarea unei vieți animale neobișnuite - cum ar fi iguana de uscat, broasca țestoasă uriașă și numeroasele tipuri de cinteze - care au inspirat teoria evoluției prin selecție naturală a lui Charles Darwin, în urma vizitei sale din 1835.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Situées dans l’océan Pacifique, à environ 1000 km du continent sud-américain, ces dix-neuf îles et la réserve marine qui les entoure constituent un musée et un laboratoire vivants de l’évolution uniques au monde. Au confluent de trois courants océaniques, les Galápagos sont un creuset d’espèces marines. L’activité sismique et le volcanisme toujours en activité illustrent les processus qui ont formé ces îles. Ces processus, ainsi que l’isolement extrême de ces îles, ont entraîné le développement d’une faune originale - notamment l’iguane terrestre, la tortue géante et de nombreuses espèces de pinsons qui inspira à Charles Darwin sa théorie de l’évolution par la sélection naturelle à la suite de sa visite en 1835.
Description is available under license CC-BY-SA IGO 3.0',
  'Situadas en el Pacífico, a unos mil kilómetros del subcontinente sudamericano, estas diecinueve islas de origen volcánico y su reserva marina circundante son un museo y un laboratorio vivientes de la evolución, únicos en el mundo. Las Galápagos están situadas en la confluencia de tres corrientes oceánicas y concentran una gran variedad de especies marinas. Su actividad sísmica y volcánica ilustra los procesos de su formación geológica. Estos procesos, sumados al extremo aislamiento del archipiélago, han originado el desarrollo de una fauna singular con especies como la iguana terrestre, la tortuga gigante y numerosas especies de pinzones, cuyo estudio inspiró a Darwin la teoría de la evolución por selección natural, tras su viaje a estas islas en 1835.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Архипелаг лежит в Тихом океане на расстоянии около 1 тыс. км от берегов Южной Америки. 19 островов этой группы, вместе с прилегающей акваторией, называют «живым музеем эволюции». Поскольку Галапагосы располагаются на пересечении трех океанических течений, они выступают в роли «плавильного котла» по отношению к обитателям морской среды. Здесь продолжается сейсмическая и вулканическая активность, что приводит к постоянному обновлению ландшафта. Эти процессы, наряду с большой изолированностью островов, привели к появлению таких оригинальных созданий как морская игуана, гигантская сухопутная черепаха, и многие разновидности вьюрков, наблюдения за которыми натолкнули Чарлза Дарвина после его визита сюда в 1835 г. на создание теории эволюции.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '群岛地处离南美大陆1000公里的太平洋上，由19个火山岛以及周围的海域组成，被人称作独一无二的“活的生物进化博物馆和陈列室”。加拉帕戈斯群岛处于三大洋流的交汇处，是海洋生物的“大熔炉”。持续的地震和火山活动反映了群岛的形成过程。这些过程，加上群岛与世隔绝的地理位置，促使群岛内进化出许多奇异的动物物种，例如陆生鬣蜥、巨龟和多种类型的雀类。1835年查尔斯·达尔文参观了这片岛屿后，从中得到感悟，进而提出了著名的进化论。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '赤道直下の太平洋上に浮かぶエクアドル領の島々。多くの動植物が島で独自の進化を遂げたことから、「種の方舟（はこぶね）」と呼ばれている。しかし持ち込まれた移入動物、ゴミや水質汚染などによって、現在その生態系は危機を迎えている。1835年ダーウィンがビーグル号で来航し、『種の起源』を著すきっかけとなった島でもある。',
  '',
  '',
  '',
  'على مسافة 1000 كيلومتر من القارة الأمريكيّة الجنوبيّة، تقع الجزر التسعة عشر والمحميّة البحريّة التي تحيطها وتكوّن متحفاً ومختبراً حيّين فريدين من نوعهما في المحيط الهادئ. وعند نقطة تلاقي تيارات المحيطات الثلاثة، تشكّل غالاباغوس بوتقة الأصناف البحريّة. فحركة الزلازل والبراكين الثائرة تجسّد عمليّات تكوين هذه الجزر. ولقد أدّت هذه العمليّات، ناهيك عن انعزال هذه الجزر التام، إلى تطوّر ثروة حيوانيّة فريدة من نوعها وخصوصاً الإغوانة البريّة والسلحفاة العملاقة وأصناف عديدة من عصافير البرقش التي استوحى منها شارل داروين نظريّته الشهيرة بعد زيارته عام 1835.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0001_0002-400-400-20151104133031.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Historic Centre of Santa Ana de los Ríos de Cuenca: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Historic Centre of Santa Ana de los Ríos de Cuenca',
  'Santa Ana de los Ríos de Cuenca is set in a valley surrounded by the Andean mountains in the south of Ecuador. This inland colonial town (entroterra ), now the country''s third city, was founded in 1557 on the rigorous planning guidelines issued 30 years earlier by the Spanish king Charles V. Cuenca still observes the formal orthogonal town plan that it has respected for 400 years. One of the region''s agricultural and administrative centres, it has been a melting pot for local and immigrant populations. Cuenca''s architecture, much of which dates from the 18th century, was ''modernized'' in the economic prosperity of the 19th century as the city became a major exporter of quinine, straw hats and other products.
Description is available under license CC-BY-SA IGO 3.0',
  'Santa Ana de los Ríos de Cuenca este situată într-o vale înconjurată de munții Anzi din sudul Ecuadorului. Acest oraș colonial din interior (entroterra ), acum al treilea oraș al țării, a fost fondat în 1557 pe liniile directoare de planificare riguroase emise cu 30 de ani mai devreme de regele spaniol Carol al V-lea. Cuenca încă respectă planul formal ortogonal al orașului pe care l-a respectat de 400 de ani. Unul dintre centrele agricole și administrative ale regiunii, a fost o criză pentru populațiile locale și imigrante. Arhitectura Cuenca, din care o mare parte datează din secolul al XVIII-lea, a fost „modernizată” în prosperitatea economică a secolului al XIX-lea, deoarece orașul a devenit un exportator major de chinină, pălării de paie și alte produse.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Santa Ana de los Ríos de Cuenca est enchâssée dans une vallée entourée par les Andes, dans le sud de l''Équateur. La ville coloniale de l''intérieur (entroterra ), actuellement troisième ville du pays, a été fondée en 1557 selon les directives d''urbanisme rigoureuses établies trente ans auparavant par Charles Quint, roi d''Espagne. Elle suit le plan orthogonal officiel respecté depuis 400 ans. Centre agricole et administratif de la région, la ville est devenue un lieu de brassage pour les populations locales et immigrantes. L''architecture de Cuenca, qui date en grande partie du XVIIIe siècle, a été « modernisée » lors de la prospérité économique du XIXe siècle, lorsque la ville est devenue grande exportatrice de quinine, de chapeaux de paille et d''autres produits.
Description is available under license CC-BY-SA IGO 3.0',
  'Santa Ana de los Ríos de Cuenca está enclavada en un valle de la cordillera de los Andes, al sur de Ecuador. Esta ciudad colonial “de tierra adentro” –que es hoy la tercera en importancia del país– fue fundada en 1557, de conformidad con la estricta normativa urbanística promulgada treinta años antes por el emperador Carlos V. El trazado urbano de la ciudad se sigue ajustando al plan ortogonal establecido 400 años atrás. Cuenca es hoy un centro agrícola y administrativo regional, en el que la población local se ha mezclado con sucesivas generaciones de emigrantes. La mayor parte de sus edificios datan del siglo XVIII, pero la arquitectura urbana se modernizó con la prosperidad económica de que se benefició la ciudad en el siglo XIX, cuando se convirtió en un centro de exportación importante de quinina, sombreros de jipijapa y otros productos.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Санта-Ана-де-лос-Риос-де-Куэнка расположена в горной долине в окружении Анд, на юге Эквадора. Этот удаленный от морского побережья колониальный город «энтротерра», ныне являющийся третьим городом в стране, был основан в 1557 г. и строился в соответствии с жесткими планировочными установлениями, принятыми 30-ю годами раньше королем Испании Карлом V. Куэнка и сейчас, спустя 400 лет, все еще сохраняет прямоугольную планировку. Представляя один из сельскохозяйственных и административных центров региона, она явилась «плавильным котлом», в котором «перемешивались» местные жители и иммигранты. Архитектура Куэнки, в основном относящаяся к XVIII в., была обновлена во время экономического процветания XIХ в., когда город стал главным экспортером хинина, шляп из перьев и других товаров.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '昆卡的洛斯－里奥斯的圣安娜位于厄瓜多尔南部安第斯山环绕的一个山谷里，始建于1557年，是典型的内陆殖民地城镇，如今是厄瓜多尔第三大城市。城市的建造严格遵守了30年前西班牙国王查尔斯·冯·昆卡(Charles V. Cuenca)制定的垂直城市规划原则，并于后来的400年间一直沿袭了当初的规划。作为这个地区的农业和行政中心之一，该历史中心是当地居民和外来移民的大熔炉。昆卡的建筑大多始建于18世纪，到19世纪时这里成为奎宁、草帽以及其他产品的主要出口港，经济上的繁荣也推动了城市建筑的现代化。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'クエンカはエクアドル南部、アスアイ州の州都。キトの南約300km、標高2,580mの高原に位置する。市街は1557年スペイン人による植民以来の丸石を敷きつめた道路や大理石の建物が残り、アメリカにおけるルネサンス様式の都市計画、異文化の巧みな融合、スペイン植民都市計画の成功例として高く評価される。写真はクエンカの象徴ともいえる大聖堂。青いドームをのせた大理石建築で、1885年に建立された。',
  '',
  '',
  '',
  'تقع سانتا آنا دي لوس ريوس دي كوينكا في وادٍ تحيطه جبال الآند جنوب الإكواتور. والمدينة المستعمرة الداخليّة وهي ثالث مدن البلاد اليوم تأسست عام 1557 بناءً على توجيهات صارمة حول التخطيط الحضري التي فرضها قبل ثلاثين عاماً من ذلك التاريج شارل كان، ملك اسبانيا. ولا تزال تتبع الخطة المتعامدة الرسميّة المطبقة منذ 400 سنة. أصبحت معبراً للسكان المحليين والمهاجرين كونها مركزا زراعيا وإداريا. جرى تحديث هندسة دي كوينكا التي ترقى بمعظمها إلى القرن الثامن عشر في خلال فترة الازدهار الاقتصادي للقرن التاسع عشر عندما أصبحت المدينة مركز تصدير الكينيين وقبعات القشّ وغيرها من المنتجات.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0863_0004-400-400-20121203153628.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Memphis and its Necropolis – the Pyramid Fields from Giza to Dahshur: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Memphis and its Necropolis – the Pyramid Fields from Giza to Dahshur',
  'The capital of the Old Kingdom of Egypt has some extraordinary funerary monuments, including rock tombs, ornate mastabas, temples and pyramids. In ancient times, the site was considered one of the Seven Wonders of the World.
Description is available under license CC-BY-SA IGO 3.0',
  'Capitala Vechiului Regat al Egiptului are câteva monumente funerare extraordinare, inclusiv morminte din stâncă, mastabe ornamentate, temple și piramide. În antichitate, situl era considerat una dintre cele șapte minuni ale lumii.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Autour de la capitale de l''Ancien Empire égyptien subsistent d''extraordinaires ensembles funéraires avec leurs tombes rupestres, leurs mastabas finement décorés, leur temples et leurs pyramides. Le site était considéré dans l''Antiquité comme l''une des Sept Merveilles du monde.
Description is available under license CC-BY-SA IGO 3.0',
  'En torno a la capital del Antiguo Imperio egipcio subsisten extraordinarios monumentos funerarios: tumbas rupestres, mastabas delicadamente ornamentadas, templos y pirámides. Menfis era considerada en la Antigüedad una de las Siete Maravillas del Mundo.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'В столице египетского Древнего Царства находятся великолепные погребальные памятники, включающие скальные надгробия, богато украшенные «мастаба», храмы и пирамиды. В древние времена этот объект считался одним из Семи Чудес Света.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '古埃及王国首都有着令人叹为观止的墓地古迹，包括石冢、装饰华丽的墓室、庙宇和金字塔。这处遗址是古代世界七大奇迹之一。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'メンフィスはエジプト古王国時代の首都。ギーザの3大ピラミッドなど80余りのピラミッドが残され、中でも高さ146mのクフ王のものが最大。テーベはエジプト中王国・新王国の首都として栄え、ナイル川東岸にあるカルナック神殿や、西岸のラムセス2世などの葬祭殿、砂漠丘陵地の王家の谷の墓地群が、かつての繁栄を物語っている。',
  '',
  '',
  '',
  'تقوم حول عاصمة مصر القديمة مبانٍ مأتميّة رائعة بقبورها الصخريّة ومصطباتها جميلة الزينة ومعابدها وأهرامها. وصنف الأقدمون هذا الموقع بين عجائب الدنيا السبع.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0086_0020-400-400-20151104170236.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Joya de Cerén Archaeological Site: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Joya de Cerén Archaeological Site',
  'Joya de Cerén was a pre-Hispanic farming community that, like Pompeii and Herculaneum in Italy, was buried under an eruption of the Laguna Caldera volcano c. AD 600. Because of the exceptional condition of the remains, they provide an insight into the daily lives of the Central American populations who worked the land at that time.
Description is available under license CC-BY-SA IGO 3.0',
  'Joya de Cerén a fost o comunitate agricolă prehispanică care, la fel ca Pompeii și Herculaneum în Italia, a fost îngropată sub o erupție a vulcanului Laguna Caldera c. 600 d.Hr. Datorită stării excepționale a rămășițelor, acestea oferă o perspectivă asupra vieții de zi cu zi a populațiilor din America Centrală care lucrau pământul la acea vreme.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Joya de Ceren était une communauté agricole préhispanique qui, comme Pompéi et Herculanum en Italie, fut brutalement engloutie par une éruption du volcan Laguna Caldera vers 600. Grâce à leur parfait état de conservation, ses vestiges témoignent de la vie quotidienne des cultivateurs mésoaméricains de l’époque.
Description is available under license CC-BY-SA IGO 3.0',
  'Al igual que las ciudades romanas de Pompeya y Herculano, la comunidad agrícola prehispánica de Joya de Cerén fue repentinamente sepultada por una erupción del volcán Laguna Caldera hacia el año 600. Gracias a su perfecto estado de conservación, los vestigios de este sitio aportan un testimonio excepcional sobre la vida cotidiana de los agricultores mesoamericanos de esa época.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Хойя-де-Серен был доиспанским сельским поселением, которое, подобно Помпее и Геркулануму в Италии, около 600 г. было погребено под вулканическими выбросами при извержении. Исключительно хорошее состояние его остатков позволяет получить представление о повседневной жизни населения Центральной Америки, занимавшегося в то время земледелием.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '霍亚－德赛伦考古遗址是古拉丁美洲的一个农庄，像意大利的庞培和赫库兰尼姆一样，于公元600年左右遭到火山喷发掩埋。正是由于这种特殊的保存方式，使得人们现在可以从此了解当时在这块土地上耕作的中美洲人的日常生活。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'كانت خويا دي سيرين جماعةً زراعيّةً سالفةً للعصر الإسباني وقد طمرها فوران بركان لاغونا كاليدرا قرابة العام 600 ، تماماً كما حصل مع بومباي وهرقولانيوم في إيطاليا. وتجسّد البقايا الأثريّة المحافظ عليها بشكلٍ ممتاز الحياة اليوميّة لمزارعي الوسط الأمريكي في تلك الحقبة.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0675_0001-400-400-20090925160354.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Asmara: A Modernist African City: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Asmara: A Modernist African City',
  'Located at over 2,000 m above sea level, the capital of Eritrea developed from the 1890s onwards as a military outpost for the Italian colonial power. After 1935, Asmara underwent a large scale programme of construction applying the Italian rationalist idiom of the time to governmental edifices, residential and commercial buildings, churches, mosques, synagogues, cinemas, hotels, etc. The property encompasses the area of the city that resulted from various phases of planning between 1893 and 1941, as well as the indigenous unplanned neighbourhoods of Arbate Asmera and Abbashawel. It is an exceptional example of early modernist urbanism at the beginning of the 20th century and its application in an African context.
Description is available under license CC-BY-SA IGO 3.0',
  'Situată la peste 2.000 m deasupra nivelului mării, capitala Eritreei s-a dezvoltat începând cu anii 1890 ca avanpost militar pentru puterea colonială italiană. După 1935, Asmara a trecut printr-un program de construcție la scară largă, aplicând limbajul raționalist italian al vremii la edificii guvernamentale, clădiri rezidențiale și comerciale, biserici, moschei, sinagogi, cinematografe, hoteluri etc. Proprietatea cuprinde zona orașului care a rezultat din diferite faze de planificare între 1893 și 1941. Abbashawel. Este un exemplu excepțional de urbanism modernist timpuriu la începutul secolului al XX-lea și aplicarea lui într-un context african.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Située à plus de 2 000 m au-dessus du niveau de la mer, la capitale de l’Érythrée s’est développée à partir des années 1890 comme un avant-poste militaire de la puissance coloniale italienne. Après 1935, Asmara connut un programme de construction à grande échelle appliquant le style rationaliste italien de l’époque aux édifices gouvernementaux, aux bâtiments résidentiels et commerciaux, aux églises, mosquées, synagogues, cinémas, hôtels, etc. Le bien comprend la zone de la ville résultant des différentes phases de planification urbaine entre 1893 et 1941, ainsi que les quartiers autochtones non planifiés d’Arbate Asmera et d’Abbashawel. Il s’agit d’un témoignage exceptionnel du début de l’urbanisme moderne, à l’aube du xxe siècle, et de son application dans un contexte africain.
Description is available under license CC-BY-SA IGO 3.0',
  'Situada a más de 2.000 metros de altura sobre el nivel mar, la capital de Eritrea, Asmara, se empezó a desarrollar a partir del decenio de 1890 como puesto militar de avanzada del poder colonial italiano. A partir de 1935, se inició un plan urbanístico a gran escala para construir con el estilo racionalista italiano de la época toda una serie de edificios gubernamentales y comerciales, iglesias, mezquitas, sinagogas, viviendas, hoteles, cines, etc. El sitio abarca la zona de construcciones planificadas en sucesivas fases, desde 1893 hasta 1941, y también las construcciones no planificadas de los barrios autóctonos de Arbate, Asmera y Abbashawel. Este bien cultural constituye un testimonio excepcional del urbanismo occidental de principios del siglo XX y de su aplicación en un contexto africano.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  '',
  '',
  'تقع مدينة أسمرة، عاصمة إريتيا، على ارتفاع أكثر من 2000 متراً فوق مستوى سطح البحر، وقد تطوّرت منذ الثمانينيّات حيث كانت مركزاً عسكريّاً للسلطة الاستعماريّة الإيطاليّة. وشهدت المدينة، منذ العام 1935، برنامج تشييد واسع النطاق أسفر عن استخدام فن العمارة العقلاني الإيطالي في تلك الفترة في المباني الحكوميّة، والمباني السكنيّة والتجاريّة، بالإضافة إلى الكنائس والمساجد والمعابد اليهوديّة وصالات السينما والفنادق... وجدير بالذكر أنّ الموقع يحتوي على منطقة تعاقبت عليها مراحل مختلفة للتخطيط الحضري بين عامي 1893 و1941، فضلاً عن عدد من الأحياء العشوائيّة الأصليّة الواقعة في أرباط أسمرا وأباشاول. ويشهد الموقع على حركة التخطيط الحضري في مطلع القرن العشرين وتطبيقه في البيئة الأفريقيّة.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1550_0007-400-400-20221005094816.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Bale Mountains National Park: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Bale Mountains National Park',
  'This property protects a landscape mosaic of extraordinary beauty that is shaped by the combined forces of ancient lava outpourings, glaciation and the dissection by the Great Rift Valley. It features volcanic peaks and ridges, dramatic escarpments, sweeping valleys, glacial lakes, lush forests, deep gorges and numerous waterfalls, creating exceptional natural beauty. The property harbours diverse and unique biodiversity at ecosystem, species and genetic levels, and five major rivers originate within the Park, estimated to supply water and support the livelihoods of millions of people in and beyond Ethiopia.
Description is available under license CC-BY-SA IGO 3.0',
  'Această proprietate protejează un mozaic peisaj de o frumusețe extraordinară, care este modelat de forțele combinate ale revărsărilor de lavă antice, glaciației și disecției de către Valea Marelui Rift. Prezintă vârfuri și creste vulcanice, escarpe dramatice, văi măturatoare, lacuri glaciare, păduri luxuriante, chei adânci și numeroase cascade, creând o frumusețe naturală excepțională. Proprietatea adăpostește biodiversitate diversă și unică la nivel de ecosistem, specii și genetice, iar cinci râuri majore își au originea în Parc, care se estimează că furnizează apă și susțin mijloacele de trai a milioane de oameni din Etiopia și dincolo de acestea.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le bien protège une mosaïque paysagère à la beauté extraordinaire, façonnée par les forces conjuguées des écoulements de lave anciens, de la glaciation et de la dissection par la vallée du Grand Rift. Sa beauté naturelle exceptionnelle lui vient de ses pics et crêtes volcaniques, de ses escarpements spectaculaires, de ses vallées à perte de vue, de ses lacs glaciaires, de ses forêts luxuriantes, de ses gorges profondes et de nombreuses cascades. Le bien abrite une biodiversité diverse et unique au niveau des écosystèmes, des espèces et de la génétique, et cinq grandes rivières prennent leur source dans le Parc, dont on estime qu’elles alimentent en eau et soutiennent les moyens d’existence de millions de personnes en Éthiopie et au-delà.
Description is available under license CC-BY-SA IGO 3.0',
  'Este sitio protege un mosaico paisajístico de extraordinaria belleza formado por las fuerzas combinadas de antiguas erupciones volcánicas, la glaciación y la disección del Gran Valle del Rift. Presenta picos y crestas volcánicas, acantilados espectaculares, amplios valles, lagos glaciares, bosques frondosos, gargantas profundas y numerosas cascadas, que crean una belleza natural excepcional. El sitio alberga una biodiversidad diversa y única a nivel de ecosistemas, especies y genética, y en el Parque nacen cinco grandes ríos que se calcula que abastecen de agua y sustentan los medios de subsistencia de millones de personas dentro y fuera de Etiopía.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Этот участок охраняет необыкновенной красоты ландшафтную мозаику, сформировавшуюся под воздействием древних излияний лавы, оледенения и рассечения Великой рифтовой долиной. Здесь находятся вулканические пики и хребты, впечатляющие эскарпы, широкие долины, ледниковые озера, густые леса, глубокие ущелья и многочисленные водопады, создающие исключительную природную красоту. На территории парка сосредоточено разнообразное и уникальное биоразнообразие на экосистемном, видовом и генетическом уровнях. На территории парка берут начало пять крупных рек, которые, по оценкам специалистов, обеспечивают водой и поддерживают жизнедеятельность миллионов людей в Эфиопии и за ее пределами.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '巴莱山（Bale）国家公园坐拥美丽非凡的多元景观，由远古熔岩喷发、冰河作用和东非大裂谷的分割共同塑造而成。这一独特的自然美景包括火山的峰岭和山脊、壮观的悬崖、绵延的沟壑、冰川湖泊、茂密的森林、幽深的峡谷和众多的瀑布。该地区在生态系统、物种和基因水平方面拥有丰富且独特的生物多样性。公园内有5条主要河流，滋养埃塞俄比亚境内外千百万人的生活和生计。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'تحمي هذه الحديقة فسيفساء طبيعية ذات جمال استثنائي، وهي فسيفساء تشكلت بفعل القوى المشتركة لتدفقات الحمم البركانية القديمة والتجلد والتصدع بواسطة الوادي المتصدع الكبير. تتميز الحديقة بالقمم والتلال البركانية الموجودة فيها، فضلاً عن المنحدرات الحادة، والوديان الواسعة، والبحيرات الجليدية، والغابات الخضراء، والوديان العميقة والعديد من الشلالات، إذ تكسبها جميع هذه المعالم جمالًا طبيعياً استثنائيًا. تكتنز الحديقة تنوعًا بيولوجيًا غنياً منقطع النظير على صعيد النظام البيئي وأصناف الكائنات الحية والجينات الوراثية، وتنبع خمسة أنهار رئيسية داخل الحديقة، وتُشير التقديرات إلى أنها توفر المياه وتدعم سبل عيش ملايين الأشخاص في إثيوبيا وخارجها.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0111_0001-400-400-20220317163041.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] The Gedeo Cultural Landscape: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'The Gedeo Cultural Landscape',
  'The property lies along the eastern edge of the Main Ethiopian Rift, on the steep escarpments of the Ethiopian highlands. An area of agroforestry, it utilizes multilayer cultivation with large trees sheltering indigenous enset, the main food crop, under which grow coffee and other shrubs. The area is densely populated by the Gedeo people whose traditional knowledge support local forest management. Within the cultivated mountain slopes are sacred forests traditionally used by local communities for rituals associated with the Gedeo religion, and along the mountain ridges are dense clusters of megalithic monuments, which came to be revered by the Gedeo and cared for by their elders.
Description is available under license CC-BY-SA IGO 3.0',
  'Proprietatea se află de-a lungul marginii de est a Riftului Etiopian Principal, pe escarpele abrupte ale muntilor Etiopieni. O zonă de agrosilvicultură, folosește cultivarea în mai multe straturi cu copaci mari care adăpostesc enset indigen, principala cultură alimentară, sub care crește cafeaua și alți arbuști. Zona este dens populată de oamenii Gedeo ale căror cunoștințe tradiționale susțin managementul pădurilor locale. Pe versanții munților cultivați se află păduri sacre folosite în mod tradițional de comunitățile locale pentru ritualuri asociate cu religia Gedeo, iar de-a lungul crestelor muntoase sunt aglomerate dense de monumente megalitice, care au ajuns să fie venerate de Gedeo și îngrijite de bătrânii lor.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Ce bien s’étend le long de la marge orientale du sud de la vallée du Rift éthiopien, sur les contreforts escarpés des hauts plateaux éthiopiens. C’est une zone d’agroforesterie caractérisée par des cultures multi-étagées, avec de grands arbres abritant l’ensète indigène, la principale culture vivrière, sous laquelle poussent le café et d’autres arbustes. La zone est densément peuplée par les membres du peuple gedeo, dont les savoirs traditionnels soutiennent les régimes forestiers. Sur les pentes cultivées de la montagne se trouvent des forêts sacrées utilisées traditionnellement par les communautés locales pour des rituels associés à la religion gedeo. Et le long des crêtes montagneuses se dressent des groupes denses de monuments mégalithiques, vénérés par les Gedeo et entretenus par leurs aînés.
Description is available under license CC-BY-SA IGO 3.0',
  'El sitio se extiende a lo largo del borde oriental del Valle del Rift Etíope, en las escarpadas laderas de las tierras altas de Etiopía. Se trata de una zona agroforestal en la que se practica el cultivo en varias capas, con grandes árboles que albergan el ensete autóctono, también conocido como bananero de Etiopía, principal cultivo alimentario, bajo el cual crecen el café y otros arbustos. La zona está densamente poblada por el pueblo gedeo, cuyos conocimientos tradicionales favorecen la gestión forestal local. En las laderas de las montañas cultivadas se encuentran bosques sagrados utilizados tradicionalmente por las comunidades locales para rituales asociados con la religión gedeo, y a lo largo de las crestas de las montañas existen densos grupos de monumentos megalíticos, que llegaron a ser venerados por los gedeo y cuidados por sus ancianos.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Территория расположена вдоль восточного края Главного Эфиопского рифта, на крутых уступах Эфиопского нагорья. Здесь используется многоуровневая агролесомелиорация с большими деревьями, укрывающими энсету, основную продовольственную культуру, под которой растут кофе и другие кустарники. Территория плотно заселена представителями народности Гедео, чьи традиционные знания поддерживают местное лесопользование. В пределах возделываемых горных склонов находятся священные леса, традиционно используемые местным населением для проведения ритуалов, связанных с религией Гедео, а вдоль горных хребтов — плотные скопления мегалитических памятников, которые почитаются Гедео и за которыми ухаживают их старейшины.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '该遗产地沿埃塞俄比亚主裂谷东缘分布，位于埃塞俄比亚高原的陡峭悬崖上。这片农林区采用多层耕作方式，大树下生长着当地主要的粮食作物阿比西尼亚香蕉，其下还种植着咖啡和其他灌木。该地区人口稠密，居民属格德奥族人，他们掌握着管理当地森林的传统知识。经过开垦的山坡上的森林，被当地人视为格德奥宗教仪式的圣地；密集的巨石纪念碑群沿着山脊而立，它们受到崇敬，并由族中长者看护。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يقع هذا الموقع على الحافة الشرقية من الفالق الإثيوبي الكبير على الجروف الشديدة الانحدار للمرتفعات الإثيوبية. والموقع عبارة عن منطقة للحراجة الزراعية وتُستخدم فيها الزراعة المتعددة الطبقات حيث تقوم الأشجار الكبيرة بتظليل الموز الحبشي المتوطن وهو المحصول الغذائي الرئيسي، ويُزرع تحته محصول القهوة وغيرها من أنواع الشجيرات. والمنطقة مكتظة بسكانها من شعب الجيديو الذي تدعم معارفه التقليدية إدارة الغابات على الصعيد المحلي. وتضم سفوح الجبال المزروعة بين جنباتها غابات مقدسة كانت تستخدمها المجتمعات المحلية بصورة تقليدية لممارسة الطقوس المرتبطة بديانة الجيديو، وتوجد على امتداد قمم الجبال تجمعات كثيفة للآثار المصنوعة من أحجار ضخمة يبجلها شعب الجيديو ويعتني بها كبارهم.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1641_0011-400-400-20230703151352.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Melka Kunture and Balchit: Archaeological and Palaeontological Sites in the Highland Area of Ethiopia: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Melka Kunture and Balchit: Archaeological and Palaeontological Sites in the Highland Area of Ethiopia',
  'Located in the Upper Awash Valley in Ethiopia, the serial property is a cluster of prehistoric sites that preserve archaeological and palaeontological records – including footprints – that testify to the area’s occupation by the hominin groups from two million years ago. The sites, situated about 2,000 to 2,200 metres above sea level, yielded Homo erectus, Homo heidelbergensis and archaic Homo sapiens fossils, documented in well-dated strata in association with various tools made from volcanic rocks. The cultural sequence includes four consecutive phases of the Oldowan, Acheulean, Middle Stone Age and Late Stone Age techno-complexes. Fragments of palaeo-landscapes, preserved buried under volcanic and sedimentary deposits with fossil fauna and flora, allow reconstruction of the high-mountain ecosystem of the Ethiopian Highlands during the Pleistocene. Conclusions can thus be drawn on the adaptation of hominin groups to the challenges and climatic conditions of high altitudes.
Description is available under license CC-BY-SA IGO 3.0',
  'Situată în Valea Superioară Awash din Etiopia, proprietatea în serie este un grup de situri preistorice care păstrează înregistrări arheologice și paleontologice – inclusiv urme de pași – care mărturisesc ocuparea zonei de către grupurile de hominini de acum două milioane de ani. Siturile, situate la aproximativ 2.000 până la 2.200 de metri deasupra nivelului mării, au produs fosile de Homo erectus, Homo heidelbergensis și arhaice Homo sapiens, documentate în straturi bine datate în asociere cu diverse instrumente realizate din roci vulcanice. Secvența culturală include patru faze consecutive ale tehno-complexelor Oldowan, Acheulean, Epoca Medie a Pietrei și Epoca Târzie a Pietrei. Fragmente de paleo-peisaje, conservate îngropate sub depozite vulcanice și sedimentare cu faună și floră fosilă, permit reconstrucția ecosistemului montan înalt al Țărilor Etiopiene în timpul Pleistocenului. Astfel, se pot trage concluzii cu privire la adaptarea grupurilor de hominini la provocările și condițiile climatice de la altitudini mari.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Situé dans la haute vallée de l’Aouache, en Éthiopie, le bien en série est un ensemble de sites préhistoriques renfermant des vestiges paléontologiques et archéologiques – notamment des empreintes de pieds – qui témoignent de l’occupation de la région par des groupes d’homininés il y a deux millions d’années. Ces sites, à une altitude d’environ 2 000 à 2 200 mètres au-dessus du niveau de la mer, ont révélé des restes fossilisés d’Homo erectus, Homo heidelbergensis et Homo sapiens archaïque documentés dans des strates bien datées aux côtés de divers outils lithiques façonnés à partir de roches volcaniques. La séquence culturelle représente quatre phases consécutives, à savoir les techno-complexes de l’Oldowayen, de l’Acheuléen, du Paléolithique moyen et du Paléolithique supérieur. Des fragments de paléopaysages, ensevelis sous les tufs volcaniques et les dépôts sédimentaires et des vestiges fossiles d’animaux et de végétaux permettent de reconstituer l’écosystème de haute montagne des hauts plateaux éthiopiens du Pléistocène. On peut donc en tirer des conclusions sur l’adaptation des groupes d’homininés aux difficultés et aux conditions climatiques des hautes altitudes.
Description is available under license CC-BY-SA IGO 3.0',
  'Este sitio en serie, situado en el Valle Alto del Awash, en Etiopía, es un conjunto de yacimientos prehistóricos que conservan registros arqueológicos y paleontológicos –entre los cuales huellas– que atestiguan que la zona ha sido ocupada por grupos de homínidos desde hace dos millones de años. Los yacimientos, que se encuentran entre 2000 y 2200 metros sobre el nivel del mar, han proporcionado fósiles de Homo erectus, Homo hedelbergensis y Homo sapiens arcaico, documentados en estratos bien datados junto con diversas herramientas fabricadas con rocas volcánicas. La secuencia cultural comprende cuatro fases consecutivas de los tecnocomplejos Olduvayense, Achelense, de la Edad de Piedra Media y de la Edad de Piedra Tardía. Los fragmentos de paleopaisajes, que se han conservado enterrados bajo depósitos volcánicos y sedimentarios con fauna y flora fósiles, permiten reconstruir el ecosistema de alta montaña de las Tierras Altas de Etiopía durante el Pleistoceno. De este modo, pueden extraerse conclusiones sobre la adaptación de los grupos de homínidos a los desafíos y las condiciones climáticas en zonas de gran altitud.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Этот серийный объект расположен в верхней части долины реки Аваш в Эфиопии. Он включает в себя группу доисторических стоянок, на территории которых были обнаружены археологические и палеонтологические объекты, в том числе отпечатки ног, свидетельствующие о том, что гоминины заселяли эту территорию два миллиона лет назад. В этих местах, расположенных на высоте от 2 000 до 2 200 метров над уровнем моря, обнаружены окаменелости человека прямоходящего (Homo erectus), гейдельбергского человека (Homo heidelbergensis) и останков архаичного человека разумного (Homo sapiens). Эти окаменелости найдены в хорошо сохранившихся пластах вместе с различными орудиями труда, изготовленными из вулканических пород. Смена культурных эпох включает четыре последовательные фазы технокомплексов олдувайского, ашельского, среднего каменного и позднего каменного веков. Фрагменты палеоландшафтов, сохранившиеся под вулканическими и осадочными отложениями с ископаемой фауной и флорой, позволяют реконструировать высокогорную экосистему Эфиопского нагорья в эпоху плейстоцена. Таким образом, можно сделать выводы об адаптации гомининов к трудным условиям и климату высокогорья.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '梅尔卡·昆图尔（Melka Kunture）和巴尔奇特（Balchit）考古与古生物遗址系列遗产是位于阿瓦什河上游河谷的史前遗址群，保存着丰富的考古遗迹与包括脚印在内的古生物记录，展现了200万年前人族在该地区的生活痕迹。遗址位于海拔约2000-2200米处，年代久远的地层出土了直立人、海德堡人、古智人化石，以及以火山岩制成的各种工具。遗存的文化序列包括4个连续阶段的技术复合体：奥杜韦文化、阿舍利文化、中石器时代、石器时代。埋藏在火山岩和沉积岩下的古地貌碎片及动植物化石，为重建更新世时代埃塞俄比亚高原的高山生态系统创造了条件，从而揭示远古人族如何适应高海拔地区的挑战与气候条件。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يوجد هذا الموقع المتسلسل في وادي الأواش الأعلى بإثيوبيا، وهو عبارة عن مجموعة من مواقع ما قبل التاريخ التي تحافظ على سجلات أثرية وأحفورية قديمة - بما في ذلك آثار الأقدام. وتشهد هذه السجلات على استيطان قبائل البشراناوات (أشباه البشر) في الموقع منذ مليوني عام. يوجد في هذه المواقع التي يتراوح ارتفاعها عن مستوى سطح البحر من 2000 إلى 2200 متر، أحافير للإنسان المنتصب القامة والإنسان هايدلبيرغ والإنسان البدائي العاقل، وهذه الأحافير مؤرخة جيداً في طبقات تضم أيضاً أدوات مختلفة مصنوعة من الصخور البركانية. ويضم التسلسل الثقافي أربع مراحل متعاقبة تتجسد في المجامع التقنية التي تعود إلى النمط الأول للصناعة الحجرية (المرحلة الأولدوانية) والنمط الثاني للصناعة الحجرية (الأشولينية) والعصر الحجري المتوسط والعصر الحجري الحديث. أتاحت أجزاء المناظر الطبيعية القديمة المحفوظة تحت الرواسب البركانية والصخور الرسوبية مع بقايا حيوانات ونباتات متحجرة، إعادة بناء النظام البيئي الجبلي للمرتفعات الإثيوبية خلال العصر البلستوسيني (العصر الحديث الأقرب). يمكن بالتالي التوصل إلى أنّ قبائل البشراناوات كانت تتكيف مع التحديات والظروف المناخية للارتفاعات الشاهقة. 
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0013_0003-400-400-20240605105439.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Petäjävesi Old Church: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Petäjävesi Old Church',
  'Petäjävesi Old Church, in central Finland, was built of logs between 1763 and 1765. This Lutheran country church is a typical example of an architectural tradition that is unique to eastern Scandinavia. It combines the Renaissance conception of a centrally planned church with older forms deriving from Gothic groin vaults.
Description is available under license CC-BY-SA IGO 3.0',
  'Vechea biserică Petäjävesi, în centrul Finlandei, a fost construită din bușteni între 1763 și 1765. Această biserică luterană de țară este un exemplu tipic de tradiție arhitecturală unică în estul Scandinaviei. Ea combină concepția renascentist a unei biserici centralizate cu forme mai vechi care derivă din bolțile gotice în curbă.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'La vieille église de Petäjävesi, en Finlande centrale, construite en rondins de conifères en 1763-1765, est une église luthérienne rurale représentative d''une tradition architecturale propre à l''est de la Scandinavie. L''église associe la conception Renaissance d''une église de plan centré et les formes plus anciennes dérivées des plafonds aux voûtes d''arêtes de la période gothique.
Description is available under license CC-BY-SA IGO 3.0',
  'Situada en el centro de Finlandia, la iglesia vieja de Petäjävesi fue construida con troncos de coníferas entre 1763 y 1765. Es una iglesia luterana rural representativa de la tradición arquitectónica típica del este de Escandinavia. Su arquitectura combina el plano centrado de concepción renacentista con formas más antiguas, derivadas de los techos con bóvedas de arista del periodo gótico.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Старая церковь в Петяявеси, в центральной Финляндии, построена из бревен в 1763-1765 гг. Эта провинциальная лютеранская церковь является типичным примером архитектурных традиций, которые уникальны для Восточной Скандинавии. Симметричная планировка церкви Ренессанса соединяется здесь с более старыми формами, берущими начало от готических крестовых сводов.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '佩泰耶韦西老教堂位于芬兰中部，建于1763至1765年，完全由原木建成。这个教堂是路德教派国家特有的教堂，体现了斯堪的纳维亚东部地区独特的传统建筑风格，把文艺复兴时期的中央教堂风格与源于哥特式建筑的穹形天花板特色和谐地结合在一起。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '1763～1765年に建築されたプロテスタントのルター会木造教会。首都ヘルシンキの北、フィンランド中央部にあり、スカンジナビア半島東部独特の伝統的な建築様式をもつ。ルネサンス様式の教会建築に、ゴシック様式に特有の十字形のリブ・ボールトを取り入れている。保存状態はよく、ほぼ建築当時の姿が残っている。',
  '',
  '',
  '',
  'إنّ كنيسة بيتاجافيزي القديمة الواقعة في وسط فنلندا والمبنيّة بجذوع أشجار صنوبر مقشورة بين 1763 و 1765 هي كنيسة لوثرية ريفية تمثل تقليداً هندسياً خاصاً بشرق سكندينافيا. وتجمع هذه الكنيسة ما بين مفهوم كنيسة النهضة ذات تصميم مركّز وأشكال قديمة مشتقّة من سقائف لقبب نتوءات صخرية تعود للحقبة القوطية.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0584_0001-400-400-20090910174931.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Bronze Age Burial Site of Sammallahdenmäki: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Bronze Age Burial Site of Sammallahdenmäki',
  'This Bronze Age burial site features more than 30 granite burial cairns, providing a unique insight into the funerary practices and social and religious structures of northern Europe more than three millennia ago.
Description is available under license CC-BY-SA IGO 3.0',
  'Acest loc de înmormântare din epoca bronzului are peste 30 de gropi de granit, oferind o perspectivă unică asupra practicilor funerare și a structurilor sociale și religioase din nordul Europei în urmă cu mai bine de trei milenii.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'La trentaine de tumulus funéraires en granit du cimetière de l''âge du bronze de Sammallahdenmäki constituent un témoignage exceptionnel des pratiques funéraires et des structures sociales et religieuses de l''Europe du Nord d''il y a plus de trois millénaires.
Description is available under license CC-BY-SA IGO 3.0',
  'Este cementerio de la Edad del Bronce, que posee unos treinta túmulos funerarios de granito, constituye un testimonio incomparable de las prácticas fúnebres y las estructuras sociales y religiosas imperantes en el norte de Europa hace más de tres milenios.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Погребальный комплекс бронзового века содержит более 30 гранитных надгробий-насыпей (cairns) и предоставляет уникальные свидетельства об обычаях погребения, социальных и религиозных структурах, бытовавших в Северной Европе более 3 тыс. лет назад.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '考古学家在塞姆奥拉德恩青铜器时代墓葬遗址发现了30个花岗岩石冢，让人们能够深入研究3000多年前北欧地区的葬礼习俗和社会宗教体系。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'フィンランド北部、ラッピ州。スカンディナヴィア青銅器文化は、紀元前1500年頃から紀元前500年頃まで、フィンランド沿岸地帯や沿岸諸島に花開いた。サンマルラハデンマキの埋葬地にある花崗岩の33の石塚は、3000年以上前のスカンディナヴィアの社会的・精神的構造を見事に解き明かしている。フィンランド最大のもので、このうち28の石塚は明らかに初期青銅器時代のものである。',
  '',
  '',
  '',
  'تشكّل الأبنية الحجرية فوق المقابر ذات الشكل المخروطي المصنوعة من الغرانيت والتي يُقدّر عددها بحوالي ثلاثين والعائدة للعصر البرونزي نموذجاً رائعاً للممارسات الجنائزية والبنى الاجتماعية والدينية في أوروبا الشمالية منذ ما يزيد عن ثلاثة آلاف سنة.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0579_0001-400-400-20090925165115.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Prehistoric Sites and Decorated Caves of the Vézère Valley: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Prehistoric Sites and Decorated Caves of the Vézère Valley',
  'The Vézère valley contains 147 prehistoric sites dating from the Palaeolithic and 25 decorated caves. It is particularly interesting from an ethnological and anthropological, as well as an aesthetic point of view because of its cave paintings, especially those of the Lascaux Cave, whose discovery in 1940 was of great importance for the history of prehistoric art. The hunting scenes show some 100 animal figures, which are remarkable for their detail, rich colours and lifelike quality.
Description is available under license CC-BY-SA IGO 3.0',
  'Valea Vézère conține 147 de situri preistorice datând din paleolitic și 25 de peșteri decorate. Este deosebit de interesant din punct de vedere etnologic și antropologic, precum și din punct de vedere estetic, datorită picturilor sale rupestre, în special cele ale Peșterii Lascaux, a cărei descoperire în 1940 a avut o mare importanță pentru istoria artei preistorice. Scenele de vânătoare prezintă aproximativ 100 de figuri de animale, care sunt remarcabile prin detaliile lor, culorile bogate și calitatea reală.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le site préhistorique de la vallée de la Vézère comporte 147 gisements remontant jusqu''au paléolithique et 25 grottes ornées. Il présente un intérêt exceptionnel d''un point de vue ethnologique, anthropologique et esthétique avec ses peintures pariétales, en particulier celles de la grotte de Lascaux dont la découverte (en 1940) a marqué une date dans l''histoire de l''art préhistorique. Ses scènes de chasse habilement composées comprennent une centaine de figures animales, étonnantes par la précision de l''observation, la richesse des coloris et la vivacité du rendu.
Description is available under license CC-BY-SA IGO 3.0',
  'El sitio prehistórico del valle del Vézère comprende 147 yacimientos arqueológicos y 25 cuevas ornadas con pinturas parietales, que ofrecen un interés antropológico y estético excepcional. Las más importantes se hallan en la cueva de Lascaux, cuyo descubrimiento en 1940 marcó un hito en la historia del arte prehistórico. Las escenas de caza representadas en ellas son de una composición admirable y comprenden cien figuras de animales ejecutadas con un agudo sentido de la observación, que asombran por su gran riqueza de colorido y su vívido realismo.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'В долине реки Везер обнаружено 147 доисторических стоянок, относящихся ко времени палеолита, и 25 пещер с наскальными рисунками. Наибольший интерес с этнологической, антропологической и эстетической точек зрения представляют наскальные росписи, особенно находящиеся в пещере Ласко, открытие которой в 1940 г. имело особую важность для изучения доисторического искусства. Сцены охоты, изображающие около 100 фигур животных, выделяются своей детальностью, богатством цветов и реалистичностью.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '韦泽尔峡谷包括147个旧石器时代的史前遗址和25个内有壁画的洞穴。这里无论是从民族学、人类学还是美学角度来看，都非常令人感兴趣，因为这里的壁画，特别是1940年发现的拉斯科洞岩壁画，对研究人类史前艺术史有着非常重要的意义。壁画中的打猎场面有约100种动物形象，描绘细致，色彩丰富，栩栩如生。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يضمّ موقع وادي فيزير العائد لفترة ما قبل التاريخ 147 منجماَ معدنياً يعود للعصر الحجري القديم و25 مغارة مزيّنة. ويثير هذا الموقع أهميةً بالغة من الناحية السلالية والثقافية-الإنسانية والجمالية برسوم جدارياته، لاسيما جداريات مغارة لاسكو التي شكّل اكتشافها (عام 1940) حقبة هامة في تاريخ الفن العائد لعصور ما قبل التاريخ. وتتضمّن صور الصيد التي رُسمت ببراعة مئات الصور الحيوانية التي تُدُهش بوضوح ملاحظتها وغنى ألوانها، وحيوية تعبيرها.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0085_0001-400-400-20151104175849.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Vézelay, Church and Hill: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Vézelay, Church and Hill',
  'Shortly after its foundation in the 9th century, the Benedictine abbey of Vézelay acquired the relics of St Mary Magdalene and since then it has been an important place of pilgrimage. St Bernard preached the Second Crusade there in 1146 and Richard the Lion-Hearted and Philip II Augustus met there to leave for the Third Crusade in 1190. With its sculpted capitals and portal, the Madeleine of Vézelay – a 12th-century monastic church – is a masterpiece of Burgundian Romanesque art and architecture.
Description is available under license CC-BY-SA IGO 3.0',
  'La scurt timp după întemeierea sa în secolul al IX-lea, mănăstirea benedictină din Vézelay a dobândit moaștele Sfintei Maria Magdalena și de atunci a fost un important loc de pelerinaj. Sfântul Bernard a predicat acolo a doua cruciada în 1146, iar Richard Inima de Leu și Filip al II-lea Augustus s-au întâlnit acolo pentru a pleca la a treia cruciada în 1190. Cu capitelurile și portalul sculptate, Madeleine of Vézelay – o biserică monahală din secolul al XII-lea – este o capodopera a artei și arhitecturii romanice burgunde.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Peu après sa fondation au IXe siècle, le monastère bénédictin a acquis les reliques de sainte Marie-Madeleine et devint, depuis lors, un haut lieu de pèlerinage. Saint Bernard y prêcha la deuxième croisade (1146). Richard Cœur de Lion et Philippe Auguste s''y retrouvèrent au départ de la troisième croisade (1190). La basilique Sainte-Madeleine, église monastique du XIIe siècle, est un chef-d''œuvre de l''art roman bourguignon tant par son architecture que par ses chapiteaux et son portail sculptés.
Description is available under license CC-BY-SA IGO 3.0',
  'Poco después de su fundación en el siglo XI, el monasterio benedictino de Vézelay adquirió las reliquias de Santa María Magdalena y se convirtió en un importante lugar de peregrinación. Aquí fue donde predicó San Bernardo la segunda cruzada (1146), y también donde se encontraron Ricardo Corazón de León y el rey Felipe Augusto de Francia para emprender la tercera (1190). Con su pórtico y capiteles magníficamente esculpidos, la basílica de Santa María Magdalena, iglesia monástica del siglo XII, es una obra maestra del arte y la arquitectura románicas borgoñonas.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Вскоре после своего основания в IX в. бенедиктинский монастырь в Везле приобрел мощи Св. Марии Магдалины и с тех пор стал важным местом паломничества. Св. Бернар провозгласил здесь начало Второго крестового похода, а Ричард Львиное Сердце и Филипп II Август встретились в 1190 г. перед отправлением в Третий поход. Церковь Мадлен в Везле – монастырская церковь XII в. – является шедевром бургундского романского искусства и архитектуры.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '韦兹莱本笃会修道院建于公元9世纪，建成不久后便安置了圣女玛丽亚·马德莱娜(St Mary Magdalene)遗体，从此便成了朝圣要地。1146年，圣贝尔纳多(St Bernard)在此为第二次十字军东征进行了布道。1190年勇猛善战的狮心王理查德和菲利浦二世奥古斯都在此相会，然后踏上了第三次十字军东征的路途。韦兹莱的马德莱大教堂是12世纪的一个修道院式的教堂，柱头和正门都有精美雕刻，是勃艮第罗马式艺术和建筑杰作。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'بعد تشييده في القرن التاسع عشر بفترة وجيزة، استحوذ الدير التابع للرهبان البندكتيين ذخائر القديسة ماري-مادلين وأصبح، منذ ذلك الحين، مكاناً مرموقا يقصده الحجيج. وقد بشر فيه القديس برنار بحربه الصليبية الثانية (عام 1146)، فيما اهتدى إليه كلّ من ريشار قلب الأسد وفيليب أوغست في بداية الحملة الصليبية الثالثة (عام 1190). تُعتبر بازيليك القديسة مادلين، وهي كنيسة رهبانية تعود للقرن الثاني عشر، إحدى تُحف الفن الروماني البرغونيّ النادرة سواء من حيث هندستها أو من حيث بواباتها أو مداخلها المنحوتة.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0084_0064-400-400-20151104180554.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Strasbourg, Grande-Île andNeustadt: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Strasbourg, Grande-Île andNeustadt',
  'The initial property, inscribed in 1988 on the World Heritage List, was formed by the Grande-Île, the historic centre of Strasbourg, structured around the cathedral. The extension concerns the Neustadt, new town, designed and built under the German administration (1871-1918). The Neustadt draws the inspiration for its urban layout partially from the Haussmannian model, while adopting an architectural idiom of Germanic inspiration. This dual influence has enabled the creation of an urban space that is specific to Strasbourg, where the perspectives created around the cathedral open to a unified landscape around the rivers and canals.
Description is available under license CC-BY-SA IGO 3.0',
  'Proprietatea inițială, înscrisă în 1988 pe Lista Patrimoniului Mondial, a fost formată din Grande-Île, centrul istoric al Strasbourgului, structurat în jurul catedralei. Extinderea se referă la Neustadt, oraș nou, proiectat și construit sub administrația germană (1871-1918). Neustadt se inspiră pentru amenajarea sa urbană parțial din modelul haussmannian, adoptând în același timp un idiom arhitectural de inspirație germanică. Această influență dublă a permis crearea unui spațiu urban specific Strasbourgului, unde perspectivele create în jurul catedralei se deschid către un peisaj unitar în jurul râurilor și canalelor.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le bien initial, inscrit en 1988 sur la Liste du patrimoine mondial, est formé de la Grande-Île, centre historique de la ville de Strasbourg, structuré autour de la cathédrale. L’extension concerne la Neustadt, ville nouvelle conçue et réalisée sous administration allemande (1871-1918). Dans sa composition urbaine, la Neustadt s’inspire pour partie du modèle haussmannien, tout en adoptant un vocabulaire architectural d''inspiration germanique. Cette double influence a permis de créer un schéma urbain spécifique à Strasbourg, où les perspectives créées à partir de la cathédrale s’ouvrent sur un paysage unifié organisé autour des cours d’eau et des canaux.
Description is available under license CC-BY-SA IGO 3.0',
  'El sitio inicial, inscrito en 1988 en la Lista del Patrimonio Mundial, esta formado por la llamada Gran Isla, esto es, el centro histórico de Estrasburgo estructurado en torno a su catedral. La extensión engloba la Neustadt, o “Ciudad Nueva”, construida bajo la administración alemana entre 1871 y 1918. El plan urbanístico de la Neustadt se inspira en parte en el modelo “haussmaniano” francés, aunque adopta un vocabulario arquitectónico semejante al alemán. Esta doble influencia franco-germana ha desembocado en un esquema urbano específicamente estrasburgués, en el que las perspectivas trazadas desde la catedral configuran un paisaje singular estructurado en torno a los cursos fluviales y canales que discurren por la ciudad.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  '',
  '',
  'أدرج الموقع الأساسي في قائمة التراث العالمي عام 1988 وكان في البداية يتألف من موقع الجزيرة الكبرى، أي وسط مدينة ستراسبورغ التاريخي، الكائن حول الكاتدرائيّة. وجاء الامتداد ليضم نويشتات، المدينة الجديدة، التي صممت وبنيت في ظل الإدارة الألمانيّة بين عامي 1871-1918. حيث تستمد نويشتات الإلهام من تخطيطها الحضري  للنموذج الهوسماني مع تبني بعض العناصر المعماريّة الألمانية في مبانيها. وقد مكّن هذا التأثير المزدوج من إيجاد مشهد حضريّ يميّز مدينة ستراسبورغ حيث أن المشاهد التي صممت حول الكاتدرائيّة مفتوحة على مشهد موحّد حول الأنهر والقنوات. 
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0495_0003-400-400-20170706170425.webp',
  'Cultural',
  'false', 'false', 'false'
);

COMMIT;

-- UNESCO Heritage Database Fixes
-- Generated: 2026-01-17T16:51:47.217192
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

-- [NEW] Cathedral of Notre-Dame, Former Abbey of Saint-Rémi and Palace of Tau, Reims: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Cathedral of Notre-Dame, Former Abbey of Saint-Rémi and Palace of Tau, Reims',
  'The outstanding handling of new architectural techniques in the 13th century, and the harmonious marriage of sculptural decoration with architecture, has made Notre-Dame in Reims one of the masterpieces of Gothic art. The former abbey still has its beautiful 9th-century nave, in which lie the remains of Archbishop St Rémi (440–533), who instituted the Holy Anointing of the kings of France. The former archiepiscopal palace known as the Tau Palace, which played an important role in religious ceremonies, was almost entirely rebuilt in the 17th century.
Description is available under license CC-BY-SA IGO 3.0',
  'Manipularea remarcabilă a noilor tehnici arhitecturale în secolul al XIII-lea și îmbinarea armonioasă a decorului sculptural cu arhitectura, au făcut din Notre-Dame din Reims una dintre capodoperele artei gotice. Fosta mănăstire are încă frumosul său naos din secolul al IX-lea, în care se află rămășițele arhiepiscopului Sf. Rémi (440–533), care a instituit Sfântul Maslu al regilor Franței. Fostul palat arhiepiscopal cunoscut sub numele de Palatul Tau, care a jucat un rol important în ceremoniile religioase, a fost reconstruit aproape în întregime în secolul al XVII-lea.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'L''utilisation exceptionnelle des nouvelles techniques architecturales du XIIIe siècle et l''harmonieux mariage de la décoration sculptée avec les éléments architecturaux ont fait de la cathédrale Notre-Dame de Reims un des chefs-d''œuvre de l''art gothique. L''ancienne abbaye, qui a conservé une très belle nef du XIe siècle, abrite les restes de l''archevêque saint Rémi (440-533), qui institua la sainte onction des rois de France. Le palais du Tau, ancien palais archiépiscopal, qui occupait une place importante dans la cérémonie du sacre, a été presque entièrement reconstruit au XVIIe siècle.
Description is available under license CC-BY-SA IGO 3.0',
  'La notable aplicación de las nuevas técnicas arquitectónicas del siglo XIII y la armonía entre las esculturas y los elementos arquitectónicos ha hecho de la catedral Notre-Dame de Reims una obra maestra del arte gótico. La antigua abadía donde yace los despojos mortales de Saint-Remi (440-533), el arzobispo que instituyó la unción sagrada de los reyes de Francia, ha conservado una hermosa nave del siglo XI. El palacio Tau, residencia de los arzobispos de Reims y escenario importante de la ceremonia de la unción real, fue reconstruido casi por completo en el siglo XVII.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Выдающийся опыт использования новых архитектурных приемов и гармоничное сочетание скульптурных украшений с архитектурой сделали Нотр-Дам в Реймсе одним из шедевров готического искусства XIII в. Бывший монастырь, где покоятся останки Св. Реми (440-533 гг.) – архиепископа, учредившего священное помазание королей Франции, - сохранил свой великолепный неф IX в. Дворец архиепископов, известный как дворец То и игравший важную роль в религиозных церемониях, был почти полностью перестроен в XVII в.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '13世纪新建筑工艺的出色应用以及雕像装饰与建筑的完美结合，使兰斯圣母大教堂成了哥特式建筑的杰作之一。修道院保留了9世纪的精美中殿，供奉着开启了法国国王受洗仪的圣雷米主教（440年至533年）的遗体。曾经在宗教仪式中具有举足轻重作用的前大主教宫殿——圣安东尼宫，已于17世纪进行了彻底重修。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'フランス北東部、パリの北東約１２５km。ゲルマン国王クローヴィスは500年頃キリスト教の洗礼を受け、ここにゲルマン人の改宗が始まった。ノートル‐ダム大聖堂は１２１１年以来１世紀に及ぶ建設を重ねた盛期ゴシック建築の華で、998～1825年の間歴代フランス国王の戴冠式場。サン‐レミ旧大寺院は第一次世界大戦で甚大な被害を被ったが、11～12世紀創建のロマネスク様式の本堂を残す。ト宮殿は大司教の館であったが、現在は博物館。',
  '',
  '',
  '',
  'إنّ الاستخدام الاستثنائي للتقنيات الهندسية الجديدة في القرن الثالث عشر والتزاوج المتناسق بين الديكور المنحوت بعناصره الهندسية جعلا من كاتدرائية نوتر دام رانس إحدى تُحف الفن القوطي. إنّ الدير القديم الذي حافظ على جناح قديم رائع الجمال يعود للقرن الحادي عشر يضمّ رفاة المطران القديس ريمي (440-533) الذي أنشأ المسحة المقدسة لملوك فرنسا. وأُعيد بناء قصر تو بكامله تقريباً في القرن السابع عشر، وهو قصر أسقفي قديم احتلّ مكانةً هامة في مراسم احتفالات التتويج.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0601_0001-400-400-20251022170159.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Historic Site of Lyon: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Historic Site of Lyon',
  'The long history of Lyon, which was founded by the Romans in the 1st century B.C. as the capital of the Three Gauls and has continued to play a major role in Europe''s political, cultural and economic development ever since, is vividly illustrated by its urban fabric and the many fine historic buildings from all periods.
Description is available under license CC-BY-SA IGO 3.0',
  'Istoria lungă a Lyonului, care a fost fondată de romani în secolul I î.Hr. ca capitală a celor Trei Galii și a continuat să joace un rol major în dezvoltarea politică, culturală și economică a Europei de atunci, este ilustrată în mod viu de țesutul său urban și de numeroasele clădiri istorice frumoase din toate perioadele.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'La longue histoire de Lyon, fondée par les Romains en tant que capitale des Trois Gaules au Ier siècle av. J.-C. et qui n''a cessé de jouer un rôle majeur dans le développement politique, culturel et économique de l''Europe depuis cette époque, est illustrée de manière extrêmement vivante par son tissu urbain et par de nombreux bâtiments historiques de toutes les époques.
Description is available under license CC-BY-SA IGO 3.0',
  'La ciudad de Lyon fue fundada en el siglo I a.C. por los romanos, que establecieron en ella la capital de las Tres Galias. Desde entonces, Lyon ha desempeñado a lo largo de toda su historia un papel importante en el desarrollo político, cultural y económico de Europa. Su estructura urbana y sus numerosos monumentos de todas las épocas son vivos testimonios de esa importancia.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Лион был основан древними римлянами в I в. до н.э. как столица «Трех Галлий». С тех пор город продолжал играть важную роль в политическом, культурном и экономическом развитии Европы. Его долгая история ярко проиллюстрирована городской застройкой и многочисленными прекрасными историческими зданиями разных периодов.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '里昂是一座历史悠久的城市，于公元前1世纪由罗马人创建，曾是高卢三朝首都，在欧洲政治、经济和文化发展中发挥了重要作用。里昂的城市建筑和各个历史时期的大量精美古建筑生动诠释了它悠久的历史。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'フランス南東部、ローヌとソーヌ両河の合流点にある交通の要衝で、紀元前1世紀ローマ人によってガリア３州の首都として建設された。以後ヨーロッパの政治的・文化的・経済的発展に重要な役割を果たしてきたリヨンの長い歴史は、都市の構造やあらゆる時代を通じて多くの見事な建造物に生き生きと反映している。サン・ジャン大聖堂、サン・マルタン・デネー聖堂のほか、大聖堂の南北一帯にはゴシック時代から17世紀に至る邸宅が多い。',
  '',
  '',
  '',
  'مدينة ليون، التي أسسها الرومان على أنها عاصمة جنرالات الغول الثلاثة في القرن الأول قبل الميلاد، والتي استمرتّ في تأدية دور ريادي في التطور السياسي والثقافي والاقتصادي لأوروبا منذ تلك الفترة، يبرز دورها في غاية من الحيوية من خلال نسيجها الإنساني والعمراني ومن خلال المباني التاريخية العديدة التي تعود إلى كافة الحقبات من تاريخها الطويل.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0872_0001-400-400-20250108121347.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Decorated Cave of Pont d’Arc, known as Grotte Chauvet-Pont d’Arc, Ardèche: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Decorated Cave of Pont d’Arc, known as Grotte Chauvet-Pont d’Arc, Ardèche',
  'Located in a limestone plateau of the Ardèche River in southern France, the property contains the earliest-known and best-preserved figurative drawings in the world, dating back as early as the Aurignacian period (30,000–32,000 BP), making it an exceptional testimony of prehistoric art. The cave was closed off by a rock fall approximately 20,000 years BP and remained sealed until its discovery in 1994, which helped to keep it in pristine condition. Over 1,000 images have so far been inventoried on its walls, combining a variety of anthropomorphic and animal motifs. Of exceptional aesthetic quality, they demonstrate a range of techniques including the skilful use of shading, combinations of paint and engraving, anatomical precision, three-dimensionality and movement. They include several dangerous animal species difficult to observe at that time, such as mammoth, bear, cave lion, rhino, bison and auroch, as well as 4,000 inventoried remains of prehistoric fauna and a variety of human footprints.
Description is available under license CC-BY-SA IGO 3.0',
  'Situată pe un platou de calcar al râului Ardèche din sudul Franței, proprietatea conține cele mai vechi și mai bine conservate desene figurative din lume, datând încă din perioada aurignaciană (30.000–32.000 BP), făcându-l o mărturie excepțională a artei preistorice. Peștera a fost închisă de o cădere de stâncă la aproximativ 20.000 de ani BP și a rămas sigilată până la descoperirea ei în 1994, ceea ce a ajutat să o mențină în stare impecabilă. Peste 1.000 de imagini au fost inventariate până acum pe pereții săi, combinând o varietate de motive antropomorfe și animale. De o calitate estetică excepțională, ele demonstrează o gamă largă de tehnici, inclusiv utilizarea cu pricepere a umbririi, combinații de vopsea și gravură, precizie anatomică, tridimensionalitate și mișcare. Acestea includ mai multe specii de animale periculoase greu de observat la acea vreme, cum ar fi mamut, urs, leu de peșteră, rinocer, bizon și auro, precum și 4.000 de rămășițe inventariate ale faunei preistorice și o varietate de urme umane.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Située dans un plateau calcaire traversé par les méandres de la rivière Ardèche, au sud de la France, la grotte recèle les plus anciennes peintures connues à ce jour (période de l’aurignacien : entre 30 000 et 32 000 av. J.-C.). Cette grotte exceptionnelle qui témoigne de l’art préhistorique a été fermée par un éboulement il y a environ 20 000 ans BP et elle est restée scellée jusqu’à sa redécouverte en 1994, ce qui a permis de la conserver de façon exceptionnelle. Plus de 1 000 peintures, aux motifs anthropomorphes ou animaliers, ont été inventoriées sur ses murs. Leur qualité esthétique exceptionnelle témoigne d’une large gamme de techniques, notamment la maîtrise de l''estompe, la combinaison peinture-gravure, la précision anatomique, la représentation tridimensionnelle et du mouvement. On y trouve notamment des représentations d’espèces dangereuses, difficiles à observer pour les hommes de l’époque (mammouths, ours, lions des cavernes, rhinocéros, bisons, aurochs), plus de 4 000 restes de la faune du paléolithique et diverses empreintes de pas humains.
Description is available under license CC-BY-SA IGO 3.0',
  'En este sitio, situado al sur de Francia, en una meseta calcárea del río Ardèche, se hallan los dibujos figurativos más antiguos y mejor conservados del mundo. Realizados en el Periodo Auriñaciense (esto es, entre 30.000 y 32.000 años atrás), estos dibujos constituyen un testimonio excepcional del arte prehistórico. Hace unos 20.000 años, un desprendimiento de rocas cerró herméticamente la entrada de la gruta hasta su hallazgo en 1994, lo cual permitió que se conservara en su estado primigenio. Hasta la fecha se han podido catalogar más de 1.000 imágenes pintadas en sus paredes con una gran variedad de motivos animales y antropomórficos. Su calidad estética es excepcional y su ejecución pone de manifiesto el dominio de toda una serie de técnicas: pericia en el uso de los colores, combinación de la pintura y el grabado, precisión anatómica, tridimensionalidad y sentido del movimiento. Las imágenes muestran diversas especies animales peligrosas y difíciles de observar en esa época (mamuts, osos, gatos monteses, rinocerontes, bisontes y uros), y también se han hallado unos 4.000 restos catalogados de fauna prehistórica y un variado conjunto de huellas humanas.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  'フランス南東部アルデッシュ県の石灰岩台地に位置する約8500㎡のショーヴェ洞窟では、3万年前以上から描かれた世界最古級の壁画が1000点以上も見られる。この洞窟は約2万年前の落石によって閉ざされていたため、1994年に発見された際にもきわめて良好な保存状態を保っていた。マンモスやクマ、ヤマネコ、サイ、バイソンなどが描かれた壁画は解剖学的にも精度が高く、有史以前の人類と動物の関わりや環境を知る手がかりとなると同時に、人類最古の天才的な絵画表現ならびに、その証拠として高い価値を持つ。',
  '',
  '',
  '',
  '',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1426_0004-400-400-20230317123726.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Taputapuātea: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Taputapuātea',
  'Taputapuātea on Ra’iātea Island is at the centre of the ‘Polynesian Triangle’, a vast portion of the Pacific Ocean, dotted with islands, and the last part of the globe to be settled by humans. The property includes two forested valleys, a portion of lagoon and coral reef and a strip of open ocean. At the heart of the property is the Taputapuātea marae complex, a political, ceremonial and funerary centre. It is characterized by several marae, with different functions. Widespread in Polynesia, the marae were places where the world of the living intersected the world of the ancestors and the gods. Taputapuātea is an exceptional testimony to 1,000 years of mā''ohi civilization.
Description is available under license CC-BY-SA IGO 3.0',
  'Taputapuātea de pe Insula Ra’iātea se află în centrul „Triunghiului Polinezian”, o vastă porțiune a Oceanului Pacific, presărată cu insule și ultima parte a globului care a fost colonizată de oameni. Proprietatea include două văi împădurite, o porțiune de lagună și recif de corali și o fâșie de ocean deschis. În centrul proprietății se află complexul Taputapuātea marae, un centru politic, ceremonial și funerar. Se caracterizează prin mai multe marae, cu funcții diferite. Răspândite în Polinezia, marae erau locuri în care lumea celor vii intersecta lumea strămoșilor și a zeilor. Taputapuātea este o mărturie excepțională a 1.000 de ani de civilizație mā''ohi.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Taputapuātea, sur l’île de Ra’iātea, se trouve au cœur du « Triangle polynésien », une vaste portion de l’océan Pacifique parsemée d’îles, dernière partie du globe à avoir été peuplée. Le bien comprend deux vallées boisées, une partie de lagon et de récif corallien, et une bande de pleine mer. Au cœur de ce bien se trouve le marae Taputapuātea, un centre politique, cérémoniel et funéraire. Il se caractérise par plusieurs marae aux fonctions bien distinctes. Répandus en Polynésie, les marae étaient des espaces de liaison entre le monde des vivants et celui des ancêtres et des dieux. Taputapuātea apporte un témoignage exceptionnel de 1 000 ans de civilisation mā''ohi.
Description is available under license CC-BY-SA IGO 3.0',
  'Situado en la isla de Raiatea, el sitio de Taputapuātea se halla en el centro del “Triángulo Polinesio”, la vasta extensión de pequeños archipiélagos del Océano Pacífico que ha sido la última parte del mundo poblada por sociedades humanas. El territorio del sitio comprende dos valles boscosos, una porción de la laguna y del arrecife coralino de la isla, y una zona de mar abierto. En medio de este paisaje típicamente polinesio se halla la “marae” Taputapuātea, un recinto formado por un patio pavimentado con una gran piedra erguida en su centro, que estaba destinado a la celebración de actos políticos, ceremonias religiosas y ritos funerarios. Muy extendidas por toda la Polinesia, las “marae” indicaban el punto de intersección entre el mundo de los vivos y el de los antepasados muertos. Taputapuātea constituye un testimonio excepcional de la civilización mā''ohi, cuya antigüedad se remota a unos mil años atrás.
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
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1529_0020-400-400-20170609175043.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Chaîne des Puys - Limagne fault tectonic arena: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Chaîne des Puys - Limagne fault tectonic arena',
  'Situated in the centre of France, the property comprises the long Limagne fault, the alignments of the Chaîne des Puys volcanoes and the inverted relief of the Montagne de la Serre. It is an emblematic segment of the West European Rift, created in the aftermath of the formation of the Alps, 35 million years ago. The geological features of the property demonstrate how the continental crust cracks, then collapses, allowing deep magma to rise and cause uplifting at the surface. The property is an exceptional illustration of continental break-up – or rifting – which is one of the five major stages of plate tectonics.
Description is available under license CC-BY-SA IGO 3.0',
  'Situată în centrul Franței, proprietatea cuprinde lunga falie Limagne, aliniamentele vulcanilor Chaîne des Puys și relieful inversat al Muntei de la Serre. Este un segment emblematic al Rift-ului vest-european, creat în urma formării Alpilor, acum 35 de milioane de ani. Caracteristicile geologice ale proprietății demonstrează cum scoarța continentală se crăpă, apoi se prăbușește, permițând magmei profunde să se ridice și să provoace ridicarea la suprafață. Proprietatea este o ilustrare excepțională a rupturii continentale - sau riftingului - care este una dintre cele cinci etape majore ale plăcilor tectonice.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Situé au centre de la France, le bien comprend la longue faille de Limagne, l’alignement des volcans de la Chaîne des Puys et le relief inversé de la Montagne de la Serre. Il s’agit d’un élément emblématique du rift ouest-européen, créé dans le sillage de la formation des Alpes, il y a 35 millions d’années. Les caractéristiques géologiques du bien démontrent comment la croûte continentale se fissure, puis s’effondre, permettant au magma profond de remonter et entraînant un soulèvement de la surface. Le bien illustre de manière exceptionnelle le phénomène de rupture continentale – ou rifting –, qui est l’une des cinq principales étapes de la tectonique des plaques.
Description is available under license CC-BY-SA IGO 3.0',
  'Situado en el centro de Francia, este sitio abarca la larga falla tectónica de Limagne, la cadena volcánica de los Puys y el relieve invertido de la Montaña de la Serre. El sitio es un elemento emblemático de la fosa tectónica alargada de Europa Occidental que se formó hace 35 millones de años a raíz de la elevación de los Alpes. Sus características geológicas muestran cómo la corteza continental se agrieta primero y se hunde después, provocando así la ascensión del magma profundo y la consiguiente elevación de la superficie terrestre. Este sitio constituye un ejemplo excepcional del fenómeno de ruptura continental, que es una de las cinco fases principales de la tectónica de placas.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Расположенный в центре Франции, этот объект включает длинный разлом Лимань, цепь вулканических гор Шен-де-Пюи и перевернутый рельеф горы Монтань-де-ла-Серр. Объект является важным элементом западноевропейского разлома, возникшего в результате образования Альп 35 млн. лет назад. Геологические особенности объекта демонстрируют процесс образования разломов, а в дальнейшем - разрушений в материковой земной коре, позволяющим магме подняться из глубоких слоев на поверхность. Объект является выдающимся примером континентального разрушения, или рифтинга, одного из пяти основных этапов тектоники плит.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '构造区位于法国中部，包括长利马涅断层，多姆山链火山群和塞拉山倒转地形。它是西欧裂谷的代表性部分，是在阿尔卑斯山于3500万年前形成之后形成的。这里的地质特征体现了大陆地壳是如何裂开然后塌陷，使得深层岩浆上升并引起地表隆起。该遗产地是大陆分裂的极好例证，大陆分裂是板块构造的5个主要阶段之一。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يضم الموقع، الموجود في وسط فرنسا، وادي "فاي دو ليماين" وسلسلة الجبال البركانية "لا شين دي بوي" والتضاريس المقلوبة في جبل "لا سير". ويعد الموقع معلماً رمزياً لصدع غرب أوروبا الذي تكوّن في القاعدة الأساسية لبنية جبال الألب منذ 35 مليون عام. وتبيّن الخصائص الجيولوجية للموقع كيف تشقّقت القشرة القارية قبل أن تنهار، الأمر الذي أدى إلى صعود الحمم البركانية المنصهرة في باطن الأرض نحو السطح مؤدية إلى ارتفاع مستوى السطح. ويبيّن الموقع بطريقة استثنائية ظاهرة الانجراف القاري التي تعدّ واحدة من الخطوات الخمس الرئيسية لتكتونيات الصفائح.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1434_0004-400-400-20221003104851.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] French Austral Lands and Seas: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'French Austral Lands and Seas',
  'The French Austral Lands and Seas comprise the largest of the rare emerged landmasses in the southern Indian Ocean: the Crozet Archipelago, the Kerguelen Islands, Saint-Paul and Amsterdam Islands as well as 60 small sub-Antarctic islands. This ‘oasis’ in the middle of the Southern Ocean covers an area of more than 166 million ha and supports one of the highest concentrations of birds and marine mammals in the world. In particular, it has the largest population of King Penguins and Yellow-nosed albatrosses in the world. The remoteness of these islands from centres of human activity makes them extremely well-preserved showcases of biological evolution and a unique terrain for scientific research.
Description is available under license CC-BY-SA IGO 3.0',
  'Pământurile și mările australe franceze cuprind cea mai mare dintre masele de uscat rare apărute în sudul Oceanului Indian: Arhipelagul Crozet, Insulele Kerguelen, Insulele Saint-Paul și Amsterdam, precum și 60 de insule mici subantarctice. Această „oază” din mijlocul Oceanului de Sud acoperă o suprafață de peste 166 de milioane de ha și susține una dintre cele mai mari concentrații de păsări și mamifere marine din lume. În special, are cea mai mare populație de pinguini rege și albatroși cu nas galben din lume. Depărtarea acestor insule de centrele de activitate umană le face vitrine extrem de bine conservate ale evoluției biologice și un teren unic pentru cercetarea științifică.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Les Terres et mers australes françaises englobent les plus grandes des rares terres émergées du sud de l’océan Indien : l’archipel Crozet, les îles Kerguelen, Saint-Paul et Amsterdam ainsi que 60 petits îlots situés dans la zone subantarctique. Cette « oasis » au cœur de l’océan Austral, qui couvre une superficie de plus de 166 millions d’hectares, abrite l’une des plus fortes concentrations d’oiseaux et de mammifères marins au monde. On y trouve notamment la plus grande population de manchots royaux et d’albatros de Carter au monde. Du fait de leur éloignement des centres d’activités humaines, ces îles sont des vitrines extrêmement bien préservées de l’évolution biologique, et elles constituent un terrain unique pour la recherche scientifique.
Description is available under license CC-BY-SA IGO 3.0',
  'Este sitio engloba los más extensos de los escasos territorios emergidos al sur del Océano Índico, esto es, los Archipiélagos de Crozet y Kerguelen, así como las islas de Saint-Paul y Nueva Ámsterdam y sesenta islotes más. Situados en el océano Austral que rodea la Antártida, estos territorios y sus mares adyacentes, que cubren una superficie de más de 166 millones de hectáreas, son un remanso de paz para poblaciones de aves y mamíferos marinos que figuran entre las más densas del mundo, o incluso entre las más numerosas, como en el caso del pingüino rey y el albatros de pico amarillo. Debido a su alejamiento de los centros de actividades humanas, estas islas y mares ofrecen un muestrario prácticamente intacto de la evolución biológica y, por consiguiente, son lugares sumamente propicios para la realización de investigaciones científicas.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Французские Южные территории и моря охватывают крупнейшие из немногих островов в южной части Индийского океана: архипелаг Крозе, острова Кергелен, Сен-Поль и Амстердам, а также 60 небольших субантарктических островов. Этот «оазис» в самом сердце Южного океана занимает площадь более 166 миллионов га и является местом одной из самых высоких концентраций птиц и морских млекопитающих в мире, в том числе королевских пингвинов и желтоклювых альбатросов. Ввиду своей удаленности от центров человеческой деятельности эти острова служат хорошо сохранившимся свидетельством биологической эволюции и представляют собой уникальную местность для проведения научных исследований.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '该遗产地包括陆地稀少的南印度洋上最大的几个群岛和岛屿：克罗泽群岛、凯尔盖朗群岛、圣保罗岛和阿姆斯特丹岛，以及约60个小型亚南极岛屿。这片南半球海域上的“绿洲”总计占地16600万公顷，是全世界鸟类和海洋哺乳动物密度最高的地区之一，尤其帝企鹅和黄鼻信天翁数量居全球之冠。由于远离人类活动中心，这些岛屿保存状态完好，是生物演变历程的陈列馆和科学研究的独特场所。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يضم هذا الموقع أكبر مساحة من الأراضي القليلة جنوب المحيط الهندي، وهي: جزر كروزيت وجزر كيرغولين وسانت بول وأمستردام بالإضافة إلى ستين جزيرة صغيرة في منطقة ساب أنتاركتيكا. وتعد هذه "الواحة" الواقعة وسط المحيط الجنوبي، وتغطي مساحة قدرها 661 مليون هكتاراً، موطناً لأكبر أعداد الطيور والثدييات البحرية في العالم. ويوجد فيها أيضاً أكبر عدد من طيور البطريق الملكية وطيور القطرس ذات المنقار الأصفر في العالم. ونظراً لبعد الموقع عن مراكز النشاط البشري، تجسد الجزر فيها هي مسرحاً للتمتع بالتطور البيولوجي وتعدّ أرضاً فريدة لإجراء البحوث العلمية.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1603_0016-400-400-20230222175345.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Cordouan Lighthouse: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Cordouan Lighthouse',
  'The Lighthouse of Cordouan rises up on a shallow rocky plateau in the Atlantic Ocean at the mouth of the Gironde estuary in the Nouvelle-Aquitaine region, in a highly exposed and hostile environment. Built in white limestone dressed blocks at the turn of the 16th and 17th centuries, it was designed by engineer Louis de Foix and remodelled by engineer Joseph Teulère in the late 18th century. A masterpiece of maritime signalling, Cordouan’s monumental tower is decorated with pilasters, columns modillions and gargoyles. It embodies the great stages of the architectural and technological history of lighthouses and was built with the ambition of continuing the tradition of famous beacons of antiquity, illustrating the art of building lighthouses in a period of renewed navigation, when beacons played an important role as territorial markers and as instruments of safety. Finally, the increase of its height, in the late 18th century, and the changes to its light chamber, attest to the progress of science and technology of the period. Its architectural forms drew inspiration from ancient models, Renaissance Mannerism and the specific architectural language of France’s engineering school École des Ponts et Chaussées.
Description is available under license CC-BY-SA IGO 3.0',
  'Farul din Cordouan se ridică pe un platou stâncos de mică adâncime din Oceanul Atlantic, la gura estuarului Girondei din regiunea Nouvelle-Aquitaine, într-un mediu extrem de expus și ostil. Construit în blocuri îmbrăcate de calcar alb la începutul secolelor al XVI-lea și al XVII-lea, a fost proiectat de inginerul Louis de Foix și remodelat de inginerul Joseph Teulère la sfârșitul secolului al XVIII-lea. O capodopera a semnalizarii maritime, turnul monumental al lui Cordouan este decorat cu pilastri, coloane modilioane si garguile. Ea întruchipează marile etape ale istoriei arhitecturale și tehnologice a farurilor și a fost construită cu ambiția de a continua tradiția farurilor celebre din antichitate, ilustrând arta de a construi faruri într-o perioadă de navigație reînnoită, când balizele jucau un rol important ca repere teritoriale și ca instrumente de siguranță. În fine, creșterea înălțimii sale, la sfârșitul secolului al XVIII-lea, și schimbările aduse camerei sale de lumină, atestă progresul științei și tehnologiei perioadei. Formele sale arhitecturale s-au inspirat din modele antice, manierismul renascentist și limbajul arhitectural specific al școlii de inginerie din Franța École des Ponts et Chaussées.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le phare de Cordouan s’élève sur un plateau rocheux peu profond de l’océan Atlantique situé à l’embouchure de l’estuaire de la Gironde en région Nouvelle-Aquitaine, dans un environnement dangereux et inhospitalier. Construit avec des blocs de calcaire blanc entre la fin du XVIe siècle et le début du XVIIe siècle, il fut conçu par l’ingénieur Louis de Foix et remanié par l’ingénieur Teulère à la fin du XVIIIe siècle. Chef-d’œuvre de la signalisation maritime, la tour monumentale de Cordouan est décorée de pilastres, de colonnes, de modillons et de gargouilles. Il représente les grandes phases de l’histoire architecturale et technologique des phares et fut construit avec l’ambition de perpétuer la tradition des phares célèbres de l’Antiquité, témoignant de l’art de la construction des phares pendant une période de développement de la navigation, quand les phares avaient un rôle important en tant que marqueurs territoriaux et dispositifs de sécurité. Enfin, son exhaussement à la fin du XVIIIe siècle et les modifications apportées à sa lanterne témoignent des avancées scientifiques et technologiques de l’époque. Ses formes architecturales se sont inspirées des modèles antiques, du maniérisme de la Renaissance et du langage architectural spécifique de l’institut de formation d''ingénieurs français, l’École des ponts et chaussées.
Description is available under license CC-BY-SA IGO 3.0',
  'Este faro se yergue en una meseta rocosa plana del Océano Atlántico, situada en el estuario de Gironda, en la región de la Nueva Aquitania. Diseñado por el ingeniero Louis de Foix, fue construido con sillares de piedra caliza, entre finales del siglo XVI y principios del XVII, en un medio natural inhóspito y muy expuesto a intemperies y mareas. A finales del siglo XVIII fue remodelado por el ingeniero Joseph Teulère. Ornamentada con pilastras, columnas, modillones y gárgolas, la torre monumental de Cordouan es una obra maestra de la señalización marítima muy representativa de la historia arquitectónica y tecnológica de los faros. Continuadora de las famosas almenaras de tiempos pasados, esta torre es ilustrativa del arte de construir faros en una época en que las técnicas de navegación se habían modernizado y las almenaras seguían desempeñando aún una importante función de demarcadores territoriales y dispositivos de salvamento. Además, la elevación de la altura de la torre y la modernización de su farola a finales del siglo XVIII son un vivo testimonio de los importantes avances científicos y tecnológicos ya logrados en esa época. La arquitectura del faro de Cordouan se inspiró en la de los faros Antigüedad clásica, así como en el manierismo renacentista y en el peculiar estilo arquitectónico de la Escuela de Puentes y Caminos de Francia.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Кордуанский маяк возвышается на мелководном скалистом плато в Атлантическом океане в устье Жиронды, в крайне враждебной и подверженной высокой степени риска среде. Построенный из блоков белого известняка на рубеже XVI и XVII веков, он был спроектирован инженером Луи де Фуа и реконструирован инженером Жозефом Тёлером в конце XVIII века. Шедевр морской сигнальной системы, монументальная башня Кордуана украшена пилястрами, модиллионами колонн и горгульями. Маяк воплощает великие этапы архитектурной и технологической истории маяков и был построен с целью продолжения традиции знаменитых маяков древности, иллюстрируя искусство строительства маяков в период обновленной навигации, когда маяки играли важную роль в качестве территориальных маркеров и инструментов безопасности. Наконец, увеличение его высоты в конце XVIII века и изменения в его световой камере свидетельствуют о прогрессе науки и техники того периода. Его архитектурные формы были вдохновлены древними образцами, маньеризмом эпохи Возрождения и особым архитектурным языком французской инженерной школы École des Ponts et Chaussées.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '科尔杜昂灯塔耸立在大西洋中吉伦特河口的一块礁石平台上，其所处环境高度暴露且十分恶劣。灯塔于16和17世纪之交以白色石灰石砌成，由工程师德福瓦（Louis de Foix）设计。在18世纪末，工程师特莱尔（Joseph Teulère）主持了改造工作。灯塔塔身饰有壁柱、立柱托饰和滴水嘴，是海事通信的杰作。它体现了灯塔建筑和技术史上的伟大阶段。建造者意欲延续古代著名灯塔的传统，在灯塔作为重要领土标志和安全工具的新航海时期展示灯塔建筑艺术。18世纪末灯塔加高和照明设备的更换展示了这一时期科学技术的进步。其建筑形式借鉴了古代范式、文艺复兴时期的风格主义，以及路桥学院特定的建筑语言。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'تنتصب منارة كوردوان فوق هضبة صخرية تقع في المياه الضحلة للمحيط الأطلسي عند مصب الجيروند، في بيئة غير مؤاتية إلى حدٍّ كبير ومعرَّضة بشدة للعوامل الجوية. وقد بُنيت بالأحجار الجيرية البيضاء المنحوتة في نهاية القرن السادس عشر وبداية القرن السابع عشر، حيث صمَّمها المهندس لويس دي فوا وأدخل عليها تعديلات المهندس جوزيف تولير في أواخر القرن الثامن عشر. ويعتبر برج المنارة الضخم من روائع التشوير البحري، تزينه الأعمدة الجدارية الناتئة والمقرنسات. وتجسد المنارة المراحل الهامة للتاريخ المعماري والتكنولوجي للمنارات، إذ بُنيت بغية الاستمرار في التقليد المتَّبع في بناء الفنارات المشهورة في العصور القديمة، لتكون مثالاً على فن بناء المنارات في فترة تجددت فيها الملاحة، وأدَّت فيها الفنارات دوراً هاماً كنقاط علام على اليابسة وكأدوات للسلامة. وأخيراً، تشهد زيادة ارتفاع المنارة في أواخر القرن الثامن عشر والتغييرات التي أُدخلت على حجرة الضوء فيها، على التقدم الذي طرأ على العلوم والتكنولوجيا في ذلك العصر. وقد استلهمت في أشكالها المعمارية من النماذج القديمة ومن الأسلوب المتكلِّف لعصر النهضة ومن النمط المعماري الخاص بالمعهد العالي للجسور والطرق في فرنسا.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1625_0014-400-400-20241028151724.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Nice, Winter Resort Town of the Riviera: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Nice, Winter Resort Town of the Riviera',
  'Nice, located on the Mediterranean, at the foot of the Alps, near the Italian border, in the Provence-Alpes-Côte d’Azur region, reflects the development of a city devoted to winter tourism, making the most of its mild climate and its coastal situation, between sea and mountains. From the mid-18th century, the site attracted growing numbers of aristocratic and upper-class families, mainly British, who developed the habit of spending their winters there. In 1832, Nice, then part of the Kingdom of Sardinia, set up the “Consiglio d’Ornato” which drew up a city planning scheme and architectural requirements designed to make the city attractive to foreigners. Thus, the “Camin dei Ingles”, a modest path which had been created along the coastline by British winter visitors in 1824, subsequently became the prestigious Promenade des Anglais. After the city was ceded to France in 1860, and thanks to its connection to the European rail network, an increasing number of winter visitors from all countries flocked to the city. This led to successive phases of development of new districts beyond the medieval old town. The diverse cultural influences of the winter visitors and the desire to make the most of the weather conditions and the coastal landscape have shaped the urban development and eclectic architectural styles of these districts, contributing to Nice’s reputation as a cosmopolitan winter resort.
Description is available under license CC-BY-SA IGO 3.0',
  'Nisa, situată la Marea Mediterană, la poalele Alpilor, lângă granița cu Italia, în regiunea Provence-Alpi-Coasta de Azur, reflectă dezvoltarea unui oraș dedicat turismului de iarnă, valorificând la maximum clima blândă și situația sa litorală, între mare și munți. De la mijlocul secolului al XVIII-lea, situl a atras un număr tot mai mare de familii aristocratice și de clasă superioară, în principal britanici, care și-au dezvoltat obiceiul de a-și petrece iarna acolo. În 1832, Nisa, pe atunci parte a Regatului Sardiniei, a înființat „Consiglio d’Ornato” care a elaborat o schemă de urbanism și cerințe arhitecturale menite să facă orașul atractiv pentru străini. Astfel, „Camin dei Ingles”, o potecă modestă care fusese creată de-a lungul coastei de către vizitatorii britanici de iarnă în 1824, a devenit ulterior prestigioasa Promenade des Anglais. După ce orașul a fost cedat Franței în 1860 și datorită conexiunii sale la rețeaua feroviară europeană, un număr tot mai mare de vizitatori de iarnă din toate țările s-au înghesuit în oraș. Acest lucru a dus la faze succesive de dezvoltare a unor noi cartiere dincolo de orașul vechi medieval. Diversele influențe culturale ale vizitatorilor de iarnă și dorința de a profita la maximum de condițiile meteorologice și de peisajul de coastă au modelat dezvoltarea urbană și stilurile arhitecturale eclectice ale acestor districte, contribuind la reputația Nisei ca stațiune de iarnă cosmopolită.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Nice, située sur la Méditerranée, au pied des Alpes près de la frontière italienne, en région Provence-Alpes-Côte d’Azur, témoigne de l’évolution d’une ville consacrée à la villégiature climatique hivernale, tirant parti de la douceur du climat et de sa situation de riviera, entre mer et montagnes. À partir du milieu du XVIIIe siècle, le site attira de plus en plus de familles aristocratiques et de la haute société, principalement britanniques, qui prirent l’habitude d’y passer leurs hivers. En 1832, Nice, appartenant alors au royaume de Piémont-Sardaigne, mit en place le « Consiglio d’Ornato », qui élabora un plan régulateur et des prescriptions architecturales visant à rendre la ville attrayante pour les étrangers. C’est ainsi que, le « Camin dei Ingles », modeste chemin qui avait été créé en 1824 par les hivernants britanniques le long du rivage, devint par la suite la prestigieuse Promenade des Anglais. Après que la ville fut cédée à la France en 1860, et grâce à son raccordement au réseau ferré européen, un nombre croissant d’hivernants de tous les pays, a afflué dans la ville, menant ainsi aux phases successives d’aménagement de nouveaux quartiers au-delà de la vieille ville médiévale. Les influences culturelles diverses exercées par les hivernants et le désir de tirer le meilleur parti des conditions climatiques et du paysage de riviera, ont façonné l’urbanisme et les styles architecturaux éclectiques de ces quartiers, contribuant à la renommée de Nice en tant que ville cosmopolite de villégiature d’hiver.
Description is available under license CC-BY-SA IGO 3.0',
  'Niza, situada en el mediterrénao, al pie de los Alpes, cerca de la frontera italiana, en la región de Provenza-Alpes Costa Azul, refleja el desarrollo de una ciudad dedicada al turismo invertal, sacando el máximo partido de su clima empleado y de su situación en la costa, entre el mar y la montaña. Desde mediados del siglo XVIII, Niza atrajo a un número cada vez mayor de familias aristocráticas y de clase alta, principalmente británicas, que acostumbraban a pasar allí los inviernos. En 1832, Niza, que entonces formaba parte del Reino de Cerdeña, creó el “Consiglio d’Ornato”, que desarrolló un plan regulador urbanístico destinado a hacerla atractiva para los extranjeros. Poco después, el “Camin dei Inglesi”, un modesto sendero de dos metros de ancho a lo largo de la orilla del mar creado por visitantes británicos en 1824, se amplió para convertirse en un prestigioso paseo marítimo, conocido como Promenade des Anglais (Paseo de los ingleses). Tras la cesión de la ciudad a Francia, en 1860, y gracias a su conexión con la red europea de ferrocarriles, comenzaron a llegar a la ciudad cada vez más visitantes invernales de todos los países. Ello condujo a sucesivas fases de desarrollo de nuevos distritos junto a la antigua ciudad medieval.  Las diversas influencias culturales de los residentes invernales y el deseo de aprovechar al máximo las condiciones climáticas y el paisaje del lugar, configuraron la planificación urbana y los estilos arquitectónicos eclécticos de esos barrios, contribuyendo al renombre de la ciudad como estación invernal cosmopolita.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Средиземноморский город Ницца, расположенный недалеко от границы с Италией, является свидетелем эволюции зимнего климатического курорта в связи с мягким климатом города и его расположением у подножия Альп. С середины XVIII века Ницца привлекала все большее число аристократических семей и семей высшего сословия, в основном британцев, которые проводили здесь зимы. В 1832 году в Ницце, в то время входившей в состав Королевства Савойя-Пьемонт-Сардиния, был принят план городского развития, направленный на то, чтобы сделать город привлекательным для иностранцев. Вскоре после этого Camin dei Inglesi, скромная тропа шириной 2 метра вдоль морского берега, была расширена и превратилась в престижную набережную, известную как Английская набережная после того, как город был передан Франции в 1860 году. В течение следующего столетия в город из других стран стекалось всё большее число желающих провести здесь зиму, в частности гости из России, что привело к последовательным этапам развития новых районов рядом со старым средневековым городом. Многообразие культурных влияний зимних гостей города и желание максимально использовать климатические условия и ландшафт местности сформировали городское планирование и эклектичный архитектурный стиль этих районов, способствуя растущей славе города как космополитического зимнего курорта.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '地中海城市尼斯临近意大利边境，由于阿尔卑斯山脚下的温和气候和滨海地理位置，她见证了冬季气候型度假胜地的演变。从18世纪中叶开始，尼斯吸引了越来越多贵族和上流社会家庭前来越冬，他们主要来自英国。1832年，当时尚属萨丁尼亚王国的尼斯实施了一项旨在提高对外国人的吸引力的城市管理规划。此后不久，一条2米宽的滨海小道被扩建成享有盛誉的步行街，在1860年尼斯被割让给法国后，这条街被称为英国人步行大道。在接下来的一个世纪里，越来越多的来自其他国家，特别是俄罗斯的冬季居民涌入这座城市，推动了毗邻中世纪古城的新区域的持续发展。冬季居民的异域文化影响，以及充分利用当地气候条件和风景的愿望，塑造了该地区的城市规划和兼收并蓄的建筑风格，使这座城市成为知名的国际性冬季度假胜地。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'تقع مدينة نيس في منطقة البحر الأبيض المتوسط على مقربة من الحدود الإيطالية، وتقف شاهداً على تطوّر المنتجعات الشتوية بفضل ما تتسم به من مناخ معتدل، ناهيك عن موقعها المحاذي للبحر عند سفح جبال الألب. وأضحت مدينة نيس، منذ منتصف القرن الثامن عشر، وجهة تجذب أعداداً متزايدة من العائلات الأرستقراطية وأُسر الطبقة العليا، لا سيما الأُسر البريطانية، التي اعتادت قضاء فصول الشتاء فيها. واعتمدت مدينة نيس في عام 1832، حينما كانت جزءاً مما كان يُعرف باسم "مملكة بييمونتي سردينيا"، خطة حضرية تنظيمية هدفها جعل المدينة أكثر جاذبية للأجانب. وسرعان ما جرى توسيع مسار "كامين داي إنجليزي"، وهو طريق بعرض المترَين على طول ساحل البحر، ليصبح بمثابة منتزه مرموق يُعرف باسم "منتزه الإنجليز"، وذلك بعدما جرى التنازل عن المدينة لصالح فرنسا في عام 1860. وتوافدت أعداد متزايدة من الزوار الأجانب، لا سيما من روسيا، إلى المدينة خلال القرن التالي بحثاً عن أماكن لقضاء فصل الشتاء. وشهدت المنطقة جرّاء ذلك وعلى مراحل متعاقبة إنشاء مناطق جديدة على مقربة من المدينة التي تعود إلى القرون الوسطى. وبفعل الطيف الواسع من التأثيرات الثقافية لزوار الشتاء، مشفوعاً بالرغبة في تحقيق الاستفادة القصوى من الظروف المناخية والأجواء التي تعم المكان، تبلورت أشكال التخطيط الحضري والأنماط الانتقائية في العمارة في هذه المناطق، وسرعان ما حصدت المدينة شهرة كبيرة كمنتجع شتوي عالميّ.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1635_0004-400-400-20220408112252.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] The Maison Carrée of Nîmes: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'The Maison Carrée of Nîmes',
  'Built in the 1st century AD in the Roman colony of Nemausus – today’s city of Nîmes in the Occitanie region– the Maison Carrée is one of the earliest examples of a Roman temple which can be connected to the imperial worship in the provinces of Rome. Dedicated to the presumptive heirs of Augustus, the princes of Youth, prematurely deceased, this building confirmed the control of Rome on the conquered territory while expressing in a symbolic way the allegiance and attachment of the people from the city of Nemausus to Augustus’ dynasty. The architecture of the Maison Carrée and its sophisticated decoration took part, symbolically, in the dissemination of Augustus ideologic program which turned the Ancient Rome from republic to empire, thus opening a new golden age bearer of promises of peace, prosperity and stability known by the name of Pax Romana.
Description is available under license CC-BY-SA IGO 3.0',
  'Construită în secolul I d.Hr. în colonia romană Nemausus – orașul de astăzi Nîmes din regiunea Occitanie – Maison Carrée este unul dintre cele mai vechi exemple de templu roman care poate fi conectat la cultul imperial din provinciile Romei. Dedicată prezumților moștenitori ai lui Augustus, principii Tineretului, decedați prematur, această clădire a confirmat controlul Romei pe teritoriul cucerit, exprimând în același timp într-un mod simbolic loialitatea și atașamentul oamenilor din orașul Nemausus față de dinastia lui Augustus. Arhitectura Maison Carrée și decorația sa sofisticată au participat, în mod simbolic, la diseminarea programului ideologic Augustus care a transformat Roma Antică din republică în imperiu, deschizând astfel o nouă epocă de aur purtătoare de promisiuni de pace, prosperitate și stabilitate cunoscută sub numele de Pax Romana.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Édifiée au I er siècle de notre ère dans la colonie romaine de Nemausus – l’actuelle ville de Nîmes en région Occitanie –, la Maison Carrée est un des premiers exemples de temple romain qui peut être associé au culte impérial dans les provinces de Rome. Dédié aux héritiers présomptifs d’Auguste, les Princes de la jeunesse, prématurément décédés, cet édifice affirma le contrôle de Rome sur le territoire qu’elle avait conquis, tout en exprimant de manière symbolique l’allégeance et l’attachement de la population de la ville de Nemausus à la dynastie d’Auguste. L’architecture de la Maison Carrée de Nîmes et sa décoration soigneusement élaborée participaient symboliquement à la diffusion du programme idéologique d’Auguste, qui fit basculer la Rome antique de la république à l’empire, ouvrant ainsi un nouvel âge d’or porteur de promesses de Paix, de prospérité et de stabilité connu sous le nom de Pax Romana.
Description is available under license CC-BY-SA IGO 3.0',
  'Erigida en el siglo I d.C. en la colonia romana de Nemausus -la actual Nîmes, Francia-, la Maison Carrée es un ejemplo temprano de templo romano asociado al culto imperial en las provincias de Roma. Dedicado a los herederos prematuramente fallecidos de Augusto, los Príncipes de la Juventud, este edificio fomentaba el control de Roma sobre su territorio conquistado, al tiempo que anunciaba simbólicamente la lealtad de la población de la ciudad de Nemausus a la línea dinástica de Augusto. La arquitectura y la elaborada decoración comunicaban simbólicamente el programa ideológico de Augusto, que transformó la Antigua Roma de república en imperio, iniciando una nueva edad de oro conocida como Pax Romana.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Возведенный в I в. н.э. в римской колонии Немаус (современный Ним во Франции) Мезон Карре представляет собой ранний образец римского храма, характерного для императорских культов в провинциях Рима. Посвященный преждевременно умершим наследникам Августа, «принцам юности», этот храм способствовал установлению контроля Рима над завоеванной территорией и символически объявлял о верности населения города Немауса династической линии Августа. Архитектура и сложный декор символически передавали идеологическую программу Августа, который превратил Древний Рим из республики в империю, открыв новый золотой век, известный как Pax Romana.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '方形神殿建于公元1世纪，所在地当时为罗马殖民地内矛苏斯（今法国尼姆）。它是罗马帝国在行省建立君主崇拜相关神庙的早期范例。这里供奉的是奥古斯都早逝的继承者、青年王子。这一建筑巩固了罗马对其征服领土的控制，同时象征性宣示内矛苏斯城居民对奥古斯都王朝的效忠。奥古斯都将古罗马从共和国转变为帝国，开启了被称为“罗马治世”的新黄金时代。神殿建筑及其精致的装饰都融入了他的思想纲领。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'شُيّد ميزون كاري في القرن الأول الميلادي في مستعمرة نيموسوس الرومانية – مدينة نيم الحالية في فرنسا - وهي أحد الأمثلة المبكرة للمعابد الرومانية المرتبطة بالعبادة الإمبراطورية في المقاطعات الرومانية. كُرّس هذا الصرح لورثة أغسطس الذين توفوا قبل أوانهم، وهم أمراء الشباب، وعزّز هذا الصرح سيطرة روما على الأراضي التي احتلتها واعتُبر بمثابة إعلان رمزيّ لولاء سكان مدينة نيموسوس لسلالة أغسطس الحاكمة. ترمز الهندسة المعمارية والزخارف المتقنة إلى البرنامج الأيديولوجي لأغسطس، الذي نقل روما القديمة من جمهورية إلى إمبراطورية، ودشّن عصرًا ذهبيًا جديدًا يُعرف باسم "السلام الروماني".
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1569_0037-400-400-20250829133011.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Volcanoes and Forests of Mount Pelée and the Pitons of Northern Martinique: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Volcanoes and Forests of Mount Pelée and the Pitons of Northern Martinique',
  'The global significance of Mount Pelée and Pitons du Carbet is based on its representation of volcanic processes and forest types. The 1902 eruption is considered the deadliest volcanic event of the 20th century, and a worldwide reference for the history of volcanology. All the forest types and the diversity of endemic plants of the Lesser Antilles are represented in the serial property, within forest continuums ranging from the seashore to the volcanic summits. The property is home to globally threatened species such as the Martinique Volcano Frog (Allobates chalcopis) and the Martinique Oriole (Icterus bonana), two strict endemics.
Description is available under license CC-BY-SA IGO 3.0',
  'Semnificația globală a Muntelui Pelée și Pitons du Carbet se bazează pe reprezentarea proceselor vulcanice și a tipurilor de pădure. Erupția din 1902 este considerată cel mai mortal eveniment vulcanic al secolului al XX-lea și o referință mondială pentru istoria vulcanologiei. Toate tipurile de pădure și diversitatea plantelor endemice din Antilele Mici sunt reprezentate în proprietatea în serie, în continuum-uri forestiere de la malul mării până la vârfurile vulcanice. Proprietatea găzduiește specii amenințate la nivel global, cum ar fi broasca vulcanului Martinica (Allobates chalcopis) și Oriolea Martinica (Icterus bonana), două endemice stricte.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'L’importance mondiale de la montagne Pelée et des pitons du Carbet s’appuie sur la représentativité des processus volcaniques et des types forestiers. L’éruption de 1902, considérée comme l’événement volcanique le plus meurtrier du XXème siècle, est une référence mondiale dans l’histoire de la volcanologie. Tous les types forestiers et la diversité des plantes endémiques des petites Antilles sont représentés dans le bien en série, au sein de continuums forestiers allant du littoral aux sommets volcaniques. Le bien abrite des espèces menacées sur le plan mondial, notamment l’Allobate de la Martinique (Allobates chalcopis) et l’Oriole de Martinique (Icterus bonana), deux espèces endémiques strictes.
Description is available under license CC-BY-SA IGO 3.0',
  'La importancia mundial dela montaña Pelada y de los pitones del Carbet se debe a que presenta características, materiales y procesos volcánicos. La erupción de 1902-1905 es considerada como un acontecimiento clave para la historia de la vulcanología que causó un impacto dramático en la ciudad de Saint Pierre, con la trágica pérdida de vidas y un legado que continúa siendo parte de la cultura de Martinica. El sitio seriado alberga especies que están amenazadas a escala mundial, como la rana del volcán de Martinica (Allobates chalcopis), la serpiente de tierra de Lacépède (Erythrolamprus cursor) y la oropéndola endémica de Martinica (Icterus bonana).
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Мировое значение Мон-Пеле и горных вершин Питон-дю-Карбе обусловлено тем, что они демонстрируют вулканические особенности, материалы и процессы. Извержение 1902-1905 гг. считается ключевым событием в истории вулканологии, оказавшим сильнейшее влияние на город Сен-Пьер, приведшим к трагическим жертвам, и ставшим частью культурного наследия Мартиники.
На территории объекта обитают такие виды, как мартиникская вулканическая лягушка (Allobates chalcopis), земляная змея Ласепеда (Erythrolamprus cursor) и эндемичный мартиникский цветной трупиал (Icterus bonana), находящиеся под угрозой исчезновения.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '培雷火山和卡尔贝山脉因其火山地貌、喷发物和形成过程而具有全球意义。1902-1905年的火山喷发被视为火山学史上的重要事件，对圣皮埃尔市造成严重影响，酿成众多人丧生的悲剧，有关记忆也成为马提尼克文化的一部分。这一系列遗产是多个全球受威胁物种的家园，例如马提尼克火山蛙（Allobates chalcopis）、拉塞佩德地蛇（Erythrolamprus cursor）和当地特有的马提拟鹂（Icterus bonana）。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يضم خليج هالونغ، في خليج تونكين زهاء 1600 جزيرة وجزيرة صغيرة، الأمر الذي يرسم منظراً بحرياً خلاباً لأعمدة الحجر الجيري. وتضم أجزاء الموقع الجديدة العديد من جزر الحجر الجيري وأعمدة الحجر الجيري الشاهقة المرتفعة من البحر، مع الشقوق والأقواس والكهوف المتآكلة التي تشكّل مناظر طبيعية خلابة ورائعة. ويوجد في الموقع سبعة أنواع رئيسيّة من النظم البيئية، وتؤوي المنطقة مجموعة من الأصناف السمتوطنة والمهددة مثل قرد لانجور الأبيض الرأس، وأبو بريص كاتب با تايجر غيكو، والقضاعة الشرقية الصغيرة المخالب.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1657_0002-400-400-20240502112024.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Te Henua Enata – The Marquesas Islands: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Te Henua Enata – The Marquesas Islands',
  'Located in the South Pacific Ocean, this mixed serial property bears an exceptional testimony to the territorial occupation of the Marquesas archipelago by a human civilisation that arrived by sea around the year 1000 CE and developed on these isolated islands between the 10th and the 19th centuries. It is also a hotspot of biodiversity that combines irreplaceable and exceptionally well conserved marine and terrestrial ecosystems. Marked by sharp ridges, impressive peaks and cliffs rising abruptly above the ocean, the landscapes of the archipelago are unparalleled in these tropical latitudes. The archipelago is a major centre of endemism, home to rare and diverse flora, a diversity of emblematic marine species, and one of the most diverse seabird assemblages in the South Pacific. Virtually free from human exploitation, Marquesan waters are among the world’s last marine wilderness areas. The property also includes archaeological sites ranging from monumental dry-stone structures to lithic sculptures and engravings.
Description is available under license CC-BY-SA IGO 3.0',
  'Situată în Oceanul Pacific de Sud, această proprietate în serie mixtă deține o mărturie excepțională a ocupării teritoriale a arhipelagului Marquesas de către o civilizație umană care a sosit pe mare în jurul anului 1000 d.Hr. și s-a dezvoltat pe aceste insule izolate între secolele al X-lea și al XIX-lea. Este, de asemenea, un punct fierbinte al biodiversității, care combină ecosisteme marine și terestre de neînlocuit și excepțional de bine conservate. Marcate de creste ascuțite, vârfuri impresionante și stânci care se ridică brusc deasupra oceanului, peisajele arhipelagului sunt de neegalat în aceste latitudini tropicale. Arhipelagul este un centru major al endemismului, adăpostește o floră rară și diversă, o diversitate de specii marine emblematice și una dintre cele mai diverse adunări de păsări marine din Pacificul de Sud. Practic libere de exploatarea umană, apele marchizeze sunt printre ultimele zone sălbatice marine din lume. Proprietatea include, de asemenea, situri arheologice, de la structuri monumentale din piatră uscată până la sculpturi și gravuri litice.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Situé dans l’océan Pacifique Sud, ce bien mixte en série constitue un témoignage exceptionnel de l’occupation territoriale de l’archipel des Marquises par une civilisation humaine arrivée par la mer autour de l’an 1000 de notre ère et qui s’est développée sur ces îles isolées entre le Xe et le XIXe siècle. Il s’agit également d’un point chaud de la biodiversité qui combine des écosystèmes marins et terrestres irremplaçables et exceptionnellement bien conservés. Marqués par des crêtes acérées, des pics spectaculaires et des falaises s’élevant abruptement au-dessus de l’océan, les paysages de cet archipel n’ont pas d’équivalent sous ces latitudes tropicales. L’archipel est un important centre d’endémisme, abritant une flore rare et variée, une diversité d’espèces marines emblématiques et l’un des ensembles d’oiseaux marins les plus diversifiés du Pacifique Sud. Pratiquement exemptes d’exploitation humaine, les eaux marquisiennes comptent parmi les dernières zones marines sauvages du monde. Le bien comprend également des sites archéologiques allant de structures monumentales en pierre sèche à des sculptures et gravures lithiques.
Description is available under license CC-BY-SA IGO 3.0',
  'Este conjunto de sitios mixto, ubicado en el océano Pacífico Sur, constituye un testimonio excepcional de la ocupación territorial del archipiélago de las Marquesas por una civilización humana que llegó por mar en torno al año 1000 e. c., y se desarrolló en estas islas aisladas entre los siglos X y XIX. También es una región clave para la biodiversidad que combina ecosistemas marinos y terrestres irreemplazables y excepcionalmente bien conservados. Los paisajes del archipiélago, que están marcados por crestas afiladas, picos impresionantes y acantilados que se elevan abruptamente sobre el océano, no tienen parangón en estas latitudes tropicales. El archipiélago también constituye un centro importante de endemismo, albergando una flora diversa y única, una gran variedad de especies marinas emblemáticas y una de las agrupaciones de aves marinas más diversas del Pacífico Sur. Las aguas marquesanas, prácticamente libres de explotación humana, se encuentran entre las últimas áreas silvestres marinas del mundo. El sitio también incluye yacimientos arqueológicos que abarcan desde estructuras monumentales de piedra seca a esculturas y grabados líticos.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Этот смешанный серийный объект расположен в южной части Тихого океана. На его территории сохранились уникальные свидетельства того, что Маркизские острова были заселены человеческой цивилизацией, которая около 1000 г. н. э. прибыла сюда морским путем и развивалась на этих изолированных островах с X по XIX век. Это также очаг биоразнообразия, в котором сосредоточены исключительные по ценности и хорошо сохранившиеся морские и наземные экосистемы. Ландшафты архипелага, покрытые острыми хребтами, впечатляющими пиками и скалами, возвышающимися над океаном, не имеют аналогов в этих тропических широтах. Архипелаг является крупным центром эндемизма и домом для редкой и разнообразной флоры, множества ценных морских видов и одного из самых разнообразных скоплений морских птиц в южной части Тихого океана. Благодаря тому, что воды около Маркизских островов практически не подвергаются антропогенной нагрузке, они являются одним из последних в мире морских районов с нетронутой природой. На территории заповедника также находятся археологические памятники — от монументальных каменных сооружений до каменных скульптур и гравировок.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '马克萨斯（Marquesas）群岛位于南太平洋。公元1000年前后，人类从海上抵达这些偏远岛屿。该混合系列遗产是这一过程及其于10-19世纪间的繁衍生息的绝佳例证。这里也是生物多样性热点地区，拥有无可替代、保存完好的海洋和陆地生态系统。群岛以陡峭的山脊、雄伟的山峰和高耸的临海峭壁为特色，其自然景观在同纬度热带地区无与伦比。它是重要的特有物种中心，拥有珍稀且多样的植物、丰富的标志性海洋物种，以及南太平洋种类最为繁多的海鸟种群。马克萨斯水域几乎未经人类开发，是世界上所剩不多的海洋荒野区。岛上还保留着大型干砌石结构、石雕、石刻等考古遗迹。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يقف هذا الموقع المختلط المتسلسل في جنوب المحيط الهادي شاهداً استثنائياً على استيطان الحضارة البشرية في أراضي خليج الماركيز بعدما وصلت إليها بحراً بحدود العام 1000 ميلادياً، وأخذت بالازدهار بين القرنَين العاشر والتاسع عشر على هذه الجزر المعزولة. وتمثل هذه الجزر أيضاً موطناً لتنوع بيولوجيّ يضم نظماً بيئية بحرية وبريّة لا غنى عنها وحوفظ عليها بصورة استثنائية. ويتميز هذا الموقع بتضاريسه الجبلية الوعرة، حيث تتناغم القمم المهيبة والمنحدرات الشاهقة التي تباغت الناظرين وترتفع من حيث لا تدري عن سطح المحيط، لترسم لوحةً لا مثيل لها في هذه المناطق الاستوائية. يُعتبر الأرخبيل مركزاً رئيسياً للتوطن ويؤوي نباتات نادرة ومتنوعة، ويحتضن مجموعة متنوعة من الأنواع البحرية الرمزية، كما أنه موطنٌ لأحد أكثر تجمعات الطيور البحرية تنوعاً في جنوب المحيط الهادي. وتعتبر المياه الماركيزية بمنأى نوعاً ما عن الاستغلال البشري، الأمر الذي يجعل منها واحدة من آخر المناطق البرية البحرية في العالم. ويوجد في الموقع أيضاً مواقع أثرية مثل الهياكل الحجرية الضخمة والمنحوتات الصخرية والنقوش.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1707_0008-400-400-20241029093646.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Megaliths of Carnac and of the shores of Morbihan: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Megaliths of Carnac and of the shores of Morbihan',
  'This serial property in Brittany, France, features a dense concentration of megalithic structures built during the Neolithic period (c. 5000–2300 BCE), carefully aligned with the area’s unique geomorphology. These monumental stone constructions—arranged in relation to one another and to natural features like terrain and waterways—reflect a sophisticated understanding of the environment. Rich engravings and associated artifacts further illustrate the cultural complexity of the societies that inhabited this part of the European Atlantic coast.
Description is available under license CC-BY-SA IGO 3.0',
  'Această proprietate în serie din Bretania, Franța, prezintă o concentrație densă de structuri megalitice construite în perioada neolitică (aproximativ 5000–2300 î.Hr.), atent aliniate cu geomorfologia unică a zonei. Aceste construcții monumentale din piatră – aranjate între ele și cu caracteristicile naturale precum terenul și căile navigabile – reflectă o înțelegere sofisticată a mediului. Gravurile bogate și artefactele asociate ilustrează și mai mult complexitatea culturală a societăților care locuiau această parte a coastei atlantice europene.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Situé en Bretagne (France), ce bien en série comprend une forte densité de structures mégalithiques érigées durant la période néolithique – entre 5000 et 2300 avant notre ère, en tenant compte des spécificités géomorphologiques du territoire. Ces structures monumentales en pierre, alignées selon la topographie et l’hydrographie locales, témoignent d’une compréhension fine du milieu environnant. Le riche répertoire de gravures et d’objets précieux témoignent de l’occupation de la côte atlantique européenne par des sociétés qui ont développé une relation complexe avec leur environnement naturel.
Description is available under license CC-BY-SA IGO 3.0',
  'Esta zona de Bretaña, Francia, alberga una densa concentración de estructuras megalíticas construidas durante el Neolítico (c. 5000-2300 a.C.) cuidadosamente alineadas con la geomorfología única de la zona. Estas monumentales construcciones de piedra, dispuestas en relación entre sí y con elementos naturales como el terreno y los cursos de agua, reflejan una sofisticada comprensión del entorno. Ricos grabados y artefactos asociados ilustran además la complejidad cultural de las sociedades que habitaron esta parte de la costa atlántica europea.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Этот объект, расположенный в Бретани, Франция, представляет собой плотное скопление мегалитических сооружений, возведенных в период неолита (около 5000–2300 гг. до н.э.). Эти монументальные каменные постройки тщательно ориентированы с учетом уникальной геоморфологии местности. Их расположение — как друг относительно друга, так и относительно таких природных элементов, как ландшафт и водные пути, — свидетельствует о глубоком понимании окружающей среды теми, кто их создал. Многочисленные гравировки и артефакты дополнительно подчеркивают культурную сложность обществ, населявших эту часть Атлантического побережья Европы.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '这处位于法国布列塔尼大区的系列遗产，集中分布着大量造于新石器时代（约公元前5000-前2300年）的巨石遗迹，其布局与当地独特的地貌巧妙呼应。这些宏伟石构建筑既彼此协调排列，又呼应地形走势或水道流向，体现出先民对环境的深刻认知。遗址中丰富的刻纹及器物进一步展示了欧洲大西洋沿岸这一地区的社会文化复杂性。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يضم هذا العنصر المتسلسل الواقع في منطقة بريتاني بفرنسا عدداً كبيراً من الهياكل الصخرية الضخمة التي شُيّدت خلال العصر الحجري الحديث (من 5000 إلى 2300 عاماً قبل الميلاد) بصورة تتماشى بعناية مع الخصائص الفريدة لعلم شكل الأرض في المنطقة. هذه الهياكل الحجرية الضخمة، المصطفة بصورة تراعي مختلف الهياكل وكذلك العناصر الطبيعية من تضاريس ومجاري مائية، مرآةٌ لفهم البيئة فهماً عميقاً. وتوضّح النقوش والآثار ذات الصلة بصورة مستفيضة مدى تعقيد وعمق ثقافة المجتمعات التي استوطنت هذا الجزء من الساحل الأطلسي الأوروبي.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1725_0012-400-400-20250626180126.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Ivindo National Park: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Ivindo National Park',
  'Situated on the equator in northern Gabon the largely pristine site encompasses an area of almost 300,000 ha crossed by a network of picturesque blackwater rivers. It features rapids and waterfalls bordered by intact rainforest, which make for a landscape of great aesthetic value. The site’s aquatic habitats harbour endemic freshwater fish species, 13 of which are threatened, and at least seven species of Podostemaceae riverweeds, with probable micro-endemic aquatic flora at each waterfall. Many fish species in the property are yet to be described and parts of the site have hardly been investigated. Critically Endangered Slender-snouted Crocodiles (Mecistops cataphractus) find shelter in Ivindo National Park which also boasts biogeographically unique Caesalpinioideae old-growth forests of high conservation value, supporting, for instance, a very high diversity of butterflies alongside threatened flagship mammals and avian fauna such as the Critically Endangered Forest Elephant (Loxodonta cyclotis), Western Lowland Gorilla (Gorilla gorilla), the Endangered Chimpanzee (Pan troglodytes) and Grey Parrot (Psittacus erithacus) as well as the Vulnerable Grey-necked Rockfowl (Picathartes oreas), Mandrill (Mandrillus sphinx), Leopard (Panthera pardus), and African Golden Cat (Caracal aurata), and three species of Pangolin (Manidae spp.).
Description is available under license CC-BY-SA IGO 3.0',
  'Situat la ecuator, în nordul Gabonului, situl în mare parte curat cuprinde o suprafață de aproape 300.000 ha străbătută de o rețea de râuri pitorești de apă neagră. Are repezi și cascade mărginite de pădure tropicală intactă, ceea ce creează un peisaj de mare valoare estetică. Habitatele acvatice ale sitului adăpostesc specii endemice de pești de apă dulce, dintre care 13 sunt amenințate și cel puțin șapte specii de buruieni de râu Podostemaceae, cu o floră acvatică micro-endemică probabilă la fiecare cascadă. Multe specii de pești din proprietate nu au fost încă descrise și părți ale sitului au fost cu greu investigate. Crocodilii cu bot subțire (Mecistops cataphractus) în pericol critic găsesc adăpost în Parcul Național Ivindo, care se mândrește, de asemenea, cu păduri vechi Caesalpinioideae unice din punct de vedere biogeografic, de mare valoare de conservare, susținând, de exemplu, o diversitate foarte mare de fluturi alături de mamiferele emblematice amenințate, cum ar fi fauna aviară Crit Elphane Endanger și Crit Elphane. (Loxodonta cyclotis), gorila de vest de câmpie (Gorilla gorilla), cimpanzeul pe cale de dispariție (Pan troglodytes) și papagalul cenușiu (Psittacus erithacus), precum și păsările vulnerabile cu gât cenușiu (Picathartes oreas), mandril (Mandrillus sphinx), leopardul (Panthera aurii pardus) și trei specii africane (Manidae spp.).
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Situé sur l’équateur, dans le nord du Gabon, le site, essentiellement intact, s’étend sur près de 300 000 hectares traversés par un réseau de rivières d’eau noire pittoresques. Il comprend des rapides et des chutes bordées par des forêts humides intactes, ce qui en fait un paysage d’une grande valeur esthétique. Les habitats aquatiques abritent des espèces de poissons endémiques, dont 13 espèces sont considérées comme menacées, au moins sept espèces d’herbes aquatiques Podostemaceae et, sans doute, une faune aquatique micro-endémique de chaque chute. De nombreuses espèces de poissons du bien ne sont pas encore décrites et certaines parties du site sont encore à peine explorées. Le crocodile à long museau (Mecistops cataphractus), en danger critique d’extinction, trouve refuge dans le parc national de l’Ivindo qui s’enorgueillit aussi de posséder des forêts climaciques uniques très anciennes à Caesalpinioideae et de haute valeur pour la conservation, abritant, par exemple, une très grande diversité de papillons ainsi que des espèces menacées de mammifères emblématiques et d’oiseaux comme l’éléphant de forêt (Loxodonta cyclotis) et le gorille de l’Ouest (Gorilla gorilla) En danger critique d’extinction, le chimpanzé (Pan troglodytes) et le perroquet gris (Psittacus erithacus) En danger, ainsi que le picatharte du Cameroun (Picathartes oreas), le mandrill (Mandrillus sphinx), le léopard (Panthera pardus) et le chat doré (Caracal aurata) Vulnérables, et trois espèces de pangolins (Manidae spp.).
Description is available under license CC-BY-SA IGO 3.0',
  'Situado en el ecuador, en el norte de Gabón, este sitio, en gran parte prístino, abarca una superficie de casi 300.000 hectáreas atravesadas por una red de pintorescos ríos de aguas negras. Cuenta con rápidos y cascadas bordeados por una selva tropical intacta, que conforman un paisaje de gran valor estético. Los hábitats acuáticos del lugar albergan especies endémicas de peces de agua dulce, 13 de las cuales están amenazadas, y al menos siete especies de algas fluviales Podostemaceae, con una probable flora acuática microendémica en cada cascada. Todavía no se han descrito muchas especies de peces en el sitio, algunas de cuyas partes han sido escasamente investigadas. Los cocodrilos de hocico fino (Mecistops cataphractus), en peligro crítico, encuentran refugio en el Parque Nacional de Ivindo, que también cuenta con bosques antiguos de Caesalpinioideae, únicos desde el punto de vista biogeográfico y de gran valor para la conservación que albergan, por ejemplo, una gran diversidad de mariposas junto con mamíferos emblemáticos amenazados y fauna aviar como el elefante de bosque (Loxodonta cyclotis), en peligro crítico, el gorila occidental de llanura (Gorilla gorilla),el chimpancé (Pan troglodytes) y el loro gris (Psittacus erithacus) en peligro de extinción, así como el picatartes cuelligrís (Picathartes oreas), que es vulnerable, el mandril (Mandrillus sphinx), el leopardo (Panthera pardus), el gato dorado africano (Caracal aurata), y tres especies de pangolín (Manidae spp.).
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Расположенная на экваторе в северной части Габона, эта в основном нетронутая местность занимает площадь около 300000 га, пересекаемую сетью живописных черноводных рек. В парке есть пороги и водопады, окаймленные нетронутым тропическим лесом, что придает ландшафту значительную эстетическую ценность. В водных средах обитания этого объекта обитают эндемичные виды пресноводных рыб, 13 из которых находятся в угрожаемом положении, и по меньшей мере семь видов речных Подостемовых с возможной микроэндемичной водной флорой на территории каждого водопада. Многие виды рыб, обитающие на территории Национального парка Ивиндо, еще не описаны, а отдельные участки парка практически не исследованы. Находящийся на грани полного исчезновения узкорылый крокодил (Mecistops cataphractus) находит убежище в Национальном парке Ивиндо, который также может похвастаться биогеографически уникальными древними лесами Цезальпиниевых, имеющими высокую природоохранную ценность и поддерживающими, например, очень большое разнообразие бабочек наряду с находящимися в угрожаемом положении флагманскими видами млекопитающих и птиц, такими как находящиеся на грани полного исчезновения лесной слон (Loxodonta cyclotis) и западная равнинная горилла (Gorilla gorilla), исчезающие виды шимпанзе (Pan troglodytes) и попугай Жако (Psittacus erithacus), а также уязвимые виды восточная лысая ворона (Picathartes oreas), мандрил (Mandrillus sphinx), леопард (Panthera pardus) и золотая кошка (Caracal aurata), а также три вида панголинов (Manidae spp.).
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '伊温多国家公园位于加蓬北部的赤道地区，覆盖了近30万公顷的原始土地，美丽的黑水河水网密布其间。原始热带雨林与穿行的激流和瀑布构成了一个极具美学价值的景观。这里的水生栖息地孕育着特有的淡水鱼类（其中13种濒危）、至少7种川苔草科植物，以及可能存在于每个瀑布的微型特有水生植物。该遗产地的多个鱼类物种尚未得到记录，部分区域几乎从未经过勘察。极度濒危的非洲狭吻鳄在伊温多国家公园找到了栖身之所。该公园还拥有生物地理学上独特的具有极高保护价值的苏木亚科原始森林，它支持着多种多样的蝴蝶以及濒危的标志性哺乳动物和鸟类，如极危物种非洲森林象、西部低地大猩猩，濒危物种黑猩猩、非洲灰鹦鹉，易危的灰颈岩鹛、山魈、花豹、非洲金猫，以及3种穿山甲。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يوجد الموقع على خط الاستواء في شمال غابون ولا يزال يحافظ على رونقه الأصلي إلى حدّ كبير، ويمتد على مساحة تصل إلى ما يقارب 300 ألف هكتار، وتعبره شبكة من أنهار المياه السوداء الخلّابة. ويحتضن الموقع أيضاً مجموعة من الشلالات والأنهار المُنسدلة في أحضان غابات مطيرة لم يمسّ الزمن شيئاً من طبيعتها. وتضفي هذه العناصر على قيمة جمالية كبيرة. وتحتضن الموائل المائية في الموقع أصنافاً مستوطنة من أسماك المياه العذبة، من بينها 13 صنفاً مهدداً، وسبعة أصناف على الأقل من أعشاب الأنهار التابعة للفصيلة البدوستمونية، وينفرد كل شلال في الموقع بنباتات وأعشاب مائية مستوطنة في محيطه دون غيره. وتجدر الإشارة إلى أنّ العديد من أصناف الأسماك المتواجدة في الموقع تفتقر إلى الوصف الوافي، مع العلم أيضاً أنّ بعض أجزاء الموقع بالكاد خضعت للبحوث. وتلتمس التماسيح المهددة بالانقراض بصورة خطيرة المأوى في حديقة آيفيندو الوطنية التي تحتضن غابات نبات عائلة العَنْدَمَاوَات المعمّرة ذات الطابع الفريد التي لِحِفظِها قيمة كبيرة، إذ يأوي الموقع على سبيل المثال طيفاً واسعاً ومتنوّعاً من الفراشات والثدييات المهددة بالانقراض والطيور المهددة بالانقراض بصورة كبيرة مثل فيلة الغابة وغوريلا السهول الغربية والشمبانزي المهدد بالانقراض والببغاء الرمادي الأفريقي والدجاج الصخري الرمادي العنق وميمون أبو الهول أو "المادريل" والنمر والسنور الذهبي الأفريقي، فضلاً عن ثلاثة أصناف من النمل الحرشفي.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1653_0011-400-400-20231107171518.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Gelati Monastery: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Gelati Monastery',
  'Founded in 1106 in the west of Georgia, the Monastery of Gelati is a masterpiece of the Golden Age of medieval Georgia, a period of political strength and economic growth between the 11th and 13th centuries. It is characterized by the facades of smoothly hewn large blocks, balanced proportions and blind arches for exterior decoration. The Gelati monastery, one of the largest medieval Orthodox monasteries, was also a centre of science and education and the Academy it housed was one of the most important centres of culture in ancient Georgia.
Description is available under license CC-BY-SA IGO 3.0',
  'Fondată în 1106 în vestul Georgiei, Mănăstirea Gelati este o capodoperă a Epocii de Aur a Georgiei medievale, o perioadă de forță politică și creștere economică între secolele XI și XIII. Se caracterizează prin fațade din blocuri mari cioplite fin, proporții echilibrate și arcade oarbe pentru decorarea exterioară. Mănăstirea Gelati, una dintre cele mai mari mănăstiri ortodoxe medievale, a fost și un centru de știință și educație, iar Academia pe care o găzduia era unul dintre cele mai importante centre de cultură din Georgia antică.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le Monastère de Ghélati, situé à l’ouest de la Géorgie et fondé en 1106, est un chef-d’œuvre de « l’Âge d’or » de la Géorgie médiévale, période de puissance politique et d’essor économique entre le XIe et le XIIIe siècles. Le monastère se caractérise par des façades de grands blocs de pierre taillés et polis, des proportions équilibrées et la décoration extérieure des arcades aveugles. Le monastère de Ghélati, l’un des plus grands monastères orthodoxes médiévaux, était aussi un centre de science et d’éducation, et l’académie installée dans son enceinte était l’un des plus importants centres de culture de l’ancienne Géorgie.
Description is available under license CC-BY-SA IGO 3.0',
  'Situado al oeste del país, este cenobio se fundó en 1106 y es una obra maestra de la arquitectura medieval de la “edad de oro” del poder político y económico de Georgia (siglos XI a XIII). El edificio monacal se caracteriza por sus fachadas construidas con grandes sillares pulimentados de proporciones equilibradas, así como por su ornamentación exterior con arcos ciegos. Ghelati fue uno de los monasterios ortodoxos más grandes de la Edad Media y además albergó en su recinto un centro docente y científico que lo convirtió en uno de los focos de irradiación cultural más importantes de la antigua Georgia.
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
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0710_0007-400-400-20150630134857.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Colchic Rainforests and Wetlands: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Colchic Rainforests and Wetlands',
  'The property comprises seven component parts, within an 80km long corridor along the warm-temperate and extremely humid eastern coast of the Black Sea. They provide a series of the most typical Colchic ecosystems at altitudes ranging from sea level to more than 2,500 metres above it. The main ecosystems are ancient deciduous Colchic rainforests and wetlands, percolation bogs and other mire types of the distinct Colchic mire region. The extremely humid broad-leaved rainforests comprise a highly diverse flora and fauna, with very high densities of endemic and relict species, with significant numbers of globally threatened species and relict species, which survived the glacial cycles of the Tertiary. The site is home to approximately 1,100 species of vascular and non-vascular plants, including 44 threatened vascular plan species, and almost 500 species of vertebrates, and a high number of invertebrate species. The site also harbours 19 threatened animal species including sturgeon, notably the critically endangered Colchic Sturgeon. It is a key stopover for many globally threatened birds that migrate through the Batumi bottleneck.
Description is available under license CC-BY-SA IGO 3.0',
  'Proprietatea cuprinde șapte părți componente, pe un coridor lung de 80 km de-a lungul coastei de est cald-temperate și extrem de umede a Mării Negre. Acestea oferă o serie de ecosisteme cele mai tipice Colchic la altitudini care variază de la nivelul mării până la peste 2.500 de metri deasupra acestuia. Principalele ecosisteme sunt pădurile tropicale și zonele umede vechi de foioase Colchic, mlaștini de percolare și alte tipuri de mlaștină din regiunea distinctă de mlaștină Colchic. Pădurile tropicale cu frunze late extrem de umede cuprind o floră și o faună foarte diversificată, cu densități foarte mari de specii endemice și relicte, cu un număr semnificativ de specii amenințate la nivel global și specii relicte, care au supraviețuit ciclurilor glaciare din Terțiar. Situl găzduiește aproximativ 1.100 de specii de plante vasculare și nevasculare, inclusiv 44 de specii de plan vascular amenințate și aproape 500 de specii de vertebrate și un număr mare de specii de nevertebrate. Situl găzduiește, de asemenea, 19 specii de animale amenințate, inclusiv sturionii, în special sturionul colhic, pe cale critică de dispariție. Este o escală esențială pentru multe păsări amenințate la nivel global care migrează prin gâtul de sticlă Batumi.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le bien comprend sept éléments constitutifs dans un corridor de 80 km de long bordant le littoral oriental tempéré chaud et extrêmement humide de la mer Noire. Ces éléments constituent une série altitudinale quasi complète des écosystèmes les plus typiques de la Colchide, du niveau de la mer à plus de 2 500 m d’altitude. Les principaux écosystèmes sont des forêts pluviales anciennes et décidues de Colchide et des zones humides, des tourbières de percolation et autres types de milieux tourbeux de la région de Colchide. Les forêts pluviales de feuillus, très humides, abritent une flore et une faune extrêmement diverses et présentent de très fortes densités d’espèces endémiques et reliques, notamment un nombre important d’espèces menacées au plan mondial et d’espèces reliques ayant survécu aux cycles glaciaires du Tertiaire. Le bien abrite environ 1 100 espèces de plantes vasculaires et non vasculaires, dont 44 espèces de plantes non vasculaires menacées, ainsi que près de 500 espèces de vertébrés et un grand nombre d’espèces d’invertébrés. Le site constitue également l’habitat de 19 espèces animales menacées, notamment l’esturgeon, et en particulier l’esturgeon du Danube, en danger critique. Il s’agit d’un site d’étape clé pour de nombreux oiseaux menacés au plan mondial qui migrent à travers le goulot d’étranglement de Batumi. 
Description is available under license CC-BY-SA IGO 3.0',
  'Este sitio consta de siete componentes situados en un amplio corredor de 80 kilómetros de longitud extendido a lo largo de la costa oriental del Mar Negro, cuyo clima es cálido templado y muy húmedo. Esos componentes albergan un conjunto de los ecosistemas más característicos de la región de la Cólquida, escalonados desde el nivel del mar hasta más de 2.500 metros de altura, entre los que destacan antiguos bosques pluviales caducifolios, humedales, turberas y otros tipos de zonas pantanosas específicas de la región. Los frondosos bosques pluviales de hoja ancha, extremadamente húmedos, albergan una flora y una fauna muy diversas que se caracterizan por la alta densidad de sus especies vivas endémicas y arcaicas, supervivientes de los ciclos glaciares del Periodo Terciario. El sitio cuenta con unas 1.100 especies de plantas de todas clases, entre las que figuran 44 plantas vasculares en peligro de extinción, y además es el hábitat de casi 500 especies de animales vertebrados y de poblaciones muy numerosas de invertebrados. De los 19 animales amenazados de desaparición que viven en la región, el esturión de la Cólquida es el que se halla en una situación más crítica. El sitio constituye, además, un área de escala esencial para muchas especies de aves migratorias en peligro de extinción a nivel mundial que transitan por la zona de Batumi, uno de los lugares del mundo con mayor concentración de paso de esta clase de aves.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Объект состоит из семи составных частей в пределах 80-километрового коридора вдоль умеренно-теплого и очень влажного восточного побережья Черного моря. Объект представляет собой ряд наиболее типичных колхидских экосистем на высотах от уровня моря до более 2500 м над уровнем моря. Основными экосистемами являются древние колхидские лиственные тропические леса и водно-болотные угодья, перколяционные болота и другие виды болот, характерные для региона колхидских болот. Влажные широколиственные тропические леса являются местом обитания для разнообразной флоры и фауны с очень высокой плотностью эндемичных и реликтовых видов, со значительным количеством видов, находящихся в угрожаемом положении в глобальном масштабе, и реликтовых видов, которые пережили ледниковые циклы третичного периода. На территории объекта обитает около 1100 видов сосудистых и несосудистых растений, в том числе 44 вида сосудистых растений, находящихся в угрожаемом положении, а также почти 500 видов позвоночных и большое количество видов беспозвоночных. На территории объекта также обитают 19 видов животных, находящихся в угрожаемом положении, в том числе осетровые, в частности, находящийся на грани полного исчезновения колхидский осетр. Объект является ключевой остановкой для многих видов птиц, находящихся в угрожаемом положении в глобальном масштабе, которые мигрируют через узкие пути Батуми.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '该遗产地由7个部分组成，沿暖温带极其潮湿的黑海东海岸分布，纵向长度约80公里。这里有一系列最典型的科尔基斯生态系统，从海平面一直延伸到海拔2500多米以上。主体为古老的科尔基斯落叶雨林及湿地、渗透沼泽和其它科尔基斯沼泽地区独有的泥沼类型。极度潮湿的阔叶雨林由高度多样化的动植物群组成，具有非常高密度的孑遗特有种，以及大量在第三纪冰期中幸存下来的全球濒危物种和孑遗物种。该遗产地是大约1100种维管束植物和非维管束植物的家园，包括44种濒危维管植物，以及近500种脊椎动物和大量的无脊椎动物。该地区还栖息着19种濒危动物，包括鲟鱼，特别是极度濒危的科尔基斯鲟。此处还是许多通过巴统廊道迁徙的全球濒危鸟类的关键中继站。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يتألَّف الموقع من سبعة عناصر موزَّعة داخل ممرّ طوله 80 كم على امتداد الساحل الشرقي للبحر الأسود، الذي يمتاز بالحرارة الدافئة والرطوبة الشديدة. وتُعتبر هذه العناصر بمثابة سلسلة من نُظُم كولخيس البيئية المميّزة والموزّعة على ارتفاعات تبدأ من مستوى سطح البحر وتصل إلى أكثر من 2500 متر فوق مستوى سطح البحر. وتضم أبرز النظم البيئية في الموقع غابات كولخيس النفضية المطيرة وأراضيها الرطبة، وأراضي الخث الرشحيّة وغيرها من أنواع مستنقعات الخث في منطقة كولخيس المميّزة. وتأوي الغابات المطيرة الشديدة الرطوبة والعريضة الأوراق طيفاً واسعاً للغاية من الأصناف النباتية والحيوانية، وتشهد تواجداً مكثفاً للغاية للأنواع القديمة المتبقية والأنواع المستوطنة، وعدداً كبيراً من الأنواع المهددة بالانقراض على الصعيد العالمي والأنواع المستوطنة، التي نجت من الدورات الجليدية إبّان العصر الجليدي الثالث. ويعتبر الموقع موطناً لزهاء 1100 نوع من النباتات الوعائية وغير الوعائية، من بينها 44 نوعاً من النباتات الوعائية المهددة بالانقراض، وزهاء 500 نوع من الفقاريات، فضلاً عن عدد كبير من فصائل اللافقاريات. ويحتوي الموقع كذلك الأمر على 19 فصيلة من الحيوانات المهددة، من بينها الأسماك الحفشية، ولا سيما أسماك كولخيس الحفشية المهددة بالانقراض. ويندرج الموقع في عداد المحطات الرئيسية التي تتوقف فيها العديد من الطيور المهددة على الصعيد العالمي، والمهاجرة عبر باتومي.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1616_0011-400-400-20211126120348.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Castles of Augustusburg and Falkenlust at Brühl: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Castles of Augustusburg and Falkenlust at Brühl',
  'Set in an idyllic garden landscape, Augustusburg Castle (the sumptuous residence of the prince-archbishops of Cologne) and the Falkenlust hunting lodge (a small rural folly) are among the earliest examples of Rococo architecture in 18th-century Germany.
Description is available under license CC-BY-SA IGO 3.0',
  'Amplasate într-un peisaj de grădină idilic, Castelul Augustusburg (reședința somptuoasă a prinților-arhiepiscopi din Köln) și cabana de vânătoare Falkenlust (o mică nebunie rurală) sunt printre cele mai timpurii exemple de arhitectură rococo din Germania secolului al XVIII-lea.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Dans le cadre idéal d''un paysage de jardins, le château d''Augustusburg, somptueuse résidence des princes-archevêques de Cologne, et le pavillon de Falkenlust, petite « folie » champêtre, sont parmi les premières manifestations du style rococo dans l''Allemagne du XVIIIe siècle.
Description is available under license CC-BY-SA IGO 3.0',
  'El palacio de Augustusburgo fue la suntuosa residencia de los arzobispos-príncipes de Colonia. En medio de los espléndidos jardines que lo rodean se halla el pabellón de Falkenlust, una casita de recreo de estilo rural. Ambas construcciones figuran entre las primeras obras arquitectónicas del arte rococó en la Alemania del siglo XVIII.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Дворец Аугустусбург, роскошная резиденция кëльнских князей-архиепископов, и охотничий замок Фалькенлуст расположены в идиллическом садовом ландшафте. Эти здания относятся к самым ранним образцам архитектуры рококо в Германии XVIII в.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '奥古斯塔斯堡周围风景优美，颇具田园风情，这里曾是科洛涅(Cologne)大主教奢华的住所，而法尔肯拉斯特古堡(the Falkenlust hunting lodge)则是一处狩猎场（小规模乡下活动）。这两个建筑都是18世纪德国洛可可风格最早的杰作。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يقع قصر أغسطسبرغ في إطار مثالي من الجمال ضمن مجموعة حدائق وهو مقر فخم لأمراء – أساقفة كولونيا. ويُضاف إليه جناح فولكنلاست، وهو "شهوة" زراعية صغيرة شيّدت في الحقول، ليشكّل المبنيان أوائل براعم نمط الروكوكو في المانيا في القرن الثامن عشر.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0288_0010-400-400-20140708150345.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Hanseatic City of Lübeck: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Hanseatic City of Lübeck',
  'Lübeck – the former capital and Queen City of the Hanseatic League – was founded in the 12th century and prospered until the 16th century as the major trading centre for northern Europe. It has remained a centre for maritime commerce to this day, particularly with the Nordic countries. Despite the damage it suffered during the Second World War, the basic structure of the old city, consisting mainly of 15th- and 16th-century patrician residences, public monuments (the famous Holstentor brick gate), churches and salt storehouses, remains unaltered.
Description is available under license CC-BY-SA IGO 3.0',
  'Lübeck – fosta capitală și oraș regina Ligii Hanseatice – a fost fondată în secolul al XII-lea și a prosperat până în secolul al XVI-lea ca principal centru comercial pentru nordul Europei. A rămas până astăzi un centru pentru comerțul maritim, în special cu țările nordice. În ciuda pagubelor suferite în timpul celui de-al Doilea Război Mondial, structura de bază a orașului vechi, constând în principal din reședințe patriciene din secolele al XV-lea și al XVI-lea, monumente publice (celebra poartă de cărămidă Holstentor), biserici și depozite de sare, rămâne nealterată.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Ancienne capitale de la Ligue hanséatique et reine de la Hanse, elle a été fondée au XIIe siècle et fut jusqu''au XVIe siècle la métropole du négoce pour toute l''Europe du Nord. Elle reste encore aujourd''hui un centre de commerce maritime, spécialement avec les pays nordiques. Malgré les dommages qu''elle a subis durant la Seconde Guerre mondiale, la structure de la vieille ville est conservée avec ses résidences patriciennes des XVe et XVIe siècles, ses monuments publics (notamment la célèbre porte fortifiée en brique de la Holstentor), ses églises et ses greniers à sel.
Description is available under license CC-BY-SA IGO 3.0',
  'Antigua capital y ciudad reina de la Liga Hanseática, Lübeck fue fundada en el siglo XII y hasta el siglo XVI fue la principal metrópoli comercial de la Europa Septentrional. Actualmente sigue siendo un importante centro de comercio marítimo, sobre todo con los países nórdicos. Pese a los daños sufridos durante la Segunda Guerra Mundial, se ha conservado la estructura de la ciudad antigua con sus mansiones señoriales de los siglos XV y XVI, sus iglesias, sus depósitos de sal y sus monumentos públicos como la famosa puerta fortificada de Holstentor, construida en ladrillo.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Любек, бывшая столица и главный город Ганзейского союза, был основан в XII в. и процветал до XVI в. как главный центр торговли на севере Европы. В наше время Любек остается центром морской торговли, в основном со странами Северной Европы. Несмотря на повреждения, нанесенные во время Второй мировой войны, сохранилась структура Старого города, где находятся относящиеся к XV-XVI вв. патрицианские особняки, общественные здания и сооружения (включая знаменитые кирпичные ворота Хольштентор и соляные склады).
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '吕贝克，汉萨同盟(the Hanseatic League)的前首都和皇后城，建于公元12世纪，作为北欧的重要商业中心曾一度繁荣, 直到16世纪。今天，这里仍是海上商贸中心（尤其与北欧国家的海上贸易）。尽管在第二次世界大战中受到了一定的损毁，这座老城的基本城市结构还是保留了下来，这点从15世纪至16世纪建造的贵族居所，历史古迹（如著名的豪斯顿砖门）、教堂和盐场等都能够看出来。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'ドイツ北部、シュレスヴィッヒ＝ホルシュタイン州の都市。大聖堂は、ザクセン地方様式の影響を残すドイツ最古のレンガ造りロマネスク聖堂で、後にゴシック様式に改造された。ザンクト・マリーエンは13世紀の大改築で、フランスのスワッソン大聖堂に範をとった壮大なレンガ造りゴシック聖堂に生まれ変わった。隣接する市庁舎とは機能的に密接に関連し、議員は会議に先立ってミサに参加し、集会を聖堂で行った。',
  '',
  '',
  '',
  'إنها العاصمة القديمة للتحالف (الهانزي) التجاري وملكة الهانزا. لقد تأسست المدينة في القرن السابع وبقيت حتى القرن السادس عشر مدينة التبادلات التجارية لكل أوروبا الشمالية. لا تزال حتى اليوم مركزاً للتجارة البحرية ولا سيما مع الدول الشمالية. على الرغم من الأضرار التي لحقت بها خلال الحرب العالمية الثانية، لا تزال بنية المدينة القديمة قائمة بمقرات النبلاء التي تعود إلى القرنين الخامس عشر والسادس عشر وبنصبها العامة (لا سيما الباب الشهير المعزز المصنوع من القرميد القادم من هولتنستور) وكنائسها ومخازن الملح فيها.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0272_0005-400-400-20251217174651.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Abbey and Altenmünster of Lorsch: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Abbey and Altenmünster of Lorsch',
  'The abbey, together with its monumental entrance, the famous ''Torhall'', are rare architectural vestiges of the Carolingian era. The sculptures and paintings from this period are still in remarkably good condition.
Description is available under license CC-BY-SA IGO 3.0',
  'Abația, împreună cu intrarea sa monumentală, faimoasa „Torhall”, sunt vestigii arhitecturale rare ale epocii carolingiene. Sculpturile și picturile din această perioadă sunt încă în stare remarcabil de bună.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'L''ensemble formé par l''abbaye et son entrée monumentale, la célèbre « Torhalle », est un rare témoignage architectural de l''époque carolingienne, avec des sculptures et des peintures de cette période remarquablement bien conservées.
Description is available under license CC-BY-SA IGO 3.0',
  'El conjunto formado por la abadía y su monumental entrada, la famosa “Torhalle”, es uno de los raros testimonios arquitectónicos de la época carolingia. Sus esculturas y pinturas, que datan también de este período, se hallan en un excelente estado de conservación.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Монастырь вместе с монументальным входом – известным «Торхоллом» - является редким архитектурным памятником эпохи Каролингов (VIII-IX вв.). Скульптуры и живопись этого периода все еще находятся в очень хорошем состоянии.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '洛尔施修道院及其颇具纪念意义的入口——著名的“托尔哈尔”(Torhall)是卡洛林时代(the Carolingian era) 珍贵的建筑遗迹，那时遗留下来的雕刻和绘画都保存得十分完好。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'إن المجموعة التي تتشكل من الدير ومدخله العظيم المعروف باسم "تورهال" هو أحد الآثار النادرة التي تعود إلى الحقبة الكارولينية بمنحوتاتها ورسومها المحفوظة بطريقة جيدة جداً.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0515_0004-400-400-20260114153231.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Mines of Rammelsberg, Historic Town of Goslar and Upper Harz Water Management System: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Mines of Rammelsberg, Historic Town of Goslar and Upper Harz Water Management System',
  'The Upper Harz mining water management system, which lies south of the Rammelsberg mines and the town of Goslar, has been developed over a period of some 800 years to assist in the process of extracting ore for the production of non-ferrous metals. Its construction was first undertaken in the Middle Ages by Cistercian monks, and it was then developed on a vast scale from the end of the 16th century until the 19th century. It is made up of an extremely complex but perfectly coherent system of artificial ponds, small channels, tunnels and underground drains. It enabled the development of water power for use in mining and metallurgical processes. It is a major site for mining innovation in the western world.
Description is available under license CC-BY-SA IGO 3.0',
  'Sistemul de management al apei miniere din Harz superior, care se află la sud de minele Rammelsberg și orașul Goslar, a fost dezvoltat pe o perioadă de aproximativ 800 de ani pentru a ajuta procesul de extragere a minereului pentru producerea de metale neferoase. Construcția sa a fost întreprinsă pentru prima dată în Evul Mediu de călugării cistercieni, iar apoi a fost dezvoltată pe scară largă de la sfârșitul secolului al XVI-lea până în secolul al XIX-lea. Este alcătuită dintr-un sistem extrem de complex, dar perfect coerent de iazuri artificiale, canale mici, tuneluri și drenuri subterane. Acesta a permis dezvoltarea energiei apei pentru utilizare în procesele miniere și metalurgice. Este un site major pentru inovarea minieră în lumea occidentală.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le système de gestion hydraulique minier du Haut-Harz, au sud des mines de Rammelsberg et de la ville de Golsar, accompagne l''exploitation de minerais pour la production de métaux non ferreux, depuis près de 800 ans. Il a été entrepris au Moyen Âge par les moines cisterciens et fut ensuite développé à grande échelle de la fin du 16e au 19e siècle. Il est constitué d’un système très complexe mais parfaitement cohérent d''étangs artificiels, de petits canaux, de tunnels et de drains souterrains. Il a permis le développement de l''énergie hydraulique au profit de la mine et des procédés métallurgiques. C''est un lieu majeur de l''innovation minière dans le monde occidental.
Description is available under license CC-BY-SA IGO 3.0',
  'El sistema de gestión hidráulica minero del Alto Harz, al sur de las minas de Rammelsberg y de la ciudad de Gosla, acompaña la explotación de minerales para la producción de metales no ferrosos desde hace casi 800 años. Fue iniciado en la Edad Media por los monjes cistercienses y se desarrolló de manera masiva desde el final del siglo XVI hasta el siglo XIX. Ofrece un sistema muy complejo pero perfectamente coherente de estanques artificiales, pequeños canales, túneles y drenajes subterráneos. Permitió en particular el desarrollo de la energía hidráulica, que se utilizaba en la mina y en los procedimientos metalúrgicos. Se trata de un sitio mayor representativo de la innovación minera en el mundo occidental.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'История города Рёрос связана с медными рудниками, заложенными в семнадцатом веке и эксплуатировавшимися в течение 333 лет - вплоть до 1977 года. Полностью восстановленный после разрушения шведскими войсками в 1679 году, город насчитывает около 2000 одно- и двухэтажных деревянных домов и литейных мастерских. Многие из них сохранили свои фасады из потемневшего от времени дерева, придающие городу средневековый облик. Памятник был включен в Список всемирного наследия в 1980 году. Теперь он расширяется за счет ряда участков, окружающих город, а также - культурного ландшафта его промышленной и сельской местностей; Фемундситты – литейной мастерской и прилегающей к ней территории; зимней проезжей дороги. Памятник окружен буферной зоной, охватывающей бывшую зону привилегий (Круг), дарованную предприятию датско-норвежским королевским двором (1646). Он иллюстрирует становление и расцвет культуры, связанной с добычей меди, в отдаленном районе с суровым климатом.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '上哈尔茨的水动力采矿系统，位于赖迈尔斯堡矿和戈斯拉尔古城以南，主要用来协助提取有色金属矿，其开发使用的历史达到800年。这套系统最初由中世纪熙笃会僧侣建成，16世纪末到19世纪期间得到了大规模开发。这是一套复杂却关联性极强的系统，组成部分包括人工池塘、小通道、隧道及地下排水渠等，建造的目的是使用水力帮助进行采矿和冶金。这是体现西方世界矿业发展创新的一处重要遗址。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'تم تطوير نظام إدارة المياه في أوبرهارز، الذي يقع جنوب مناجم راميلسبورغ ومدينة غوسلار، على مدى حوالى 800 سنة للمساعدة في عملية استخراج المعادن الخام لإنتاج معادن غير حديدية. وبُني هذا النظام على يد رهبان بندكتيين في القرون الوسطى، وتم تطويره على نطاق واسع اعتباراً من نهاية القرن السادس عشر حتى القرن التاسع عشر. ويتألف هذا النظام من مجموعة تتميز باتساق تام - وإن كانت معقدة جداً - من البرك الصناعية، والقنوات الصغيرة، والأنفاق، والبالوعات الجوفية. وأتاح نظام إدارة المياه في أوبرهارز تطوير توليد الطاقة من المياه لاستخدامها في عمليات استخراج المعادن والتعدين. ويُعتبر هذا النظام موقعاً بارزاً للابتكار في مجال استخراج المعادن في العالم الغربي
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0623_0003-400-400-20100730122926.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Völklingen Ironworks: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Völklingen Ironworks',
  'The ironworks, which cover some 6 ha, dominate the city of Völklingen. Although they have recently gone out of production, they are the only intact example, in the whole of western Europe and North America, of an integrated ironworks that was built and equipped in the 19th and 20th centuries and has remained intact.
Description is available under license CC-BY-SA IGO 3.0',
  'Feroneria, care acoperă aproximativ 6 ha, domină orașul Völklingen. Deși au ieșit recent din producție, sunt singurul exemplu intact, în toată Europa de Vest și America de Nord, de fierărie integrată care a fost construită și utilată în secolele XIX și XX și a rămas intactă.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le complexe sidérurgique, qui couvre 6 hectares, surplombe la ville de Völklingen, dans la Sarre. C''est, dans tout le monde occidental européen et nord-américain, la seule usine sidérurgique intégrée construite et équipée aux XIXe et XXe siècles qui ait fermé ses portes récemment et qui soit restée intacte.
Description is available under license CC-BY-SA IGO 3.0',
  'Este complejo siderúrgico tiene una superficie de seis hectáreas y domina la ciudad de Völklingen, en el Sarre. Construida y equipada en los siglos XIX y XX, esta fábrica siderúrgica integrada dejó de funcionar recientemente y es la única de toda Europa Occidental y América del Norte que ha permanecido intacta.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Железоделательный завод, занимающий территорию в шесть гектаров, доминирует в облике города Фëльклинген. Хотя производство на нем недавно прекратилось, он остается единственным сохранившимся в целости железоделательным заводом из всех построенных в XIX и XX вв. в Западной Европе и Северной Америке.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '弗尔克林根钢铁厂占地6公顷，构成了弗尔克林根市的主体部分。尽管这个工厂已经停产，但它仍然是整个西欧和北美地区现存唯一一处保存完好的综合性钢铁厂遗址，向人们展示着19世纪和20世纪时期建造和装备的钢铁厂风貌。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'フランスとの国境に近いザールブリュッケンの西・フェルクリンゲンにある6haもの大製鉄所。19～20世紀にかけて、西ヨーロッパと北米に鉄を供給しつづけた。近代化の波に押されて現在は生産を中止したが、施設はほぼ完全な形で残されている。ヨーロッパ最大の重工業地帯として発展したザール地方の原動力となった。',
  '',
  '',
  '',
  'إن مجمّع مصانع الصلب الذي يغطي 6 هكتارات يشرف على مدينة فولكلينغن في منطقة السار. إنه مصنع الصلب الوحيد في العالم الاوروبي الغربي والأميركي الشمالي المتكامل الذي بُِني وجُهّز بين القرنين التاسع عشر والعشرين والذي أغلق أبوابه مؤخراً وقد بقي على حاله.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0687_0001-400-400-20080616160121.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Bauhaus and its Sites in Weimar, Dessau and Bernau: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Bauhaus and its Sites in Weimar, Dessau and Bernau',
  'Between 1919 and 1933 the Bauhaus movement revolutionized architectural and aesthetic thinking and practice in the 20th century. The Bauhaus buildings in Weimar, Dessau and Bernau are fundamental representatives of Classical Modernism, directed towards a radical renewal of architecture and design. This property, which was inscribed on the World Heritage List in 1996, originally comprised buildings located in Weimar (Former Art School, the Applied Art School and the Haus Am Horn) and Dessau (Bauhaus Building, the group of seven Masters'' Houses). The 2017 extension includes the Houses with Balcony Access in Dessau and the ADGB Trade Union School in Bernau as important contributions to the Bauhaus ideas of austere design, functionalism and social reform.
Description is available under license CC-BY-SA IGO 3.0',
  'Între 1919 și 1933, mișcarea Bauhaus a revoluționat gândirea și practica arhitecturală și estetică în secolul al XX-lea. Clădirile Bauhaus din Weimar, Dessau și Bernau sunt reprezentanți fundamentali ai modernismului clasic, îndreptat către o reînnoire radicală a arhitecturii și designului. Această proprietate, care a fost înscrisă pe Lista Patrimoniului Mondial în 1996, cuprindea inițial clădiri situate în Weimar (Fosta Școală de Artă, Școala de Artă Aplicată și Haus Am Horn) și Dessau (Clădirea Bauhaus, grupul de șapte Case ale Maeștrilor). Extinderea din 2017 include casele cu acces la balcon din Dessau și școala sindicală ADGB din Bernau ca contribuții importante la ideile Bauhaus de design auster, funcționalism și reformă socială.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Entre 1919 et 1933, le Mouvement du Bauhaus révolutionna la pensée et la pratique architecturales et esthétiques au XXe siècle. Les bâtiments du Bauhaus à Weimar, Dessau et Bernau sont des représentants fondamentaux du modernisme classique, orienté vers un renouveau radical de l’architecture et de la conception. Ce bien, inscrit sur la Liste du patrimoine mondial en 1996, comprenait à l’origine les bâtiments situés à Weimar (l’ancienne école d’art du Bauhaus, l’école d’arts appliqués et la maison am Horn) et Dessau (le bâtiment du Bauhaus, le groupe de sept maisons de maîtres). L’extension de 2017 inclut les maisons avec accès aux balcons à Dessau et l’École de la Confédération syndicale ADGB à Bernau, comme des contributions importantes aux idées du Bauhaus en matière de conception épurée, de fonctionnalisme et de réforme sociale.
Description is available under license CC-BY-SA IGO 3.0',
  'Entre 1919 y 1933, el movimiento de la Bauhaus revolucionó el pensamiento y la práctica arquitectónicos y estéticos del siglo XX. Los edificios de la Bauhaus en Weimar, Dessau y Bernau son representantes fundamentales del modernismo clásico, dirigido hacia una renovación radical de la arquitectura y el diseño. El sitio, inscrito en la Lista del Patrimonio Mundial en 1996, comprendía en su origen edificios situados en Weimar (antigua Escuela de Artes, Escuela de Artes Aplicadas y Haus Am Horn) y Desau (Edificio Bauhaus, Grupo de las siete casas de maestros). La ampliación de 2017 incluye cinco bloques de viviendas sociales de tres pisos –con acceso por balcón– edificados con ladrillo en Desau, y la Escuela de la Confederación General de Sindicatos de Alemania (ADGB) construida en Bernau, como contribuciones importantes a los ideales de la Bauhaus de diseño depurado, funcionalismo y reforma social.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  '',
  '',
  'كان الموقع الذي أدرج عام 1996 في قائمة التراث العالمي يتألف في الأساس من مجموعات من المباني والمواقع الأثريّة الواقعة في فايمار وديساو والتي بنيت بأكملها تحت إشراف والتر غروبيوس، أول مدير لمدرسة الباوهاوس. وقد جاء التعديل الحدودي ليضم المنازل التي تمتلك شرفة في مدخلها في ديساو، والمباني التي تتألف من ثلاثة طوابق اسمنتيّة والتي كانت مخصصة لاستقبال الأشخاص منخفضي الدخل و ADGB Trade Union School في بيرناو والتي بنيت تحت إشراف هاينس ماير، سلف غروبيوس حتى عام 1930. ويجسّد هذا الامتداد للموقع مساهمة قسم الهندسة المعماريّة في أناقة التصميم والإصلاح الاجتماعي في الباوهاوس وهي حركة شكّلت ثورة في الفكر والممارسات المعماريّة في القرن العشرين.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0729_0001-400-400-20170711150900.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Garden Kingdom of Dessau-Wörlitz: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Garden Kingdom of Dessau-Wörlitz',
  'The Garden Kingdom of Dessau-Wörlitz is an exceptional example of landscape design and planning of the Age of the Enlightenment, the 18th century. Its diverse components - outstanding buildings, landscaped parks and gardens in the English style, and subtly modified expanses of agricultural land - serve aesthetic, educational, and economic purposes in an exemplary manner.
Description is available under license CC-BY-SA IGO 3.0',
  'Regatul Grădinilor din Dessau-Wörlitz este un exemplu excepțional de proiectare și planificare a peisajului din Epoca Iluminismului, secolul al XVIII-lea. Componentele sale diverse - clădiri remarcabile, parcuri și grădini amenajate în stil englezesc și întinderi subtil modificate de teren agricol - servesc scopurilor estetice, educaționale și economice într-o manieră exemplară.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le royaume des jardins de Dessau-Wörlitz est un exemple exceptionnel de conception paysagère et d''urbanisme du XVIIIe siècle, le Siècle des Lumières. Ses divers composants – édifices remarquables, parcs paysagers, jardins à l''anglaise et pans de terres agricoles subtilement modifiés – remplissent de manière exemplaire des fonctions esthétiques, éducatives et économiques.
Description is available under license CC-BY-SA IGO 3.0',
  'El Reino de los Jardines de Dessau-Wörlitz es un excepcional ejemplo del diseño paisajístico y el urbanismo del Siglo de las Luces. Sus diversos elementos –bellos edificios, parques y jardines de estilo inglés, y parcelas de tierras agrícolas sutilmente modificadas– cumplen de forma ejemplar funciones estéticas, educativas y económicas.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '«Парковое королевство» Дессау-Верлиц – это шедевр ландшафтного проектирования и планирования, созданный в эпоху Просвещения в XVIII в. Его различные компоненты – отдельные здания, ландшафтные парки и сады в английском стиле, а также искусно улучшенные участки сельскохозяйственных земель – имеют большое эстетическое, образовательное и хозяйственное значение.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '德绍－沃尔利茨园林王国是18世纪欧洲启蒙运动时期园林设计和规划的典范之作。在花园中有各种杰出的建筑、英国风格观景园和花园以及通过精心设计的农田景致，将美学、教育和经济目的融合到了一起，堪称经典。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'ドイツ中西部、ザクセン・アンハルト州にある1764年～1805年に造園された一大庭園地帯。公爵フリードリヒ3世が、エルベ川支流の内湖沿いに広大なイギリス式庭園を造営させ、敷地内のさまざまな景観に溶けこむようにドイツ古典様式の建築物を配置した。庭園中央部には、設計者エルトマンスドルフが多様な建築要素を採り入れた「ドイツ古典主義の原点」といわれる宮殿がある。その他の諸建築物も庭園の設計思想のもとに配置されている。',
  '',
  '',
  '',
  'إن مملكة حدائق ديساو- فورليتز هي مثال استثنائي لمفهوم تنظيم الحدائق والتنظيم المدني في القرن الثامن عشر، أي قرن الأنوار. وتؤدي مكوّناته المختلفة- المباني الرائعة، الحدائق المنظمة، الحدائق الإنكليزية النمط والجلول الزراعية المعدلة - وظائف جمالية وتعليمية واقتصادية على أكمل وجه.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0534_0006-400-400-20151105100744.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Dresden Elbe Valley: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Dresden Elbe Valley',
  'The 18th- and 19th-century cultural landscape of Dresden Elbe Valley extends some 18 km along the river from Übigau Palace and Ostragehege fields in the north-west to the Pillnitz Palace and the Elbe River Island in the south-east. It features low meadows, and is crowned by the Pillnitz Palace and the centre of Dresden with its numerous monuments and parks from the 16th to 20th centuries. The landscape also features 19th- and 20th-century suburban villas and gardens and valuable natural features. Some terraced slopes along the river are still used for viticulture and some old villages have retained their historic structure and elements from the industrial revolution, notably the 147-m Blue Wonder steel bridge (1891–93), the single-rail suspension cable railway (1898–1901), and the funicular (1894–95). The passenger steamships (the oldest from 1879) and shipyard (c. 1900) are still in use.
Description is available under license CC-BY-SA IGO 3.0',
  'Peisajul cultural din secolele al XVIII-lea și al XIX-lea din Valea Elbei din Dresda se întinde pe aproximativ 18 km de-a lungul râului de la Palatul Übigau și câmpurile Ostragehege în nord-vest până la Palatul Pillnitz și Insula Râului Elba în sud-est. Are pajiști joase și este încununată de Palatul Pillnitz și de centrul Dresdei, cu numeroasele sale monumente și parcuri din secolele XVI-XX. Peisajul prezintă, de asemenea, vile suburbane și grădini din secolele al XIX-lea și al XX-lea și caracteristici naturale valoroase. Unii versanți terasați de-a lungul râului sunt încă folosiți pentru viticultură, iar unele sate vechi și-au păstrat structura istorică și elementele revoluției industriale, în special podul de oțel Blue Wonder de 147 m (1891–93), telecabina cu suspensie cu o singură șină (1898–1901) și funicularul (1894–95). Navele cu aburi de pasageri (cele mai vechi din 1879) și șantierul naval (c. 1900) sunt încă în uz.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le paysage culturel des XVIIIe et XIXe siècles de la vallée de l’Elbe à Dresde s’étend sur quelque 18 km le long du fleuve, du palais d’Übigau et des champs d’Ostragehege au nord-ouest jusqu’au château de Pillnitz et à l’île sur l’Elbe au sud-est. Ses prairies basses servent d’écrin au château de Pillnitz et au centre de Dresde, où abondent parcs et monuments surgis entre le XVIe et le XXe siècle. Le site comprend également des villas et des jardins des XIXe et XXe siècles. Les terrasses sur les coteaux sont toujours en partie consacrées à la viticulture, et certains villages anciens ont conservé leur structure d’époque, et des éléments datant de la révolution industrielle, notamment la « Merveille Bleue », un pont en acier de 147 m de long (1891-1893), le monorail funiculaire suspendu (1898-1901) et le funiculaire (1894-1895). Les bateaux à vapeur (le plus ancien remonte à 1879) et le chantier naval (vers 1900) sont toujours en activité.
Description is available under license CC-BY-SA IGO 3.0',
  'El paisaje cultural del Valle del Elba en Dresde, creado durante de los siglos XVIII y XIX, se extiende por las orillas de este río a lo largo de 18 kilómetros con un eje de orientación noroeste–sudeste, desde el Palacio de Übigau y las praderas de Ostragehege hasta el Palacio de Pillnitz y la isla del Elba. En este espectacular paisaje formado por praderas bajas, destacan el palacio de Pillnitz y el centro histórico de la ciudad con sus numerosos monumentos y parques que datan de los siglos XVI al XX. En las laderas del valle se sigue cultivando la viña en bancales. Algunos pueblos antiguos de los alrededores han conservado su estructura ancestral, así como vestigios de la Revolución Industrial, entre los que destacan la “Maravilla Azul”, un puente de acero de 147 metros de longitud, construido entre 1891 y 1893, así como un monorriel suspendido (1898-1901) y un funicular (1894-1895). Los barcos de vapor (el más antiguo data de 1879) y el astillero (construido hacia 1900) están aún en funcionamiento.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Культурный ландшафт долины Эльбы близ Дрездена, сформированный в XVIII-XIX вв., имеет протяженность примерно 18 км – от дворца Юбигау и полей Острагехеге на северо-западе до дворца Пильниц и острова на Эльбе на юго-востоке. Его компонентами являются пойменные луга, пригородные виллы XIX-XX вв. и сады, а «увенчан» он дворцом Пильниц и центром города Дрезден, с его многочисленными памятниками и парками, относящимися к XVI-XX вв. Некоторые террасированные склоны вдоль реки все еще используются для виноградарства, а отдельные поселки сохранили свою историческую структуру и фрагменты застройки эпохи промышленной революции.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '18世纪和19世纪的德累斯顿的埃尔伯峡谷景观起始于西北部的于毕高宫(Übigau Palace)和奥斯特拉葛黑葛平原(Ostragehege fields)，东南一直延伸到皮尔尼茨宫(Pillnitz Palace)和易北岛(Elbe River Island)，沿着河谷纵深有18公里长。这里主要有低洼草地，顶部的皮尔尼茨宫，遗迹德累斯顿中心，还有16至20世纪的无数古迹和公园，同时这里还拥有19世纪和20世纪的郊区别墅、花园以及极具价值的自然风光。今天，一些沿河梯田仍然种植着葡萄，一些古老的村庄仍然保留着工业革命时期的历史建筑和设施，特别是长147米的钢桥（1891年至1893年）、单轨吊索铁路（1898年至1901年）和索道（1894年至1895年）。古老的汽船（起源于1879年）和成立于1900年的造船厂至今仍在使用。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يمتدّ المنظر الثقافي الذي يعود إلى القرنين الثامن عشر والتاسع عشر في وادي إلبة في دريسدن على حوالى 81 كلم على طول النهر وعلى طول قصر أوبيغو وحقول "أوستراجيهيج" في الشمال الغربي وصولاً إلى قصر بيلنتز والجزيرة التي تقع في جنوبلشرقي نهر إلبة. وتشكّل المراعي إطاراً طبيعياً لقصر بيلنتز ووسط دريسدن حيث تكثر الحدائق والنصب التي شيّدت بين القرنين السادس عشر والقرن العشرين. ويشمل الموقع أيضاً بيوتا وحدائق أنشئت في القرن التاسع عشر والقرن العشرين. ولا تزال الجلول على السفوح مخصصة في غالبيتها لزراعة العنب وقد حافظت بعض القرى القديمة على بنيتها القديمة وعلى عناصر تعود إلى الثورة الصناعية، ولا سيما منها "الروعة الزرقاء" وهو جسر من معدن طوله 741 متراً (1898- 1901) والقطار الجبلي المعلق ذو سكة وحيدة (1898-1901) والقطار الجبلي العادي (1894-1895). أما البواخر البخارية والأقدم بينها يعود إلى (1879) ومصنع السفن (حوالى1900)، فلا تزال كلها تعمل.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1156_0013-400-400-20130801163627.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Bergpark Wilhelmshöhe: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Bergpark Wilhelmshöhe',
  'Descending a long hill dominated by a giant statue of Hercules, the monumental water displays of Wilhelmshöhe were begun by Landgrave Carl of Hesse-Kassel in 1689 around an east-west axis and were developed further into the 19th century. Reservoirs and channels behind the Hercules Monument supply water to a complex system of hydro-pneumatic devices that supply the site’s large Baroque water theatre, grotto, fountains and 350-metre long Grand Cascade. Beyond this, channels and waterways wind across the axis, feeding a series of dramatic waterfalls and wild rapids, the geyser-like Grand Fountain which leaps 50m high, the lake and secluded ponds that enliven the Romantic garden created in the 18th century by Carl’s great-grandson, Elector Wilhelm I. The great size of the park and its waterworks along with the towering Hercules statue constitute an expression of the ideals of absolutist Monarchy while the ensemble is a remarkable testimony to the aesthetics of the Baroque and Romantic periods.
Description is available under license CC-BY-SA IGO 3.0',
  'Coborând un deal lung dominat de o statuie uriașă a lui Hercule, spectacolele monumentale de apă ale lui Wilhelmshöhe au fost începute de landgravul Carl de Hesse-Kassel în 1689 în jurul unei axe est-vest și au fost dezvoltate mai departe în secolul al XIX-lea. Rezervoarele și canalele din spatele Monumentului Hercules furnizează apă unui sistem complex de dispozitive hidropneumatice care alimentează marele teatru de apă în stil baroc, grota, fântâni și Grand Cascade de 350 de metri lungime. Dincolo de aceasta, canalele și căile navigabile șerpuiesc de-a lungul axei, alimentând o serie de cascade dramatice și repezișuri sălbatice, Marea Fântână asemănătoare cu gheizere, care sare cu o înălțime de 50 de metri, lacul și iazurile izolate care însuflețesc grădina romantică creată în secolul al XVIII-lea de strănepotul lui Carl, Electorul Wilhelm I, împreună cu statuia lui de mărime mare al lui Hercules I. constituie o expresie a idealurilor Monarhiei absolutiste în timp ce ansamblul este o mărturie remarcabilă a esteticii perioadelor baroc și romantic.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Descendant la longue pente d’une colline couronnée par la statue géante d’Hercule, les jeux d’eau monumentaux de Wilhelmshöhe furent créés à partir de 1689 par le landgrave Charles de Hesse-Cassel autour d’un axe est-ouest. D’autres éléments ont été apportés par la suite. Des réservoirs et canaux aménagés derrière le monument d’Hercule apportent l’eau au système complexe de dispositifs hydropneumatiques alimentant le vaste théâtre d’eau baroque du site, sa grotte, ses fontaines et sa grande cascade de 350 mètres de long. Outre cet ensemble, les lignes sinueuses de canaux et voies d’eau artificielles traversent cet axe, en alimentant une série de chutes d’eau spectaculaires et de rapides tumultueux, la grande fontaine et son geyser jaillissant à une hauteur de 50 mètres, le lac et les bassins isolés qui animent le jardin romantique créé au 18e siècle par l’arrière-petit-fils de Charles, l’électeur Guillaume Ier. La grande taille du parc et de ses jeux d’eau, ainsi que l’imposante statue d’Hercule, constitue une expression du pouvoir absolu en Europe et l’ensemble témoigne des conceptions esthétiques des périodes baroque et romantique.
Description is available under license CC-BY-SA IGO 3.0',
  'source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '富と権力の証しとなったバロック庭園。ヴィルヘルムスヘーエ城公園は、カール伯爵によって1689年から建設が開始された壮麗な公園。庭園は噴水や渓流、滝などの水を利用した芸術的な造形とデザインが特徴で、その水の表現は他に例を見ないユニークなもの。その造形はバロックおよびロマン主義時代の庭園芸術として他の追随を許さないものである。また、頂上にそびえるヘラクレス像は、近代初期の巨大彫刻として技術的・芸術的に最も優れているといわれる。この公園は、18～19世紀ヨーロッパの支配階級の富と権力を象徴する顕著な証拠である。',
  '',
  '',
  '',
  '',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1413_0006-400-400-20221005120327.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Caves and Ice Age Art in the Swabian Jura: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Caves and Ice Age Art in the Swabian Jura',
  'Modern humans first arrived in Europe 43,000 years ago during the last ice age. One of the areas where they took up residence was the Swabian Jura in southern Germany. Excavated from the 1860s, six caves have revealed items dating from 43,000 to 33,000 years ago. Among them are carved figurines of animals (including cave lions, mammoths, horses and bovids), musical instruments and items of personal adornment. Other figurines depict creatures that are half animal, half human and there is one statuette of a woman. These archaeological sites feature some of the oldest figurative art worldwide and help shed light on the origins of human artistic development.
Description is available under license CC-BY-SA IGO 3.0',
  'Oamenii moderni au ajuns pentru prima dată în Europa în urmă cu 43.000 de ani, în timpul ultimei epoci glaciare. Una dintre zonele în care și-au stabilit reședința a fost Jura șvabă din sudul Germaniei. Săpate din anii 1860, șase peșteri au scos la iveală obiecte care datează de la 43.000 la 33.000 de ani în urmă. Printre acestea se numără figurine sculptate de animale (inclusiv lei de peșteră, mamuți, cai și bovidi), instrumente muzicale și obiecte de podoabă personală. Alte figurine înfățișează creaturi care sunt jumătate animale, jumătate umane și există o statuetă a unei femei. Aceste situri arheologice prezintă unele dintre cele mai vechi artă figurativă din lume și ajută la aruncarea în lumină asupra originilor dezvoltării artistice umane.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Les premiers humains modernes sont arrivés en Europe il y a 43 000 ans, pendant la dernière période glaciaire. L’un de leurs lieux d’établissement fut le Jura souabe, dans le sud de l’Allemagne. Six grottes, fouillées depuis les années 1860, ont révélé des vestiges vieux de 43 000 à 33 000 ans. Des figurines sculptées d’animaux (y compris des lions des cavernes, mammouths, chevaux et bovidés), des instruments de musique et des objets de parure personnelle y ont notamment été trouvés. D’autres figurines représentent des créatures mi-animales, mi-humaines, et une statuette de femme a été retrouvée. Ces sites archéologiques témoignent d’un art figuratif parmi les plus anciens au monde, et contribuent à éclairer les origines du développement artistique humain.
Description is available under license CC-BY-SA IGO 3.0',
  'Los primeros humanos “modernos” llegaron a Europa en el periodo glacial, hace unos 43.000 años. El Jura suabo, situado al sur de Alemania, fue uno de los lugares donde se asentaron. Las excavaciones arqueológicas efectuadas en seis grutas desde el decenio de 1860 han permitido descubrir huellas de su presencia, cuya antigüedad se remonta a unos 33.000 a 43.000 años atrás. En este sitio se han hallado, entre otros, los siguientes objetos: una estatuilla femenina; figuritas esculpidas de animales (leones cavernarios, mamuts, caballos, bovinos, etc.) y de criaturas fantásticas, mitad humanas mitad animales; instrumentos musicales; y objetos de adorno. Estos vestigios arqueológicos atestiguan la existencia de uno de los artes figurativos más antiguos del mundo y contribuyen a esclarecer nuestros conocimientos sobre los orígenes del espíritu creador del ser humano en el ámbito del arte.
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
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1527_0002-400-400-20221004095704.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Archaeological Border complex of Hedeby and the Danevirke: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Archaeological Border complex of Hedeby and the Danevirke',
  'The archaeological site of Hedeby consists of the remains of an emporium – or trading town – containing traces of roads, buildings, cemeteries and a harbour dating back to the 1st and early 2nd millennia CE. It is enclosed by part of the Danevirke, a line of fortification crossing the Schleswig isthmus, which separates the Jutland Peninsula from the rest of the European mainland. Because of its unique situation between the Frankish Empire in the South and the Danish Kingdom in the North, Hedeby became a trading hub between continental Europe and Scandinavia and between the North Sea and the Baltic Sea. Because of its rich and well preserved archaeological material, it has become a key site for the interpretation of economic, social and historical developments in Europe during the Viking age.
Description is available under license CC-BY-SA IGO 3.0',
  'Situl arheologic Hedeby constă din rămășițele unui emporium – sau oraș comercial – care conține urme de drumuri, clădiri, cimitire și un port datând din mileniul I și începutul celui de-al II-lea e.n. Este înconjurat de o parte a Danevirke, o linie de fortificații care traversează istmul Schleswig, care separă Peninsula Iutlanda de restul continentului european. Datorită situației sale unice între Imperiul franc din sud și regatul danez din nord, Hedeby a devenit un centru comercial între Europa continentală și Scandinavia și între Marea Nordului și Marea Baltică. Datorită materialului său arheologic bogat și bine conservat, a devenit un loc cheie pentru interpretarea evoluțiilor economice, sociale și istorice din Europa în timpul epocii vikingilor.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Hedeby est un site archéologique comprenant les vestiges d’un emporium - ou ville commerciale -  contenant des traces de rues, de bâtiments, de cimetières et d’un port qui remontent au Ier et au début du IIe millénaire de notre ère. Il est entouré par une partie du Danevirke, une ligne de fortification traversant l’isthme du Schleswig, qui sépare la péninsule du Jutland du reste de l’Europe continentale. En raison de sa situation unique entre l’Empire franc au sud et le royaume danois au nord, Hedeby devint une plaque tournante entre l’Europe continentale et la Scandinavie, et entre la mer du Nord et la mer Baltique. En raison de son matériel archéologique riche et bien conservé, le bien est essentiel pour l’interprétation des évolutions économiques, sociales et historiques en Europe à l’ère viking.
Description is available under license CC-BY-SA IGO 3.0',
  'Hedeby es un sitio arqueológico con vestigios de un antiguo emporio que muestran trazados de calles, así como edificios, cementerios y un puerto construidos durante el primer milenio de nuestra era y principios del segundo. El sitio está rodeado por un segmento de la Danevirke, línea de fortificaciones que atraviesa el istmo de Schleswig, cuya angostura separa la Península de Jutlandia del resto del continente europeo. Por su excepcional situación entre el Imperio Franco, al sur, y el Reino de Dinamarca, al norte, Hedeby se convirtió en un importante eje del comercio entre Escandinavia y el resto de Europa, por un lado, y entre el Mar del Norte y el Mar Báltico, por otro lado. La abundancia de material arqueológico del sitio y su excelente conservación han hecho de Hedeby un lugar esencial para poder interpretar la evolución histórica y socioeconómica de Europa en la época de los vikingos.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Хедебю – это археологический объект, включающий остатки эмпориума, или торгового города, со следами улиц, зданий, кладбищ и порта, относящегося к первому и началу второго тысячелетия нашей эры. Хедебю окружен частью Даневирке, линии оборонительных укреплений, пересекающей Шлезвигский перешеек, который отделяет полуостров Ютландия от остальной части континентальной Европы. Благодаря своему уникальному расположению между Франкской империей на юге и Датским королевством на севере, Хедебю стал перевалочным пунктом между континентальной Европой и Скандинавией, а также между Северным и Балтийским морями. Благодаря своему богатому и хорошо сохранившемуся археологическому наследию этот объект имеет важное значение для осмысления экономических, социальных и политических событий в Европе в эпоху викингов.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '赫德比的考古遗址由一座包含道路、建筑、墓地的贸易集镇和一个古海港，其历史可追溯至公元1世纪初和公元2世纪初期 。整个遗迹被丹尼维尔克防御工事包围，该防御工事是穿过石勒苏益格地峡、将日德兰半岛与欧洲大陆其他地区隔开的一条防御线。这里位于南部法兰克帝国与北部丹麦王国之间，独特的地理位置使赫德比成为欧洲大陆与斯堪的纳维亚之间，以及北海与波罗的海之间的贸易枢纽。由于考古资料丰富且保存完好，它已成为解读维京时代欧洲经济、社会和历史发展的重要遗产。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يحتوي موقع هيديبي الأثري على بقايا مجمع تجاري أو مدينة تجارية، ومنها مثلاً: آثار لشوارع ومباني ومدافن وميناء تعود للألفية الأولى وبدايات الألفية الثانية من تاريخنا. ويحيط بالموقع جزء من خط دانيفيرك الحدودي 
الدفاعي الذي يعبر مضيق شليسفيج الذي يفصل شبه جزيرة يوتلاند عن أوروبا القارية. وأصبح الهيديبي، بفضل موقعه الفريد بين الإمبراطورية الفرانكية (مملكة الفرانك) من الجنوب ومملكة الدنمارك من الشمال، نقطة عبور بين أوروبا القارية وشبه جزيرة إسكندنافيا، وبين بحر الشمال وبحر البلطيق. ويحتوي على ممتلكات أثريّة غنية في حالة جيّدة، الأمر الذي يجعله أساسياً لفهم التطورات الاقتصادية والاجتماعية والتاريخية في أوروبا في عصر الفايكنغ.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1553_0004-400-400-20180122173132.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Naumburg Cathedral: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Naumburg Cathedral',
  'Located in the eastern part of the Thuringian Basin, the Cathedral of Naumburg, whose construction began in 1028, is an outstanding testimony to medieval art and architecture. Its Romanesque structure, flanked by two Gothic choirs, demonstrates the stylistic transition from late Romanesque to early Gothic. The west choir, dating to the first half of the 13th century, reflects changes in religious practice and the appearance of science and nature in the figurative arts. The choir and life-size sculptures of the founders of the Cathedral are masterpieces of the workshop known as the ‘Naumburg Master’.
Description is available under license CC-BY-SA IGO 3.0',
  'Situată în partea de est a Bazinului Turingian, Catedrala din Naumburg, a cărei construcție a început în 1028, este o mărturie remarcabilă a artei și arhitecturii medievale. Structura sa romanică, flancată de două coruri gotice, demonstrează tranziția stilistică de la romanic târziu la gotic timpuriu. Corul de vest, datând din prima jumătate a secolului al XIII-lea, reflectă schimbări în practica religioasă și apariția științei și a naturii în artele figurative. Corul și sculpturile în mărime naturală ale fondatorilor Catedralei sunt capodopere ale atelierului cunoscut sub numele de „Maestrul Naumburg”.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Située dans la partie orientale du bassin de Thuringe, la cathédrale de Naumburg, dont la construction a commencé à partir de 1028, est un témoignage exceptionnel de l''art et de l''architecture du Moyen Âge. Sa structure romane flanquée de deux chœurs gothiques témoigne d''un style de transition entre la fin du style roman et le début du gothique. Le jubé ouest, qui date de la première moitié du xiiie siècle, reflète des changements dans la pratique religieuse et l''inclusion de la science et de la nature dans les arts figuratifs. Ce jubé ainsi que les sculptures grandeur nature des fondateurs de la cathédrale sont des chefs-d''œuvre de l''atelier connu sous le nom de « l’atelier du Maître de Naumburg ». 
Description is available under license CC-BY-SA IGO 3.0',
  'Situada en la parte oriental de la cuenca de Turinga, la catedral de Naumburgo, cuya construcción comenzó a partir de 1028, es un testimonio excepcional del arte y la arquitectura de la Edad Media. Su estructura románica, flanqueada por dos coros góticos, es muestra de un estilo de transición entre el final del estilo románico y el principio del gótico. El jubé occidental, que data de la primera mitad del siglo XIII, refleja cambios en la práctica religiosa y la inclusión de la ciencia y la naturaleza en las artes figurativas. Este jubé, así como las esculturas de talla real de los fundadores de la catedral, son obras de arte debida al taller conocido con el nombre de “Maestro de Naumburgo”.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Расположенный в восточной части Тюрингии, Наумбургский кафедральный собор, строительство которого началось в 1028 году, является уникальным свидетельством средневекового искусства и архитектуры. Здание собора в романском стиле, к которому по обе стороны пристроены два готических хора, является ярким примером стилистического перехода от позднероманского периода к ранней готике. Интерьер западного хора, относящийся к первой половине XIII века, отражает изменения в религиозной практике и включение компонентов науки и природы в изобразительное искусство. Западный хор, а также скульптуры основателей собора в натуральную величину являются шедеврами художественной школы, известной как «Мастер из Наумбурга».
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '位于图林根盆地东部的瑙姆堡大教堂始建于1028年，是中世纪艺术和建筑的杰出代表。它的罗马式结构和两侧的哥特式唱经楼展示了从罗马式晚期到哥特式早期的风格转变。可追溯至13世纪上半叶的西侧唱经楼反映了宗教实践的变化，以及科学和自然在具象艺术中的显现。唱经楼和真人大小的大教堂创建者雕像是该遗产地的代表，被称作“瑙姆堡大师”作品
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'تعدّ كاتدرائية ناومبورغ ، الواقعة في الجزء الشرقي من حوض تورنغن والتي بدأ إنشاؤها في عام 1028، شاهداً فريداً على فنون العصور الوسطى وعمارتها. فإنّ بنيتها الرومانية المحاطة بجوقتين قوطيتين تشهد على طراز انتقالي من بين أواخر الطراز الروماني وبدايات الطراز القوطي. وإن الجوقة الغربية التي تعود إلى النصف الأول من القرن الثالث عشر، تجسّد تغييرات في الممارسات الدينية وإدماج العلوم والطبيعة في الفنون التصويرية. إذ تعد هذه الجوقة والتماثيل المنحوتة بالحجم الطبيعي لبناة الكاتدرائية، قطعاً فنية رائعة للمعرض المعروف باسم "سيّد ناومبورغ". 
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1470_0008-400-400-20180221180445.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Water Management System of Augsburg: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Water Management System of Augsburg',
  'The water management system of the city of Augsburg has evolved in successive phases from the 14th century to the present day. It includes a network of canals, water towers dating from the 15th to 17th centuries, which housed pumping machinery, a water-cooled butchers’ hall, a system of three monumental fountains and hydroelectric power stations, which continue to provide sustainable energy today. The technological innovations generated by this water management system have helped establish Augsburg as a pioneer in hydraulic engineering.
Description is available under license CC-BY-SA IGO 3.0',
  'Sistemul de management al apei din orașul Augsburg a evoluat în faze succesive din secolul al XIV-lea până în prezent. Include o rețea de canale, turnuri de apă care datează din secolele XV-XVII, care găzduiau utilaje de pompare, o sală de măcelărie răcită cu apă, un sistem de trei fântâni monumentale și centrale hidroelectrice, care continuă să furnizeze energie durabilă și astăzi. Inovațiile tehnologice generate de acest sistem de management al apei au contribuit la stabilirea Augsburgului ca un pionier în inginerie hidraulică.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le système de gestion de l’eau de la ville d’Augsbourg a évolué au cours de phases successives depuis le XIVe siècle jusqu’à nos jours. Il comprend notamment un réseau de canaux, des châteaux d’eau datant du XVe au XVIIe siècle qui ont abrité des machines de pompage, une salle des bouchers refroidie par eau, un système de trois fontaines monumentales et des centrales hydroélectriques qui continuent aujourd’hui de fournir une énergie durable. Les innovations technologiques engendrées par ce système de gestion de l’eau ont contribué à faire d’Augsbourg une ville pionnière en matière d’ingénierie hydraulique.
Description is available under license CC-BY-SA IGO 3.0',
  'Este sistema ha ido evolucionando por etapas sucesivas desde el siglo XIV hasta nuestros días. Comprende los siguientes elementos: una red de canales; arcas de agua, construidas entre los siglos XV y XVII, que albergaron en otros tiempos maquinarias de bombeo; un local para carnicería refrigerado con agua; un conjunto de tres fuentes monumentales; y centrales hidroeléctricas que siguen suministrando actualmente energía renovable. Propiciadas por la existencia de este sistema peculiar de gestión de los recursos hídricos, las innovaciones tecnológicas relacionadas con el agua han hecho de Augsburgo una ciudad puntera en el ámbito de la ingeniería hidráulica.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Система управления водными ресурсами в городе Аугсбург последовательно развивалась с XIV века до наших дней. Она включает сеть каналов и водонапорных башен XV-XVII вв., в которых в разное время размещались насосные установки, комнаты водяного охлаждения мясных продуктов, система из трех монументальных фонтанов, а также гидроэлектростанции, которые продолжают обеспечивать город экологически устойчивой энергией. Технологические инновации, создаваемые этой системой управления водными ресурсами, помогли Аугсбургу стать одним из лидирующих городов в области гидротехники.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '奥格斯堡市的水利管理系统自14世纪至今已经历了数个阶段的发展。该水利系统由以下几部分组成：运河网络、数个历史可追溯至15-17世纪的水塔（内部为抽水装置）、1座水冷式屠宰行业建筑、3个雕塑喷泉系统以及仍在为奥格斯堡提供可持续能源的水电站。该水利管理系统产生的技术创新让奥格斯堡成为发展水利工程的先驱城市。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'مرّ نظام إدارة المياه في مدينة آوغسبورغ بمراحل متتالية أثناء تطوره منذ القرن الرابع عشر وحتى يومنا هذا. ويتكوّن في المقام الأول من شبكة من القنوات وأبراج المياه التي يعود تاريخها إلى الفترة الممتدة من القرن الخامس عشر حتى القرن السابع عشر، والتي كانت تحتوي على مضخات للمياه، وحجرة للجزارين مبردة بفعل المياه، ونظام مؤلف من ثلاث نوافير ضخمة، ومحطات للطاقة الكهرومائية التي لا تزال توفر مصدراً من مصادر الطاقة المستدامة. وقد أسهمت الابتكارات التكنولوجية الناتجة عن نظام إدارة المياه في جعل مدينة آوغسبورغ  رائدة في الهندسة الهيدروليكي
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1580_0009-400-400-20221125113459.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Frontiers of the Roman Empire – The Lower German Limes: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Frontiers of the Roman Empire – The Lower German Limes',
  'Following the left bank of the Lower Rhine River for approximately 400 km from the Rhenish Massif in Germany to the North Sea coast in the Netherlands, the transnational property consist of 102 components from one section of the frontiers of the Roman Empire, which in the 2nd century CE, stretched across Europe, the Near East, and North Africa, over 7,500 km. The property comprises military and civilian sites and infrastructure that marked the edge of Lower Germany from the 1st to 5th centuries CE. Archaeological remains in the property include legionary fortresses, forts, fortlets, towers, temporary camps, roads, harbours, a fleet base, a canal and an aqueduct, as well as civilian settlements, towns, cemeteries, sanctuaries, an amphitheatre, and a palace. Almost all of these archaeological remains are buried underground. Waterlogged deposits in the property have enabled a high degree of preservation of both structural and organic materials from the Roman periods of occupation and use.
Description is available under license CC-BY-SA IGO 3.0',
  'Urmând malul stâng al râului Rin de Jos pe aproximativ 400 km de la Masivul Renan din Germania până la coasta Mării Nordului din Țările de Jos, proprietatea transnațională este formată din 102 componente dintr-o secțiune a frontierelor Imperiului Roman, care în secolul al II-lea d.Hr., se întindea prin Europa, Orientul Apropiat și Africa de Nord, peste 7.500 km. Proprietatea cuprinde situri militare și civile și infrastructură care au marcat marginea Germaniei de Jos din secolele I-V e.n. Resturile arheologice din proprietate includ fortărețe legionare, forturi, fortărețe, turnuri, tabere temporare, drumuri, porturi, o bază de flotă, un canal și un apeduct, precum și așezări civile, orașe, cimitire, sanctuare, un amfiteatru și un palat. Aproape toate aceste rămășițe arheologice sunt îngropate sub pământ. Depozitele îmbinate cu apă din proprietate au permis un grad ridicat de conservare atât a materialelor structurale, cât și a materialelor organice din perioadele romane de ocupare și utilizare.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Suivant la rive gauche du Rhin inférieur sur environ 400 km – du Massif rhénan en Allemagne à la côte de la mer du Nord aux Pays-Bas –, ce bien transnational est composé de 102 éléments appartenant à une section des frontières de l’Empire romain qui, au IIe siècle de notre ère, s’étendait sur 7 500 km à travers l’Europe, le Proche-Orient et l’Afrique du Nord. Le bien comprend des sites et des infrastructures militaires et civiles qui ont matérialisé la frontière de la Germanie inférieure du Ier au Ve siècle de notre ère. Les vestiges archéologiques du bien comprennent des camps légionnaires, des forts, des fortins, des tours, des camps temporaires, des routes, des ports, une base navale, un canal et un aqueduc, ainsi que des établissements civils, des villes, des cimetières, des sanctuaires, un amphithéâtre et un palais. La quasi-totalité de ces vestiges archéologiques est enfouie sous terre. Les gisements gorgés d’eau du bien ont permis un haut degré de préservation des matériaux structurels et organiques datant des périodes d’occupation et d’utilisation romaines.
Description is available under license CC-BY-SA IGO 3.0',
  'Siguiendo la ribera izquierda del Bajo Rin a lo largo de unos 400 km desde el Macizo renano en Alemania hasta la costa del Mar del Norte en los Países Bajos, este sitio transnacional consta de 102 componentes de una sección de las fronteras del Imperio Romano, que en el siglo II de nuestra era se extendía por Europa, Oriente Próximo y el Norte de África, a lo largo de 7.500 km. El sitio comprende emplazamientos e infraestructuras militares y civiles que marcaron el límite de la Baja Alemania entre los siglos I y V de nuestra era. Los vestigios arqueológicos del sitio incluyen campamentos de legionarios, fuertes, fortines, torres, campamentos temporarios, carreteras, puertos, una base para la flota, un canal y un acueducto, así como asentamientos civiles, ciudades, cementerios, santuarios, un anfiteatro y un palacio. Casi todos estos restos arqueológicos están enterrados. Los depósitos repletos de agua del sitio han permitido un alto grado de conservación de los materiales estructurales y orgánicos de los períodos romanos de ocupación y uso.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Этот транснациональный объект, протяженностью примерно 400 км вдоль левого берега реки Нижний Рейн от Рейнского массива в Германии до побережья Северного моря в Нидерландах, состоит из 102 компонентов, расположенных в части пограничной линии древней Римской империи, которая во II веке нашей эры простиралась через Европу, Ближний Восток и Северную Африку на более чем 7500 км. Нижнегерманские рубежи включают в себя военные и гражданские объекты и инфраструктуру, обозначавшие край Нижней Германии с I по V вв. н. э. Археологические находки на территории объекта включают военные базы, форты, крепости, башни, временные лагеря, дороги, гавани, базу флота, канал и акведук, а также гражданские поселения, города, кладбища, святилища, амфитеатр и дворец. Почти все эти археологические останки захоронены под землей. Заболоченные отложения позволили обеспечить высокую степень сохранности как структурных, так и органических материалов периода римской оккупации и использования.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '从德国的莱茵山地到荷兰的北海沿岸，下日耳曼界墙由莱茵河下游左岸约400公里沿线的102个遗产点组成，是罗马帝国边境的一部分。公元2世纪，罗马帝国横跨欧洲、近东和北非，跨度超过7500公里。这些遗产点包括标识公元1-5世纪的下日耳曼边疆的军事和民用遗迹以及基础设施。该遗产地的考古遗迹包括军事基地、堡垒、塔楼、临时营地、道路、港口、舰队基地、运河和渡槽，以及平民居住区、城镇、墓地、避难所、圆形剧场和宫殿。几乎所有这些考古遗迹都埋在地下。遗迹中的浸水沉积物使罗马占领时期的结构和有机材料得到高度完好的保存。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يمتد هذا الموقع على طول 400 كم تقريباً بمحاذاة الضفة اليسرى لنهر الراين الأدنى، ويبدأ من كتلة جبال الراين في ألمانيا وينتهي في ساحل بحر الشمال في هولندا، ويتألف هذا الموقع العابر للحدود من 102 عنصراً ضمن قطاع واحد من حدود الإمبراطورية الرومانية، التي توسَّعت خلال القرن الثاني الميلادي لتمتد على طول 7500 كم عبر أوروبا والشرق الأوسط وشمال أفريقيا. ويضمُّ الموقع بين جنباته مواقع وبنى أساسية عسكرية ومدنية كانت نقاط علام للحدود الجرمانية الدنيا من القرن الأول الميلادي حتى القرن الخامس الميلادي. ويوجد في الموقع بقايا أثرية تتنوع بين قواعد عسكرية وحصون وتحصينات وأبراج، ومعسكرات مؤقتة وطرق وموانئ وقواعد للأساطيل، وقناة وقناة لجر المياه، ومستوطنات للمدنيين ومدن ومقابر ومعابد ومدرَّج وقصر، ولا يزال مجمل هذه البقايا الأثرية تقريباً مدفوناً تحت الأرض. وقد أدَّت الترسبات المشبعة بالمياه في الموقع، دوراً في حفظ المواد الإنشائية والعضوية بدرجة كبيرة، وهي تنحدر من الحقب التي سادت فيها الإمبراطورية الرومانية وقامت باستخدامها.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1631_0013-400-400-20241104123549.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Mathildenhöhe Darmstadt: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Mathildenhöhe Darmstadt',
  'The Darmstadt Artists’ Colony on Mathildenhöhe, the highest elevation above the city of Darmstadt in west-central Germany, was established in 1897 by Ernst Ludwig, Grand Duke of Hesse, as a centre for emerging reform movements in architecture, arts and crafts. The buildings of the colony were created by its artist members as experimental early modernist living and working environments. The colony was expanded during successive international exhibitions in 1901, 1904, 1908 and 1914. Today, it offers a testimony to early modern architecture, urban planning and landscape design, all of which were influenced by the Arts and Crafts movement and the Vienna Secession. The serial property consists of two component parts including 23 elements, such as the Wedding Tower (1908), the Exhibition Hall (1908), the Plane Tree Grove (1833, 1904-14), the Russian Chapel of St. Maria Magdalena (1897-99), the Lily Basin, the Gottfried Schwab Memorial (1905), the Pergola and Garden (1914), the “Swan Temple” Garden Pavilion (1914), the Ernst Ludwig Fountain, and the 13 houses and artists’ studios that were built for the Darmstadt Artists’ Colony and for the international exhibitions. A Three House Group, built for the 1904 exhibition is an additional component.
Description is available under license CC-BY-SA IGO 3.0',
  'Colonia Artiștilor Darmstadt de pe Mathildenhöhe, cea mai înaltă înălțime deasupra orașului Darmstadt din centrul-vestul Germaniei, a fost înființată în 1897 de Ernst Ludwig, Marele Duce de Hesse, ca centru pentru mișcările emergente de reformă în arhitectură, arte și meșteșuguri. Clădirile coloniei au fost create de membrii săi artiști ca medii experimentale de viață și de lucru moderniste timpurii. Colonia a fost extinsă în timpul expozițiilor internaționale succesive din 1901, 1904, 1908 și 1914. Astăzi, ea oferă o mărturie a arhitecturii moderne timpurii, a urbanismului și a designului peisagistic, toate acestea fiind influențate de mișcarea Arte și Meserii și Secesiunea de la Viena. Proprietatea în serie constă din două părți componente, inclusiv 23 de elemente, cum ar fi Turnul Nunții (1908), Sala de expoziții (1908), Plataniul (1833, 1904-14), Capela Rusă Sf. Maria Magdalena (1897-99), Bazinul Crinilor, Grădina Gottfried Schwab (19), Grădina Memorială. Pavilionul Grădinii „Templul lebedelor” (1914), Fântâna Ernst Ludwig și cele 13 case și studiouri ale artiștilor care au fost construite pentru Colonia Artiștilor din Darmstadt și pentru expozițiile internaționale. Un grup cu trei case, construit pentru expoziția din 1904 este o componentă suplimentară.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'La colonie d’artistes de Darmstadt, située dans la Mathildenhöhe, point culminant de la ville de Darmstadt, dans le centre-ouest de l’Allemagne, fut fondée en 1897 par le grand-duc de Hesse, Ernst Ludwig, en tant que centre des nouveaux mouvements réformistes alors émergents dans les domaines de l’architecture, des arts et de l’artisanat. Les bâtiments de la colonie sont l’œuvre des artistes qui en furent les membres, servant de cadres de vie et de travail expérimentaux du début du modernisme. La colonie s’est agrandie au cours des expositions internationales successives de 1901, 1904, 1908 et 1914. Aujourd’hui, elle offre un témoignage des débuts de l’architecture, de l’urbanisme et de l’aménagement paysager modernes, tous inspirés par le mouvement Arts and Crafts et la Sécession viennoise. Le bien en série comprend 23 composantes, dont la Tour matrimoniale (1908), le hall d’exposition (1908), le bosquet de platanes (1833, 1904-14), la chapelle russe Sainte-Marie-Madeleine (1897-99), le bassin du Lys, le mémorial de Gottfried Schwab (1905), la pergola et le jardin (1914), le pavillon de jardin « Temple du Cygne » (1914), la fontaine Ernst Ludwig, ainsi que les 13 maisons et ateliers d’artistes qui furent construits pour la colonie d’artistes de Darmstadt et pour les expositions internationales. Un groupe de trois maisons construites pour l’exposition de 1904 constitue une composante supplémentaire. 
Description is available under license CC-BY-SA IGO 3.0',
  'En 1897 el Gran Duque Ernesto Luis de Hesse patrocinó la fundación de una Colonia de Artistas en la Mathildenhöhe, una colina que domina la ciudad de Darmstadt situada al oeste de la parte central de Alemania. La Colonia se fundó con el propósito de que se convirtiera en un centro de los movimientos renovadores que se manifestaban por entonces en los campos de las artes, la arquitectura y la artesanía. Fueron los propios artistas de la Colonia quienes diseñaron con carácter experimental los espacios de vida y trabajo de las construcciones que se ejecutaron en un estilo precozmente modernista. La Colonia fue cobrando auge gracias a una serie de exposiciones internacionales sucesivas que tuvieron lugar en los años 1901, 1904, 1908 y 1914. Hoy en día sigue constituyendo un testimonio de los albores de la arquitectura, la planificación urbana y la paisajística modernas, influidas todas ellas por el movimiento “Arts and Crafts” y la “Secesión Vienesa”. El sitio consta de dos componentes que abarcan 23 elementos entre los que figuran la Torre del Matrimonio (1908), el Pabellón de Exposiciones (1908), la Arboleda Plana (1833 y 1904-1914), la Capilla Rusa de Santa María Magdalena (1897-1899), el Estanque de los Lirios y el Monumento a Gottfried Schwab (1905), la Pérgola, el Jardín y el pabellón denominado “Templo de los Cisnes” (1914), la Fuente de Ernesto Luis de Hesse y 13 hogares y estudios de artistas construidos para la Colonia y las exposiciones internacionales. Otro elemento complementario es el Grupo de Tres Casas edificado para la exposición de 1904.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Дармштадтская колония художников на Матильденхёэ, самом высоком возвышении над городом Дармштадт в западно-центральной Германии, была основана в 1897 году Эрнстом Людвигом, великим герцогом Гессенским, в качестве центра для новых реформаторских движений в архитектуре, искусстве и ремеслах. Здания колонии были созданы художниками как экспериментальные жилые и рабочие пространства раннего модерна. Колония расширялась в ходе ряда международных выставок в 1901, 1904, 1908 и 1914 годах. Сегодня она является свидетельством ранней современной архитектуры, городского планирования и ландшафтного дизайна, на которые повлияло движение «Искусства и ремесла» и Венский сецессион. Этот серийный объект состоит из двух составных частей, включая 23 элемента, такие как Свадебная башня (1908 г.), Выставочный зал (1908 г.), Платановая роща (1833, 1904-1914 гг.), Церковь Святой Марии Магдалины (1897-1899 гг.), Бассейн с лилиями, Мемориал Готфрида Шваба (1905 г.), Пергола и сад (1914 г.), Садовый павильон «Лебединый храм» (1914 г.), Фонтан Эрнста Людвига и 13 домов и мастерских художников, которые были построены для Дармштадской колонии художников и для международных выставок. Дополнительным элементом является группа из трех домов, построенная к выставке 1904 года.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '达姆施塔特艺术家村位于德国中西部达姆施塔特市的制高点玛蒂尔德高地上，由黑森大公路德维希(Ernst Ludwig)创建于1897年，是当时建筑、艺术和手工艺领域新兴改革运动的中心。这里的建筑由其艺术家成员设计，用作实验性的早期现代主义生活和工作环境。随着在1901、1904、1908和1914年接连举办的国际展览，艺术村不断扩张。如今，早期的现代建筑、城市规划和景观设计都在这里留下了印迹，所有这些都受到了工艺美术运动和维也纳分离派的影响。该遗产地包含2个组成部分，共23处遗产点。第一部分为婚礼塔(1908年)、展览厅(1908年)、梧桐林(1833年，1904-14年)、抹大拉的玛丽亚俄罗斯小教堂(1897-99年)、百合池、戈特弗里德•施瓦布纪念雕塑(1905年)、凉棚与花园(1914年)、“天鹅殿”凉亭(1914年)、恩斯特•路德维希喷泉，以及为达姆施塔特艺术家村和国际展览而建造的13处艺术家住宅与工作室。第二部分是为1904年展览建造的、由3部分组成的建筑群
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'أسَّس دوق هسن الأكبر، إرنست لودفغ، في عام 1897 مجمع دارمشتات للفن على مرتفع ماتيلدنهوة، وهو أعلى نقطة مطلة على مدينة درامشتات التي تقع غرب وسط ألمانيا، ليكون مركزاً للحركات الناشئة في مجال العمارة والفنون والحِرف. وقد صمَّم الفنانون الأعضاء في المجمع الأبنية فيه لتكون بيئات تجريبية للعيش والعمل فيها على نسق مطلع طراز الحداثة. وقد جرى توسيع المجمَّع خلال المعارض الدولية المتلاحقة التي أقيمت في عام 1901 و1904 و1908 و1914. وهو يشهد اليوم على بواكير فن العمارة الحديثة وتخطيط المدن وتصميم المناظر الطبيعية، التي تأثرت جميعها بحركة الفنون والحِرف وبحركة انفصال فيينا. وتتألف الممتلكات المتسلسلة من جزئين مكونين لها يضمَّان 23 عنصراً، مثل برج العرس (1908) وصالة المعارض (1908)، وبستان أشجار الدلب (1833، 1904-1914)، والكنيسة الروسية "مريم المجدلية" (1897-1899)، وحوض أزهار الزنبق والنصب التذكاري لغوتفريد شواب (1905)، والعريشة والحديقة (1914)، وسرادق الحديقة "معبد البجع" (1914)، ونافورة إرنست لودفغ والمنازل ومحترَفات الفنانين التي يبلغ عددها 13 والتي بنيت داخل مجمع دارمشتات للفن ومن أجل المعارض الدولية. ويضمُّ المجمع عنصراً إضافياً يتألف من مجموعة من ثلاثة منازل بنيت من أجل المعرض الذي أقيم في عام 1904.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1614_0012-400-400-20210603113952.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] ShUM Sites of Speyer, Worms and Mainz: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'ShUM Sites of Speyer, Worms and Mainz',
  'Located in the former Imperial cathedral cities of Speyer, Worms and Mainz, in the Upper Rhine Valley, the serial site of Speyer, Worms and Mainz comprise the Speyer Jewry-Court, with the structures of the synagogue and women’s shul (Yiddish for synagogue), the archaeological vestiges of the yeshiva (religious school), the courtyard and the still intact underground mikveh (ritual bath), which has retained its high architectural and building quality. The property also comprises the Worms Synagogue Compound, with its in situ post-war reconstruction of the 12th century synagogue and 13th century women’s shul, the community hall (Rashi House), and the monumental 12th-century mikveh. The series also includes the Old Jewish Cemetery in Worms and the Old Jewish Cemetery in Mainz. The four component sites tangibly reflect the early emergence of distinctive Ashkenaz customs and the development and settlement pattern of the ShUM communities, particularly between the 11th and the 14th centuries. The buildings that constitute the property served as prototypes for later Jewish community and religious buildings as well as cemeteries in Europe. The acronym ShUM stands for the Hebrew initials of Speyer, Worms and Mainz.
Description is available under license CC-BY-SA IGO 3.0',
  'Situat în fostele orașe catedrale imperiale Speyer, Worms și Mainz, în Valea Rinului Superior, situl în serie Speyer, Worms și Mainz cuprinde Tribunalul evreiesc Speyer, cu structurile sinagogii și shul pentru femei (idiș pentru sinagogă), vestigiile arheologice ale yeshivei și școlii religioase încă din curte (în curte). (baie rituală), care și-a păstrat înaltă calitate arhitecturală și de construcție. Proprietatea cuprinde, de asemenea, Complexul Sinagogii Worms, cu reconstrucția sa in situ după război a sinagogii din secolul al XII-lea și a shul-ului pentru femei din secolul al XIII-lea, sala comunității (Casa Rashi) și monumentalul mikveh din secolul al XII-lea. Seria include, de asemenea, Vechiul Cimitir Evreiesc din Worms și Vechiul Cimitir Evreiesc din Mainz. Cele patru situri componente reflectă în mod tangibil apariția timpurie a obiceiurilor distinctive Ashkenaz și modelul de dezvoltare și așezare a comunităților ShUM, în special între secolele XI și XIV. Clădirile care constituie proprietatea au servit drept prototipuri pentru comunitatea evreiască și clădirile religioase de mai târziu, precum și cimitirele din Europa. Acronimul ShUM reprezintă inițialele ebraice ale lui Speyer, Worms și Mainz.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Situé dans les anciennes villes cathédrales impériales de la vallée du Rhin supérieur, Spire, Worms et Mayence, ce site en série comprend à Spire la Cour de justice de la communauté juive, avec les structures de la synagogue et de la shul(synagogue, en yiddish) des femmes, les vestiges archéologiques de la yeshiva (école religieuse), la cour et le mikveh (bâtiments pour les bains rituels) souterrain encore intact, lequel a conservé sa grande qualité architecturale et de construction. Le bien comprend également le complexe de la synagogue, avec la synagogue (XIIe siècle) reconstruite in situ après la guerre et la shul des femmes (XIIe siècle), la salle communautaire (maison Rachi) et le mikveh monumental du XIIe siècle. La série comprend également l’ancien cimetière juif de Worms et celui de Mayence. Ces quatre éléments reflètent de manière tangible l’émergence initiale des coutumes distinctes des juifs ashkénazes et le modèle de développement et d’établissement des communautés SchUM dans ces trois villes, en particulier du XIe au XIVe siècle. Les édifices qui constituent le bien ont servi de prototypes aux communautés juives et aux bâtiments religieux ultérieurs ainsi que pour les cimetières en Europe. L’acronyme SchUM correspond aux initiales hébraïques de Spire, Worms et Mayence.
Description is available under license CC-BY-SA IGO 3.0',
  'Situado en las antiguas ciudades catedralicias imperiales de Speyer, Worms y Maguncia, en el valle del Alto Rin, el conjunto de Espira, Worms y Maguncia comprende el Patio judío de Speyer, con las estructuras de la sinagoga y la shulfemenina (sinagoga en yidish), los vestigios arqueológicos de la yeshiva (escuela religiosa), el patio y la mikve (baño ritual) subterránea aún intacta, que ha conservado su alta calidad arquitectónica y constructiva. El sitio también comprende el recinto de la sinagoga de Worms, con su reconstrucción in situ después de la guerra de la sinagoga del siglo XII y la shul femenina del siglo XIII, el salón comunitario (Casa Rashi) y la monumental mikve del siglo XII. La serie también incluye el antiguo cementerio judío de Worms y el antiguo cementerio judío de Maguncia. Los cuatro lugares que componen el sitio reflejan de forma tangible la aparición temprana de las costumbres distintivas asquenazíes y el desarrollo y el patrón de asentamiento de las comunidades ShUM, especialmente entre los siglos XI y XIV. Los edificios que constituyen el sitio sirvieron de prototipo para posteriores edificios comunitarios y religiosos judíos, así como para cementerios en Europa. El acrónimo ShUM corresponde a las iniciales hebreas de Espira, Worms y Maguncia.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Расположенный в бывших имперских соборных городах Шпайер, Вормс и Майнц, в долине Верхнего Рейна, серийный объект включает Еврейский двор в Шпайере с синагогой и женской синагогой, археологические остатки ешивы (религиозная школа), двор и все еще нетронутую подземную микву (ритуальная баня), которая сохранила свое высокое архитектурное и строительное качество. В состав объекта также входят Комплекс Вормсской синагоги с послевоенной реконструкцией на месте синагоги XII века и женской синагоги XIII века, а также общественный зал (дом Раши) и монументальная миква XII века. На территории серийного объекта также находятся Старое еврейское кладбище в Вормсе и Старое еврейское кладбище в Майнце. Четыре составляющие объекта наглядно отражают раннее появление отличительных обычаев ашкеназов, а также структуру развития и расселения общин ШУМ, особенно в период между XI и XIV веками. Здания, которые составляют объект, служили прототипами для более поздних еврейских общин и религиозных построек, а также кладбищ в Европе. Аббревиатура ШУМ (ShUM) представляет собой сокращение названий трех немецких городов - Шпайер, Вормс и Майнц.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '该遗产地位于莱茵河谷上游的施派尔、沃尔姆斯和美因茨等前帝国座堂城市。施派尔犹太会堂部分包括犹太教堂和妇女会堂的建筑结构、犹太学校考古遗迹、庭院和仍然完好无损的地下浸礼池，建筑及施工质量很高。沃尔姆斯犹太会堂建筑群部分包括战后在原址重建的12世纪犹太教堂和13世纪妇女会堂、犹太社区礼堂和纪念性的12世纪浸礼池。遗产地还包括沃尔姆斯和美因茨的老犹太公墓。这4个组成部分生动地反映了独特的德系犹太人风俗的初期形成过程，以及犹太社区的发展和定居模式，尤以11-14世纪最为突出。这些建筑是后来欧洲犹太社区、宗教建筑以及墓地的原型。希伯来语中“犹太社区”（ShUM）一词就是施派尔、沃尔姆斯和美因茨的首字母缩写。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يقع الموقع المتسلسل في مدن الكاتدرائيات الإمبراطورية سابقاً، ألا وهي مُدن شباير وفورمز وماينز الكائنة في وادي الراين الأعلى. ويضم الموقع محكمة تعود للمجتمع المحلي اليهودي وهياكل معبد يهودي ومعبد آخر للنساء اليهوديات (أي "شول" باللغة اليديشية) وبقايا أثرية لمدرسة "يشيفا" الدينية وفناء "الميكفاه" (مكان الاستحمام التعبّدي) وسردابه الذي لم تَشِبه شائبة وحافظ على الجودة الرفيعة للعمارة والبناء فيه. ويضم الموقع أيضاً مجمع المعبد اليهودي في فورمز، والكنيس الذي يعود تاريخه للقرن الثاني عشر وكنيس النساء الذي يعود للقرن الثالث عشر اللذين رُمّما بعد الحرب، ومجلس المجتمع المحلي (بيت راشي)، والميكفاه الأثرية التي يعود تاريخها إلى القرن الثاني عشر. ويضم الموقع المتسلسل أيضاً المقبرة اليهودية القديمة في ماينز. ويجسّد الموقع المؤلف من أربعة مكوّنات البداية المبكّرة لتقاليد الأشكناز وتبلوُرِ مفهوم أنماط الاستيطان لدى مجتمعات مدن "الشوم"، لا سيما بين القرنَين الحادي عشر والرابع عشر. هذا وغدت المباني والصروح التي يتألف منها الموقع بمثابة نماذج أولية للمجتمع اليهودي والمباني الدينية في المراحل اللاحقة، فضلاً عن المقابر الأوروبية. وإنّ الاسم المختصر "شوم" مؤلف من الأحرف الأولى من أسماء المدن شباير وفورمز وماينز.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1636_0003-400-400-20210604115457.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Jewish-Medieval Heritage of Erfurt: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Jewish-Medieval Heritage of Erfurt',
  'Located in the medieval historic centre of Erfurt, the capital city of Thuringia, the property comprises three monuments: the Old Synagogue, the Mikveh, and the Stone House. They illustrate the life of the local Jewish community and its coexistence with a Christian majority in Central Europe during the Middle Ages, between the end of the 11th and the mid-14th century.
Description is available under license CC-BY-SA IGO 3.0',
  'Situată în centrul istoric medieval al orașului Erfurt, capitala Turingiei, proprietatea cuprinde trei monumente: Sinagoga Veche, Mikveh și Casa de Piatră. Ele ilustrează viața comunității evreiești locale și coexistența acesteia cu o majoritate creștină în Europa Centrală în timpul Evului Mediu, între sfârșitul secolului al XI-lea și mijlocul secolului al XIV-lea.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Situé dans le centre historique médiéval d’Erfurt, la capitale de la Thuringe, ce bien comprend trois monuments : la vieille synagogue, le mikveh (bain rituel) et la maison de pierre. Ces monuments illustrent la vie de la communauté juive locale et sa coexistence avec la majorité chrétienne en Europe centrale durant le Moyen Âge, entre la fin du XIe siècle et le milieu du XIVe siècle.
Description is available under license CC-BY-SA IGO 3.0',
  'Situado en el centro histórico medieval de Erfurt, capital de Turingia, el sitio comprende tres monumentos: la Sinagoga Vieja, la Mikve (baño ritual) y la Casa de Piedra. Ilustran la vida de la comunidad judía local y su coexistencia con una mayoría cristiana en Europa Central durante la Edad Media, entre finales del siglo XI y mediados del XIV.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Расположенный в средневековом историческом центре Эрфурта, столицы Тюрингии, объект включает в себя три памятника: Старую синагогу, Микве и Каменный дом. Они иллюстрируют жизнь местной еврейской общины и ее сосуществование с христианским большинством в Центральной Европе в эпоху Средневековья, с конца XI до середины XIV века.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '遗产位于图林根自由州首府埃尔福特（Erfurt）的中世纪古城，由3座古建筑组成：旧犹太教堂、浸礼池、石屋。它们展现了中世纪时期（公元11世纪末至14世纪中期）中欧地区犹太社区的生活，及其与基督教多数派的共存。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يقع هذا الموقع في المركز التاريخي لمدينة إيرفورت الذي يعود إلى العصور الوسطى، والمدينة هي عاصمة ولاية تورينجيا، ويتضمن الموقع المعالم الأثرية الثلاثة التالية: الكنيس القديم والميكفاه والبيت الحجري. وتعرض هذه المعالم حياة المجتمع المحلي لليهود وتعايشهم مع الأغلبية المسيحية في وسط أوروبا خلال فترة العصور الوسطى بين أواخر القرن الحادي عشر وأواسط القرن الرابع عشر.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1656_0002-400-400-20231020132959.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Schwerin Residence Ensemble: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Schwerin Residence Ensemble',
  'Established on the shores of Lake Schwerin in northeast Germany, the Schwerin Residence Ensemble is an architectural and landscape ensemble, which fits very precisely within the context of the emergence and development of the historicist style in Europe. Created for the most part in the 19th century in what was then the capital of the Grand Duchy of Mecklenburg-Schwerin in northeast Germany, the property comprises 38 elements, including the Grand Duke’s Residence Palace and manor houses, cultural and sacred buildings, and the Pfaffenteich ornamental lake. But it also fulfils all the functions required of a ducal capital in terms of administration, defence, service infrastructure, transportation, prestige and cultural activities, with parks, canals, ponds and lakes, and public spaces. The buildings form an exceptional architectural ensemble, ranging from Neo­-Classical to Neo-Baroque and Neo-Renaissance and even includes in certain cases references to the more regional Neo-Renaissance "Johann-Albrecht" style, with influences from the Italian Renaissance. 
Description is available under license CC-BY-SA IGO 3.0',
  'Înființat pe malul lacului Schwerin din nord-estul Germaniei, Schwerin Residence Ensemble este un ansamblu arhitectural și peisagistic, care se încadrează foarte precis în contextul apariției și dezvoltării stilului istoricist în Europa. Creată în cea mai mare parte în secolul al XIX-lea în ceea ce era atunci capitala Marelui Ducat de Mecklenburg-Schwerin din nord-estul Germaniei, proprietatea cuprinde 38 de elemente, inclusiv Palatul Marelui Duce și conacele, clădirile culturale și sacre și lacul ornamental Pfaffenteich. Dar îndeplinește și toate funcțiile cerute unei capitale ducale în materie de administrare, apărare, infrastructură de servicii, transport, prestigiu și activități culturale, cu parcuri, canale, iazuri și lacuri, precum și spații publice. Clădirile formează un ansamblu arhitectural de excepție, variind de la neoclasic la neobaroc și neorenascentist și chiar include în anumite cazuri referiri la stilul mai regional neorenascentist „Johann-Albrecht”, cu influențe din Renașterea italiană. 
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Établi sur les rives du lac de Schwerin, dans le nord-est de l''Allemagne, l''ensemble résidentiel de Schwerin est un ensemble architectural et paysager qui s''inscrit très précisément dans le contexte de l''émergence et du développement du style historiciste en Europe. Créé pour l’essentiel au cours de la première moitié du XIXe siècle au cœur de la capitale du grand-duché de Mecklembourg-Schwerin, le bien est composé de 38 éléments, dont le palais grand-ducal, des manoirs, des édifices culturels et sacrés, et l’étang d’agrément Pfaffenteich. Mais il remplit aussi les fonctions nécessaires à une capitale ducale en matière d’administration, de défense, de fonctionnement, de déplacement, de prestige et d’activités culturelles ; il comprend également un ensemble de parcs, canaux, plans d’eau et places publiques. Ces édifices composent un ensemble architectural exceptionnel, allant du néo-classique au néo-baroque et à la néo-renaissance, avec même, dans certains cas, des références au style néo-renaissance « Johann-Albrecht », plus régional, tout en s’inspirant de la Renaissance italienne. 
Description is available under license CC-BY-SA IGO 3.0',
  'El sitio se construyó en su mayor parte en la primera mitad del siglo XIX en la que entonces era la capital del Gran Ducado de Mecklemburgo-Schwerin, en el noreste de Alemania. La propiedad comprende 38 elementos, entre los cuales se encuentran el Palacio de la Residencia del Gran Duque y casas señoriales, edificios culturales y sagrados, y el lago ornamental Pfaffenteich. Además, cumple con todas las funciones requeridas de una capital ducal en términos de administración, defensa, infraestructuras de servicios, transporte, prestigio y actividades culturales. Para ello cuenta con parques, canales, estanques y lagos, así como espacios públicos. Los edificios forman un conjunto arquitectónico excepcional que refleja el espíritu historicista de la época, abarcando desde el neorrenacimiento hasta el neobarroco y el neoclásico, con influencias del Renacimiento italiano.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Большая часть комплекса была создана в XIX веке в качестве столицы великого герцогства Мекленбург-Шверин на северо-востоке Германии. В состав объекта входят 38 частей, включая дворец-резиденцию великого герцога и усадьбы, культурные и священные сооружения, а также декоративное озеро Пфаффентейх. Кроме того, этот комплекс выполняет все функции, возлагаемые на герцогскую столицу в области управления, обороны, инфраструктуры, транспорта, поддержания престижа и организации культурного досуга: в нем есть парки, каналы, пруды и озера, а также общественные пространства. Здания образуют исключительный архитектурный ансамбль, отражающий исторический дух того времени: от неоренессанса до необарокко и неоклассицизма, включая влияние итальянского Возрождения.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '什未林住宅区大部分建于19世纪上半叶，位于当时的梅克伦堡—什未林大公国首都，现今德国东北部。住宅区由38个部分组成，包括大公府邸和庄园、文化和宗教建筑、普法芬（Pfaffenteich）景观湖等。其中的公园、运河、池塘湖泊和公共空间满足了公国首都在行政、防卫、服务类基础设施、交通、文化、政治影响方面的所有需求。这些建筑形成独特的建筑群，反映了当年时代精神的历史脉络，展现意大利文艺复兴影响下的新文艺复兴、新巴洛克、新古典主义艺术风格。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'أُنشئ معظم هذا المجمَّع في القرن التاسع عشر فيما كان يُعرف حينها بعاصمة دوقية مكلنبرغ-شويرن في شمال شرق ألمانيا، ويتألف الموقع من 38 عنصراً، بما فيها قصر إقامة الدوق الأكبر ومنازل النبلاء والمباني المخصصة للأغراض الثقافية والدينية وبحيرة بفايفنتايش الاصطناعية التزيينية. ويلبي هذا المجمَّع أيضاً جميع الوظائف المطلوبة من عاصمة للدوقية من ناحية الإدارة والدفاع والبنية الأساسية للخدمات والنقل والمكانة الاجتماعية والأنشطة الثقافية، إلى جانب الحدائق والقنوات والبرك والبحيرات والأماكن العامة. وتشكِّل هذه المباني مجمَّعاً معمارياً استثنائياً يعكس الروح التاريخية لذلك الوقت التي تتنوع بين النهضة الجديدة والباروك الجديد والكلاسيكية الجديدة مع تأثيرات للنهضة الإيطالية.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1705_0012-400-400-20240605111802.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] The Palaces of King Ludwig II of Bavaria: Neuschwanstein, Linderhof, Schachen and Herrenchiemsee: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'The Palaces of King Ludwig II of Bavaria: Neuschwanstein, Linderhof, Schachen and Herrenchiemsee',
  'This serial property consists of four grand palace complexes in Bavaria’s alpine region, built under King Ludwig II between 1868 and 1886. Designed as personal retreats and imaginative escapes, they reflect the romantic and eclectic spirit of the era. Drawing inspiration from the Wartburg Castle, Versailles, German fairy tales, and Wagner’s operas, the palaces showcase historicist styles and advanced 19th-century techniques. Carefully integrated into stunning natural landscapes, they embody Ludwig’s artistic vision. Opened to the public shortly after his death in 1886, these sites are now preserved as museums and remain major cultural landmarks.
Description is available under license CC-BY-SA IGO 3.0',
  'Această proprietate în serie constă din patru complexe mari de palate din regiunea alpină a Bavariei, construite sub regele Ludwig al II-lea între 1868 și 1886. Proiectate ca refugii personale și evadari imaginative, ele reflectă spiritul romantic și eclectic al epocii. Inspirându-se din Castelul Wartburg, Versailles, basmele germane și operele lui Wagner, palatele prezintă stiluri istoriciste și tehnici avansate din secolul al XIX-lea. Integrate cu grijă în peisaje naturale uimitoare, ele întruchipează viziunea artistică a lui Ludwig. Deschise publicului la scurt timp după moartea sa în 1886, aceste situri sunt acum păstrate ca muzee și rămân repere culturale majore.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Ce bien en série regroupe quatre ensembles palatiaux situés dans la région alpine de Bavière et construits sous le règne du roi Louis II de Bavière, de 1868 à 1886. Conçus comme des lieux de retraite, ils reflètent la vision romantique et éclectique de l’époque. Inspirés des châteaux de la Wartbourg et de Versailles, des contes de fée allemands et des opéras de Wagner, ces châteaux mêlent styles historicistes et techniques innovantes du XIXe siècle. Implantés avec soin au sein de paysages naturels spectaculaires, ils incarnent la vision artistique de Louis II de Bavière. Ouverts au public peu après son décès en 1886, ces sites sont aujourd’hui préservés comme musées et monuments culturels majeurs.
Description is available under license CC-BY-SA IGO 3.0',
  'Esta serie de bienes patrimoniales consta de cuatro grandes complejos de palacios en la región alpina de Baviera construidos bajo el reinado de Luis II entre 1868 y 1886. Diseñados como retiros personales y escapadas imaginativas, reflejan el espíritu romántico y ecléctico de la época. Inspirados en el castillo de Wartburg, en Versalles, en los cuentos de hadas alemanes y las óperas de Wagner, los palacios muestran estilos historicistas y técnicas avanzadas del siglo XIX. Cuidadosamente integrados en impresionantes paisajes naturales, encarnan la visión artística del rey Luis II. Abiertos al público poco después de su muerte en 1886, estos lugares se conservan ahora como museos y siguen siendo importantes monumentos culturales.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Этот серийный объект состоит из четырёх замков, построенных для короля Людвига II в регионе Баварских Альп с 1868 по 1886 год. Они задумывались как пространства для уединения и фантазий, что отражает романтический и эклектичный дух эпохи. Источниками вдохновения стали замок Вартбург, дворец Версаль, немецкие сказки и оперы Вагнера. Архитектурный облик замков сочетает стили историзма с передовыми инженерными решениями XIX века. Они были органично вписаны в живописные природные пейзажи и воплощают художественное видение Людвига. Вскоре после его смерти в 1886 году замки были открыты для публики. Сегодня они функционируют как музеи и остаются важными культурными достопримечательностями.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '该系列遗产包括巴伐利亚阿尔卑斯地区4处宏伟宫殿建筑群，由路德维希二世国王于1868-1886年兴建，作为个人静修与畅想的避世之所，反映了浪漫主义与兼收并蓄的时代精神。其设计灵感来自瓦尔特堡、凡尔赛宫、德国童话及瓦格纳歌剧，体现历史主义风格与19世纪先进建筑技术的结合。这些建筑巧妙融入壮丽的自然景观，诠释出国王的艺术理想。宫殿群自1886年国王逝世后不久即对公众开放，现作为博物馆得到妥善保护，且仍是重要文化地标。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يتألف هذا العنصر المتسلسل من أربعة مجمّعات قصور ضخمة تقع في منطقة جبال الألب من بافاريا وشُيّدت في عهد الملك لودفيغ الثاني بين عامَي 1868 و1886. ونظراً إلى تصميمها لتكون بمنزلة ممالك شخصية يختلي بها الملك ويهرب إلى خبايا مخيلته، فهي تجسّد نمط العمارة الرومانسية والروح الانتقائية التي تتميز بهما تلك الحقبة. واستُلهمت تصاميم هذه القصور المعمارية من قلعة فارتبورغ وقصر فرساي وبيوت الحكايات الخرافية الألمانية ودور أوبرا فاغنر بصورة تُجسّد أنماطاً تاريخية وتقنيات معمارية متقدّمة تعود إلى القرن التاسع عشر. ودمجت هذه القصور بعناية بالغة في قلب مناظر طبيعية خلابة بصورة تتماشى مع الرؤية الفنية للملك لودفيغ. وبدأت هذه القصور باستقبال الزوّار بعد فترة وجيزة من وفاة الملك في عام 1886، وتُصان هذه المواقع اليوم بوصفها متاحف وتحتفظ بمكانتها كمعالم ثقافية بارزة.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1726_0004-400-400-20250616151202.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] The Historic Centre (Chorá) with the Monastery of Saint-John the Theologian and the Cave of the Apocalypse on the Island of Pátmos: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'The Historic Centre (Chorá) with the Monastery of Saint-John the Theologian and the Cave of the Apocalypse on the Island of Pátmos',
  'The small island of Pátmos in the Dodecanese is reputed to be where St John the Theologian wrote both his Gospel and the Apocalypse. A monastery dedicated to the ‘beloved disciple’ was founded there in the late 10th century and it has been a place of pilgrimage and Greek Orthodox learning ever since. The fine monastic complex dominates the island. The old settlement of Chorá, associated with it, contains many religious and secular buildings.
Description is available under license CC-BY-SA IGO 3.0',
  'Mica insulă Pátmos din Dodecanezul este reputată a fi locul unde Sfântul Ioan Teologul și-a scris atât Evanghelia, cât și Apocalipsa. Acolo a fost fondată la sfârșitul secolului al X-lea o mănăstire dedicată „uceniculului iubit” și de atunci a fost un loc de pelerinaj și de învățare greco-ortodoxă. Complexul monahal fin domină insula. Vechea așezare Chorá, asociată cu aceasta, conține multe clădiri religioase și laice.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'La petite île de Pátmos, dans le Dodécanèse, est réputée être l’endroit où saint Jean le Théologien a écrit son Évangile et l’Apocalypse. Un monastère dédié au « disciple bien aimé » y a été fondé à la fin du Xe siècle. Il est depuis cette époque un lieu de pèlerinage et d’enseignement orthodoxe grec permanent. Ce magnifique complexe monastique domine l’île, et l’ancien établissement de Chorá, qui lui est associé, abrite de nombreux édifices religieux et séculiers.
Description is available under license CC-BY-SA IGO 3.0',
  'Situada en el archipiélago del Dodecaneso, la pequeña isla de Patmos, es célebre por ser el lugar donde San Juan el Teólogo escribió su Evangelio y el Apocalipsis. A finales del siglo X se fundó en la isla un monasterio dedicado al “discípulo bien amado”, que se convirtió en lugar de peregrinación y centro de enseñanza de la Iglesia Ortodoxa griega. Este magnífico conjunto monástico domina la isla, mientras que el antiguo y vecino asentamiento humano de Chorá cuenta con numerosos edificios religiosos y civiles.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Небольшой остров Патмос, входящий в состав архипелага Додеканес, известен тем, что здесь Св. Иоанн Богослов создал свое Евангелие и Апокалипсис. Монастырь, посвященный «любимому ученику», был основан в конце Х в., и с того времени он является местом паломничества и греческого православного образования. Прекрасный монастырский комплекс доминирует на острове, с ним также связано старое поселение Хора с церковными и гражданскими зданиями.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '多德卡尼斯群岛的帕特莫斯小岛由于圣约翰神学家在此创作《福音书》和《启示录》而驰名。10世纪后期，有人在这里为“挚爱的门徒”修建了一座修道院，从此，这里便一直是一个朝圣地，也是希腊东正教学习之地。岛上占主体地位的是精美的修道院建筑群，焦耳城(Chorá)古老的住区及其周围有许多宗教和世俗的建筑。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'ギリシア南東部、エーゲ海に浮かぶドデカニソス諸島の島。ローマ時代の流刑地で、西暦94年、聖ヨハネが流刑中に福音書と黙示録を著した。聖ヨハネ修道院は11世紀の建立。島の中央に“黙示録の洞窟（黙示録修道院）”がある。歴史地区ホーラは「主要な町」の意味で、修道院の黒ずんだ城壁を白く取り囲んで広がっている。古くは16世紀の建造。',
  '',
  '',
  '',
  'تُعرف جزيرة باتموس الصغيرة الواقعة في جزيرة الدودكانيز بأنها المكان الذي وضع فيه القديس يوحنا الحبيب نسخته من الإنجيل وكتاب الرؤيا المعروف بـ"رؤيا يوحنا". وتأسس في أواخر القرن العاشر دير خُصّص لتلميذ المسيح، ليصبح هذا الدير منذ تلك الفترة وعلى مر العصور مكان حج وتعليم لطائفة الروم الأروثوذوكس. هذا المجمع الكنسي الرائع هو الصرح الطاغي على جزيرة باتموس، ويضمّ موقع كورا القديم المتصل بها العديد من الأبنية الدينية والمدنية.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0942_0001-400-400-20090923171713.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Zagori Cultural Landscape: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Zagori Cultural Landscape',
  'Located in a remote rural landscape in northwestern Greece, small stone villages known as Zagorochoria extend along the western slopes of the northern part of the Pindus mountain range. These traditional villages, typically organized around a central square containing a plane tree and surrounded by sacred forests maintained by local communities, showcase a traditional architecture adapted to the mountain topography. A network of stone-arched bridges, stone cobbled paths, and stone staircases linking the villages formed a system that served as a political and social unit connecting the communities of the Vikos and the Voïdomatis River basin.
Description is available under license CC-BY-SA IGO 3.0',
  'Situate într-un peisaj rural îndepărtat din nord-vestul Greciei, mici sate de piatră cunoscute sub numele de Zagorochoria se întind de-a lungul versanților vestici ai părții de nord a lanțului muntos Pindus. Aceste sate tradiționale, organizate în mod obișnuit în jurul unei piețe centrale care conține un platan și înconjurate de păduri sacre întreținute de comunitățile locale, prezintă o arhitectură tradițională adaptată topografiei montane. O rețea de poduri cu arc de piatră, poteci pietruite de piatră și scări de piatră care leagă satele au format un sistem care a servit ca unitate politică și socială care leagă comunitățile din Vikos și bazinul râului Voïdomatis.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Situé dans un paysage rural reculé au nord-ouest de la Grèce, des petits villages en pierre connus sous le nom de Zagorochoria s’étendent le long du versant occidental de la partie septentrionale du massif montagneux du Pinde. Ces villages traditionnels, généralement organisés autour d’une place centrale sur laquelle se dresse un platane, et entourés de forêts sacrées entretenues par les communautés locales, présentent une architecture traditionnelle adaptée à la topographie des montagnes. Un ensemble de ponts en arc, de chemins pavés et d''escaliers, tous en pierre, reliait les villages et formait un réseau assurant l''unité politique et sociale des communautés du bassin de la rivière Vikos et de la rivière Voïdomatis.
Description is available under license CC-BY-SA IGO 3.0',
  'Situados en un remoto paisaje rural del noroeste de Grecia, los pequeños pueblos de piedra conocidos como Zagorochoria se extienden a lo largo de las laderas occidentales de la parte septentrional de la cordillera del Pindo. Estos pueblos tradicionales, típicamente organizados en torno a una plaza central que contiene un plátano y rodeados de bosques sagrados mantenidos por las comunidades locales, muestran una arquitectura tradicional adaptada a la topografía montañosa. Los pueblos se conectaban a través de una red de puentes con arcos de piedra, caminos empedrados y escaleras de piedra, creando así un sistema que funcionaba como una unidad política y social, uniendo a las comunidades de la cuenca del río Voïdomatis.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Небольшие каменные деревни, известные как Загорохория, расположены в отдаленных сельских районах на северо-западе Греции и тянутся вдоль западных склонов северной части горного массива Пинд. Эти традиционные деревни, расположенные вокруг центральной площади с платаном и окруженные священными лесами, поддерживаемыми местными общинами, демонстрируют традиционную архитектуру, адаптированную к горному рельефу. Сеть каменных мостов, мощеных дорожек и каменных лестниц, соединяющих деревни, образует систему, которая служит политической и социальной единицей, связывающей сообщества бассейна реки Войдоматис.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '扎戈里的小石村散落于希腊西北部的偏远乡村，沿着品都斯山北段的西坡分布。这些传统村落通常围绕着中心广场而建，广场上有一棵悬铃木。村庄外围则是由当地社区养护的神圣森林。这些村落展现了与山区地形相适应的建筑传统。石拱桥、鹅卵石小路和石砌台阶组成路网，串联起作为沃伊多马蒂斯河（Voïdomatis River）流域社区的政治和社会单位的村庄。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'تقع القرى الحجرية الصغيرة المعروفة باسم "زاجوروشوريا" في منطقة ريفية نائية في شمال غرب اليونان، وتمتد على طول المنحدرات الغربية للجزء الشمالي من سلسلة جبال بيندوس. تُشيّد هذه القرى التقليدية عادة حول ساحة مركزية فيها شجرة دلب وتحيط بها غابات مقدسة تحافظ عليها المجتمعات المحلية، وتتميز بعمارة تقليدية تتلاءم مع تضاريس الجبال.وشكلت شبكة من الجسور الحجرية المقوسة، والممرات المرصوفة بالحصى، والسلالم الحجرية التي تربط القرى، نظاماً كان بمنزلة وحدة سياسية واجتماعية تربط مجتمعات حوض نهر فويدوماتيس.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1695_0003-400-400-20230712140602.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Minoan Palatial Centres: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Minoan Palatial Centres',
  'This serial property comprises six archaeological sites on Crete dating from 1900 to 1100 BCE. These sites represent the Minoan civilization, a major prehistoric Mediterranean culture. The palatial centres served as administrative, economic, and religious hubs, featuring advanced architecture, urban planning, and vibrant frescoes. They reveal early writing systems, maritime networks, and cultural exchanges. The property highlights the complexity of the Minoans’ social structure and their enduring influence on Mediterranean history.
Description is available under license CC-BY-SA IGO 3.0',
  'Această proprietate în serie cuprinde șase situri arheologice din Creta, datând între 1900 și 1100 î.Hr. Aceste situri reprezintă civilizația minoică, o cultură mediteraneană preistorică majoră. Centrele palatioase au servit ca centre administrative, economice și religioase, prezentând arhitectură avansată, planificare urbană și fresce vibrante. Ele dezvăluie sisteme timpurii de scriere, rețele maritime și schimburi culturale. Proprietatea evidențiază complexitatea structurii sociale a minoicilor și influența lor durabilă asupra istoriei mediteraneene.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Ce bien en série comprend six sites archéologiques situés en Crète, datant de 1 900 à 1 100 avant notre ère. Ces sites illustrent la civilisation minoenne, une importance société préhistorique de la Méditerranée. Les centres palatiaux remplissaient des fonctions administratives, économiques et religieuses, caractérisés par une architecture poussée, un urbanisme complexe et des fresques colorées. Ils révèlent des systèmes d’écriture précoces, des réseaux maritimes, des échanges culturels et mettent en évidence la sophistication de la société minoenne et son influence durable sur l’histoire méditerranéenne.
Description is available under license CC-BY-SA IGO 3.0',
  'Se trata de un conjunto de seis yacimientos arqueológicos en Creta que datan del 1900 al 1100 a.C. Estos lugares son representativos de la civilización minoica, una importante cultura prehistórica mediterránea. Los centros palaciegos funcionaban como centros administrativos, económicos y religiosos, se caracterizan por una arquitectura avanzada, planificación urbana y frescos vibrantes que revelan sistemas de escritura temprana, redes marítimas e intercambios culturales. El conjunto destaca la complejidad de la estructura social de los minoicos y su influencia perdurable en la historia mediterránea.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Этот серийный объект включает шесть археологических памятников на Крите, относящихся к периоду с 1900 по 1100 год до н. э. Памятники представляют минойскую цивилизацию — одну из ключевых первобытных культур Средиземноморья. Дворцовые центры выполняли административные, экономические и религиозные функции. Они отличаются развитой архитектурой, продуманной планировкой и яркими фресками. Здесь обнаружены ранние формы письменности, свидетельства развитых морских связей и межкультурных контактов. Объект отражает сложную социальную структуру минойцев и подчёркивает их значительное влияние на развитие Средиземноморья.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '该系列遗产包括克里特岛上6处公元前1900年-前1100年间的考古遗址，代表米诺斯文明这一重要史前地中海文明的发展脉络。米诺斯王宫中心曾经是行政、经济、宗教枢纽，以成熟的建筑设计、城市规划和鲜活的壁画艺术为特色，从中可窥见早期文字系统、海事网络及文化交流。遗产充分体现米诺斯社会的复杂结构及其对地中海历史的深远影响。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يضم هذا العنصر المتسلسل ستة مواقع أثرية في جزيرة كريت يعود تاريخها إلى الفترة الممتدة من عام 1900 إلى 1100 قبل الميلاد. وتمثّل هذه المواقع الحضارة المينوسية التي تندرج في عداد أبرز ثقافات عصر ما قبل التاريخ في منطقة البحر الأبيض المتوسط. كانت هذه المراكز المهيبة محاور إدارية واقتصادية ودينية، وتميّزت بهندستها المعمارية المتقدّمة وتخطيطها الحضري ولوحاتها الجدارية النابضة بالحياة. وتكشف هذه المراكز أيضاً نظم الكتابة القديمة والشبكات البحرية والتبادلات الثقافية. وتُبرز هذه المراكز أيضاً مدى تعقيد البنية الاجتماعية المينوسية وتأثيرها العميق والمستمر في تاريخ منطقة البحر الأبيض المتوسط.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1733_0001-400-400-20250617145254.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] National Archaeological Park Tak’alik Ab’aj: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'National Archaeological Park Tak’alik Ab’aj',
  'Tak’alik Ab’aj is an archaeological site located on the Pacific Coast of Guatemala. Its 1,700-year history spans a period that saw the transition from the Olmec civilization to the emergence of Early Mayan culture. Tak’alik Ab’aj had a primary role in this transition, in part because it was vital to the long-distance trade route that connected the Isthmus of Tehuantepec in today''s Mexico to present-day El Salvador. Ideas and customs were shared extensively along this route. Sacred spaces and buildings were laid out according to cosmological principles, and innovative water management systems, ceramics, and lapidary art can be found. Today, Indigenous groups of different affiliations still consider the site a sacred place and visit it to perform rituals.
Description is available under license CC-BY-SA IGO 3.0',
  'Tak’alik Ab’aj este un sit arheologic situat pe coasta Pacificului din Guatemala. Istoria sa de 1.700 de ani se întinde pe o perioadă care a văzut tranziția de la civilizația olmecă la apariția culturii Maya timpurii. Tak’alik Ab’aj a avut un rol principal în această tranziție, în parte pentru că era vitală pentru ruta comercială pe distanțe lungi care lega Istmul Tehuantepec din Mexicul de astăzi cu El Salvador actual. Ideile și obiceiurile au fost împărtășite pe larg de-a lungul acestui traseu. Spațiile și clădirile sacre au fost amenajate conform principiilor cosmologice și pot fi găsite sisteme inovatoare de gestionare a apei, ceramică și artă lapidară. Astăzi, grupurile indigene de diferite afilieri consideră încă un loc sacru și îl vizitează pentru a efectua ritualuri.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Tak’alik Ab’aj est un site archéologique situé sur la côte pacifique du Guatemala. Son histoire longue de 1 700 ans s’étend sur une période marquée par la transition entre la civilisation olmèque et l’émergence de la culture maya ancienne. Tak’alik Ab’aj fut l’un des principaux acteurs de cette transition, notamment en raison du rôle essentiel qu’il joua dans la route commerciale longue distance qui reliait l’isthme de Tehuantepec, dans l’actuel Mexique, au Salvador actuel. Cette route favorisa de vastes échanges d’idées et de coutumes. Les espaces et édifices sacrés étaient disposés en fonction de principes cosmologiques, et des systèmes de gestion de l’eau innovants, des céramiques et des objets d’art lapidaire ont été découverts. De nos jours, des groupes autochtones de différentes origines considèrent toujours le site comme un lieu sacré et s’y rendent pour accomplir des rituels.
Description is available under license CC-BY-SA IGO 3.0',
  'Tak''alik Ab''aj es un sitio arqueológico situado en la costa del Pacífico de Guatemala. Su historia de 1.700 años abarca un periodo que vio la transición de la civilización olmeca al surgimiento de la cultura maya más temprana. Tak''alik Ab''aj desempeñó un papel primordial en dicha transición, en parte porque era vital para la ruta comercial de larga distancia que conectaba el istmo de Tehuantepec, en lo que hoy es México, con el actual El Salvador. Las ideas y costumbres se compartían ampliamente a lo largo de esta ruta. Los espacios y edificios sagrados se organizaban según principios cosmológicos, y todavía se pueden encontrar innovadores sistemas de gestión del agua, cerámica y arte lapidario. En la actualidad, varios grupos indígenas de distintas filiaciones siguen considerando el sitio un lugar sagrado y lo visitan para celebrar rituales.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Такалик-Абах — археологический памятник, расположенный на тихоокеанском побережье Гватемалы. Его 1700-летняя история охватывает период перехода от цивилизации ольмеков к возникновению ранней культуры майя. Такалик-Абах сыграл первостепенную роль в этом переходе, в том числе и потому, что он был жизненно важен для дальнего торгового пути, соединявшего перешеек Теуантепек на территории современной Мексики с современным Сальвадором. На этом пути происходил активный обмен идеями и обычаями. Священные места и здания строились в соответствии с космологическими принципами, встречаются инновационные системы водопользования, керамика и гранильное искусство. Сегодня коренные народы разных национальностей по-прежнему считают это место священным и посещают его для совершения ритуалов.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '塔卡利克·阿巴赫（Tak’alik Ab’aj）考古遗址位于危地马拉的太平洋海岸。它有着1700年的历史，见证了奥尔梅克文明向早期玛雅文明的演变。塔卡利克·阿巴赫在这一进程中扮演着重要角色，部分归因于它扼守一条长途贸易路线，连接起现今的墨西哥特万特佩克地峡和萨尔瓦多。各地的思想和风俗沿着这条路线广泛交融。遗址内的圣所和建筑根据宇宙学原理分布，这里还有创新的水务系统、陶器和宝石艺术。如今，不同族群的土著居民仍将该遗址视为圣地，并在此开展仪式活动。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'حديقة تاكاليك أباخ هي موقع أثري كائن على ساحل المحيط الهادي، ويبلغ عمرها التاريخي 1700 عام تغطي الحقبة التي شهدت تحولاً من حضارة الأولمك إلى نشوء ثقافة المايا المبكرة؛ وكان لحديقةتاكاليك أباخ دور رئيسي في هذا التحول، ويعود ذلك جزئياً لأنها كانت ذات درو حيوي بالنسبة إلى طريق التجارة الطويل الذي يصل بين برزخ تيهوانتبيك الذي يقع فيما يعرف اليوم بالمكسيك وبين السلفادور، وكان يجري تبادل الأفكار والعادات بصورة كبيرة على طول هذا الطريق. وتوزعت الأماكن والمباني المقدسة وفقاً للمبادئ الكونية، ويوجد فيها نظم مبتكرة لإدارة المياه وقطع خزفية وأحجار كريمة منحوتة. وحتى يومنا هذا، هناك جماعات من الشعوب الأصلية من انتماءات مختلفة لا تزال تعتبر هذا الموقع مكاناً مقدساً وتزوره لأداء الطقوس.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1663_0019-400-400-20220502120628.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Coastal and Marine Ecosystems of the Bijagós Archipelago – Omatí Minhô: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Coastal and Marine Ecosystems of the Bijagós Archipelago – Omatí Minhô',
  'The property includes a continuous series of coastal and marine ecosystems, corresponding to the marine and intertidal environments of the best-preserved areas of the Bijagós Archipelago in Guinea-Bissau. The Archipelago is the only active deltaic archipelago on the African Atlantic coast and one of the few in the world. The site is home to a rich biodiversity, including endangered Green and Leatherback turtles, manatees, dolphins, and over 870,000 migratory shorebirds. It features mangroves, mudflats, and intertidal zones vital for marine life, and supports rare plant species, diverse fish populations, and bird colonies. Poilão Island is a globally important nesting site for turtles.
Description is available under license CC-BY-SA IGO 3.0',
  'Proprietatea include o serie continuă de ecosisteme de coastă și marine, corespunzătoare mediilor marine și intertidale din zonele cel mai bine conservate din Arhipelagul Bijagós din Guineea-Bissau. Arhipelagul este singurul arhipelag deltaic activ de pe coasta Atlanticului african și unul dintre puținele din lume. Situl găzduiește o biodiversitate bogată, incluzând broaște țestoase verzi și piele pe cale de dispariție, lamantini, delfini și peste 870.000 de păsări de coastă migratoare. Prezintă mangrove, mâluri și zone intertidale vitale pentru viața marină și susține specii de plante rare, populații diverse de pești și colonii de păsări. Insula Poilão este un loc de cuibărire important la nivel global pentru broaște țestoase.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Ce bien comprend un ensemble continu d’écosystèmes côtiers et marins, correspondant aux milieux marins et intertidaux des zones les mieux préservées et ayant la plus haute valeur écologique de l’Archipel des Bijagós en Guinée-Bissau. Il s’agit du seul, et l’un des rares au monde, archipel deltaïque actif de la côte atlantique africaine. Le site abrite une riche biodiversité, notamment la tortue verte et la tortue luth, toutes deux menacées, des lamantins, des dauphins, ainsi que plus de 870 000 oiseaux côtiers migrateurs. Il comprend des mangroves, des vasières et des zones intertidales fondamentales pour la vie marine et abrite des espèces de plantes rares, des poissons divers et des regroupements d’oiseaux. L’îlot de Poilão est un des principaux lieux de nidification de tortues marines à travers le monde.
Description is available under license CC-BY-SA IGO 3.0',
  'El bien patrimonial incluye un encadenamiento de ecosistemas costeros y marinos correspondientes a los entornos marinos e intermareales de las áreas mejor conservadas del archipiélago de Bijagós en Guinea-Bissau. El archipiélago es el único archipiélago deltaico activo en la costa atlántica africana y uno de los pocos en el mundo. El sitio alberga una rica biodiversidad y especies emblemáticas como las tortugas verdes y laúd en peligro de extinción, manatíes, delfines y más de 870 000 aves costeras migratorias. Cuenta con manglares, marismas y zonas intermareales vitales para la vida marina, y alberga especies vegetales poco comunes, poblaciones diversas de peces y colonias de aves. La isla de Poilão es uno de los principales lugares de anidación de tortugas a nivel mundial.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Этот объект охватывает цепь прибрежных и морских экосистем, относящихся к морским и литоральным зонам наилучшим образом сохранившихся территорий архипелага Бижагош в Гвинее-Бисау. Архипелаг является единственным геологически активным дельтовым архипелагом на Атлантическом побережье Африки и одним из немногих в мире. Объект отличается богатым биоразнообразием: здесь обитают такие вымирающие виды, как зелёные и кожистые черепахи, а также ламантины, дельфины и более 870 000 мигрирующих прибрежных птиц. На территории объекта расположены мангровые заросли, илистые отмели и литоральные зоны, играющие ключевую роль для морской жизни. Кроме того, здесь произрастают редкие виды растений, обитают разнообразные виды рыб и колонии птиц. Остров Поилао — это место гнездования черепах, имеющее
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '该遗产涵盖一系列连续的滨海和海洋生态系统，对应几内亚比绍比热戈斯群岛保存最完好区域的海洋与潮间带环境。群岛是非洲大西洋海岸唯一活跃的三角洲群岛，也是全球为数不多的此类地貌之一。该地拥有丰富的生物多样性，包括濒危的绿海龟、棱皮龟、海牛、海豚，以及超87万只迁徙性岸鸟。红树林、泥滩、潮间带构成海洋生物的关键生境，稀有植物和多样鱼类种群、鸟类群落在此栖息。群岛中的波伊朗岛是全球重要的海龟产卵地。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يضمُّ هذا الموقع سلسلة متواصلة من النظم الإيكولوجية الساحلية والبحرية الموافقة للبيئات البحرية والمناطق المدية الواقعة في المناطق الأفضل حفظاً من أرخبيل بيجاغوس في غينيا-بيساو. وهذا الأرخبيل هو الوحيد الذي يمتلك دلتا على ساحل المحيط الأطلسي الأفريقي، وهو واحد من قلائل مثله في العالم. ويستوطن في هذا الموقع تنوع بيولوجي غني، يتضمن السلاحف الخضراء والجلدية الظهر المهددة بالانقراض، وخراف البحر والدلافين، وأكثر من 870000 طائر شاطئي مهاجر. ويتميز الموقع بوجود أشجار المانغروف والمسطحات الطينية والمناطق المدِّية الحيوية بالنسبة إلى الأحياء البحرية، وهو يؤوي أنواعاً نادرة من النباتات وأنواعاً مختلفة من الأسماك ومستعمرات للطيور. وتكتسي جزيرة بويلاو أهمية عالمية كموقع لتعشيش السلاحف.  
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1431_0009-400-400-20250616152429.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Historic Centre of Rome, the Properties of the Holy See in that City Enjoying Extraterritorial Rights and San Paolo Fuori le Mura: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Historic Centre of Rome, the Properties of the Holy See in that City Enjoying Extraterritorial Rights and San Paolo Fuori le Mura',
  'Founded, according to legend, by Romulus and Remus in 753 BC, Rome was first the centre of the Roman Republic, then of the Roman Empire, and it became the capital of the Christian world in the 4th century. The World Heritage site, extended in 1990 to the walls of Urban VIII, includes some of the major monuments of antiquity such as the Forums, the Mausoleum of Augustus, the Mausoleum of Hadrian, the Pantheon, Trajan’s Column and the Column of Marcus Aurelius, as well as the religious and public buildings of papal Rome.
Description is available under license CC-BY-SA IGO 3.0',
  'Fondată, conform legendei, de Romulus și Remus în anul 753 î.Hr., Roma a fost mai întâi centrul Republicii Romane, apoi al Imperiului Roman și a devenit capitala lumii creștine în secolul al IV-lea. Situl Patrimoniului Mondial, extins în 1990 până la zidurile lui Urban al VIII-lea, include unele dintre monumentele majore ale antichității precum Forumurile, Mausoleul lui Augustus, Mausoleul lui Hadrian, Panteonul, Columna lui Traian și Columna lui Marcus Aurelius, precum și clădirile religioase și publice ale Romei papale.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Fondée selon la légende par Romulus et Remus en 753 av. J.-C., la ville de Rome a d’abord été le centre de la République romaine, puis de l’Empire romain, et enfin la capitale du monde chrétien au IVe siècle. Le site du patrimoine mondial, étendu en 1990 jusqu’aux murs d’Urbain VIII, comporte quelques-uns des principaux monuments de l’Antiquité tels que les forums et le mausolée d’Auguste, les colonnes de Trajan et de Marc Aurèle, le mausolée d’Hadrien, le Panthéon, ainsi que les édifices religieux et publics de la Rome papale.
Description is available under license CC-BY-SA IGO 3.0',
  'Fundada por Rómulo y Remo en el año 753 a.C. según reza la leyenda, Roma fue en un principio la capital de la República y el Imperio romanos y, a partir del siglo IV, la del orbe cristiano. El sitio del Patrimonio Mundial, ampliado en 1990 hasta las murallas de Urbano VIII, comprende algunos de los principales monumentos de la Antigüedad como los foros, los mausoleos de Augusto y Adriano, las columnas de Trajano y Marco Aurelio y el Panteón, y también los edificios públicos y religiosos de la Roma papal.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Рим, согласно легенде основанный братьями Ромулом и Рэмом в 753 г. до н.э., был сначала центром Римской республики, затем – Римской империи, а в IV в. стал столицей христианского мира. Объект всемирного наследия, расширенный в 1990 г. до стен Урбана VIII, включает несколько важных памятников античности, таких как форумы, мавзолей Августа, мавзолей Адриана, Пантеон, колонна Траяна и колонна Марка Аврелия, а также религиозные и общественные здания папского Рима.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '根据神话传说，罗马城由罗穆卢斯和瑞摩斯于公元前753年修建。罗马首先作为罗马共和国的首都，后来是罗马帝国的都城，再后来到了公元4世纪，这里则成了整个基督教世界的中心。1990年，这个世界遗产地的范围扩大到了罗马八区的城墙。该文化遗址包括了一些著名的古代建筑，例如：古罗马广场、奥古斯都的陵墓、哈德良的陵墓、万神殿、图拉真柱、马可·奥里利乌斯柱，以及罗马教皇的许多宗教和公共建筑。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'ローマにはフォロ・ローマやコロッセオなどのローマ帝国の遺跡、そしてサンタンジェロ城やファルネーゼ宮殿などの中世の建築物が残されており、紀元前から始まる古い町の歴史を物語っている。バチカン市国の教皇領にある聖パウロの墓の上に建てられたサン・パオロ・フォリ・ムーラ聖堂はローマ帝国衰退期の4世紀末、初期キリスト教時代に建てられた教会でバジリカ式教会では最大のものである。1923年の火災で被害を受け、後に慎重に修復された。',
  '',
  '',
  '',
  'تأسست روما بحسب الأسطورة على يد رومولوس وريموس في العام 753 ق.م. وكانت أولاً مركزًا للجمهورية الرومانية ثم للامبراطورية الرومانية وأخيرًا عاصمة للعالم المسيحي في القرن الرابع. فالموقع الأثري المدرج في قائمة التراث العالمي الذي وسّع في العام 1990حتى جدران "أوربان 8"، يتضمن بعضًا من النصب الأساسية العائدة إلى العصور القديمة مثل الميادين وضريح "أغسطس" وعواميد "تراجان" و"ماركوس أوريلوس"، وضريح "هادريان" ، والبانثيون، بالإضافة إلى النصب الدينية والعامة في المدينة البابوية.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0091_0061-400-400-20140709164150.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Río Plátano Biosphere Reserve: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Río Plátano Biosphere Reserve',
  'Located on the watershed of the Río Plátano, the reserve is one of the few remains of a tropical rainforest in Central America and has an abundant and varied plant and wildlife. In its mountainous landscape sloping down to the Caribbean coast, over 2,000 indigenous people have preserved their traditional way of life.
Description is available under license CC-BY-SA IGO 3.0',
  'Situată pe bazinul hidrografic al râului Río Plátano, rezervația este una dintre puținele rămășițe ale unei păduri tropicale din America Centrală și are o plantă și o faună sălbatică abundentă și variată. În peisajul său muntos înclinat spre coasta Caraibelor, peste 2.000 de indigeni și-au păstrat modul tradițional de viață.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Située dans le bassin versant du Río Platano, la réserve abrite l''un des rares vestiges de la forêt tropicale humide d''Amérique centrale. Sa faune et sa flore sont abondantes et variées. Dans un paysage montagneux qui descend jusqu''à la côte des Caraïbes, plus de 2 000 indigènes ont conservé leur mode de vie traditionnel.
Description is available under license CC-BY-SA IGO 3.0',
  'Ubicada en la cuenca del río Plátano, esta reserva alberga uno de los escasos vestigios de bosque lluvioso tropical de Centroamérica. Su fauna y flora son abundantes y variadas. En su territorio montañoso, que desciende en pendiente hasta la costa del Caribe, viven más de 2.000 indígenas que han conservado su modo de vida tradicional.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Резерват, охватывающий водосборный бассейн реки Рио-Платано, включает один из немногих уцелевших в Центральной Америке массивов влажно-тропического леса, и выделяется богатой и разнообразной флорой и фауной. В этой гористой местности, понижающейся по мере приближения к побережью Карибского моря, проживают, сохраняя свой традиционный уклад, свыше 2 тыс. аборигенов.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '该保留地位于雷奥普拉塔诺河的分水岭处，是中美洲少数几个湿热带雨林保护区之一。保留地内有数量丰富、种类繁多的植物和野生动物。在它加勒比海岸延伸的山地上，居住有2000多名土著居民，他们仍然沿袭传统的生活方式。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'ホンジュラス北東部のプラタノ川流域に広がる生物圏保護区。低地のラグーン、マングローブ、サバンナなどと、1000m前後の広大な山地といった変化に富んだ自然環境が見られる。現在、プラタノ川の源流域では、道路建設とそれに伴う森林伐採や不法な開拓などが行われ、「危機にさらされている世界遺産リスト」に登録されている。',
  '',
  '',
  '',
  'تشمل المحمية الواقعة في الحوض المنحدر لريو بلاتانو إحدى أكثر الآثار ندرةً في الغابة الاستوائية الرطبة لأميركا الوسطى.ويشهد للثروة الحيوانية والنباتية في هذه المحميّة بوفرتها وتنوعها. وقد حافظ أكثر من ألفي نسمة من السكان الأصليين على نمط حياتهم التقليدي في هذا الموقع الجبلي المنحدر حتى ساحل جزر الكاريبي.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0196_0001-400-400-20151105103349.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Old Village of Hollókő and its Surroundings: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Old Village of Hollókő and its Surroundings',
  'Hollokö is an outstanding example of a deliberately preserved traditional settlement. This village, which developed mainly during the 17th and 18th centuries, is a living example of rural life before the agricultural revolution of the 20th century.
Description is available under license CC-BY-SA IGO 3.0',
  'Hollokö este un exemplu remarcabil de așezare tradițională conservată în mod deliberat. Acest sat, care s-a dezvoltat mai ales în secolele al XVII-lea și al XVIII-lea, este un exemplu viu de viață rurală înainte de revoluția agricolă din secolul XX.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Exemple exceptionnel d''habitat traditionnel volontairement conservé, le village d''Hollokö, qui s''est développé surtout aux XVIIe et XVIIIe siècles, reste un témoignage toujours vivant des formes de la vie rurale avant la révolution agricole du XXe siècle.
Description is available under license CC-BY-SA IGO 3.0',
  'La aldea de Hollókö, que se desarrolló sobre todo en los siglos XVII y XVIII, es un extraordinario ejemplo de hábitat tradicional, deliberadamente conservado, y constituye un testimonio vivo del modo de vida rural antes de la revolución agrícola del siglo XX.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Село Холлокё – это наглядный пример целенаправленно сохраняемого традиционного поселения. Оно бурно развивалось в течение XVII-XVIII вв. Село хорошо иллюстрирует особенности сельской жизни до аграрной революции XX в.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '霍洛克是被精心保护下来的传统民居的一个典型范例，该村落主要建立于17和18世纪，生动地展示了20世纪农业革命前乡村生活的生动图景。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'لا تزال قرية هولوكو التي تشكّل مثالاً استثنائياً عن السكن التقليدي الذي تمّ الحفاظ عليه طوعاً والتي ازدهرت بصورة خاصة في القرنين السابع والثامن عشر، شهادةً حية لأشكال الحياة المدنية قبل اندلاع الثروة الزراعية في القرن العشرين.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0401_0003-400-400-20140623150554.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Hortobágy National Park - thePuszta: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Hortobágy National Park - thePuszta',
  'The cultural landscape of the Hortobágy Puszta consists of a vast area of plains and wetlands in eastern Hungary. Traditional forms of land use, such as the grazing of domestic animals, have been present in this pastoral society for more than two millennia.
Description is available under license CC-BY-SA IGO 3.0',
  'Peisajul cultural al Hortobágy Puszta constă dintr-o zonă vastă de câmpii și zone umede din estul Ungariei. Formele tradiționale de utilizare a terenurilor, cum ar fi pășunatul animalelor domestice, sunt prezente în această societate pastorală de mai bine de două milenii.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le paysage culturel de la puszta de l''Hortobágy est une vaste étendue de plaines et de marécages dans l''est de la Hongrie. L''utilisation traditionnelle des terres à des fins telles que le pâturage des animaux domestiques y a été perpétuée par une société pastorale pendant plus de deux mille ans.
Description is available under license CC-BY-SA IGO 3.0',
  'El paisaje cultural de la puszta de Hortobágy es una vasta extensión de llanuras y pantanos situada al este de Hungría. Durante más de dos mil años, una sociedad pastoril ha perpetuado en estos parajes el uso tradicional de la tierra para el pasto de animales.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Культурный ландшафт Хортобадьской «пушты» (Puszta) представляет собой обширную степную равнину и заболоченные приречные участки на востоке Венгрии. Традиционные способы землепользования, такие как пастбищное скотоводство, сохраняются в этом сельском сообществе более двух тысячелетий.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '霍尔托巴吉普斯陶文化景区是匈牙利东部一片面积辽阔的草原和湿地。传统的利用土地方式，例如家畜牧养，在这里的游牧民族保持了2000多年。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'ハンガリー東部、ドナウ川と支流ティサ川流域に広がる大平原プスタ。ホルトバージの町を含むその一部はホルトバージ国立公園として自然保護区に指定されている。森林のない湿地帯で池や川が多く、ヨーロッパ有数の野鳥の生息地でもある。ホルトバージは中世には52の小村から成るコミュニティであった。2000年以上にわたる牧畜生活の伝統と人類と自然との調和をその見事な文化的景観のなかに、今なお生き生きと映し出している。',
  '',
  '',
  '',
  'يتألف مشهد لابوسزتا الثقافي، الواقع في روضة أرتوباغي الوطنية، من مساحة شاسعة من السهول والمستنقعات شرق المجر. فقدعملت مجموعات من الرعاة منذ أكثر من ألفَي عام على استخدام هذه الأراضي استخداماً تقليدياً لغايات الزراعة والماشية.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0474_0019-400-400-20241029104646.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Early Christian Necropolis of Pécs (Sopianae): Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Early Christian Necropolis of Pécs (Sopianae)',
  'In the 4th century, a remarkable series of decorated tombs were constructed in the cemetery of the Roman provincial town of Sopianae (modern Pécs). These are important both structurally and architecturally, since they were built as underground burial chambers with memorial chapels above the ground. The tombs are important also in artistic terms, since they are richly decorated with murals of outstanding quality depicting Christian themes.
Description is available under license CC-BY-SA IGO 3.0',
  'În secolul al IV-lea, o serie remarcabilă de morminte decorate a fost construită în cimitirul orașului roman de provincie Sopianae (modern Pécs). Acestea sunt importante atât din punct de vedere structural, cât și din punct de vedere arhitectural, deoarece au fost construite ca camere funerare subterane cu capele memoriale deasupra solului. Mormintele sunt importante și din punct de vedere artistic, deoarece sunt bogat decorate cu picturi murale de o calitate remarcabilă ilustrând teme creștine.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Au IVe siècle, une série remarquable de tombeaux ornés fut érigée dans le cimetière de la ville romaine provinciale de Sopianae (la Pécs moderne). Ces tombeaux sont importants, tant du point de vue structurel qu''architectural, car ils ont été construits sous terre comme des chambres funéraires surmontées de chapelles commémoratives en surface. Ils sont également importants sur le plan artistique dans la mesure où ils sont richement ornés de peintures murales d''une qualité exceptionnelle représentant des thèmes chrétiens.
Description is available under license CC-BY-SA IGO 3.0',
  'En el siglo IV se construyó un excepcional conjunto de tumbas ornamentadas en el cementerio de la ciudad provincial romana de Sopianae (la actual Pécs). Estos sepulcros poseen un gran valor estructural y arquitectónico, porque fueron excavados bajo tierra como cámaras funerarias y encima de ellos se construyeron capillas funerarias. También poseen un valor artístico importante porque están ricamente ornamentados con excelentes pinturas murales de temática cristiana.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'В IV в. на кладбище древнеримского центра провинции – города Сопиана (современный Печ) - было сооружено несколько богато украшенных гробниц. Подземные склепы и наземные мемориальные часовни выделяются в строительно-техническом и архитектурном отношении. Гробницы также имеют художественное значение, так как богато украшены великолепными настенными изображениями на христианские темы.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '公元4世纪，罗马帝国索皮阿瑙埃省（现代的佩奇城）建造了大量带有装饰的基督徒墓地。墓地不仅有地下墓室，而且地面上还有礼拜堂，在结构和建筑方面都具有重要意义。墓室里的装饰以基督为主题，创作精美细腻，这一切使皮阿尼亚基督徒墓地在人类建筑史和艺术史上都占有一席之地。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'ローマ帝国属領パンノニアのソピアネ（現ペーチ）は、重要な商業都市として発展。4世紀には初期キリスト教建築が多く建設され、近郊の墓地には装飾の施された墓が造られた。1780年に発見された墓室は、埋葬室と記念礼拝堂を兼ねていることから、構造的にも建築的にも建築史上希少価値が高いものである。聖書に題材をとった墓地を飾る壁画の数々は、水準が高く、芸術的にも貴重な遺産といえる。',
  '',
  '',
  '',
  'شُيّدت في القرن الرابع مجموعة مدهشة من الأضرحة المزيّنة في مقبرة مدينة سوبيانايي الرومانية. واتّسمت هذه الأضرحة بأهمية بالغة إن من حيث بنائها أو هندستها لأنها شُيّدت تحت الأرض كغرف جنائزية تقوم على سطحها كنائس تذكارية. وتتخذ هذه الأضرحة أهميةً أخرى من حيث التصميم الفني إذ أنها زُيّنت زينةً غنية برسوم جدرانية ذات نوعية استثنائية تحمل رموزا دينية.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0853_0004-400-400-20241029110605.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Vatnajökull National Park - Dynamic Nature of Fire and Ice: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Vatnajökull National Park - Dynamic Nature of Fire and Ice',
  'This iconic volcanic region covers an area of over 1,400,000 ha, nearly 14% of Iceland''s territory. It numbers ten central volcanoes, eight of which are subglacial. Two of these are among the most active in Iceland. The interaction between volcanoes and the rifts that underlie the Vatnajökull ice cap takes many forms, the most spectacular of which is the jökulhlaup – a sudden flood caused by the breach of the margin of a glacier during an eruption. This recurrent phenomenon has led to the emergence of unique sandur plains, river systems and rapidly evolving canyons. Volcanic areas are home to endemic groundwater fauna that has survived the Ice Age.
Description is available under license CC-BY-SA IGO 3.0',
  'Această regiune vulcanică emblematică acoperă o suprafață de peste 1.400.000 ha, aproape 14% din teritoriul Islandei. Numară zece vulcani centrali, dintre care opt sunt subglaciari. Două dintre acestea sunt printre cele mai active din Islanda. Interacțiunea dintre vulcani și rupturile care stau la baza calotei glaciare Vatnajökull ia multe forme, dintre care cea mai spectaculoasă este jökulhlaup – o inundație bruscă cauzată de spargerea marginii unui ghețar în timpul unei erupții. Acest fenomen recurent a dus la apariția câmpiilor Sandur unice, a sistemelor fluviale și a canioanelor cu evoluție rapidă. Zonele vulcanice găzduiesc fauna subterană endemică care a supraviețuit epocii glaciare.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le bien, qui couvre plus de 1 400 000 ha, soit près de 14 % de l’Islande, est une région volcanique emblématique. Il compte dix volcans centraux, dont huit sous-glaciaires. Deux de ces derniers sont parmi les plus actifs d’Islande. L’interaction entre les volcans et les fissures qui sous-tendent la calotte glaciaire du Vatnajökull prend différentes formes dont la plus spectaculaire est le jökulhlaup : une inondation soudaine causée par la rupture de la marge d’un glacier durant une éruption. Ce phénomène récurrent a fait apparaître des plaines de sable uniques au monde, des réseaux fluviaux ainsi que des canyons en évolution rapide. Les zones volcaniques abritent une faune endémique des eaux souterraines qui a survécu à la période glaciaire.
Description is available under license CC-BY-SA IGO 3.0',
  'Este sitio natural de 1.400.000 hectáreas de superficie abarca una región volcánica emblemática de Islandia. El parque del Vatnajökull cuenta con diez volcanes importantes, de los cuales ocho son subglaciares, y entre estos últimos hay dos que figuran entre los más activos de toda Islandia. La interacción geológica entre las erupciones volcánicas y las grietas subyacentes al casquete glaciar del parque puede dar lugar a fenómenos diversos. El más espectacular sin duda es el denominado “jökulhlaup”, esto es, la inundación repentina ocasionada por la ruptura de la margen de un glaciar en el transcurso de una erupción. Este fenómeno, que es recurrente, deja al descubierto planicies de arena únicas en el mundo, así como redes fluviales y cañones cuya morfología evoluciona a gran velocidad. Las zonas volcánicas albergan una fauna endémica de aguas subterráneas que logró sobrevivir al periodo glaciar.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Этот объект, характеризующийся вулканической активностью, занимает площадь более 1 400 000 га, что составляет почти 14% территории Исландии. Объект включает десять вулканов центрального типа, в том числе восемь подледниковых вулканов. Два из них являются одними из самых активных вулканов в Исландии. Взаимодействие между вулканами и трещинами под ледяным покровом Ватнайёкюдль принимает различные формы, наиболее впечатляющей из которых является йоукюльхлёйп: внезапное наводнение, вызванное частичными обрушениями ледника во время вулканического подлёдного извержения. Такое периодически повторяющееся явление стало причиной формирования уникальных зандровых равнин, речных систем и каньонов. Зоны вулканической активности являются домом для переживших ледниковый период эндемичных видов фауны подземных вод.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '该遗产地是典型的火山地区，占地面积逾140万公顷，接近冰岛领土面积的14%。瓦特纳冰川国家公园内有10座中心式火山，其中8座为冰川火山。这些火山中有2座位居冰岛最活跃的火山之列。火山与瓦特纳冰盖裂缝之间的相互作用形成了各种自然景观，其中最引人注目的是火山爆发期间冰川边缘突然崩裂引发的大洪水。这一现象的反复出现催生了世界上独一无二的沙原、河网和变化迅速的峡谷。当地火山地区还生活着冰川时期遗存的、生活在地下水中的典型动物。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يمثل هذا الموقع، الذي يغطي أكثر من 1400000 هكتار، منطقة بركانية مميّزة. ويوجد فيه عشرة براكين مركزية بما في ذلك ثمانية من البراكين تحت الجليدية ومنها اثنين من البراكين الأكثر نشاطاً في آيسلندا. ويولد التفاعل بين البراكين والشقوق الطبقة الجليدية في فاتناكوكول والتي تتخذ أشكالاً مختلفة، وأبرزها: الفيضان الجليدية المعروفة باسم "يوكلهوب"، وهي فيضانات تتشكل على نحو مفاجئ بفعل حدوث انهيارات على جوانب الأنهار الجليدية جرّاء ذوبانها. وتؤدي هذه الظاهرة المتكررة إلى تشكّل سهول رملية وأودية فريدة من نوعها ونظم أنهار سريعة التدفق. وتعدّ المناطق البركانية موطناً لحيوانات المياه الجوفية التي نجت من العصر الجليدي.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1604_0007-400-400-20230222172834.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Sun Temple, Konârak: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Sun Temple, Konârak',
  'On the shores of the Bay of Bengal, bathed in the rays of the rising sun, the temple at Konarak is a monumental representation of the sun god Surya''s chariot; its 24 wheels are decorated with symbolic designs and it is led by a team of six horses. Built in the 13th century, it is one of India''s most famous Brahman sanctuaries.
Description is available under license CC-BY-SA IGO 3.0',
  'Pe malul Golfului Bengal, scăldat în razele soarelui răsare, templul de la Konarak este o reprezentare monumentală a carului zeului soarelui Surya; cele 24 de roți ale sale sunt decorate cu desene simbolice și este condusă de o echipă de șase cai. Construit în secolul al XIII-lea, este unul dintre cele mai faimoase sanctuare brahmane din India.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Au bord du golfe du Bengale, dans le prolongement des rayons du soleil levant, le temple de Konarak est une représentation monumentale du char du dieu-soleil Surya, aux vingt-quatre roues abondamment sculptées de motifs symboliques, et de son attelage de six chevaux. Construit au XIIIe siècle, c''est l''un des plus célèbres sanctuaires brahmaniques de l''Inde.
Description is available under license CC-BY-SA IGO 3.0',
  'Situado a orillas del golfo de Bengala y bañado por los rayos del sol naciente, el Templo del Sol es una representación monumental del carro del dios sol, Surya, con sus veinticuatro ruedas esculpidas con un sinfín motivos simbólicos y su tiro de seis caballos. Construido en el siglo XIII, este templo es uno de los más celebres santuarios brahmánicos de la India.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Освещаемый лучами восходящего солнца храм в Конараке на берегу Бенгальского залива – это монументальное воплощение колесницы бога Солнца – Сурьи, увлекаемой упряжкой из шести лошадей. Ее 24 колеса украшены символическими изображениями. Этот храм, воздвигнутый в XIII в., является одним из наиболее известных брахманских святилищ в Индии.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '科纳拉克太阳神庙位于孟加拉湾沿岸，沐浴着冉冉升起的太阳。神庙依照太阳神苏利耶驾驶战车的样子建造。24个车轮饰有字符图案，6匹马拉着战车。这座神庙建于13世纪，是印度最著名的婆罗门庙宇之一。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'يشكّل معبد كوناراك الواقع على تخوم خليج البنغال في امتداد أشعة الشمس البازغة عرضاً تذكارياً لعربة إلهة الشمس ثريا بعجلاتها الأربعة والعشرين المنحوتة بوفرة بزخارف رمزية وبربطها ستة أحصنة. إنّ هذا المعبد الذي شُيّد في القرن الثالث عشر هو من أشهر المعابد البرهمانية في الهند.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_0246_0003-400-400-20140224103928.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Archaeological Site of Nalanda Mahavihara at Nalanda, Bihar: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Archaeological Site of Nalanda Mahavihara at Nalanda, Bihar',
  'The Nalanda Mahavihara site is in the State of Bihar, in north-eastern India. It comprises the archaeological remains of a monastic and scholastic institution dating from the 3rd century BCE to the 13th century CE. It includes stupas, shrines, viharas (residential and educational buildings) and important art works in stucco, stone and metal. Nalanda stands out as the most ancient university of the Indian Subcontinent. It engaged in the organized transmission of knowledge over an uninterrupted period of 800 years. The historical development of the site testifies to the development of Buddhism into a religion and the flourishing of monastic and educational traditions.
Description is available under license CC-BY-SA IGO 3.0',
  'Situl Nalanda Mahavihara se află în statul Bihar, în nord-estul Indiei. Cuprinde rămășițele arheologice ale unei instituții monahale și scolastice care datează din secolul al III-lea î.Hr. până în secolul al XIII-lea e.n. Include stupa, altare, viharas (cladiri rezidentiale si educative) si opere de arta importante din stuc, piatra si metal. Nalanda se remarcă ca cea mai veche universitate a subcontinentului indian. S-a angajat în transmiterea organizată a cunoștințelor pe o perioadă neîntreruptă de 800 de ani. Dezvoltarea istorică a sitului mărturisește dezvoltarea budismului într-o religie și înflorirea tradițiilor monahale și educaționale.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Le site de Nalanda Mahavihara est situé dans l’état du Bihar, au nord-est de l’Inde. Il s''agit des vestiges archéologiques d’une institution monastique et scolastique en activité du IIIe siècle av. J.-C. au XIIIe siècle de notre ère. Il comprend des stupas, des sanctuaires, des viharas (bâtiments résidentiels et éducatifs) et d’importantes œuvres d’art en stuc, en pierre et en métal. Nalanda se distingue comme la plus ancienne université du sous-continent indien, une institution qui a transmis le savoir de façon organisée sur une période ininterrompue de 800 ans. Le développement historique du site témoigne de l’évolution du bouddhisme en une religion, et de l’épanouissement des traditions monastiques et éducatives.
Description is available under license CC-BY-SA IGO 3.0',
  'Este sitio se halla al nordeste de la India, en el estado de Bihar, y está integrado por los vestigios arqueológicos de un gran monasterio (“mahavihara”) que llevó a cabo una importante actividad religiosa y docente desde el siglo III a.C. hasta el siglo XIII de nuestra era. A los vestigios arquitectónicos de estupas, santuarios y edificios monacales (“viharas”) destinados a albergar y educar a los profesos, se suman importantes obras de arte realizadas en estuco, piedra y metales. Nalanda se distingue como la más antigua universidad del subcontinente indio, una institución que organizó la transmisión del saber durante un periodo ininterrumpido de 800 años. La historia del sitio atestigua no sólo la evolución de la devoción budista hacia su afirmación como religión, sino también el florecimiento de las prácticas monásticas y educativas tradicionales.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Объект Наланда Махавихара расположен в штате Бихар на северо-востоке Индии. Этот археологический памятник представляет собой монастырское образовательное учреждение, действовавшее с III века до н.э. по XIII век н.э. На территории комплекса расположены, главным образом, ступы и вихары (жилые здания и учебные корпуса), а также святилища. Здесь сохранились важные произведения искусства из гипса, камня и металла. Наланда является старейшим университетом на индийском субконтиненте. В стенах этого учреждения непрерывно передавались знания на протяжении 800 лет. Историческое развитие объекта свидетельствует о превращении буддизма в религию и расцвете монастырских и образовательных традиций.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '那烂陀寺遗址位于印度东北部的巴哈尔邦。遗址由公元前3世纪至公元13世纪存在于此的寺庙和佛学院遗留下的古迹组成，包括窣堵坡（坟冢），舍利塔，寺庙（僧房学舍），以及重要的墙画、石刻、金属器物等艺术作品。那烂陀作为印度次大陆上最古老的大学而引人注目，其作为有序的知识传递场所存续长达800年，发展的历史见证了佛学宗教化的过程，以及寺院和教育传统的繁荣。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '多くの僧が集ったインド随一の学問寺の遺構。インド北東部ビハール州に位置するナーランダにある、紀元前3世紀から後13世紀にかけて運営された、修道的・教育的な機関の考古学的遺構。ナーランダの大学は、インド亜大陸において最古の大学として顕著な存在で、ここでは800年も途切れることなく系統的な知識の伝達が続けられた。遺構にはストゥーパや聖廟、住居や教育関連の建物としての僧院、漆喰や石、金属で作られた重要な美術作品も含まれ、当地の歴史は、仏教の宗教への発展および修道と教育の伝統の繁栄を証明している。',
  '',
  '',
  '',
  'يقع موقع نالاندا في ولاية بيهار شمال شرق الهند. ويتألف من مجموعة آثار مباني مدرسيّة ورهبانية كانت مأهولة في الفترة بين القرن الثالث قبل الميلاد والقرن الثالث عشر بعد الميلاد. ويوجد في المدينة أبراج بوذيّة ومباني سكنيّة ومدرسيّة ومعابد بالإضافة إلى أعمال فنيّة مهمّة مصنوعة من الجص والحجارة والمعادن. ويشهد تطوّر هذا المكان عبر التاريخ على تطوّر البوذيّة إلى ديانة بالإضافة إلى تطوّر التقاليد التربويّة والرهبانيّة.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1502_0010-400-400-20160616154106.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Historic City of Ahmadabad: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Historic City of Ahmadabad',
  'The walled city of Ahmadabad, founded by Sultan Ahmad Shah in the 15th century, on the eastern bank of the Sabarmati river, presents a rich architectural heritage from the sultanate period, notably the Bhadra citadel, the walls and gates of the Fort city and numerous mosques and tombs as well as important Hindu and Jain temples of later periods. The urban fabric is made up of densely-packed traditional houses (pols) in gated traditional streets (puras) with characteristic features such as bird feeders, public wells and religious institutions. The city continued to flourish as the capital of the State of Gujarat for six centuries, up to the present.
Description is available under license CC-BY-SA IGO 3.0',
  'Orașul cu ziduri Ahmadabad, fondat de sultanul Ahmad Shah în secolul al XV-lea, pe malul estic al râului Sabarmati, prezintă o bogată moștenire arhitecturală din perioada sultanatului, în special cetatea Bhadra, zidurile și porțile orașului Fort și numeroase moschei și morminte, precum și temple importante din perioadele hinduse și jainiste. Țesătura urbană este alcătuită din case tradiționale dens împachetate (pols) în străzi tradiționale închise (puras) cu trăsături caracteristice precum hrănitori pentru păsări, fântâni publice și instituții religioase. Orașul a continuat să înflorească ca capitală a statului Gujarat timp de șase secole, până în prezent.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'La ville fortifiée d’Ahmedabad a été fondée par le sultan Ahmad Shah au XVe siècle, sur la rive orientale du fleuve Sabarmati. Elle présente un riche patrimoine architectural de l’époque du sultanat, notamment la citadelle de Badhra, les murs et les portes de la ville fortifiée, et de nombreuses mosquées et sépultures ainsi que d’importants temples hindous et jaïns d’époques ultérieures. Le tissu urbain est formé de maisons traditionnelles (pols) densément regroupées le long de rues traditionnelles (puras) fermées par des portes, qui se caractérisent notamment par des mangeoires à oiseaux, des puits publics et des institutions religieuses. La ville a continué de prospérer en tant que capitale de l’État du Gujarat pendant six siècles, jusqu’à nos jours.
Description is available under license CC-BY-SA IGO 3.0',
  'Fundada en el siglo XV por el sultán Ahmad Shah, la ciudad fortificada de Ahmenabad se extiende por la orilla oriental del río Sabarmati. Posee un rico patrimonio arquitectónico del periodo del sultanato compuesto por la ciudadela de Badhra y las murallas y puertas de la ciudad fortificada, así como por un gran número de mezquitas y sepulturas. También cuenta con importantes templos hindúes y jainistas edificados en épocas posteriores. El tejido urbano de Ahmenabad está formado por densos núcleos de viviendas tradicionales (“pols”) agrupados a lo largo de calles típicas cerradas por puertas (“puras”), que se caracterizan por la presencia de pozos públicos y comederos para pájaros. Esta ciudad, que es la más importante del Estado de Gujarat, sigue prosperando sin cesar seis siglos después de su fundación.
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
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1551_0004-400-400-20230214172300.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Victorian Gothic and Art Deco Ensembles of Mumbai: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Victorian Gothic and Art Deco Ensembles of Mumbai',
  'Having become a global trading centre, the city of Mumbai implemented an ambitious urban planning project in the second half of the 19th century. It led to the construction of ensembles of public buildings bordering the Oval Maidan open space, first in the Victorian Neo-Gothic style and then, in the early 20th century, in the Art Deco idiom. The Victorian ensemble includes Indian elements suited to the climate, including balconies and verandas. The Art Deco edifices, with their cinemas and residential buildings, blend Indian design with Art Deco imagery, creating a unique style that has been described as Indo-Deco. These two ensembles bear testimony to the phases of modernization that Mumbai has undergone in the course of the 19th and 20th centuries.
Description is available under license CC-BY-SA IGO 3.0',
  'Devenind un centru comercial global, orașul Mumbai a implementat un proiect ambițios de planificare urbană în a doua jumătate a secolului al XIX-lea. A dus la construirea de ansambluri de clădiri publice care mărginesc spațiul deschis Oval Maidan, mai întâi în stil neogotic victorian și apoi, la începutul secolului al XX-lea, în idiomul Art Deco. Ansamblul victorian include elemente indiene potrivite climei, inclusiv balcoane și verande. Edificiile Art Deco, cu cinematografele și clădirile lor rezidențiale, îmbină designul indian cu imaginile Art Deco, creând un stil unic care a fost descris drept Indo-Deco. Aceste două ansambluri mărturisesc fazele de modernizare pe care le-a trecut Mumbaiul de-a lungul secolelor al XIX-lea și al XX-lea.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'Devenue un centre de commerce d’envergure mondiale, la ville de Mumbai a connu un ambitieux projet d’urbanisme durant la deuxième moitié du XIXe siècle. Il s’est traduit par l’édification d’ensembles de bâtiments publics construits dans le style néo-gothique victorien, puis, au début du XXe siècle, par un groupe d’édifices Art déco autour de l’espace vert de l’Oval Maidan. L’ensemble victorien intègre des éléments indiens destinés à répondre au climat local, comme des balcons et des vérandas. Les bâtiments Art déco, avec leurs salles de cinéma et leurs immeubles d’habitation, mélangent la conception indienne et l’imagerie Art déco, créant un style unique appelé plus tard Indo-Deco. Ces deux ensembles témoignent des phases de modernisation que Mumbai a traversées au cours des XIXe et XXe siècles.
Description is available under license CC-BY-SA IGO 3.0',
  'Ciudad portuaria comercial de importancia mundial, Mumbai fue en la segunda mitad del siglo XIX escenario de un ambicioso proyecto urbanístico que se plasmó en la construcción de un conjunto de edificios públicos de estilo neogótico victoriano en torno a la verde explanada del Gran Óvalo, al que vino añadirse un nuevo conjunto de inmuebles art déco a principios del siglo XX. Las construcciones victorianas integraron elementos de la arquitectura india, como balcones y porches, para adaptarse a las condiciones climáticas locales, y en los demás edificios, destinados a viviendas y salas de cine, las nociones estéticas del art déco se fusionaron con formas conceptuales y simbólicas propiamente indias, dando así origen a un estilo único en su género que más tarde se denominaría art indo-déco. Estos dos conjuntos arquitectónicos son una muestra de las etapas por las que atravesó la modernización de Mumbai a lo largo de los siglos XIX y XX.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'Став торговым центром мирового значения, город Мумбай реализовал амбициозный проект городской застройки во второй половине XIX века. Этот проект воплотился в комплексе общественных зданий викторианского неоготического стиля, а затем, в начале XX века, в ряде зданий стиля «арт-деко» вокруг зеленого поля Овал Майдан. Викторианский комплекс отмечен элементами индийской архитектуры, соответствующими местным климатическим условиям, - балконами и верандами. В зданиях стиля «арт-деко» размещаются кинотеатры и жилые помещения, индийский дизайн сочетается с элементами «арт-деко», создавая уникальный стиль, позднее получивший название «индо-деко». Эти два компонента городской застройки демонстрируют последующие фазы модернизации города Мумбай на протяжении XIX и XX веков.
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '在如今已成为全球贸易中心的孟买，19世纪下半叶实施了雄心勃勃的城市改造。临近Oval Maidan的开放空间就是改造的结果，前期的改造为维多利亚新哥特式样式，然后在20世纪初转为装饰艺术风格。维多利亚样式中还融合了适应当地气候特点的印度元素，如阳台设计。装饰艺术风格的电影院和住宅建筑中也带有浓郁的印度设计气息，形成独特的“印度装饰艺术”。这两类建筑诠释了孟买在19和20世纪经历的现代化历程。
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  '',
  '',
  '',
  '',
  'أصبحت مدينة مومباي مركزاً تجارياً هاماً على الصعيد العالمي، وقد شهدت مشروعاً طموحاً للتنمية الحضرية خلال الجزء الثاني من القرن التاسع عشر. إذ أسفر هذا المشروع عن تشييد عدد من المباني العامة المبنية على طراز العمارة الفكتورية القوطية الحديثة، ومجموعة من المباني المنشأة على طراز الـ "آرت ديكو" في بداية القرن العشرين، وذلك حول منطقة الميدان البيضاوي أو"أوفال ميدان" الخضراء. ويجسّد المجمع المبني على الطراز الفكتوري عناصر هندية مخصصة للتأقلم مع المناخ المحلي ومنها مثلاً الشُرف المسقوفة وغير المسقوفة. وإنّ أبنية الآرت ديكو وقاعات السينما والمباني السكنية فيها تخلط بين التصميم الهندي وروح طراز "الآرت ديكور"، الأمر الذي نتج عنه طراز مميّز أطلق عليه اسم الديكو الهندي. ويشهد هذان المجمعان على مراحل التحديث التي مرت بها مدينة مومباي خلال القرنين التاسع عشر والعشرين. 
source: UNESCO/CPE
Description is available under license CC-BY-SA IGO 3.0',
  'UNESCO World Heritage Site',
  '',
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1480_0015-400-400-20231018162844.webp',
  'Cultural',
  'false', 'false', 'false'
);

-- [NEW] Jaipur City, Rajasthan: Add new UNESCO site
INSERT INTO museum_item (paintingname, description, description_ro, description_fr, description_es, description_ru, description_zh, description_ja, description_pt, description_de, description_it, description_ar, author, location, full_image_uri, style, isFavourite, viewed, visited)
VALUES (
  'Jaipur City, Rajasthan',
  'The walled city of Jaipur, in India’s north-western state of Rajasthan was founded in 1727 by Sawai Jai Singh II. Unlike other cities in the region located in hilly terrain, Jaipur was established on the plain and built according to a grid plan interpreted in the light of Vedic architecture. The streets feature continuous colonnaded businesses that intersect in the centre, creating large public squares called chaupars. Markets, shops, residences and temples built along the main streets have uniform facades. The city''s urban planning shows an exchange of ideas from ancient Hindu and early modern Mughal as well as Western cultures. The grid plan is a model that prevails in the West, while the organization of the different city sectors (chowkris) refers to traditional Hindu concepts. Designed to be a commercial capital, the city has maintained its local commercial, artisanal and cooperative traditions to this day.
Description is available under license CC-BY-SA IGO 3.0',
  'Orașul cu ziduri Jaipur, în statul Rajasthan, din nord-vestul Indiei, a fost fondat în 1727 de Sawai Jai Singh II. Spre deosebire de alte orașe din regiune situate pe teren deluros, Jaipur a fost stabilit pe câmpie și construit după un plan grilă interpretat în lumina arhitecturii vedice. Străzile prezintă afaceri continue cu colonade care se intersectează în centru, creând piețe publice mari numite chaupars. Piețele, magazinele, reședințele și templele construite de-a lungul străzilor principale au fațade uniforme. Planificarea urbană a orașului arată un schimb de idei din vechiul hindus și din mughalul modern timpuriu, precum și din culturile occidentale. Planul grilă este un model care predomină în Occident, în timp ce organizarea diferitelor sectoare ale orașului (chowkris) se referă la concepte tradiționale hinduse. Conceput pentru a fi o capitală comercială, orașul și-a menținut până astăzi tradițiile comerciale, artizanale și cooperative locale.
Descrierea este disponibilă sub licență CC-BY-SA IGO 3.0',
  'La ville fortifiée de Jaipur, située dans l’État du Rajasthan, au nord-ouest de l’Inde, a été fondée en 1727 par Sawai Jai Singh II. Contrairement à d’autres villes de la région situées en terrains vallonnés, Jaipur fut implantée en plaine et construite selon un plan quadrillé interprété à la lumière de l’architecture védique. Les rues sont bordées d’une ligne continue de commerces à colonnades qui se croisent au centre, créant de grandes places publiques appelées chaupars. Les marchés, magasins, résidences et temples construits le long des rues principales présentent des façades uniformes. L’urbanisme de la ville montre un échange d’idées issues des cultures hindoue ancienne, moghole moderne et occidentale. Le plan quadrillé est un modèle qui prévaut à l’ouest, tandis que l’organisation des différents secteurs de la ville (chowkris) fait référence aux concepts traditionnels hindous. Conçue pour être une capitale marchande, la ville a maintenu jusqu’à aujourd’hui ses traditions locales commerciales, artisanales et coopératives.
Description is available under license CC-BY-SA IGO 3.0',
  'La ciudad fortificada de Jaipur, situada en el estado de Rajastán, al noroeste de la India, fue fundada en 1727 por Sawai Jai Singh II. A diferencia de otras ciudades de la región situadas en terrenos ondulados, Jaipur se estableció en la llanura y se construyó según un plano en cuadrícula interpretado a la luz de la arquitectura védica. Las calles están bordeadas por una línea continua de comercios con columnatas que se cruzan en el centro, creando grandes plazas públicas llamadas chaupars. Los mercados, puestos, residencias y templos construidos a lo largo de las calles principales presentan fachadas uniformes. La planificación urbana de la ciudad muestra un intercambio de ideas surgidas de las antiguas culturas hindú y mogol y occidentales modernas. Diseñada para ser una capital mercante, la ciudad ha mantenido hasta el día de hoy sus tradiciones comerciales, artesanales y cooperativas.
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
  'https://whc.unesco.org/document/128912/t=3by2sm, https://whc.unesco.org/document/190295/t=3by2sm, https://whc.unesco.org/document/128241/t=3by2sm, https://whc.unesco.org/document/190344/t=3by2sm, https://whc.unesco.org/uploads/thumbs/site_1605_0013-400-400-20221005171943.webp',
  'Cultural',
  'false', 'false', 'false'
);

COMMIT;

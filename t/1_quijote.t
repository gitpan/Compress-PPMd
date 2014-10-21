
use Test::More tests => 31;
BEGIN { use_ok('Compress::PPMd') };

my $in;
{ local $/; $in=<DATA> }

for my $maxorder (2..16) {
    my $encoder=Compress::PPMd::Encoder->new($maxorder);
    my $decoder=Compress::PPMd::Decoder->new($maxorder);

    my $encoded=$encoder->encode($in);
    my $decoded=$decoder->decode($encoded);
    is ($decoded, $in, "encoding/decoding maxorder=$maxorder");

    my $encoded2=$encoder->encode($in);
    my $decoded2=$decoder->decode($encoded2);
    is ($decoded2, $in, "encoding/decoding maxorder=$maxorder, solid mode");
}

__DATA__

Cap�tulo primero. Que trata de la condici�n y ejercicio del famoso hidalgo
don Quijote de la Mancha


En un lugar de la Mancha, de cuyo nombre no quiero acordarme, no ha mucho
tiempo que viv�a un hidalgo de los de lanza en astillero, adarga antigua,
roc�n flaco y galgo corredor. Una olla de algo m�s vaca que carnero,
salpic�n las m�s noches, duelos y quebrantos los s�bados, lantejas los
viernes, alg�n palomino de a�adidura los domingos, consum�an las tres
partes de su hacienda. El resto della conclu�an sayo de velarte, calzas de
velludo para las fiestas, con sus pantuflos de lo mesmo, y los d�as de
entresemana se honraba con su vellor� de lo m�s fino. Ten�a en su casa una
ama que pasaba de los cuarenta, y una sobrina que no llegaba a los veinte,
y un mozo de campo y plaza, que as� ensillaba el roc�n como tomaba la
podadera. Frisaba la edad de nuestro hidalgo con los cincuenta a�os; era de
complexi�n recia, seco de carnes, enjuto de rostro, gran madrugador y amigo
de la caza. Quieren decir que ten�a el sobrenombre de Quijada, o Quesada,
que en esto hay alguna diferencia en los autores que deste caso escriben;
aunque, por conjeturas veros�miles, se deja entender que se llamaba
Quejana. Pero esto importa poco a nuestro cuento; basta que en la narraci�n
d�l no se salga un punto de la verdad.

Es, pues, de saber que este sobredicho hidalgo, los ratos que estaba
ocioso, que eran los m�s del a�o, se daba a leer libros de caballer�as, con
tanta afici�n y gusto, que olvid� casi de todo punto el ejercicio de la
caza, y aun la administraci�n de su hacienda. Y lleg� a tanto su curiosidad
y desatino en esto, que vendi� muchas hanegas de tierra de sembradura para
comprar libros de caballer�as en que leer, y as�, llev� a su casa todos
cuantos pudo haber dellos; y de todos, ningunos le parec�an tan bien como
los que compuso el famoso Feliciano de Silva, porque la claridad de su
prosa y aquellas entricadas razones suyas le parec�an de perlas, y m�s
cuando llegaba a leer aquellos requiebros y cartas de desaf�os, donde en
muchas partes hallaba escrito: La raz�n de la sinraz�n que a mi raz�n se
hace, de tal manera mi raz�n enflaquece, que con raz�n me quejo de la
vuestra fermosura. Y tambi�n cuando le�a: ...los altos cielos que de
vuestra divinidad divinamente con las estrellas os fortifican, y os hacen
merecedora del merecimiento que merece la vuestra grandeza.

Con estas razones perd�a el pobre caballero el juicio, y desvel�base por
entenderlas y desentra�arles el sentido, que no se lo sacara ni las
entendiera el mesmo Arist�teles, si resucitara para s�lo ello. No estaba
muy bien con las heridas que don Belian�s daba y receb�a, porque se
imaginaba que, por grandes maestros que le hubiesen curado, no dejar�a de
tener el rostro y todo el cuerpo lleno de cicatrices y se�ales. Pero, con
todo, alababa en su autor aquel acabar su libro con la promesa de aquella
inacabable aventura, y muchas veces le vino deseo de tomar la pluma y dalle
fin al pie de la letra, como all� se promete; y sin duda alguna lo hiciera,
y aun saliera con ello, si otros mayores y continuos pensamientos no se lo
estorbaran. Tuvo muchas veces competencia con el cura de su lugar -que era
hombre docto, graduado en Sig�enza-, sobre cu�l hab�a sido mejor caballero:
Palmer�n de Ingalaterra o Amad�s de Gaula; mas maese Nicol�s, barbero del
mesmo pueblo, dec�a que ninguno llegaba al Caballero del Febo, y que si
alguno se le pod�a comparar, era don Galaor, hermano de Amad�s de Gaula,
porque ten�a muy acomodada condici�n para todo; que no era caballero
melindroso, ni tan llor�n como su hermano, y que en lo de la valent�a no le
iba en zaga.

En resoluci�n, �l se enfrasc� tanto en su letura, que se le pasaban las
noches leyendo de claro en claro, y los d�as de turbio en turbio; y as�,
del poco dormir y del mucho leer, se le sec� el celebro, de manera que vino
a perder el juicio. Llen�sele la fantas�a de todo aquello que le�a en los
libros, as� de encantamentos como de pendencias, batallas, desaf�os,
heridas, requiebros, amores, tormentas y disparates imposibles; y
asent�sele de tal modo en la imaginaci�n que era verdad toda aquella
m�quina de aquellas sonadas so�adas invenciones que le�a, que para �l no
hab�a otra historia m�s cierta en el mundo. Dec�a �l que el Cid Ruy D�az
hab�a sido muy buen caballero, pero que no ten�a que ver con el Caballero
de la Ardiente Espada, que de s�lo un rev�s hab�a partido por medio dos
fieros y descomunales gigantes. Mejor estaba con Bernardo del Carpio,
porque en Roncesvalles hab�a muerto a Rold�n el encantado, vali�ndose de la
industria de H�rcules, cuando ahog� a Anteo, el hijo de la Tierra, entre
los brazos. Dec�a mucho bien del gigante Morgante, porque, con ser de
aquella generaci�n gigantea, que todos son soberbios y descomedidos, �l
solo era afable y bien criado. Pero, sobre todos, estaba bien con Reinaldos
de Montalb�n, y m�s cuando le ve�a salir de su castillo y robar cuantos
topaba, y cuando en allende rob� aquel �dolo de Mahoma que era todo de oro,
seg�n dice su historia. Diera �l, por dar una mano de coces al traidor de
Galal�n, al ama que ten�a, y aun a su sobrina de a�adidura.

En efeto, rematado ya su juicio, vino a dar en el m�s estra�o pensamiento
que jam�s dio loco en el mundo; y fue que le pareci� convenible y
necesario, as� para el aumento de su honra como para el servicio de su
rep�blica, hacerse caballero andante, y irse por todo el mundo con sus
armas y caballo a buscar las aventuras y a ejercitarse en todo aquello que
�l hab�a le�do que los caballeros andantes se ejercitaban, deshaciendo todo
g�nero de agravio, y poni�ndose en ocasiones y peligros donde, acab�ndolos,
cobrase eterno nombre y fama. Imagin�base el pobre ya coronado por el valor
de su brazo, por lo menos, del imperio de Trapisonda; y as�, con estos tan
agradables pensamientos, llevado del estra�o gusto que en ellos sent�a, se
dio priesa a poner en efeto lo que deseaba.

Y lo primero que hizo fue limpiar unas armas que hab�an sido de sus
bisabuelos, que, tomadas de or�n y llenas de moho, luengos siglos hab�a que
estaban puestas y olvidadas en un rinc�n. Limpi�las y aderez�las lo mejor
que pudo, pero vio que ten�an una gran falta, y era que no ten�an celada de
encaje, sino morri�n simple; mas a esto supli� su industria, porque de
cartones hizo un modo de media celada, que, encajada con el morri�n, hac�an
una apariencia de celada entera. Es verdad que para probar si era fuerte y
pod�a estar al riesgo de una cuchillada, sac� su espada y le dio dos
golpes, y con el primero y en un punto deshizo lo que hab�a hecho en una
semana; y no dej� de parecerle mal la facilidad con que la hab�a hecho
pedazos, y, por asegurarse deste peligro, la torn� a hacer de nuevo,
poni�ndole unas barras de hierro por de dentro, de tal manera que �l qued�
satisfecho de su fortaleza; y, sin querer hacer nueva experiencia della, la
diput� y tuvo por celada fin�sima de encaje.

Fue luego a ver su roc�n, y, aunque ten�a m�s cuartos que un real y m�s
tachas que el caballo de Gonela, que tantum pellis et ossa fuit, le pareci�
que ni el Buc�falo de Alejandro ni Babieca el del Cid con �l se igualaban.
Cuatro d�as se le pasaron en imaginar qu� nombre le pondr�a; porque, seg�n
se dec�a �l a s� mesmo, no era raz�n que caballo de caballero tan famoso, y
tan bueno �l por s�, estuviese sin nombre conocido; y ans�, procuraba
acomod�rsele de manera que declarase qui�n hab�a sido, antes que fuese de
caballero andante, y lo que era entonces; pues estaba muy puesto en raz�n
que, mudando su se�or estado, mudase �l tambi�n el nombre, y le cobrase
famoso y de estruendo, como conven�a a la nueva orden y al nuevo ejercicio
que ya profesaba. Y as�, despu�s de muchos nombres que form�, borr� y
quit�, a�adi�, deshizo y torn� a hacer en su memoria e imaginaci�n, al fin
le vino a llamar Rocinante: nombre, a su parecer, alto, sonoro y
significativo de lo que hab�a sido cuando fue roc�n, antes de lo que ahora
era, que era antes y primero de todos los rocines del mundo.

Puesto nombre, y tan a su gusto, a su caballo, quiso pon�rsele a s� mismo,
y en este pensamiento dur� otros ocho d�as, y al cabo se vino a llamar don
Quijote; de donde -como queda dicho- tomaron ocasi�n los autores desta tan
verdadera historia que, sin duda, se deb�a de llamar Quijada, y no Quesada,
como otros quisieron decir. Pero, acord�ndose que el valeroso Amad�s no
s�lo se hab�a contentado con llamarse Amad�s a secas, sino que a�adi� el
nombre de su reino y patria, por Hepila famosa, y se llam� Amad�s de Gaula,
as� quiso, como buen caballero, a�adir al suyo el nombre de la suya y
llamarse don Quijote de la Mancha, con que, a su parecer, declaraba muy al
vivo su linaje y patria, y la honraba con tomar el sobrenombre della.

Limpias, pues, sus armas, hecho del morri�n celada, puesto nombre a su
roc�n y confirm�ndose a s� mismo, se dio a entender que no le faltaba otra
cosa sino buscar una dama de quien enamorarse; porque el caballero andante
sin amores era �rbol sin hojas y sin fruto y cuerpo sin alma. Dec�ase �l
a s�:

-Si yo, por malos de mis pecados, o por mi buena suerte, me encuentro por
ah� con alg�n gigante, como de ordinario les acontece a los caballeros
andantes, y le derribo de un encuentro, o le parto por mitad del cuerpo, o,
finalmente, le venzo y le rindo, �no ser� bien tener a quien enviarle
presentado y que entre y se hinque de rodillas ante mi dulce se�ora, y diga
con voz humilde y rendido: ''Yo, se�ora, soy el gigante Caraculiambro,
se�or de la �nsula Malindrania, a quien venci� en singular batalla el
jam�s como se debe alabado caballero don Quijote de la Mancha, el cual me
mand� que me presentase ante vuestra merced, para que la vuestra grandeza
disponga de m� a su talante''?

�Oh, c�mo se holg� nuestro buen caballero cuando hubo hecho este discurso,
y m�s cuando hall� a quien dar nombre de su dama! Y fue, a lo que se cree,
que en un lugar cerca del suyo hab�a una moza labradora de muy buen
parecer, de quien �l un tiempo anduvo enamorado, aunque, seg�n se entiende,
ella jam�s lo supo, ni le dio cata dello. Llam�base Aldonza Lorenzo, y a
�sta le pareci� ser bien darle t�tulo de se�ora de sus pensamientos; y,
busc�ndole nombre que no desdijese mucho del suyo, y que tirase y se
encaminase al de princesa y gran se�ora, vino a llamarla Dulcinea del
Toboso, porque era natural del Toboso; nombre, a su parecer, m�sico y
peregrino y significativo, como todos los dem�s que a �l y a sus cosas
hab�a puesto.


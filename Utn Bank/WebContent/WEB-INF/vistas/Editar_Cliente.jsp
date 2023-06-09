<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script>
const provincias = ['Buenos Aires', 'Buenos Aires-GBA','Capital Federal','Catamarca','Chaco','Chubut','C�rdoba','Corrientes','Entre R�os','Formosa','Jujuy','La Pampa','La Rioja','Mendoza','Misiones','Neuqu�n','R�o Negro','Salta','San Juan','San Luis','Santa Cruz','Santa Fe','Santiago del Estero','Tierra del Fuego','Tucum�n'];
const  ciudades = [
	['25 de Mayo','Bah�a Blanca','Capilla del Se�or','Chascom�s','Luj�n', '3 de febrero', 'A. Alsina', 'A. Gonz�les Ch�ves', 'Aguas Verdes', 'Alberti', 'Arrecifes', 'Ayacucho', 'Azul', 'Balcarce', 'Baradero', 'Benito Ju�rez', 'Berisso', 'Bol�var', 'Bragado', 'Brandsen', 'Campana', 'Ca�uelas', 'Capit�n Sarmiento', 'Carapachay', 'Carhue', 'Caril�', 'Carlos Casares', 'Carlos Tejedor', 'Carmen de Areco', 'Carmen de Patagones', 'Castelli', 'Chacabuco', 'Chivilcoy', 'Col�n', 'Coronel Dorrego', 'Coronel Pringles', 'Coronel Rosales', 'Coronel Suarez', 'Costa Azul', 'Costa Chica', 'Costa del Este', 'Costa Esmeralda', 'Daireaux', 'Darregueira', 'Del Viso', 'Dolores', 'Don Torcuato', 'Ensenada', 'Escobar', 'Exaltaci�n de la Cruz', 'Florentino Ameghino', 'Gar�n', 'Gral. Alvarado', 'Gral. Alvear', 'Gral. Arenales', 'Gral. Belgrano', 'Gral. Guido', 'Gral. Lamadrid', 'Gral. Las Heras', 'Gral. Lavalle', 'Gral. Madariaga', 'Gral. Pueyrred�n', 'Gral. Rodr�guez', 'Gral. Viamonte', 'Gral. Villegas', 'Guamin�', 'Guernica', 'Hip�lito Yrigoyen', 'Ing. Maschwitz', 'Jun�n', 'La Plata', 'Laprida', 'Las Flores', 'Las Toninas', 'Leandro N. Alem', 'Lincoln', 'Loberia', 'Lobos', 'Los Cardales', 'Los Toldos', 'Lucila del Mar', 'Magdalena', 'Maip�', 'Mar Chiquita', 'Mar de Aj�', 'Mar de las Pampas', 'Mar del Plata', 'Mar del Tuy�', 'Marcos Paz', 'Mercedes', 'Miramar', 'Monte', 'Monte Hermoso', 'Munro', 'Navarro', 'Necochea', 'Olavarr�a', 'Partido de la Costa', 'Pehuaj�', 'Pellegrini', 'Pergamino', 'Pig��', 'Pila', 'Pilar', 'Pinamar', 'Pinar del Sol', 'Polvorines', 'Pte. Per�n', 'Pu�n', 'Punta Indio', 'Ramallo', 'Rauch', 'Rivadavia', 'Rojas', 'Roque P�rez', 'Saavedra', 'Saladillo', 'Salliquel�', 'Salto', 'San Andr�s de Giles', 'San Antonio de Areco', 'San Antonio de Padua', 'San Bernardo', 'San Cayetano', 'San Clemente del Tuy�', 'San Nicol�s', 'San Pedro', 'San Vicente', 'Santa Teresita', 'Suipacha', 'Tandil', 'Tapalqu�', 'Tordillo', 'Tornquist', 'Trenque Lauquen', 'Tres Lomas', 'Villa Gesell', 'Villarino', 'Z�rate'],
	['11 de Septiembre', '20 de Junio', '25 de Mayo', 'Acassuso', 'Adrogu�', 'Aldo Bonzi', '�rea Reserva Cintur�n Ecol�gico', 'Avellaneda', 'Banfield', 'Barrio Parque', 'Barrio Santa Teresita', 'Beccar', 'Bella Vista', 'Berazategui', 'Bernal Este', 'Bernal Oeste', 'Billinghurst', 'Boulogne', 'Burzaco', 'Carapachay', 'Caseros', 'Castelar', 'Churruca', 'Ciudad Evita', 'Ciudad Madero', 'Ciudadela', 'Claypole', 'Crucecita', 'Dock Sud', 'Don Bosco', 'Don Orione', 'El Jag�el', 'El Libertador', 'El Palomar', 'El Tala', 'El Tr�bol', 'Ezeiza', 'Ezpeleta', 'Florencio Varela', 'Florida', 'Francisco �lvarez', 'Gerli', 'Glew', 'Gonz�lez Cat�n', 'Gral. Lamadrid', 'Grand Bourg', 'Gregorio de Laferrere', 'Guillermo Enrique Hudson', 'Haedo', 'Hurlingham', 'Ing. Sourdeaux', 'Isidro Casanova', 'Ituzaing�', 'Jos� C. Paz', 'Jos� Ingenieros', 'Jos� Marmol', 'La Lucila', 'La Reja', 'La Tablada', 'Lan�s', 'Llavallol', 'Loma Hermosa', 'Lomas de Zamora', 'Lomas del Mill�n', 'Lomas del Mirador', 'Longchamps', 'Los Polvorines', 'Luis Guill�n', 'Malvinas Argentinas', 'Mart�n Coronado', 'Mart�nez', 'Merlo', 'Ministro Rivadavia', 'Monte Chingolo', 'Monte Grande', 'Moreno', 'Mor�n', 'Mu�iz', 'Olivos', 'Pablo Nogu�s', 'Pablo Podest�', 'Paso del Rey', 'Pereyra', 'Pi�eiro', 'Pl�tanos', 'Pontevedra', 'Quilmes', 'Rafael Calzada', 'Rafael Castillo', 'Ramos Mej�a', 'Ranelagh', 'Remedios de Escalada', 'S�enz Pe�a', 'San Antonio de Padua', 'San Fernando', 'San Francisco Solano', 'San Isidro', 'San Jos�', 'San Justo', 'San Mart�n', 'San Miguel', 'Santos Lugares', 'Sarand�', 'Sourigues', 'Tapiales', 'Temperley', 'Tigre', 'Tortuguitas', 'Trist�n Su�rez', 'Trujui', 'Turdera', 'Valent�n Alsina', 'Vicente L�pez', 'Villa Adelina', 'Villa Ballester', 'Villa Bosch', 'Villa Caraza', 'Villa Celina', 'Villa Centenario', 'Villa de Mayo', 'Villa Diamante', 'Villa Dom�nico', 'Villa Espa�a', 'Villa Fiorito', 'Villa Guillermina', 'Villa Insuperable', 'Villa Jos� Le�n Su�rez', 'Villa La Florida', 'Villa Luzuriaga', 'Villa Martelli', 'Villa Obrera', 'Villa Progreso', 'Villa Raffo', 'Villa Sarmiento', 'Villa Tesei', 'Villa Udaondo', 'Virrey del Pino', 'Wilde', 'William Morris'],
	['Agronom�a', 'Almagro', 'Balvanera', 'Barracas', 'Belgrano', 'Boca', 'Boedo', 'Caballito', 'Chacarita', 'Coghlan', 'Colegiales', 'Constituci�n', 'Flores', 'Floresta', 'La Paternal', 'Liniers', 'Mataderos', 'Monserrat', 'Monte Castro', 'Nueva Pompeya', 'N��ez', 'Palermo', 'Parque Avellaneda', 'Parque Chacabuco', 'Parque Chas', 'Parque Patricios', 'Puerto Madero', 'Recoleta', 'Retiro', 'Saavedra', 'San Crist�bal', 'San Nicol�s', 'San Telmo', 'V�lez S�rsfield', 'Versalles', 'Villa Crespo', 'Villa del Parque', 'Villa Devoto', 'Villa Gral. Mitre', 'Villa Lugano', 'Villa Luro', 'Villa Ort�zar', 'Villa Pueyrred�n', 'Villa Real', 'Villa Riachuelo', 'Villa Santa Rita', 'Villa Soldati', 'Villa Urquiza'],
	[, 'Ancasti', 'Andalgal�', 'Antofagasta', 'Bel�n', 'Capay�n', 'Capital', '4', 'Corral Quemado', 'El Alto', 'El Rodeo', 'F.Mamerto Esqui�', 'Fiambal�', 'Hualf�n', 'Huillapima', 'Ica�o', 'La Puerta','Aconquija', 'Las Juntas', 'Londres', 'Los Altos', 'Los Varela', 'Mutqu�n', 'Pacl�n', 'Poman', 'Pozo de La Piedra', 'Puerta de Corral', 'Puerta San Jos�', 'Recreo', 'S.F.V de 4', 'San Fernando', 'San Fernando del Valle', 'San Jos�', 'Santa Mar�a', 'Santa Rosa', 'Saujil', 'Tapso', 'Tinogasta', 'Valle Viejo', 'Villa Vil'],
	['Avi� Tera�', 'Barranqueras', 'Basail', 'Campo Largo', 'Capital', 'Capit�n Solari', 'Charadai', 'Charata', 'Chorotis', 'Ciervo Petiso', 'Cnel. Du Graty', 'Col. Ben�tez', 'Col. Elisa', 'Col. Popular', 'Colonias Unidas', 'Concepci�n', 'Corzuela', 'Cote Lai', 'El Sauzalito', 'Enrique Urien', 'Fontana', 'Fte. Esperanza', 'Gancedo', 'Gral. Capdevila', 'Gral. Pinero', 'Gral. San Mart�n', 'Gral. Vedia', 'Hermoso Campo', 'I. del Cerrito', 'J.J. Castelli', 'La Clotilde', 'La Eduvigis', 'La Escondida', 'La Leonesa', 'La Tigra', 'La Verde', 'Laguna Blanca', 'Laguna Limpia', 'Lapachito', 'Las Bre�as', 'Las Garcitas', 'Las Palmas', 'Los Frentones', 'Machagai', 'Makall�', 'Margarita Bel�n', 'Miraflores', 'Misi�n N. Pompeya', 'Napenay', 'Pampa Almir�n', 'Pampa del Indio', 'Pampa del Infierno', 'Pdcia. de La Plaza', 'Pdcia. Roca', 'Pdcia. Roque S�enz Pe�a', 'Pto. Bermejo', 'Pto. Eva Per�n', 'Puero Tirol', 'Puerto Vilelas', 'Quitilipi', 'Resistencia', 'S�enz Pe�a', 'Samuh�', 'San Bernardo', 'Santa Sylvina', 'Taco Pozo', 'Tres Isletas', 'Villa �ngela', 'Villa Berthet', 'Villa R. Bermejito'],
	['Aldea Apeleg', 'Aldea Beleiro', 'Aldea Epulef', 'Alto R�o Sengerr', 'Buen Pasto', 'Camarones', 'Carrenleuf�', 'Cholila', 'Co. Centinela', 'Colan Conhu�', 'Comodoro Rivadavia', 'Corcovado', 'Cushamen', 'Dique F. Ameghino', 'Dolav�n', 'Dr. R. Rojas', 'El Hoyo', 'El Mait�n', 'Epuy�n', 'Esquel', 'Facundo', 'Gaim�n', 'Gan Gan', 'Gastre', 'Gdor. Costa', 'Gualjaina', 'J. de San Mart�n', 'Lago Blanco', 'Lago Puelo', 'Lagunita Salada', 'Las Plumas', 'Los Altares', 'Paso de los Indios', 'Paso del Sapo', 'Pto. Madryn', 'Pto. Pir�mides', 'Rada Tilly', 'Rawson', 'R�o Mayo', 'R�o Pico', 'Sarmiento', 'Tecka', 'Telsen', 'Trelew', 'Trevelin', 'Veintiocho de Julio'],
	['Achiras', 'Adelia Maria', 'Agua de Oro', 'Alcira Gigena', 'Aldea Santa Maria', 'Alejandro Roca', 'Alejo Ledesma', 'Alicia', 'Almafuerte', 'Alpa Corral', 'Alta Gracia', 'Alto Alegre', 'Alto de Los Quebrachos', 'Altos de Chipion', 'Amboy', 'Ambul', 'Ana Zumaran', 'Anisacate', 'Arguello', 'Arias', 'Arroyito', 'Arroyo Algodon', 'Arroyo Cabral', 'Arroyo Los Patos', 'Assunta', 'Atahona', 'Ausonia', 'Avellaneda', 'Ballesteros', 'Ballesteros Sud', 'Balnearia', 'Ba�ado de Soto', 'Bell Ville', 'Bengolea', 'Benjamin Gould', 'Berrotaran', 'Bialet Masse', 'Bouwer', 'Brinkmann', 'Buchardo', 'Bulnes', 'Cabalango', 'Calamuchita', 'Calchin', 'Calchin Oeste', 'Calmayo', 'Camilo Aldao', 'Caminiaga', 'Ca�ada de Luque', 'Ca�ada de Machado', 'Ca�ada de Rio Pinto', 'Ca�ada del Sauce', 'Canals', 'Candelaria Sud', 'Capilla de Remedios', 'Capilla de Siton', 'Capilla del Carmen', 'Capilla del Monte', 'Capital', 'Capitan Gral B. O�Higgins', 'Carnerillo', 'Carrilobo', 'Casa Grande', 'Cavanagh', 'Cerro Colorado', 'Chaj�n', 'Chalacea', 'Cha�ar Viejo', 'Chancan�', 'Charbonier', 'Charras', 'Chaz�n', 'Chilibroste', 'Chucul', 'Chu�a', 'Chu�a Huasi', 'Churqui Ca�ada', 'Cienaga Del Coro', 'Cintra', 'Col. Almada', 'Col. Anita', 'Col. Barge', 'Col. Bismark', 'Col. Bremen', 'Col. Caroya', 'Col. Italiana', 'Col. Iturraspe', 'Col. Las Cuatro Esquinas', 'Col. Las Pichanas', 'Col. Marina', 'Col. Prosperidad', 'Col. San Bartolome', 'Col. San Pedro', 'Col. Tirolesa', 'Col. Vicente Aguero', 'Col. Videla', 'Col. Vignaud', 'Col. Waltelina', 'Colazo', 'Comechingones', 'Conlara', 'Copacabana', '7', 'Coronel Baigorria', 'Coronel Moldes', 'Corral de Bustos', 'Corralito', 'Cosqu�n', 'Costa Sacate', 'Cruz Alta', 'Cruz de Ca�a', 'Cruz del Eje', 'Cuesta Blanca', 'Dean Funes', 'Del Campillo', 'Despe�aderos', 'Devoto', 'Diego de Rojas', 'Dique Chico', 'El Ara�ado', 'El Brete', 'El Chacho', 'El Crisp�n', 'El Fort�n', 'El Manzano', 'El Rastreador', 'El Rodeo', 'El T�o', 'Elena', 'Embalse', 'Esquina', 'Estaci�n Gral. Paz', 'Estaci�n Ju�rez Celman', 'Estancia de Guadalupe', 'Estancia Vieja', 'Etruria', 'Eufrasio Loza', 'Falda del Carmen', 'Freyre', 'Gral. Baldissera', 'Gral. Cabrera', 'Gral. Deheza', 'Gral. Fotheringham', 'Gral. Levalle', 'Gral. Roca', 'Guanaco Muerto', 'Guasapampa', 'Guatimozin', 'Gutenberg', 'Hernando', 'Huanchillas', 'Huerta Grande', 'Huinca Renanco', 'Idiazabal', 'Impira', 'Inriville', 'Isla Verde', 'Ital�', 'James Craik', 'Jes�s Mar�a', 'Jovita', 'Justiniano Posse', 'Km 658', 'L. V. Mansilla', 'La Batea', 'La Calera', 'La Carlota', 'La Carolina', 'La Cautiva', 'La Cesira', 'La Cruz', 'La Cumbre', 'La Cumbrecita', 'La Falda', 'La Francia', 'La Granja', 'La Higuera', 'La Laguna', 'La Paisanita', 'La Palestina', '12', 'La Paquita', 'La Para', 'La Paz', 'La Playa', 'La Playosa', 'La Poblaci�n', 'La Posta', 'La Puerta', 'La Quinta', 'La Rancherita', 'La Rinconada', 'La Serranita', 'La Tordilla', 'Laborde', 'Laboulaye', 'Laguna Larga', 'Las Acequias', 'Las Albahacas', 'Las Arrias', 'Las Bajadas', 'Las Caleras', 'Las Calles', 'Las Ca�adas', 'Las Gramillas', 'Las Higueras', 'Las Isletillas', 'Las Junturas', 'Las Palmas', 'Las Pe�as', 'Las Pe�as Sud', 'Las Perdices', 'Las Playas', 'Las Rabonas', 'Las Saladas', 'Las Tapias', 'Las Varas', 'Las Varillas', 'Las Vertientes', 'Leguizam�n', 'Leones', 'Los Cedros', 'Los Cerrillos', 'Los Cha�aritos (C.E)', 'Los Chanaritos (R.S)', 'Los Cisnes', 'Los Cocos', 'Los C�ndores', 'Los Hornillos', 'Los Hoyos', 'Los Mistoles', 'Los Molinos', 'Los Pozos', 'Los Reartes', 'Los Surgentes', 'Los Talares', 'Los Zorros', 'Lozada', 'Luca', 'Luque', 'Luyaba', 'Malague�o', 'Malena', 'Malvinas Argentinas', 'Manfredi', 'Maquinista Gallini', 'Marcos Ju�rez', 'Marull', 'Matorrales', 'Mattaldi', 'Mayu Sumaj', 'Media Naranja', 'Melo', 'Mendiolaza', 'Mi Granja', 'Mina Clavero', 'Miramar', 'Morrison', 'Morteros', 'Mte. Buey', 'Mte. Cristo', 'Mte. De Los Gauchos', 'Mte. Le�a', 'Mte. Ma�z', 'Mte. Ralo', 'Nicol�s Bruzone', 'Noetinger', 'Nono', 'Nueva 7', 'Obispo Trejo', 'Olaeta', 'Oliva', 'Olivares San Nicol�s', 'Onagolty', 'Oncativo', 'Ordo�ez', 'Pacheco De Melo', 'Pampayasta N.', 'Pampayasta S.', 'Panaholma', 'Pascanas', 'Pasco', 'Paso del Durazno', 'Paso Viejo', 'Pilar', 'Pinc�n', 'Piquill�n', 'Plaza de Mercedes', 'Plaza Luxardo', 'Porte�a', 'Potrero de Garay', 'Pozo del Molle', 'Pozo Nuevo', 'Pueblo Italiano', 'Puesto de Castro', 'Punta del Agua', 'Quebracho Herrado', 'Quilino', 'Rafael Garc�a', 'Ranqueles', 'Rayo Cortado', 'Reducci�n', 'Rinc�n', 'R�o Bamba', 'R�o Ceballos', 'R�o Cuarto', 'R�o de Los Sauces', 'R�o Primero', 'R�o Segundo', 'R�o Tercero', 'Rosales', 'Rosario del Saladillo', 'Sacanta', 'Sagrada Familia', 'Saira', 'Saladillo', 'Sald�n', 'Salsacate', 'Salsipuedes', 'Sampacho', 'San Agust�n', 'San Antonio de Arredondo', 'San Antonio de Lit�n', 'San Basilio', 'San Carlos Minas', 'San Clemente', 'San Esteban', 'San Francisco', 'San Ignacio', 'San Javier', 'San Jer�nimo', 'San Joaqu�n', 'San Jos� de La Dormida', 'San Jos� de Las Salinas', 'San Lorenzo', 'San Marcos Sierras', 'San Marcos Sud', 'San Pedro', 'San Pedro N.', 'San Roque', 'San Vicente', 'Santa Catalina', 'Santa Elena', 'Santa Eufemia', 'Santa Maria', 'Sarmiento', 'Saturnino M.Laspiur', 'Sauce Arriba', 'Sebasti�n Elcano', 'Seeber', 'Segunda Usina', 'Serrano', 'Serrezuela', 'Sgo. Temple', 'Silvio Pellico', 'Simbolar', 'Sinsacate', 'Sta. Rosa de Calamuchita', 'Sta. Rosa de R�o Primero', 'Suco', 'Tala Ca�ada', 'Tala Huasi', 'Talaini', 'Tancacha', 'Tanti', 'Ticino', 'Tinoco', 'T�o Pujio', 'Toledo', 'Toro Pujio', 'Tosno', 'Tosquita', 'Tr�nsito', 'Tuclame', 'Tutti', 'Ucacha', 'Unquillo', 'Valle de Anisacate', 'Valle Hermoso', 'V�lez Sarfield', 'Viamonte', 'Vicu�a Mackenna', 'Villa Allende', 'Villa Amancay', 'Villa Ascasubi', 'Villa Candelaria N.', 'Villa Carlos Paz', 'Villa Cerro Azul', 'Villa Ciudad de Am�rica', 'Villa Ciudad Pque Los Reartes', 'Villa Concepci�n del T�o', 'Villa Cura Brochero', 'Villa de Las Rosas', 'Villa de Mar�a', 'Villa de Pocho', 'Villa de Soto', 'Villa del Dique', 'Villa del Prado', 'Villa del Rosario', 'Villa del Totoral', 'Villa Dolores', 'Villa El Chancay', 'Villa Elisa', 'Villa Flor Serrana', 'Villa Fontana', 'Villa Giardino', 'Villa Gral. Belgrano', 'Villa Gutierrez', 'Villa Huidobro', 'Villa La Bolsa', 'Villa Los Aromos', 'Villa Los Patos', 'Villa Mar�a', 'Villa Nueva', 'Villa Pque. Santa Ana', 'Villa Pque. Siquiman', 'Villa Quillinzo', 'Villa Rossi', 'Villa Rumipal', 'Villa San Esteban', 'Villa San Isidro', 'Villa 21', 'Villa Sarmiento (G.R)', 'Villa Sarmiento (S.A)', 'Villa Tulumba', 'Villa Valeria', 'Villa Yacanto', 'Washington', 'Wenceslao Escalante', 'Ycho Cruz Sierras'],
	['Alvear', 'Bella Vista', 'Ber�n de Astrada', 'Bonpland', 'Ca� Cati', 'Capital', 'Chavarr�a', 'Col. C. Pellegrini', 'Col. Libertad', 'Col. Liebig', 'Col. Sta Rosa', 'Concepci�n', 'Cruz de Los Milagros', 'Curuz�-Cuati�', 'Empedrado', 'Esquina', 'Estaci�n Torrent', 'Felipe Yofr�', 'Garruchos', 'Gdor. Agr�nomo', 'Gdor. Mart�nez', 'Goya', 'Guaviravi', 'Herlitzka', 'Ita-Ibate', 'Itat�', 'Ituzaing�', 'Jos� Rafael G�mez', 'Juan Pujol', 'La Cruz', 'Lavalle', 'Lomas de Vallejos', 'Loreto', 'Mariano I. Loza', 'Mburucuy�', 'Mercedes', 'Mocoret�', 'Mte. Caseros', 'Nueve de Julio', 'Palmar Grande', 'Parada Pucheta', 'Paso de La Patria', 'Paso de Los Libres', 'Pedro R. Fernandez', 'Perugorr�a', 'Pueblo Libertador', 'Ramada Paso', 'Riachuelo', 'Saladas', 'San Antonio', 'San Carlos', 'San Cosme', 'San Lorenzo', '20 del Palmar', 'San Miguel', 'San Roque', 'Santa Ana', 'Santa Luc�a', 'Santo Tom�', 'Sauce', 'Tabay', 'Tapebicu�', 'Tatacua', 'Virasoro', 'Yapey�', 'Yatait� Calle'],
	['Alarc�n', 'Alcaraz', 'Alcaraz N.', 'Alcaraz S.', 'Aldea Asunci�n', 'Aldea Brasilera', 'Aldea Elgenfeld', 'Aldea Grapschental', 'Aldea Ma. Luisa', 'Aldea Protestante', 'Aldea Salto', 'Aldea San Antonio (G)', 'Aldea San Antonio (P)', 'Aldea 19', 'Aldea San Miguel', 'Aldea San Rafael', 'Aldea Spatzenkutter', 'Aldea Sta. Mar�a', 'Aldea Sta. Rosa', 'Aldea Valle Mar�a', 'Altamirano Sur', 'Antelo', 'Antonio Tom�s', 'Aranguren', 'Arroyo Bar�', 'Arroyo Burgos', 'Arroyo Cl�', 'Arroyo Corralito', 'Arroyo del Medio', 'Arroyo Maturrango', 'Arroyo Palo Seco', 'Banderas', 'Basavilbaso', 'Betbeder', 'Bovril', 'Caseros', 'Ceibas', 'Cerrito', 'Chajar�', 'Chilcas', 'Clodomiro Ledesma', 'Col. Alemana', 'Col. Avellaneda', 'Col. Avigdor', 'Col. Ayu�', 'Col. Baylina', 'Col. Carrasco', 'Col. Celina', 'Col. Cerrito', 'Col. Crespo', 'Col. Elia', 'Col. Ensayo', 'Col. Gral. Roca', 'Col. La Argentina', 'Col. Merou', 'Col. Oficial N�3', 'Col. Oficial N�13', 'Col. Oficial N�14', 'Col. Oficial N�5', 'Col. Reffino', 'Col. Tunas', 'Col. Virar�', 'Col�n', 'Concepci�n del Uruguay', 'Concordia', 'Conscripto Bernardi', 'Costa Grande', 'Costa San Antonio', 'Costa Uruguay N.', 'Costa Uruguay S.', 'Crespo', 'Crucecitas 3�', 'Crucecitas 7�', 'Crucecitas 8�', 'Cuchilla Redonda', 'Curtiembre', 'Diamante', 'Distrito 6�', 'Distrito Cha�ar', 'Distrito Chiqueros', 'Distrito Cuarto', 'Distrito Diego L�pez', 'Distrito Pajonal', 'Distrito Sauce', 'Distrito Tala', 'Distrito Talitas', 'Don Crist�bal 1� Secci�n', 'Don Crist�bal 2� Secci�n', 'Durazno', 'El Cimarr�n', 'El Gramillal', 'El Palenque', 'El Pingo', 'El Quebracho', 'El Redom�n', 'El Solar', 'Enrique Carbo', '9', 'Espinillo N.', 'Estaci�n Campos', 'Estaci�n Escri�a', 'Estaci�n Lazo', 'Estaci�n Ra�ces', 'Estaci�n Yer�a', 'Estancia Grande', 'Estancia L�baros', 'Estancia Racedo', 'Estancia Sol�', 'Estancia Yuquer�', 'Estaquitas', 'Faustino M. Parera', 'Febre', 'Federaci�n', 'Federal', 'Gdor. Echag�e', 'Gdor. Mansilla', 'Gilbert', 'Gonz�lez Calder�n', 'Gral. Almada', 'Gral. Alvear', 'Gral. Campos', 'Gral. Galarza', 'Gral. Ram�rez', 'Gualeguay', 'Gualeguaych�', 'Gualeguaycito', 'Guardamonte', 'Hambis', 'Hasenkamp', 'Hernandarias', 'Hern�ndez', 'Herrera', 'Hinojal', 'Hocker', 'Ing. Sajaroff', 'Irazusta', 'Isletas', 'J.J De Urquiza', 'Jubileo', 'La Clarita', 'La Criolla', 'La Esmeralda', 'La Florida', 'La Fraternidad', 'La Hierra', 'La Ollita', 'La Paz', 'La Picada', 'La Providencia', 'La Verbena', 'Laguna Ben�tez', 'Larroque', 'Las Cuevas', 'Las Garzas', 'Las Guachas', 'Las Mercedes', 'Las Moscas', 'Las Mulitas', 'Las Toscas', 'Laurencena', 'Libertador San Mart�n', 'Loma Limpia', 'Los Ceibos', 'Los Charruas', 'Los Conquistadores', 'Lucas Gonz�lez', 'Lucas N.', 'Lucas S. 1�', 'Lucas S. 2�', 'Maci�', 'Mar�a Grande', 'Mar�a Grande 2�', 'M�danos', 'Mojones N.', 'Mojones S.', 'Molino Doll', 'Monte Redondo', 'Montoya', 'Mulas Grandes', '�ancay', 'Nogoy�', 'Nueva Escocia', 'Nueva Vizcaya', 'Omb�', 'Oro Verde', 'Paran�', 'Pasaje Guayaquil', 'Pasaje Las Tunas', 'Paso de La Arena', 'Paso de La Laguna', 'Paso de Las Piedras', 'Paso Duarte', 'Pastor Britos', 'Pedernal', 'Perdices', 'Picada Ber�n', 'Piedras Blancas', 'Primer Distrito Cuchilla', 'Primero de Mayo', 'Pronunciamiento', 'Pto. Algarrobo', 'Pto. Ibicuy', 'Pueblo Brugo', 'Pueblo Cazes', 'Pueblo Gral. Belgrano', 'Pueblo Liebig', 'Puerto Yeru�', 'Punta del Monte', 'Quebracho', 'Quinto Distrito', 'Raices Oeste', 'Rinc�n de Nogoy�', 'Rinc�n del Cinto', 'Rinc�n del Doll', 'Rinc�n del Gato', 'Rocamora', 'Rosario del Tala', 'San Benito', 'San Cipriano', 'San Ernesto', 'San Gustavo', 'San Jaime', 'San Jos�', 'San Jos� de Feliciano', 'San Justo', 'San Marcial', 'San Pedro', 'San Ram�rez', 'San Ram�n', 'San Roque', 'San Salvador', 'San V�ctor', 'Santa Ana', 'Santa Anita', 'Santa Elena', 'Santa Luc�a', 'Santa Luisa', 'Sauce de Luna', 'Sauce Montrull', 'Sauce Pinto', 'Sauce Sur', 'Segu�', 'Sir Leonard', 'Sosa', 'Tabossi', 'Tezanos Pinto', 'Ubajay', 'Urdinarrain', 'Veinte de Septiembre', 'Viale', 'Victoria', 'Villa Clara', 'Villa del Rosario', 'Villa Dom�nguez', 'Villa Elisa', 'Villa Fontana', 'Villa Gdor. Etchevehere', 'Villa Mantero', 'Villa Paranacito', 'Villa Urquiza', 'Villaguay', 'Walter Moss', 'Yacar�', 'Yeso Oeste'],
	['Buena Vista', 'Clorinda', 'Col. Pastoril', 'Cte. Fontana', 'El Colorado', 'El Espinillo', 'Estanislao Del Campo', '10', 'Fort�n Lugones', 'Gral. Lucio V. Mansilla', 'Gral. Manuel Belgrano', 'Gral. Mosconi', 'Gran Guardia', 'Herradura', 'Ibarreta', 'Ing. Ju�rez', 'Laguna Blanca', 'Laguna Naick Neck', 'Laguna Yema', 'Las Lomitas', 'Los Chiriguanos', 'Mayor V. Villafa�e', 'Misi�n San Fco.', 'Palo Santo', 'Piran�', 'Pozo del Maza', 'Riacho He-He', 'San Hilario', 'San Mart�n II', 'Siete Palmas', 'Subteniente Per�n', 'Tres Lagunas', 'Villa Dos Trece', 'Villa Escolar', 'Villa Gral. G�emes'],
	['Abdon Castro Tolay', 'Abra Pampa', 'Abralaite', 'Aguas Calientes', 'Arrayanal', 'Barrios', 'Caimancito', 'Calilegua', 'Cangrejillos', 'Caspala', 'Catu�', 'Cieneguillas', 'Coranzulli', 'Cusi-Cusi', 'El Aguilar', 'El Carmen', 'El C�ndor', 'El Fuerte', 'El Piquete', 'El Talar', 'Fraile Pintado', 'Hip�lito Yrigoyen', 'Huacalera', 'Humahuaca', 'La Esperanza', 'La Mendieta', 'La Quiaca', 'Ledesma', 'Libertador Gral. San Martin', 'Maimara', 'Mina Pirquitas', 'Monterrico', 'Palma Sola', 'Palpal�', 'Pampa Blanca', 'Pampichuela', 'Perico', 'Puesto del Marqu�s', 'Puesto Viejo', 'Pumahuasi', 'Purmamarca', 'Rinconada', 'Rodeitos', 'Rosario de R�o Grande', 'San Antonio', 'San Francisco', 'San Pedro', 'San Rafael', 'San Salvador', 'Santa Ana', 'Santa Catalina', 'Santa Clara', 'Susques', 'Tilcara', 'Tres Cruces', 'Tumbaya', 'Valle Grande', 'Vinalito', 'Volc�n', 'Yala', 'Yav�', 'Yuto'],
	['Adolfo Van Praet', 'Agustoni', 'Algarrobo del Aguila', 'Alpachiri', 'Alta Italia', 'Anguil', 'Arata', 'Ataliva Roca', 'Bernardo Larroude', 'Bernasconi', 'Caleuf�', 'Carro Quemado', 'Catril�', 'Ceballos', 'Chacharramendi', 'Col. Bar�n', 'Col. Santa Mar�a', 'Conhelo', 'Coronel Hilario Lagos', 'Cuchillo-C�', 'Doblas', 'Dorila', 'Eduardo Castex', 'Embajador Martini', 'Falucho', 'Gral. Acha', 'Gral. Manuel Campos', 'Gral. Pico', 'Guatrach�', 'Ing. Luiggi', 'Intendente Alvear', 'Jacinto Arauz', 'La Adela', 'La Humada', 'La Maruja', '12', 'La Reforma', 'Limay Mahuida', 'Lonquimay', 'Loventuel', 'Luan Toro', 'Macach�n', 'Maisonnave', 'Mauricio Mayer', 'Metileo', 'Miguel Can�', 'Miguel Riglos', 'Monte Nievas', 'Parera', 'Per�', 'Pichi-Huinca', 'Puelches', 'Puel�n', 'Quehue', 'Quem� Quem�', 'Quetrequ�n', 'Rancul', 'Realic�', 'Relmo', 'Rol�n', 'Rucanelo', 'Sarah', 'Speluzzi', 'Sta. Isabel', 'Sta. Rosa', 'Sta. Teresa', 'Tel�n', 'Toay', 'Tomas M. de Anchorena', 'Trenel', 'Unanue', 'Uriburu', 'Veinticinco de Mayo', 'Vertiz', 'Victorica', 'Villa Mirasol', 'Winifreda'],
	['Arauco', 'Capital', 'Castro Barros', 'Chamical', 'Chilecito', 'Coronel F. Varela', 'Famatina', 'Gral. A.V.Pe�aloza', 'Gral. Belgrano', 'Gral. J.F. Quiroga', 'Gral. Lamadrid', 'Gral. Ocampo', 'Gral. San Mart�n', 'Independencia', 'Rosario Penaloza', 'San Blas de Los Sauces', 'Sanagasta', 'Vinchina'],
	['Capital', 'Chacras de Coria', 'Dorrego', 'Gllen', 'Godoy Cruz', 'Gral. Alvear', 'Guaymall�n', 'Jun�n', 'La Paz', 'Las Heras', 'Lavalle', 'Luj�n', 'Luj�n De Cuyo', 'Maip�', 'Malarg�e', 'Rivadavia', 'San Carlos', 'San Mart�n', 'San Rafael', 'Sta. Rosa', 'Tunuy�n', 'Tupungato', 'Villa Nueva'],
	['Alba Posse', 'Almafuerte', 'Ap�stoles', 'Arist�bulo Del Valle', 'Arroyo Del Medio', 'Azara', 'Bdo. De Irigoyen', 'Bonpland', 'Ca� Yari', 'Campo Grande', 'Campo Ram�n', 'Campo Viera', 'Candelaria', 'Capiov�', 'Caraguatay', 'Cdte. Guacurar�', 'Cerro Azul', 'Cerro Cor�', 'Col. Alberdi', 'Col. Aurora', 'Col. Delicia', 'Col. Polana', 'Col. Victoria', 'Col. Wanda', 'Concepci�n De La Sierra', 'Corpus', 'Dos Arroyos', 'Dos de Mayo', 'El Alc�zar', 'El Dorado', 'El Soberbio', 'Esperanza', 'F. Ameghino', 'Fachinal', 'Garuhap�', 'Garup�', 'Gdor. L�pez', 'Gdor. Roca', 'Gral. Alvear', 'Gral. Urquiza', 'Guaran�', 'H. Yrigoyen', 'Iguaz�', 'Itacaruar�', 'Jard�n Am�rica', 'Leandro N. Alem', 'Libertad', 'Loreto', 'Los Helechos', 'M�rtires', '15', 'Moj�n Grande', 'Montecarlo', 'Nueve de Julio', 'Ober�', 'Olegario V. Andrade', 'Panamb�', 'Posadas', 'Profundidad', 'Pto. Iguaz�', 'Pto. Leoni', 'Pto. Piray', 'Pto. Rico', 'Ruiz de Montoya', 'San Antonio', 'San Ignacio', 'San Javier', 'San Jos�', 'San Mart�n', 'San Pedro', 'San Vicente', 'Santiago De Liniers', 'Santo Pipo', 'Sta. Ana', 'Sta. Mar�a', 'Tres Capones', 'Veinticinco de Mayo', 'Wanda'],
	['Aguada San Roque', 'Alumin�', 'Andacollo', 'A�elo', 'Bajada del Agrio', 'Barrancas', 'Buta Ranquil', 'Capital', 'Caviahu�', 'Centenario', 'Chorriaca', 'Chos Malal', 'Cipolletti', 'Covunco Abajo', 'Coyuco Cochico', 'Cutral C�', 'El Cholar', 'El Huec�', 'El Sauce', 'Gua�acos', 'Huinganco', 'Las Coloradas', 'Las Lajas', 'Las Ovejas', 'Loncopu�', 'Los Catutos', 'Los Chihuidos', 'Los Miches', 'Manzano Amargo', '16', 'Octavio Pico', 'Paso Aguerre', 'Pic�n Leuf�', 'Piedra del Aguila', 'Pilo Lil', 'Plaza Huincul', 'Plottier', 'Quili Malal', 'Ram�n Castro', 'Rinc�n de Los Sauces', 'San Mart�n de Los Andes', 'San Patricio del Cha�ar', 'Santo Tom�s', 'Sauzal Bonito', 'Senillosa', 'Taquimil�n', 'Tricao Malal', 'Varvarco', 'Villa Cur� Leuvu', 'Villa del Nahueve', 'Villa del Puente Pic�n Leuv�', 'Villa El Choc�n', 'Villa La Angostura', 'Villa Pehuenia', 'Villa Traful', 'Vista Alegre', 'Zapala'],
	['Aguada Cecilio', 'Aguada de Guerra', 'All�n', 'Arroyo de La Ventana', 'Arroyo Los Berros', 'Bariloche', 'Calte. Cordero', 'Campo Grande', 'Catriel', 'Cerro Polic�a', 'Cervantes', 'Chelforo', 'Chimpay', 'Chinchinales', 'Chipauquil', 'Choele Choel', 'Cinco Saltos', 'Cipolletti', 'Clemente Onelli', 'Col�n Conhue', 'Comallo', 'Comic�', 'Cona Niyeu', 'Coronel Belisle', 'Cubanea', 'Darwin', 'Dina Huapi', 'El Bols�n', 'El Ca�n', 'El Manso', 'Gral. Conesa', 'Gral. Enrique Godoy', 'Gral. Fernandez Oro', 'Gral. Roca', 'Guardia Mitre', 'Ing. Huergo', 'Ing. Jacobacci', 'Laguna Blanca', 'Lamarque', 'Las Grutas', 'Los Menucos', 'Luis Beltr�n', 'Mainqu�', 'Mamuel Choique', 'Maquinchao', 'Mencu�', 'Mtro. Ramos Mexia', 'Nahuel Niyeu', 'Naupa Huen', '�orquinco', 'Ojos de Agua', 'Paso de Agua', 'Paso Flores', 'Pe�as Blancas', 'Pichi Mahuida', 'Pilcaniyeu', 'Pomona', 'Prahuaniyeu', 'Rinc�n Treneta', 'R�o Chico', 'R�o Colorado', 'Roca', 'San Antonio Oeste', 'San Javier', 'Sierra Colorada', 'Sierra Grande', 'Sierra Pailem�n', 'Valcheta', 'Valle Azul', 'Viedma', 'Villa Llanqu�n', 'Villa Mascardi', 'Villa Regina', 'Yaminu�'],
	['A. Saravia', 'Aguaray', 'Angastaco', 'Animan�', 'Cachi', 'Cafayate', 'Campo Quijano', 'Campo Santo', 'Capital', 'Cerrillos', 'Chicoana', 'Col. Sta. Rosa', 'Coronel Moldes', 'El Bordo', 'El Carril', 'El Galp�n', 'El Jard�n', 'El Potrero', 'El Quebrachal', 'El Tala', 'Embarcaci�n', 'Gral. Ballivian', 'Gral. G�emes', 'Gral. Mosconi', 'Gral. Pizarro', 'Guachipas', 'Hip�lito Yrigoyen', 'Iruy�', 'Isla De Ca�as', 'J. V. Gonzalez', 'La Caldera', 'La Candelaria', 'La Merced', 'La Poma', 'La Vi�a', 'Las Lajitas', 'Los Toldos', 'Met�n', 'Molinos', 'Nazareno', 'Or�n', 'Payogasta', 'Pichanal', 'Prof. S. Mazza', 'R�o Piedras', 'Rivadavia Banda Norte', 'Rivadavia Banda Sur', 'Rosario de La Frontera', 'Rosario de Lerma', 'Saclant�s', '18', 'San Antonio', 'San Carlos', 'San Jos� De Met�n', 'San Ram�n', 'Santa Victoria E.', 'Santa Victoria O.', 'Tartagal', 'Tolar Grande', 'Urundel', 'Vaqueros', 'Villa San Lorenzo'],
	['Albard�n', 'Angaco', 'Calingasta', 'Capital', 'Caucete', 'Chimbas', 'Iglesia', 'Jachal', 'Nueve de Julio', 'Pocito', 'Rawson', 'Rivadavia', '19', 'San Mart�n', 'Santa Luc�a', 'Sarmiento', 'Ullum', 'Valle F�rtil', 'Veinticinco de Mayo', 'Zonda'],
	['Alto Pelado', 'Alto Pencoso', 'Anchorena', 'Arizona', 'Bagual', 'Balde', 'Batavia', 'Beazley', 'Buena Esperanza', 'Candelaria', 'Capital', 'Carolina', 'Carpinter�a', 'Concar�n', 'Cortaderas', 'El Morro', 'El Trapiche', 'El Volc�n', 'Fort�n El Patria', 'Fortuna', 'Fraga', 'Juan Jorba', 'Juan Llerena', 'Juana Koslay', 'Justo Daract', 'La Calera', 'La Florida', 'La Punilla', 'La Toma', 'Lafinur', 'Las Aguadas', 'Las Chacras', 'Las Lagunas', 'Las Vertientes', 'Lavaisse', 'Leandro N. Alem', 'Los Molles', 'Luj�n', 'Mercedes', 'Merlo', 'Naschel', 'Navia', 'Nogol�', 'Nueva Galia', 'Papagayos', 'Paso Grande', 'Potrero de Los Funes', 'Quines', 'Renca', 'Saladillo', 'San Francisco', 'San Ger�nimo', 'San Mart�n', 'San Pablo', 'Santa Rosa de Conlara', 'Talita', 'Tilisarao', 'Uni�n', 'Villa de La Quebrada', 'Villa de Praga', 'Villa del Carmen', 'Villa Gral. Roca', 'Villa Larca', 'Villa Mercedes', 'Zanjitas'],
	['Calafate', 'Caleta Olivia', 'Ca�ad�n Seco', 'Comandante Piedrabuena', 'El Calafate', 'El Chalt�n', 'Gdor. Gregores', 'Hip�lito Yrigoyen', 'Jaramillo', 'Koluel Kaike', 'Las Heras', 'Los Antiguos', 'Perito Moreno', 'Pico Truncado', 'Pto. Deseado', 'Pto. San Juli�n', 'Pto. 21', 'R�o Cuarto', 'R�o Gallegos', 'R�o Turbio', 'Tres Lagos', 'Veintiocho De Noviembre'],
	['Aar�n Castellanos', 'Acebal', 'Aguar� Grande', 'Albarellos', 'Alcorta', 'Aldao', 'Alejandra', '�lvarez', 'Ambrosetti', 'Amen�bar', 'Ang�lica', 'Angeloni', 'Arequito', 'Arminda', 'Armstrong', 'Arocena', 'Arroyo Aguiar', 'Arroyo Ceibal', 'Arroyo Leyes', 'Arroyo Seco', 'Arruf�', 'Arteaga','Ataliva', 'Aurelia', 'Avellaneda', 'Barrancas', 'Bauer Y Sigel', 'Bella Italia', 'Berabev�', 'Berna', 'Bernardo de Irigoyen', 'Bigand', 'Bombal', 'Bouquet', 'Bustinza', 'Cabal', 'Cacique Ariacaiquin', 'Cafferata', 'Calchaqu�', 'Campo Andino', 'Campo Piaggio', 'Ca�ada de G�mez', 'Ca�ada del Ucle', 'Ca�ada Rica', 'Ca�ada Rosqu�n', 'Candioti', 'Capital', 'Capit�n Berm�dez', 'Capivara', 'Carcara��', 'Carlos Pellegrini', 'Carmen', 'Carmen Del Sauce', 'Carreras', 'Carrizales', 'Casalegno', 'Casas', 'Casilda', 'Castelar', 'Castellanos', 'Cayast�', 'Cayastacito', 'Centeno', 'Cepeda', 'Ceres', 'Chab�s', 'Cha�ar Ladeado', 'Chapuy', 'Chovet', 'Christophersen', 'Classon', 'Cnel. Arnold', 'Cnel. Bogado', 'Cnel. Dominguez', 'Cnel. Fraga', 'Col. Aldao', 'Col. Ana', 'Col. Belgrano', 'Col. Bicha', 'Col. Bigand', 'Col. Bossi', 'Col. Cavour', 'Col. Cello', 'Col. Dolores', 'Col. Dos Rosas', 'Col. Dur�n', 'Col. Iturraspe', 'Col. Margarita', 'Col. Mascias', 'Col. Raquel', 'Col. Rosa', 'Col. San Jos�', 'Constanza', 'Coronda', 'Correa', 'Crispi', 'Culul�', 'Curupayti', 'Desvio Arij�n', 'Diaz', 'Diego de Alvear', 'Egusquiza', 'El Araz�', 'El Rab�n', 'El Sombrerito', 'El Tr�bol', 'Elisa', 'Elortondo', 'Emilia', 'Empalme San Carlos', 'Empalme Villa Constitucion', 'Esmeralda', 'Esperanza', 'Estaci�n Alvear', 'Estacion Clucellas', 'Esteban Rams', 'Esther', 'Esustolia', 'Eusebia', 'Felicia', 'Fidela', 'Fighiera', 'Firmat', 'Florencia', 'Fort�n Olmos', 'Franck', 'Fray Luis Beltr�n', 'Frontera', 'Fuentes', 'Funes', 'Gaboto', 'Galisteo', 'G�lvez', 'Garabalto', 'Garibaldi', 'Gato Colorado', 'Gdor. Crespo', 'Gessler', 'Godoy', 'Golondrina', 'Gral. Gelly', 'Gral. Lagos', 'Granadero Baigorria', 'Gregoria Perez De Denis', 'Grutly', 'Guadalupe N.', 'G�deken', 'Helvecia', 'Hersilia', 'Hipat�a', 'Huanqueros', 'Hugentobler', 'Hughes', 'Humberto 1�', 'Humboldt', 'Ibarlucea', 'Ing. Chanourdie', 'Intiyaco', 'Ituzaing�', 'Jacinto L. Ar�uz', 'Josefina', 'Juan B. Molina', 'Juan de Garay', 'Juncal', 'La Brava', 'La Cabral', 'La Camila', 'La Chispa', 'La Clara', 'La Criolla', 'La Gallareta', 'La Lucila', 'La Pelada', 'La Penca', 'La Rubia', 'La Sarita', 'La Vanguardia', 'Labordeboy', 'Laguna Paiva', 'Landeta', 'Lanteri', 'Larrechea', 'Las Avispas', 'Las Bandurrias', 'Las Garzas', 'Las Palmeras', 'Las Parejas', 'Las Petacas', 'Las Rosas', 'Las Toscas', 'Las Tunas', 'Lazzarino', 'Lehmann', 'Llambi Campbell', 'Logro�o', 'Loma Alta', 'L�pez', 'Los Amores', 'Los Cardos', 'Los Laureles', 'Los Molinos', 'Los Quirquinchos', 'Lucio V. Lopez', 'Luis Palacios', 'Ma. Juana', 'Ma. Luisa', 'Ma. Susana', 'Ma. Teresa', 'Maciel', 'Maggiolo', 'Malabrigo', 'Marcelino Escalada', 'Margarita', 'Matilde', 'Mau�', 'M�ximo Paz', 'Melincu�', 'Miguel Torres', 'Mois�s Ville', 'Monigotes', 'Monje', 'Monte Obscuridad', 'Monte Vera', 'Montefiore', 'Montes de Oca', 'Murphy', '�anducita', 'Nar�', 'Nelson', 'Nicanor E. Molinas', 'Nuevo Torino', 'Oliveros', 'Palacios', 'Pav�n', 'Pav�n Arriba', 'Pedro G�mez Cello', 'P�rez', 'Peyrano', 'Piamonte', 'Pilar', 'Pi�ero', 'Plaza Clucellas', 'Portugalete', 'Pozo Borrado', 'Progreso', 'Providencia', 'Pte. Roca', 'Pueblo Andino', 'Pueblo Esther', 'Pueblo Gral. San Mart�n', 'Pueblo Irigoyen', 'Pueblo Marini', 'Pueblo Mu�oz', 'Pueblo Uranga', 'Pujato', 'Pujato N.', 'Rafaela', 'Ramay�n', 'Ramona', 'Reconquista', 'Recreo', 'Ricardone', 'Rivadavia', 'Rold�n', 'Romang', 'Rosario', 'Rueda', 'Rufino', 'Sa Pereira', 'Saguier', 'Saladero M. Cabal', 'Salto Grande', 'San Agust�n', 'San Antonio de Obligado', 'San Bernardo (N.J.)', 'San Bernardo (S.J.)', 'San Carlos Centro', 'San Carlos N.', 'San Carlos S.', 'San Crist�bal', 'San Eduardo', 'San Eugenio', 'San Fabi�n', 'San Fco. de Santa F�', 'San Genaro', 'San Genaro N.', 'San Gregorio', 'San Guillermo', 'San Javier', 'San Jer�nimo del Sauce', 'San Jer�nimo N.', 'San Jer�nimo S.', 'San Jorge', 'San Jos� de La Esquina', 'San Jos� del Rinc�n', 'San Justo', 'San Lorenzo', 'San Mariano', 'San Mart�n de Las Escobas', 'San Mart�n N.', 'San Vicente', 'Sancti Spititu', 'Sanford', 'Santo Domingo', 'Santo Tom�', 'Santurce', 'Sargento Cabral', 'Sarmiento', 'Sastre', 'Sauce Viejo', 'Serodino', 'Silva', 'Soldini', 'Soledad', 'Soutomayor', 'Sta. Clara de Buena Vista', 'Sta. Clara de Saguier', 'Sta. Isabel', 'Sta. Margarita', 'Sta. Maria Centro', 'Sta. Mar�a N.', 'Sta. Rosa', 'Sta. Teresa', 'Suardi', 'Sunchales', 'Susana', 'Tacuarend�', 'Tacural', 'Tartagal', 'Teodelina', 'Theobald', 'Timb�es', 'Toba', 'Tortugas', 'Tostado', 'Totoras', 'Traill', 'Venado Tuerto', 'Vera', 'Vera y Pintado', 'Videla', 'Vila', 'Villa Amelia', 'Villa Ana', 'Villa Ca�as', 'Villa Constituci�n', 'Villa Elo�sa', 'Villa Gdor. G�lvez', 'Villa Guillermina', 'Villa Minetti', 'Villa Mugueta', 'Villa Ocampo', 'Villa San Jos�', 'Villa Saralegui', 'Villa Trinidad', 'Villada', 'Virginia', 'Wheelwright', 'Zavalla', 'Zen�n Pereira'],
	['A�atuya', '�rraga', 'Bandera', 'Bandera Bajada', 'Beltr�n', 'Brea Pozo', 'Campo Gallo', 'Capital', 'Chilca Juliana', 'Choya', 'Clodomira', 'Col. Alpina', 'Col. Dora', 'Col. El Simbolar Robles', 'El Bobadal', 'El Charco', 'El Moj�n', 'Estaci�n Atamisqui', 'Estaci�n Simbolar', 'Fern�ndez', 'Fort�n Inca', 'Fr�as', 'Garza', 'Gramilla', 'Guardia Escolta', 'Herrera', 'Ica�o', 'Ing. Forres', 'La Banda', 'La Ca�ada', 'Laprida', 'Lavalle', 'Loreto', 'Los Jur�es', 'Los N��ez', 'Los Pirpintos', 'Los Quiroga', 'Los Telares', 'Lugones', 'Malbr�n', 'Matara', 'Medell�n', 'Monte Quemado', 'Nueva Esperanza', 'Nueva Francia', 'Palo Negro', 'Pampa de Los Guanacos', 'Pinto', 'Pozo Hondo', 'Quimil�', 'Real Sayana', 'Sachayoj', 'San Pedro de Guasay�n', 'Selva', 'Sol de Julio', 'Sumampa', 'Suncho Corral', 'Taboada', 'Tapso', 'Termas de Rio Hondo', 'Tintina', 'Tomas Young', 'Vilelas', 'Villa Atamisqui', 'Villa La Punta', 'Villa Ojo de Agua', 'Villa R�o Hondo', 'Villa Salavina', 'Villa Uni�n', 'Vilmer', 'Weisburd'],
	['R�o Grande', 'Tolhuin', 'Ushuaia'],
	['Acheral', 'Agua Dulce', 'Aguilares', 'Alderetes', 'Alpachiri', 'Alto Verde', 'Amaicha del Valle', 'Amberes', 'Ancajuli', 'Arcadia', 'Atahona', 'Banda del R�o Sali', 'Bella Vista', 'Buena Vista', 'Burruyac�', 'Capit�n C�ceres', 'Cevil Redondo', 'Choromoro', 'Ciudacita', 'Colalao del Valle', 'Colombres', 'Concepci�n', 'Delf�n Gallo', 'El Bracho', 'El Cadillal', 'El Cercado', 'El Cha�ar', 'El Manantial', 'El Moj�n', 'El Mollar', 'El Naranjito', 'El Naranjo', 'El Polear', 'El Puestito', 'El Sacrificio', 'El Timb�', 'Escaba', 'Esquina', 'Estaci�n Ar�oz', 'Famaill�', 'Gastone', 'Gdor. Garmendia', 'Gdor. Piedrabuena', 'Graneros', 'Huasa Pampa', 'J B Alberdi', 'La Cocha', 'La Esperanza', 'La Florida', 'La Ramada', 'La Trinidad', 'Lamadrid', 'Las Cejas', 'Las Talas', 'Las Talitas', 'Los Bulacio', 'Los G�mez', 'Los Nogales', 'Los Pereyra', 'Los P�rez', 'Los Puestos', 'Los Ralos', 'Los Sarmientos', 'Los Sosa', 'Lules', 'M. Garc�a Fern�ndez', 'Manuela Pedraza', 'Medinas', 'Monte Bello', 'Monteagudo', 'Monteros', 'Padre Monti', 'Pampa Mayo', 'Quilmes', 'Raco', 'Ranchillos', 'R�o Chico', 'R�o Colorado', 'R�o Seco', 'Rumi Punco', 'San Andr�s', 'San Felipe', 'San Ignacio', 'San Javier', 'San Jos�', 'San Miguel de 25', 'San Pedro', 'San Pedro de Colalao', 'Santa Rosa de Leales', 'Sgto. Moya', 'Siete de Abril', 'Simoca', 'Soldado Maldonado', 'Sta. Ana', 'Sta. Cruz', 'Sta. Luc�a', 'Taco Ralo', 'Taf� del Valle', 'Taf� Viejo', 'Tapia', 'Teniente Berdina', 'Trancas', 'Villa Belgrano', 'Villa Benjam�n Araoz', 'Villa Chiligasta', 'Villa de Leales', 'Villa Quinteros', 'Y�nima', 'Yerba Buena', 'Yerba Buena (S)']
	];
	function onProvinciaChange(seleccion) {
		let localidades;
		let opciones = '';
		if (seleccion.value == 'Buenos Aires') localidades = ciudades[0]; 
		if (seleccion.value == 'Buenos Aires-GBA') localidades = ciudades[1]; 
		if (seleccion.value == 'Capital Federal') localidades = ciudades[2];
		if (seleccion.value == 'Catamarca') localidades = ciudades[3]; 
		if (seleccion.value == 'Chaco') localidades = ciudades[4]; 
		if (seleccion.value == 'Chubut') localidades = ciudades[5]; 
		if (seleccion.value == 'C�rdoba') localidades = ciudades[6]; 
		if (seleccion.value == 'Corrientes') localidades = ciudades[7]; 
		if (seleccion.value == 'Entre R�os') localidades = ciudades[8]; 
		if (seleccion.value == 'Formosa') localidades = ciudades[9]; 
		if (seleccion.value == 'Jujuy') localidades = ciudades[10]; 
		if (seleccion.value == 'La Pampa') localidades = ciudades[11]; 
		if (seleccion.value == 'La Rioja') localidades = ciudades[12]; 
		if (seleccion.value == 'Mendoza') localidades = ciudades[13]; 
		if (seleccion.value == 'Misiones') localidades = ciudades[14]; 
		if (seleccion.value == 'Neuqu�n') localidades = ciudades[15]; 
		if (seleccion.value == 'R�o Negro') localidades = ciudades[16]; 
		if (seleccion.value == 'Salta') localidades = ciudades[17]; 
		if (seleccion.value == 'San Juan') localidades = ciudades[18]; 
		if (seleccion.value == 'San Luis') localidades = ciudades[19]; 
		if (seleccion.value == 'Santa Cruz') localidades = ciudades[20]; 
		if (seleccion.value == 'Santa Fe') localidades = ciudades[21]; 
		if (seleccion.value == 'Santiago del Estero') localidades = ciudades[22]; 
		if (seleccion.value == 'Tierra del Fuego') localidades = ciudades[23]; 
		if (seleccion.value == 'Tucum�n') localidades = ciudades[24];
	localidades.forEach(function(ciudad) {
		opciones = opciones + '<option>' + ciudad + '</option>';
	});
	document.getElementById('ddLocalidad').innerHTML = opciones;
}

</script>
<title>Editar Clientes</title>
</head>
<body>


<style>
.Formulario{
width: 400px;
background:#24303c;
padding: 30px;
margin: auto;
margin-top: 100px;
border-radius: 4px;
font-family: 'calibri';
color: white;
}
.Formulario h4{
font-size:22px;
margin-bottom:20px;

}


.controls{
width:100%;
background: #24303c;
padding:10px;
border-radius: 4px;
margin-bottom: 16px;
border: 1px solid #1f53c5;
font-size: 18px;
}
.Formulario .botons{
width: 100%;
background: #1f53c5;
border:none;
padding:12px;
color:white;
margin: 16px 0;
font-size: 16px;
animation: shadow-pulse 1000ms 1;
background-color:#434343;
}
body{
background:black;
}
</style>
<jsp:include page="MenuAdmin.jsp"></jsp:include>
<form action="ActualizarCliente.html" method="post">
<div class="Formulario">
  <c:forEach var="cliente" items="${ ListaClientes }"  >
<h1 align="center">Bienvenido Admin</h1>
<h4 align="center">Editar Cliente</h4>
	<p align="center">Nombre: <input class="controls" type="text" name="nombre" value="${cliente.nombre}" required onkeypress="return (event.charCode ==32 || (event.charCode >= 97 && event.charCode <= 122) || (event.charCode >= 65 && event.charCode <= 90))"></p>
    <p align="center">Apellido: <input class="controls" type="text" name="apellido" value="${cliente.apellido}" required onkeypress="return (event.charCode ==32 || (event.charCode >= 97 && event.charCode <= 122) || (event.charCode >= 65 && event.charCode <= 90))"></p>
    <p align="center"> Sexo:</p> 
    <p align="center" class="controls">
    <input type="radio" name="Sexo" value="Hombre" ${cliente.sexo.genero == "Hombre" ? "checked" : ""}> Hombre
    <input type="radio" name="Sexo" value="Mujer" ${cliente.sexo.genero == "Mujer" ? "checked" : ""}> Mujer
  		</p>
 	 <p align="center">Dni: <input class="controls" type="text" name="dni" value="${cliente.dni}" readonly="readonly"></p>
     <p align="center">A�o de nacimiento:<input class="controls"name="date" type="date" value="${cliente.nacimiento}">
       <p>Provincia:
      <select class="controls" name='nacionalidad'>
     <option selected="selected">${cliente.nacionalidad.nacionalidad} </option>
          <option>afgano/a</option>
<option>alem�n/a</option>
<option>�rabe</option>
<option>argentino/a</option>
<option>australiano/a</option>
<option>belga</option>
<option>boliviano/a</option>
<option>brasile�o/a</option>
<option>camboyano/a</option>
<option>canadiense</option>
<option>chileno/a</option>	
<option>chino/a</option>
<option>colombiano/a</option>
<option>coreano/a</option>
<option>cubano/a</option>
<option>dan�s/a</option>
<option>ecuatoriano/a</option>
<option>egipcio/a</option>
<option>salvadore�o/a</option>
<option>escoc�s/a</option>
<option>espa�ol/a</option>
<option>estadounidense</option>
<option>estonio/a</option>
<option>etiope</option>
<option>filipino/a</option>
<option>finland�s/a</option>
<option>franc�s/a</option>
<option>gal�s/a</option>
<option>griego/a</option>
<option>guatemalteco/a</option>
<option>haitiano/a</option>
<option>holand�s/a</option>
<option>hondure�o/a</option>
<option>indon�s/a</option>
<option>ingl�s/a</option>
<option>iraqu�</option>
<option>iran�</option>
<option>irland�s/a</option>
<option>israel�</option>
<option>italiano/a</option>
<option>japon�s/a</option>
<option>jordano/a</option>
<option>laosiano/a</option>
<option>let�n/a</option>
<option>leton�s/a</option>
<option>malayo/a</option>
<option>marroqu�</option>
<option>mexicano/a</option>
<option>noruego/a</option>
<option>neozeland�s/a</option>
<option>paname�o/a</option>
<option>paraguayo/a</option>
<option>peruano/a</option>
<option>polaco/a</option>
<option>portugu�s/a</option>
<option>puertorrique�o</option>
<option>dominicano/a</option>
<option>rumano/a</option>
<option>ruso/a</option>
<option>sueco/a</option>
<option>suizo/a</option>
<option>tailand�s/a</option>
<option>taiwanes/a</option>
<option>ucraniano/a</option>
<option>uruguayo/a</option>
<option>venezolano/a</option>
<option>vietnamita</option>
       </select> </p>
        <p>Provincia:
        <select class="controls" name='Provincia' onchange="onProvinciaChange(this)">
         	<option selected="selected">${cliente.provincia.nombre} </option>
        	<option>Buenos Aires</option>
	        <option>Buenos Aires-GBA</option>
	        <option>Capital Federal</option>
	        <option>Catamarca</option>
	        <option>Chaco</option>
	        <option>Chubut</option>
	        <option>C�rdoba</option>
	        <option>Corrientes</option>
	        <option>Entre R�os</option>
	        <option>Formosa</option>
	        <option>Jujuy</option>
	        <option>La Pampa</option>
	        <option>La Rioja</option>
	        <option>Mendoza</option>
	        <option>Misiones</option>
	        <option>Neuqu�n</option>
	        <option>R�o Negro</option>
	        <option>Salta</option>
	        <option>San Juan</option>
	        <option>San Luis</option>
	        <option>Santa Cruz</option>
	        <option>Santa Fe</option>
	        <option>Santiago del Estero</option>
	        <option>Tierra del Fuego</option>
	        <option>Tucum�n</option>
         </select> </p>      
      <p>Localidad:
      <select id="ddLocalidad" class="controls" name='Localidad'>
         <option selected="selected">${cliente.localidad.nombre} </option>        
      </select> </p>
        <p align="center">Usuario: <input class="controls" type="text" name="usuario" value="${cliente.usuario.usuario}" readonly="readonly"></p>
         <p align="center">Usuario: <input class="controls" type="password" name="contrase�a" value="${cliente.usuario.contrase�a}" readonly="readonly"></p>
	  <input class="botons"type="submit" value="Aceptar">
	</div>
	</c:forEach>

</form>
</body>
</html>
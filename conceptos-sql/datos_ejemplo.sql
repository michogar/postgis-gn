--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: curso; Type: SCHEMA; Schema: -; Owner: alumno
--

CREATE SCHEMA curso;


ALTER SCHEMA curso OWNER TO alumno;

SET search_path = curso, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: barrio; Type: TABLE; Schema: curso; Owner: alumno; Tablespace: 
--

CREATE TABLE barrio (
    id integer NOT NULL,
    sector character varying(80),
    codigo character varying(80),
    nom_barrio character varying(80),
    numero character varying(80),
    municipio integer,
    area character varying,
    pob_bo character varying,
    zona integer
);


ALTER TABLE curso.barrio OWNER TO alumno;

--
-- Name: barrios_gid_seq; Type: SEQUENCE; Schema: curso; Owner: alumno
--

CREATE SEQUENCE barrios_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE curso.barrios_gid_seq OWNER TO alumno;

--
-- Name: barrios_gid_seq; Type: SEQUENCE OWNED BY; Schema: curso; Owner: alumno
--

ALTER SEQUENCE barrios_gid_seq OWNED BY barrio.id;


--
-- Name: departamento; Type: TABLE; Schema: curso; Owner: alumno; Tablespace: 
--

CREATE TABLE departamento (
    id integer NOT NULL,
    name character varying(75),
    varname character varying(150)
);


ALTER TABLE curso.departamento OWNER TO alumno;

--
-- Name: departamentos_gid_seq; Type: SEQUENCE; Schema: curso; Owner: alumno
--

CREATE SEQUENCE departamentos_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE curso.departamentos_gid_seq OWNER TO alumno;

--
-- Name: departamentos_gid_seq; Type: SEQUENCE OWNED BY; Schema: curso; Owner: alumno
--

ALTER SEQUENCE departamentos_gid_seq OWNED BY departamento.id;


--
-- Name: equipo; Type: TABLE; Schema: curso; Owner: alumno; Tablespace: 
--

CREATE TABLE equipo (
    nombre character varying NOT NULL
);


ALTER TABLE curso.equipo OWNER TO alumno;

--
-- Name: municipio; Type: TABLE; Schema: curso; Owner: alumno; Tablespace: 
--

CREATE TABLE municipio (
    id integer NOT NULL,
    estado character varying(75),
    codigo_d integer,
    codigo_m integer,
    municipio character varying(75),
    perimetro double precision,
    superficie double precision,
    poblacion double precision,
    departamento integer
);


ALTER TABLE curso.municipio OWNER TO alumno;

--
-- Name: municipios_gid_seq; Type: SEQUENCE; Schema: curso; Owner: alumno
--

CREATE SEQUENCE municipios_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE curso.municipios_gid_seq OWNER TO alumno;

--
-- Name: municipios_gid_seq; Type: SEQUENCE OWNED BY; Schema: curso; Owner: alumno
--

ALTER SEQUENCE municipios_gid_seq OWNED BY municipio.id;


--
-- Name: responsable; Type: TABLE; Schema: curso; Owner: alumno; Tablespace: 
--

CREATE TABLE responsable (
    numero_sanitario character varying(10) NOT NULL,
    nombre character varying(50),
    apellidos character varying(50),
    equipo character varying NOT NULL
);


ALTER TABLE curso.responsable OWNER TO alumno;

--
-- Name: trabajador; Type: TABLE; Schema: curso; Owner: alumno; Tablespace: 
--

CREATE TABLE trabajador (
    numero_sanitario character varying(10) NOT NULL,
    nombre character varying(50),
    apellidos character varying(50),
    equipo character varying NOT NULL
);


ALTER TABLE curso.trabajador OWNER TO alumno;

--
-- Name: zona; Type: TABLE; Schema: curso; Owner: alumno; Tablespace: 
--

CREATE TABLE zona (
    id integer NOT NULL,
    codigo integer
);


ALTER TABLE curso.zona OWNER TO alumno;

--
-- Name: zona_equipo; Type: TABLE; Schema: curso; Owner: alumno; Tablespace: 
--

CREATE TABLE zona_equipo (
    id_zona integer NOT NULL,
    id_equipo character varying NOT NULL
);


ALTER TABLE curso.zona_equipo OWNER TO alumno;

--
-- Name: zona_id_seq; Type: SEQUENCE; Schema: curso; Owner: alumno
--

CREATE SEQUENCE zona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE curso.zona_id_seq OWNER TO alumno;

--
-- Name: zona_id_seq; Type: SEQUENCE OWNED BY; Schema: curso; Owner: alumno
--

ALTER SEQUENCE zona_id_seq OWNED BY zona.id;


--
-- Name: id; Type: DEFAULT; Schema: curso; Owner: alumno
--

ALTER TABLE ONLY barrio ALTER COLUMN id SET DEFAULT nextval('barrios_gid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: curso; Owner: alumno
--

ALTER TABLE ONLY departamento ALTER COLUMN id SET DEFAULT nextval('departamentos_gid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: curso; Owner: alumno
--

ALTER TABLE ONLY municipio ALTER COLUMN id SET DEFAULT nextval('municipios_gid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: curso; Owner: alumno
--

ALTER TABLE ONLY zona ALTER COLUMN id SET DEFAULT nextval('zona_id_seq'::regclass);


--
-- Data for Name: barrio; Type: TABLE DATA; Schema: curso; Owner: alumno
--

INSERT INTO barrio VALUES (500, NULL, '22', 'BARRIO EL CANTON', NULL, 157, '476651,000000000000000', '0,000000000000000', NULL);
INSERT INTO barrio VALUES (501, NULL, '16', 'BARRIO EL ZARZAL', NULL, 157, '1141721,000000000000000', '790,000000000000000', NULL);
INSERT INTO barrio VALUES (502, NULL, '2', 'BARRIO EL CARMELO', NULL, 157, '408991,000000000000000', '229,000000000000000', NULL);
INSERT INTO barrio VALUES (503, NULL, '13', 'BARRIO ARRIBA', NULL, 157, '172341,000000000000000', '336,000000000000000', NULL);
INSERT INTO barrio VALUES (504, NULL, '1', 'BARRIO EL CENTRO', NULL, 157, '50991,000000000000000', '282,000000000000000', NULL);
INSERT INTO barrio VALUES (505, NULL, '12', 'BARRIO ABAJO', NULL, 157, '62273,000000000000000', '204,000000000000000', NULL);
INSERT INTO barrio VALUES (506, NULL, '19', 'BARRIO SUNTECO', NULL, 157, '227798,000000000000000', '22,000000000000000', NULL);
INSERT INTO barrio VALUES (507, NULL, '14', 'COL EL BANCO', NULL, 157, '277241,000000000000000', '144,000000000000000', NULL);
INSERT INTO barrio VALUES (508, NULL, '20', 'BARRIO EL TABLON ABA', NULL, 157, '548676,000000000000000', '203,000000000000000', NULL);
INSERT INTO barrio VALUES (509, NULL, '21', 'BARRIO EL TABLON ARR', NULL, 157, '792669,000000000000000', '578,000000000000000', NULL);
INSERT INTO barrio VALUES (510, NULL, '17', 'COL GRACIAS A DIOS', NULL, 157, '67006,000000000000000', '247,000000000000000', NULL);
INSERT INTO barrio VALUES (511, NULL, '18', 'BARRIO LA ESCONDIDA', NULL, 157, '265806,000000000000000', '0,000000000000000', NULL);
INSERT INTO barrio VALUES (512, NULL, '7', 'BARRIO MIRAVALLE', NULL, 157, '391253,000000000000000', '293,000000000000000', NULL);
INSERT INTO barrio VALUES (513, NULL, '3', 'BARRIO LA CIMBRA', NULL, 157, '1436893,000000000000000', '498,000000000000000', NULL);
INSERT INTO barrio VALUES (514, NULL, '9', 'BARRIO LA POZONA', NULL, 157, '172229,000000000000000', '0,000000000000000', NULL);
INSERT INTO barrio VALUES (515, NULL, '4', 'BARRIO LA ESPERANZA', NULL, 157, '292647,000000000000000', '620,000000000000000', NULL);
INSERT INTO barrio VALUES (516, NULL, '5', 'BARRIO LA LEONA', NULL, 157, '292647,000000000000000', '54,000000000000000', NULL);
INSERT INTO barrio VALUES (517, NULL, '8', 'BARRIO EL MOLINO', NULL, 157, '512000,000000000000000', '261,000000000000000', NULL);
INSERT INTO barrio VALUES (518, NULL, '10', 'BARRIO LA QUINTA', NULL, 157, '737846,000000000000000', '72,000000000000000', NULL);
INSERT INTO barrio VALUES (519, NULL, '6', 'BARRIO AGUA DULCE', NULL, 157, '45213,000000000000000', '36,000000000000000', NULL);
INSERT INTO barrio VALUES (520, NULL, '11', 'BARRIO LOS LIRIOS ZO', NULL, 157, '182724,000000000000000', '230,000000000000000', NULL);
INSERT INTO barrio VALUES (521, NULL, '15', 'BARRIO EL PORVENIR', NULL, 157, '321569,000000000000000', '300,000000000000000', NULL);
INSERT INTO barrio VALUES (1, '5', '5-041', 'Tr. Maderas Noriega-SatÂ‚lite', '1088.00000000', 27, NULL, NULL, 1);
INSERT INTO barrio VALUES (6, '8', '8-047', 'Las Tunas', '1222.00000000', 27, NULL, NULL, 1);
INSERT INTO barrio VALUES (14, '8', '8-048', 'Carmelina', '1223.00000000', 27, NULL, NULL, 2);
INSERT INTO barrio VALUES (23, '8', '8-033', '4 de Febrero', '1208.00000000', 27, NULL, NULL, 3);
INSERT INTO barrio VALUES (34, '8', '8-022', 'El Cacao No.2', '1197.00000000', 27, NULL, NULL, 3);
INSERT INTO barrio VALUES (42, '8', '8-073', 'Hda. Jorge PeÂ¤a y Colindantes', '1242.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (56, '8', '8-075', 'Azucarera (InvasiÂ¢n)', '1244.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (71, '8', '8-059', 'Tr. El Palmar-BÂ scula', '1233.00000000', 27, NULL, NULL, 5);
INSERT INTO barrio VALUES (87, '7', '7-026', 'Morales No. 1', '1157.00000000', 27, NULL, NULL, 6);
INSERT INTO barrio VALUES (103, '7', '7-024', 'Los Angeles', '1155.00000000', 27, NULL, NULL, 8);
INSERT INTO barrio VALUES (111, '3', '3-032', 'Tr. La Puerta-La Cumbre', '999.000000000', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (126, '1', '1-043', 'Juan Lindo', '896.000000000', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (140, '3', '3-023', 'Prado Alto', '991.000000000', 27, NULL, NULL, 10);
INSERT INTO barrio VALUES (149, '1', '1-035', 'OrquÂ¡dea Blanca', '888.000000000', 27, NULL, NULL, 10);
INSERT INTO barrio VALUES (218, '1', '1-075', 'Santa MÂ¢nica', '1335.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (290, '1', '1-054', 'Nova', '906.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (372, '5', '5-062', 'Induna', '0E-11', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (2, '4', '4-047', 'Los Angeles', '1351.00000000', 27, NULL, NULL, 1);
INSERT INTO barrio VALUES (3, '8', '8-024', 'Tr. Calanares-Cacao No. 1', '1199.00000000', 27, NULL, NULL, 1);
INSERT INTO barrio VALUES (4, '8', '8-044', 'La Sierra', '1219.00000000', 27, NULL, NULL, 1);
INSERT INTO barrio VALUES (5, '8', '8-066', 'Tr. PalÂ½n-Puente Naco', '1238.00000000', 27, NULL, NULL, 1);
INSERT INTO barrio VALUES (53, '8', '8-004', 'El CÂ¢rbano', '1180.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (57, '8', '8-011', 'San Lorenzo', '1187.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (58, '8', '8-068', 'Tr. La Flecha-24 de Abril', '1240.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (59, '8', '8-008', 'San Jorge (Cofradia)', '1184.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (60, '8', '8-009', 'San Jorge (Asentamiento)', '1185.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (74, '7', '7-035', 'Lempira No. 3', '1166.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (75, '8', '8-001', 'El Palmar', '1177.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (76, '8', '8-003', 'La Fortaleza', '1179.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (89, '7', '7-036', 'Padilla', '1167.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (90, '7', '7-020', '14 de Julio', '1151.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (92, '7', '7-051', 'Chamelecon II', '1412.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (93, '7', '7-041', 'Tr. Col. EspaÂ¤a-ChamelecÂ¢n II', '1407.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (94, '7', '7-053', 'Tr. Lot. San Juan-14 de Julio', '1414.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (95, '7', '7-054', 'Angel Fajardo', '1415.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (96, '7', '7-034', 'Lempira No. 2', '1165.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (108, '1', '1-021', 'Mazzarello', '874.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (7, '8', '8-049', 'Santa Rita', '1224.00000000', 27, NULL, NULL, 1);
INSERT INTO barrio VALUES (8, '8', '8-045', 'Las Flores', '1220.00000000', 27, NULL, NULL, 2);
INSERT INTO barrio VALUES (9, '8', '8-046', 'El Centro de Naco', '1221.00000000', 27, NULL, NULL, 2);
INSERT INTO barrio VALUES (10, '8', '8-050', 'Las Vegas', '1225.00000000', 27, NULL, NULL, 2);
INSERT INTO barrio VALUES (11, '8', '8-029', 'San Manuel', '1204.00000000', 27, NULL, NULL, 2);
INSERT INTO barrio VALUES (12, '8', '8-018', 'Paz Rivera', '1193.00000000', 27, NULL, NULL, 2);
INSERT INTO barrio VALUES (13, '8', '8-051', 'Santa LucÂ­a', '1226.00000000', 27, NULL, NULL, 2);
INSERT INTO barrio VALUES (15, '8', '8-028', 'La Hoya', '1203.00000000', 27, NULL, NULL, 2);
INSERT INTO barrio VALUES (16, '8', '8-039', 'San Bartolo', '1214.00000000', 27, NULL, NULL, 2);
INSERT INTO barrio VALUES (17, '8', '8-035', 'San Isidro', '1210.00000000', 27, NULL, NULL, 2);
INSERT INTO barrio VALUES (18, '8', '8-064', 'Tr. Gracias a Dios-Villa Vida Nueva', '1236.00000000', 27, NULL, NULL, 2);
INSERT INTO barrio VALUES (19, '8', '8-041', 'Rivera Fajardo', '1216.00000000', 27, NULL, NULL, 2);
INSERT INTO barrio VALUES (20, '8', '8-037', 'Los Angeles', '1212.00000000', 27, NULL, NULL, 2);
INSERT INTO barrio VALUES (21, '8', '8-040', 'Ojo de Agua', '1215.00000000', 27, NULL, NULL, 3);
INSERT INTO barrio VALUES (22, '8', '8-042', 'La Cooperativa', '1217.00000000', 27, NULL, NULL, 3);
INSERT INTO barrio VALUES (24, '8', '8-034', 'El Campo', '1209.00000000', 27, NULL, NULL, 3);
INSERT INTO barrio VALUES (25, '8', '8-016', 'Gracias a Dios', '1192.00000000', 27, NULL, NULL, 3);
INSERT INTO barrio VALUES (26, '8', '8-021', 'El Cacao No.1', '1196.00000000', 27, NULL, NULL, 3);
INSERT INTO barrio VALUES (27, '8', '8-071', 'Mescalar (Cooperativa)', '1241.00000000', 27, NULL, NULL, 3);
INSERT INTO barrio VALUES (28, '8', '8-027', 'Miramontes', '1202.00000000', 27, NULL, NULL, 3);
INSERT INTO barrio VALUES (29, '8', '8-038', 'El Centro de CofradÂ¡a', '1213.00000000', 27, NULL, NULL, 3);
INSERT INTO barrio VALUES (30, '8', '8-020', 'Guadalupe', '1195.00000000', 27, NULL, NULL, 3);
INSERT INTO barrio VALUES (31, '8', '8-023', 'San Juan Bosco', '1198.00000000', 27, NULL, NULL, 3);
INSERT INTO barrio VALUES (32, '8', '8-026', 'Tito Gonzani', '1201.00000000', 27, NULL, NULL, 3);
INSERT INTO barrio VALUES (33, '8', '8-019', 'Morel', '1194.00000000', 27, NULL, NULL, 3);
INSERT INTO barrio VALUES (35, '8', '8-060', '9 de Mayo II Etapa', '1419.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (36, '8', '8-057', 'Senderos de Occidente', '1418.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (37, '8', '8-052', 'La AsÂ‚quia', '1227.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (38, '8', '8-043', 'Zona Militar', '1218.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (39, '8', '8-062', 'Matamoros', '1234.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (40, '8', '8-053', 'Imprema', '1228.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (41, '8', '8-031', 'Cohdefor', '1206.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (43, '8', '8-074', 'El ParaÂ¡so', '1243.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (44, '8', '8-070', 'San JerÂ¢nimo', '1422.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (45, '8', '8-030', '9 de Mayo', '1205.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (46, '8', '8-061', 'Altos de CofradÂ¡a', '1420.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (47, '8', '8-069', 'Brisas de Occidente', '1421.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (48, '8', '8-076', 'Jose Antonio Salazar', '1423.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (49, '8', '8-065', 'Villa Vida Nueva', '1237.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (50, '8', '8-033', '4 de Febrero', '1208.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (51, '8', '8-032', 'El Negro', '1207.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (52, '8', '8-025', 'Santo Domingo', '1200.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (54, '8', '8-005', 'La Pita Abajo', '1181.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (55, '8', '8-010', '24 de Abril', '1186.00000000', 27, NULL, NULL, 4);
INSERT INTO barrio VALUES (61, '8', '8-017', 'Suvanh', '1417.00000000', 27, NULL, NULL, 5);
INSERT INTO barrio VALUES (62, '8', '8-014', 'Calanares', '1190.00000000', 27, NULL, NULL, 5);
INSERT INTO barrio VALUES (63, '8', '8-015', '10 de Enero', '1191.00000000', 27, NULL, NULL, 5);
INSERT INTO barrio VALUES (64, '8', '8-013', 'La Victoria', '1189.00000000', 27, NULL, NULL, 5);
INSERT INTO barrio VALUES (65, '8', '8-012', 'Brisas del Valle', '1188.00000000', 27, NULL, NULL, 5);
INSERT INTO barrio VALUES (66, '8', '8-077', 'Brisas del Valle II Etapa', '1424.00000000', 27, NULL, NULL, 5);
INSERT INTO barrio VALUES (67, '8', '8-067', 'Tr. La Fortaleza-La Pita', '1239.00000000', 27, NULL, NULL, 5);
INSERT INTO barrio VALUES (68, '8', '8-063', 'Tr. La Pita-La Flecha', '1235.00000000', 27, NULL, NULL, 5);
INSERT INTO barrio VALUES (69, '8', '8-007', 'Casa Quemada', '1183.00000000', 27, NULL, NULL, 5);
INSERT INTO barrio VALUES (70, '8', '8-006', 'La Flecha', '1182.00000000', 27, NULL, NULL, 5);
INSERT INTO barrio VALUES (72, '7', '7-042', 'Tr. Peaje-Lempira No.2', '1172.00000000', 27, NULL, NULL, 5);
INSERT INTO barrio VALUES (73, '7', '7-013', 'ChamelecÂ¢n', '333.000000000', 27, NULL, NULL, 5);
INSERT INTO barrio VALUES (77, '8', '8-002', 'Cerro Verde', '1178.00000000', 27, NULL, NULL, 6);
INSERT INTO barrio VALUES (78, '8', '8-054', 'Tr. El Palmar-La Fortaleza', '1229.00000000', 27, NULL, NULL, 6);
INSERT INTO barrio VALUES (79, '7', '7-018', 'Los Zorzales', '1149.00000000', 27, NULL, NULL, 6);
INSERT INTO barrio VALUES (80, '7', '7-044', 'Morales No. 4', '1174.00000000', 27, NULL, NULL, 6);
INSERT INTO barrio VALUES (81, '7', '7-025', 'SabillÂ¢n CrÂ£z', '1156.00000000', 27, NULL, NULL, 6);
INSERT INTO barrio VALUES (82, '7', '7-028', 'Morales No. 3', '1159.00000000', 27, NULL, NULL, 6);
INSERT INTO barrio VALUES (83, '7', '7-027', 'Morales No. 2', '1158.00000000', 27, NULL, NULL, 6);
INSERT INTO barrio VALUES (84, '7', '7-029', 'La Bolsa', '1160.00000000', 27, NULL, NULL, 6);
INSERT INTO barrio VALUES (85, '7', '7-017', 'EspaÂ¤a', '1148.00000000', 27, NULL, NULL, 6);
INSERT INTO barrio VALUES (86, '7', '7-021', 'Palmira', '1152.00000000', 27, NULL, NULL, 6);
INSERT INTO barrio VALUES (88, '7', '7-045', 'San Juan (lotificaciÂ¢n)', '1175.00000000', 27, NULL, NULL, 6);
INSERT INTO barrio VALUES (91, '7', '7-049', 'Plaza Castilla', '1410.00000000', 27, NULL, NULL, 7);
INSERT INTO barrio VALUES (97, '7', '7-033', 'Lempira No. 1', '1164.00000000', 27, NULL, NULL, 8);
INSERT INTO barrio VALUES (98, '7', '7-015', 'Terencio Sierra', '1146.00000000', 27, NULL, NULL, 8);
INSERT INTO barrio VALUES (99, '7', '7-023', 'San Juan', '1154.00000000', 27, NULL, NULL, 8);
INSERT INTO barrio VALUES (100, '7', '7-030', 'FÂ‚ y Esperanza', '1161.00000000', 27, NULL, NULL, 8);
INSERT INTO barrio VALUES (101, '7', '7-032', 'San Jorge', '1163.00000000', 27, NULL, NULL, 8);
INSERT INTO barrio VALUES (102, '7', '7-031', 'San JosÂ‚', '1162.00000000', 27, NULL, NULL, 8);
INSERT INTO barrio VALUES (104, '3', '3-024', 'Prado', '992.000000000', 27, NULL, NULL, 8);
INSERT INTO barrio VALUES (105, '3', '3-026', 'La Guardia', '1315.00000000', 27, NULL, NULL, 8);
INSERT INTO barrio VALUES (106, '3', '3-018', 'Zona Industrial', '1307.00000000', 27, NULL, NULL, 8);
INSERT INTO barrio VALUES (107, '3', '3-002', 'El Benque', '970.000000000', 27, NULL, NULL, 8);
INSERT INTO barrio VALUES (109, '1', '1-028', 'Colombia', '881.000000000', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (110, '1', '1-057', 'Los Alpes', '1327.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (112, '3', '3-021', 'Suazo Cordova', '989.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (113, '3', '3-016', '13 de Marzo', '984.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (116, '1', '1-056', 'MerendÂ¢n', '907.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (119, '3', '3-015', 'Renacimiento', '1304.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (124, '1', '1-039', 'MalecÂ¢n', '892.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (134, '1', '1-014', 'Villas del Sol', '1266.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (135, '3', '3-029', 'La Puerta', '997.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (136, '1', '1-034', 'Los Andes', '887.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (150, '1', '1-037', 'ZerÂ¢n', '890.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (151, '1', '1-036', 'La Mora', '889.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (152, '1', '1-045', 'Guanacaste', '898.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (153, '3', '3-056', NULL, '0E-11', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (154, '1', '1-020', 'Country', '873.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (155, '1', '1-023', 'El Pedregal', '876.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (156, '1', '1-051', 'Agua Caliente', '904.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (157, '1', '1-055', 'Los Cedros', '1326.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (158, '1', '1-008', 'Villas Mackey', '861.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (159, '1', '1-046', 'Armenta', '899.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (160, '1', '1-019', 'El PlayÂ¢n', '872.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (161, '1', '1-084', 'Bosques del MerendÂ¢n', '0E-11', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (162, '1', '1-052', 'PotosÂ¡ II', '1325.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (163, '1', '1-063', 'Complejo Residencial', '1329.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (164, '1', '1-067', 'El Campo', '1330.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (165, '1', '1-082', 'Tr. OrquÂ­dea Blanca-Metropolitana', '0E-11', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (166, '1', '1-089', 'Finca Vieja', '0E-11', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (167, '1', '1-091', 'Puerta del Sol', '0E-11', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (168, '1', '1-090', 'Tr. os Medicos - Tara', '0E-11', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (169, '1', '1-024', 'Gracias a Dios', '877.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (170, '3', '3-033', 'Brisas del Cortes (Invasion)', '1000.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (171, '1', '1-026', 'Miramelinda', '879.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (172, '1', '1-053', 'Las Casitas', '905.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (173, '1', '1-025', 'PeÂ¤a Blanca', '878.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (174, '3', '3-011', 'Nueva Primavera', '1300.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (175, '3', '3-013', 'Rodas Alvarado', '1302.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (176, '3', '3-007', 'Figueroa', '975.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (177, '3', '3-009', 'Trejo III Etapa', '1298.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (178, '3', '3-031', 'Vieja Primavera II Etap', '1320.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (179, '2', '2-042', 'Bordo Universal - Las Vegas', '963.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (180, '2', '2-032', 'Universal', '953.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (181, '2', '2-040', 'Bordo El Roble', '961.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (182, '1', '1-004', 'Prieto', '857.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (183, '2', '2-013', 'Brisas Inva', '934.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (184, '2', '2-046', 'Anexo Brisas INVA', '966.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (185, '2', '2-038', 'MorazÂ n', '959.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (186, '2', '2-037', 'Modelo', '958.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (187, '2', '2-050', 'Geisa I Etapa', '967.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (188, '2', '2-050', 'Geisa I Etapa', '967.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (189, '2', '2-051', 'Geisa II Etapa', '1344.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (190, '2', '2-050', 'Geisa I Etapa', '967.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (191, '2', '2-052', 'Liga Nacional', '968.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (192, '2', '2-039', 'Honduras', '960.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (193, '2', '2-017', 'Villa Florencia', '938.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (194, '2', '2-031', 'Ideal', '952.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (195, '2', '2-030', 'Alameda Residencial', '951.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (196, '2', '2-036', 'Las Vegas', '957.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (197, '1', '1-003', 'Las Mercedes', '856.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (198, '2', '2-048', 'AndalucÂ¡a', '1342.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (199, '2', '2-043', 'Tr. Guadalupe-2do. Anillo', '964.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (200, '2', '2-014', 'Brisas No.3', '1283.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (201, '2', '2-008', 'BogrÂ n', '929.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (202, '2', '2-006', 'Buenos Aires', '927.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (203, '2', '2-005', 'El Roble', '1274.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (204, '2', '2-009', 'Las Anonas', '930.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (205, '2', '2-004', 'Zelaya', '1273.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (206, '1', '1-005', 'Rio Blanco', '1257.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (207, '1', '1-079', 'El Retiro', '919.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (208, '1', '1-080', 'Tr. Zapotal-Prieto', '920.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (209, '1', '1-081', 'Tr. Calle Zapotal-Retiro', '921.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (210, '2', '2-041', 'Tr. BogrÂ n-2do. Anillo', '962.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (211, '2', '2-028', 'El Sauce', '949.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (212, '2', '2-053', 'Florida', '1345.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (213, '2', '2-033', 'OdilÂ¢n Ayestas', '954.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (214, '2', '2-034', 'Esquipulas No.1', '955.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (215, '6', '6-003', 'Nueva Esperanza', '1114.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (114, '1', '1-038', 'Moderna', '891.000000000', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (115, '1', '1-064', 'Rancho El Coco', '912.000000000', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (117, '3', '3-010', 'Trejo IV Etapa', '978.000000000', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (118, '3', '3-030', 'San Isidro', '1319.00000000', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (120, '1', '1-065', 'Monte Carlo', '913.000000000', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (121, '3', '3-008', 'Trejo', '976.000000000', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (122, '1', '1-041', 'Nueva Esperanza', '894.000000000', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (123, '3', '3-006', 'DubÂ¢n', '974.000000000', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (125, '1', '1-040', 'Bella Vista', '893.000000000', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (127, '1', '1-042', 'Loma Linda', '895.000000000', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (128, '1', '1-044', 'Continental', '897.000000000', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (129, '4', '4-010', 'La Libertad', '1010.00000000', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (130, '1', '1-022', 'Tr. Santa Ana-M.C.R.', '875.000000000', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (131, '3', '3-005', 'Rio Piedras', '1294.00000000', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (132, '3', '3-012', 'Vieja Primavera', '1301.00000000', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (133, '1', '1-085', 'Valle AzÂ£l', '0E-11', 27, NULL, NULL, 9);
INSERT INTO barrio VALUES (137, '4', '4-026', 'Navidad', '1025.00000000', 27, NULL, NULL, 10);
INSERT INTO barrio VALUES (138, '3', '3-017', 'Altiplano', '1306.00000000', 27, NULL, NULL, 10);
INSERT INTO barrio VALUES (139, '3', '3-014', 'Altamira', '1303.00000000', 27, NULL, NULL, 10);
INSERT INTO barrio VALUES (141, '3', '3-025', 'HernÂ ndez', '993.000000000', 27, NULL, NULL, 10);
INSERT INTO barrio VALUES (142, '3', '3-004', 'Suyapa', '1293.00000000', 27, NULL, NULL, 10);
INSERT INTO barrio VALUES (143, '3', '3-022', 'Villa Eugenia', '990.000000000', 27, NULL, NULL, 10);
INSERT INTO barrio VALUES (144, '3', '3-019', 'Los Arcos', '1308.00000000', 27, NULL, NULL, 10);
INSERT INTO barrio VALUES (145, '3', '3-020', 'Las Mesetas', '1309.00000000', 27, NULL, NULL, 10);
INSERT INTO barrio VALUES (146, '1', '1-033', 'Boulevard MorazÂ n', '886.000000000', 27, NULL, NULL, 10);
INSERT INTO barrio VALUES (147, '3', '3-003', 'Boulevard MorazÂ n', '971.000000000', 27, NULL, NULL, 10);
INSERT INTO barrio VALUES (148, '1', '1-027', 'Metropolitana', '880.000000000', 27, NULL, NULL, 10);
INSERT INTO barrio VALUES (216, '2', '2-045', 'Covimal', '965.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (217, '2', '2-003', 'Los CastaÂ¤os', '924.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (219, '2', '2-054', 'Villas del Campo', '1346.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (220, '1', '1-077', 'Tr. Mercedes-Fesitranh', '1338.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (221, '1', '1-048', 'Tr. Prieto-Santa MÂ¢nica', '901.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (222, '2', '2-055', 'Los CastaÂ¤os I Etapa', '1347.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (223, '7', '7-037', 'La MontaÂ¤ita', '1168.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (224, '7', '7-012', 'Eben-Ezer', '1144.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (225, '7', '7-011', '10 de Septiembre', '1143.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (226, '4', '4-022', 'San JosÂ‚ Cahsa', '1021.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (227, '4', '4-006', 'Aurora', '1006.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (228, '4', '4-004', 'FernÂ ndez GuzmÂ n', '1004.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (229, '4', '4-044', 'Jerusalem', '1043.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (230, '4', '4-055', 'Goybi', '1357.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (231, '4', '4-030', 'CabaÂ¤itas', '1029.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (232, '4', '4-028', 'CabaÂ¤as', '1027.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (233, '4', '4-005', 'Tepeaca', '1005.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (234, '4', '4-049', 'Cacvil', '1353.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (235, '4', '4-018', 'Santa MarÂ¡a', '1017.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (236, '4', '4-057', 'ZIP San JosÂ‚', '1047.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (237, '4', '4-059', 'Villa Olimpica', '1360.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (238, '4', '4-045', 'Isla del Progreso II', '1044.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (239, '4', '4-020', 'Luisiana', '1019.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (240, '4', '4-058', 'El Triangulo', '1359.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (241, '4', '4-024', 'Pastor Zelaya No.2', '1023.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (242, '4', '4-051', 'Sula "A"', '1045.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (243, '4', '4-025', 'Modesto Rodas', '1024.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (244, '4', '4-023', 'Pastor Zelaya No.1', '1022.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (245, '4', '4-007', 'La Gran Villa', '1007.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (246, '4', '4-016', 'La Sabana', '1015.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (247, '4', '4-054', 'San Jorge de Sula', '1046.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (248, '4', '4-015', 'San Carlos de Sula', '1014.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (249, '4', '4-053', 'San Roberto de Sula', '1356.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (250, '4', '4-014', 'San JosÂ‚ de Sula', '1013.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (251, '4', '4-013', 'San Pedro', '564.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (252, '4', '4-012', 'Centroamericana', '1012.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (253, '4', '4-011', 'Santa Rosa de San Pedro', '1011.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (254, '4', '4-061', 'Hermosa Provincia', '1048.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (255, '7', '7-055', 'Tr. Villa Rica - 15 septiembre', '1416.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (256, '1', '1-018', 'HernÂ ndez Morel', '1269.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (257, '4', '4-002', 'Medina', '1002.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (258, '4', '4-001', 'ConcepciÂ¢n', '1001.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (259, '2', '2-027', 'Santa Anita', '948.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (260, '2', '2-026', 'La RuÂ¡z', '947.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (261, '2', '2-016', 'Guadalupe (Res.)', '1285.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (262, '2', '2-025', 'Barandillas', '946.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (263, '2', '2-019', 'Las Flores', '1288.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (264, '2', '2-020', 'El Progreso', '941.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (265, '1', '1-030', 'Las Acacias', '883.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (266, '2', '2-021', 'La Blanquita', '942.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (267, '1', '1-029', 'Zona CervecerÂ¡a', '882.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (268, '2', '2-018', 'San CristÂ¢bal', '1287.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (269, '2', '2-023', 'La Granja', '944.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (270, '2', '2-022', 'Sesenta y Uno', '943.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (271, '2', '2-015', 'Guadalupe', '936.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (272, '1', '1-010', 'Tara', '863.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (273, '1', '1-015', 'Los Laureles', '569.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (274, '1', '1-049', 'Zona Palenque', '902.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (275, '1', '1-012', 'Bermejo', '865.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (276, '1', '1-011', 'Bermejo Arriba (La Amistad)', '864.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (277, '2', '2-011', 'Las Brisas', '1280.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (278, '1', '1-007', 'Colvisula', '860.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (279, '1', '1-009', 'Los Zorzales', '1261.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (280, '1', '1-006', 'Los Alamos', '859.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (281, '1', '1-060', 'Sitraihss', '910.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (282, '1', '1-070', 'Tr. Alamos-Nova', '915.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (283, '1', '1-086', 'Los Medicos', '0E-11', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (284, '1', '1-032', 'Santa Ana', '885.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (285, '3', '3-027', 'Paz Barahona', '995.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (286, '1', '1-017', 'Universidad', '870.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (287, '4', '4-029', 'San JosÂ‚', '1028.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (288, '1', '1-058', 'Stibys', '908.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (289, '1', '1-062', 'Sitraplash', '911.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (291, '1', '1-078', 'El Zapotal (Aldea)', '918.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (292, '3', '3-001', 'El Centro', '969.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (293, '3', '3-028', 'Lempira', '1317.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (294, '1', '1-059', 'Sitraunah', '909.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (295, '1', '1-050', 'Tr. Zona Militar', '903.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (296, '1', '1-016', 'Cementos de Honduras', '869.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (297, '1', '1-013', 'Jardines del Valle', '1265.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (298, '1', '1-061', 'Sitratelh', '1328.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (299, '1', '1-031', 'Guamilito', '884.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (300, '1', '1-069', 'El Barrial', '1332.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (301, '1', '1-068', 'Etahsa', '1331.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (302, '1', '1-071', 'La Humildad', '1333.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (303, '1', '1-074', 'Villa Real', '1334.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (304, '1', '1-087', 'Tr. Alamos-PolitÂ‚cnico', '0E-11', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (305, '7', '7-048', 'Palos Verdes', '1409.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (306, '7', '7-052', 'Tr. Palos Verdes-Col. Panting', '1413.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (307, '7', '7-006', 'San Antonio II Etapa', '1138.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (308, '7', '7-010', 'San Isidro', '1142.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (309, '7', '7-005', 'San Antonio', '1137.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (310, '7', '7-009', 'La Ceiba', '1141.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (311, '7', '7-007', 'Suyapa', '1139.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (312, '7', '7-002', 'Panting', '1134.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (313, '7', '7-004', 'Providencia II Etapa', '1136.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (314, '7', '7-003', 'Providencia', '1135.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (315, '7', '7-001', 'El Cacao', '1133.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (316, '4', '4-042', 'Montefresco Centro', '1041.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (317, '4', '4-041', 'Islas del Progreso', '1040.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (318, '4', '4-040', 'Buenos Amigos', '1039.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (319, '4', '4-039', 'San Jose V', '1038.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (320, '4', '4-056', 'Montefresco Este', '1358.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (321, '4', '4-032', 'San Francisco', '1031.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (322, '4', '4-043', 'Montefresco', '1042.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (323, '4', '4-038', 'La UniÂ¢n', '1037.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (324, '4', '4-036', 'La Paz', '1035.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (325, '4', '4-037', 'San Luis', '1036.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (326, '4', '4-035', 'Zona Ind. contiguo Col. Paz', '1034.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (327, '4', '4-034', 'Las Palmas', '1033.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (328, '4', '4-031', 'RÂ palo', '1030.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (329, '4', '4-009', 'BerlÂ¡n', '1009.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (330, '2', '2-024', 'Smith', '945.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (331, '2', '2-012', 'La Esperanza', '933.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (332, '2', '2-007', 'Sitra-Alus', '928.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (333, '2', '2-010', 'El Higueral', '1279.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (334, '7', '7-008', 'Suyapa Anach', '1140.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (335, '7', '7-047', 'Monte Bello', '1408.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (336, '4', '4-003', 'Santa Ana', '1003.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (337, '4', '4-027', 'Suncery', '1026.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (338, '4', '4-033', 'Flor del Valle', '1032.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (339, '4', '4-021', 'Valle de Sula', '1020.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (340, '4', '4-008', 'El HipÂ¢dromo', '1008.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (341, '7', '7-019', '15 de Septiembre', '1150.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (342, '7', '7-022', 'Los Laureles', '1153.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (343, '7', '7-016', 'Villa Rica', '1147.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (344, '7', '7-014', 'Santa Ana', '1145.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (345, '7', '7-038', 'Brisas del Canada', '1169.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (346, '7', '7-039', 'Berman HernÂ ndez', '1170.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (347, '5', '5-058', 'Tr. Cablotales-Altamisa', '1105.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (348, '5', '5-090', 'Nueva Esperanza', '1384.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (349, '6', '6-008', 'Reina del Carmen', '1119.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (350, '6', '6-007', 'J.N.B.S', '1118.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (351, '6', '6-006', 'El Carmen (Aldea)', '1117.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (352, '6', '6-010', 'Angeles del Carmen', '1121.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (353, '6', '6-009', 'Colinas del Carmen', '1120.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (354, '6', '6-032', 'Altos del Porvenir', '1403.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (355, '6', '6-013', 'Lomas de San Juan II Etapa', '1393.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (356, '6', '6-023', 'Indiana', '1394.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (357, '6', '6-024', 'Luis Garcia Bustamante', '1395.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (358, '6', '6-025', 'El Sitio', '1396.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (359, '6', '6-029', 'Orquidea', '1400.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (360, '6', '6-026', 'Lomas de Raquel', '1397.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (361, '5', '5-039', 'Cabiotales', '1086.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (362, '5', '5-035', 'R. Gonzales', '1082.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (363, '5', '5-043', 'Tr. Rivera Hdez-LÂ¡m. La Lima', '1090.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (364, '5', '5-046', 'Quintas El Dorado', '1093.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (365, '5', '5-036', 'Leonardo Callejas', '1083.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (366, '5', '5-037', 'San Vicente PaÂ£l No.1', '1084.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (367, '5', '5-018', 'Arenales', '332.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (368, '5', '5-066', 'Tr. Villa Asturia-Carr. La Lima', '1110.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (369, '5', '5-015', 'Del Valle', '1063.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (370, '5', '5-038', 'San Vicente PaÂ£l No.2', '1085.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (371, '5', '5-089', 'Cablotales II', '1383.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (373, '5', '5-063', 'Guanacaste', '0E-11', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (374, '5', '5-067', 'Monte Verde', '1111.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (375, '5', '5-097', 'Filadelfia', '1391.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (376, '5', '5-073', 'Villa Asturia III', '1367.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (377, '5', '5-098', 'Villa Nuria', '1392.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (378, '2', '2-002', 'Juan RamÂ¢n Molina', '923.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (379, '6', '6-002', 'Carmen Inva', '1113.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (380, '6', '6-001', 'Reparto El Carmen', '1112.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (381, '6', '6-018', 'Tr. 2do. Anillo-El Limonar', '1128.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (382, '2', '2-047', 'Villas del Bosque I Etapa', '1341.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (383, '6', '6-014', 'Lomas del Carmen', '1124.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (384, '6', '6-004', 'El Limonar', '1115.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (385, '6', '6-017', 'Tr. Limonar-Od. Ayestas', '1127.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (386, '6', '6-020', 'Tr. Carr. La Lima-Lomas Carmen', '1130.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (387, '6', '6-016', 'Lomas de San Juan', '1126.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (388, '6', '6-019', 'Tr. Limonar-Lomas del Carmen', '1129.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (389, '6', '6-015', 'Santa Martha', '1125.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (390, '6', '6-005', 'Villas del Carmen', '1116.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (391, '6', '6-012', 'Tr. Villas del Carmen-El Carmen', '1123.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (392, '2', '2-001', 'Tr. Juan RamÂ½n Molina-Peaje', '922.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (393, '1', '1-002', 'Fesitranh', '855.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (394, '1', '1-072', 'Tr. Los Prados-Fesitranh', '916.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (395, '1', '1-001', 'VeracrÂ£z', '854.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (396, '1', '1-076', 'Los Pinos', '1337.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (397, '1', '1-088', 'Los Prados', '0E-11', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (398, '2', '2-049', 'Villas del Bosque II Etapa', '1343.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (399, '2', '2-044', 'Monte Alegre', '1339.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (400, '6', '6-027', 'Santa Clara', '1398.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (401, '6', '6-030', 'Los Naranjo', '1401.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (402, '6', '6-028', 'Brisas del Cacao', '1399.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (403, '6', '6-034', 'Alameda', '1405.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (404, '7', '7-046', 'Tr. Berman Hdez.-Col. 14 Julio', '1176.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (405, '7', '7-050', 'Reyes Leiva', '1411.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (406, '1', '1-066', 'Altos de Sula', '914.000000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (407, '5', '5-050', 'Miguel Angel PavÂ¢n II', '1097.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (408, '5', '5-072', 'Villa Asturia II', '1366.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (409, '5', '5-056', 'Tr. Autolote El PalÂ¢n-Arenales', '1103.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (410, '5', '5-053', 'SatÂ‚lite IV Etapa', '1100.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (411, '5', '5-005', 'SatÂ‚lite III Etapa', '1053.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (412, '5', '5-009', 'PerpÂ‚tuo Socorro', '1057.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (413, '5', '5-011', 'Planes de Calpules', '1059.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (414, '5', '5-008', 'La Pradera', '1056.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (415, '5', '5-004', 'SatÂ‚lite II Etapa', '1052.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (416, '5', '5-007', 'Reparto Lempira', '1055.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (417, '5', '5-006', 'Sandoval Sorto', '1054.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (418, '5', '5-080', 'Luke', '1374.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (419, '5', '5-002', 'JÂ£piter', '1050.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (420, '5', '5-001', 'El EdÂ‚n', '1049.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (421, '5', '5-070', 'El Sauce ( Ciudad Nueva )', '1364.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (422, '5', '5-003', 'SatÂ‚lite I Etapa', '1051.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (423, '5', '5-049', 'Miguel Angel PavÂ¢n I', '1096.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (424, '5', '5-012', 'Perfecto Vasquez', '1060.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (425, '5', '5-010', '15 de Octubre', '1058.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (426, '5', '5-048', 'Villa Asturia I', '1095.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (427, '5', '5-013', 'Municipal', '1061.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (428, '5', '5-017', 'San SebastiÂ n', '1065.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (429, '5', '5-064', 'Tr. Villa Ernestina-Miguel Angel PavÂ¢n', '1109.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (430, '5', '5-065', 'SatÂ‚lite V Etapa', '0E-11', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (431, '5', '5-077', 'Sandoval Sorto II Etapa', '1371.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (432, '5', '5-094', 'La Victoria', '1388.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (433, '1', '1-083', 'Los Pinos II Etapa', '0E-11', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (434, '4', '4-019', 'Villa Ernestina', '1018.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (435, '5', '5-052', 'El Chorizo', '1099.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (436, '5', '5-046', 'Quintas El Dorado', '1093.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (437, '4', '4-060', 'Saturno', '1361.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (438, '4', '4-017', 'Villeda Morales', '1016.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (439, '4', '4-048', 'Buena Vista', '1352.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (440, '6', '6-021', 'El Porvenir', '1131.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (441, '2', '2-056', 'Villas del Bosque III Etapa', '1348.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (442, '7', '7-040', 'Chotepe', '1171.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (443, '5', '5-014', 'Periodista', '1062.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (444, '5', '5-016', 'Calpules', '1064.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (445, '6', '6-022', 'Haciendas JardÂ­n BotÂ nico', '1132.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (446, '6', '6-031', 'Ocotillo (Aldea)', '1402.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (447, '5', '5-060', 'Los Laureles (Aldea)', '1107.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (448, '5', '5-033', '6 de Mayo (Asentamiento)', '1080.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (449, '5', '5-044', 'Tr. Aeropuerto-Bordo', '1091.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (450, '5', '5-034', 'Puerto Escondido', '1081.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (451, '5', '5-055', 'Llanos de Sula II', '1102.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (452, '5', '5-082', 'Reyes Martinez', '1376.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (453, '5', '5-030', 'Santa Martha', '1077.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (454, '5', '5-081', 'Santa Venecia', '1375.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (455, '5', '5-032', 'La Cuchilla', '1079.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (456, '5', '5-054', 'Llanos de Sula I', '1101.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (457, '5', '5-029', 'Venecia', '1076.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (458, '5', '5-028', '6 de Mayo', '1075.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (459, '5', '5-027', 'La Solita', '1074.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (460, '5', '5-047', 'Haciendas', '1094.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (461, '5', '5-057', 'Alfonso Lacayo', '1104.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (462, '5', '5-031', 'MontaÂ¤ita', '1078.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (463, '5', '5-091', 'Sitradima', '1385.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (464, '5', '5-083', 'Campo Alegre', '1377.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (465, '5', '5-085', 'Tr. Central-Santa Martha', '1379.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (466, '5', '5-084', 'Villas Kitur III', '1378.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (467, '5', '5-086', 'Villas Kitur I', '1380.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (468, '5', '5-078', 'Llanos de Sula IV', '1372.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (469, '5', '5-079', 'Cristo Viene', '1373.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (470, '5', '5-075', 'Fesitranh II Etapa', '1369.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (471, '5', '5-092', 'Brisas del Aeropuerto', '1386.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (472, '6', '6-035', 'Cosmul', '1406.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (473, '6', '6-011', 'Tr. Hda. El RincÂ¢n-Alde', '1122.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (474, '5', '5-076', 'Hermanos Villegas', '1370.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (475, '5', '5-069', 'Palmeras', '1363.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (476, '5', '5-026', 'Centralita', '1073.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (477, '5', '5-023', 'Brisas del Sauce Norte', '1070.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (478, '5', '5-024', 'Brisas del Sauce Sur', '1071.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (479, '5', '5-045', 'Felipe Zelaya', '1092.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (480, '5', '5-021', 'Reparto La Esperanza Parte 1', '1068.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (481, '5', '5-040', 'Altamisales', '1087.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (482, '5', '5-042', 'Tr. Rivera Hdez-SinaÂ¡', '1089.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (483, '5', '5-022', 'Rivera HernÂ ndez', '1069.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (484, '5', '5-019', 'Los Angeles', '1066.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (485, '5', '5-020', 'SinaÂ¡', '1067.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (486, '5', '5-051', 'Fesitranh II', '1098.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (487, '5', '5-059', 'Jose M. Arreaga I', '1106.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (488, '5', '5-061', 'Bordo 6 de Mayo', '1108.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (489, '5', '5-071', 'Jose M Arreaga II', '1365.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (490, '5', '5-074', 'Roberto Larios Silva', '1368.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (491, '5', '5-095', 'Villa Dulce Hogar', '1389.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (492, '5', '5-093', 'Cerrito Lindo', '1387.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (493, '5', '5-096', 'Reparto La Esperanza Parte 2', '1390.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (494, '6', '6-033', 'Tr. Parque El Ocotillo-Aldea El Ocotillo', '1404.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (495, '5', '5-025', 'Central', '1072.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (496, '5', '5-052', 'El Chorizo', '1099.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (497, '5', '5-068', 'Copen (Aldea)', '1362.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (498, '5', '5-088', 'San JosÂ‚ del BoquerÂ¢n', '1382.00000000', 27, NULL, NULL, NULL);
INSERT INTO barrio VALUES (499, '1', '1-047', 'Lomas de Bella Vista', '900.000000000', 27, NULL, NULL, NULL);


--
-- Name: barrios_gid_seq; Type: SEQUENCE SET; Schema: curso; Owner: alumno
--

SELECT pg_catalog.setval('barrios_gid_seq', 521, true);


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: curso; Owner: alumno
--

INSERT INTO departamento VALUES (1185, 'Atlántida', NULL);
INSERT INTO departamento VALUES (1186, 'Choluteca', NULL);
INSERT INTO departamento VALUES (1187, 'Colón', NULL);
INSERT INTO departamento VALUES (1188, 'Comayagua', NULL);
INSERT INTO departamento VALUES (1189, 'Copán', NULL);
INSERT INTO departamento VALUES (1190, 'Cortés', 'Cortez');
INSERT INTO departamento VALUES (1191, 'El Paraíso', 'Paraiso');
INSERT INTO departamento VALUES (1192, 'Francisco Morazán', 'Tegucigalpa');
INSERT INTO departamento VALUES (1193, 'Gracias a Dios', NULL);
INSERT INTO departamento VALUES (1194, 'Intibucá', NULL);
INSERT INTO departamento VALUES (1195, 'Islas de la Bahía', 'Islas de Bahia');
INSERT INTO departamento VALUES (1196, 'La Paz', NULL);
INSERT INTO departamento VALUES (1197, 'Lempira', 'Gracias');
INSERT INTO departamento VALUES (1198, 'Ocotepeque', NULL);
INSERT INTO departamento VALUES (1199, 'Olancho', NULL);
INSERT INTO departamento VALUES (1200, 'Santa Bárbara', NULL);
INSERT INTO departamento VALUES (1201, 'Valle', NULL);
INSERT INTO departamento VALUES (1202, 'Yoro', NULL);


--
-- Name: departamentos_gid_seq; Type: SEQUENCE SET; Schema: curso; Owner: alumno
--

SELECT pg_catalog.setval('departamentos_gid_seq', 18, true);


--
-- Data for Name: equipo; Type: TABLE DATA; Schema: curso; Owner: alumno
--

INSERT INTO equipo VALUES ('equipo-1');
INSERT INTO equipo VALUES ('equipo-2');
INSERT INTO equipo VALUES ('equipo-3');
INSERT INTO equipo VALUES ('equipo-4');
INSERT INTO equipo VALUES ('equipo-5');


--
-- Data for Name: municipio; Type: TABLE DATA; Schema: curso; Owner: alumno
--

INSERT INTO municipio VALUES (1, 'Honduras', 1189, 15041, 'Dulce Nombre', 0.295586999999999989, 0.00270000000000000014, 6227, 1189);
INSERT INTO municipio VALUES (2, 'Honduras', 1189, 15042, 'El Paraíso', 0.691382000000000052, 0.022370000000000001, 22477, 1189);
INSERT INTO municipio VALUES (3, 'Honduras', 1189, 15043, 'Florida', 1.14445400000000008, 0.0302639999999999992, 28267, 1189);
INSERT INTO municipio VALUES (4, 'Honduras', 1189, 15044, 'La Jigua', 0.614349999999999952, 0.00973899999999999939, 8987, 1189);
INSERT INTO municipio VALUES (5, 'Honduras', 1189, 15045, 'La Unión', 0.69881099999999996, 0.0194550000000000001, 7619, 1189);
INSERT INTO municipio VALUES (6, 'Honduras', 1189, 15046, 'Nueva Arcadia', 0.657105999999999968, 0.0131030000000000001, 42743, 1189);
INSERT INTO municipio VALUES (7, 'Honduras', 1189, 15047, 'San Agustín', 0.340183000000000013, 0.00522599999999999974, 4260, 1189);
INSERT INTO municipio VALUES (18, 'Honduras', 1190, 15058, 'Choloma', 0.883024000000000031, 0.036538000000000001, 276863, 1190);
INSERT INTO municipio VALUES (19, 'Honduras', 1190, 15059, 'La Lima', 0.890835000000000043, 0.0108970000000000004, 63216, 1190);
INSERT INTO municipio VALUES (20, 'Honduras', 1190, 15060, 'Omoa', 1.48826499999999995, 0.0336479999999999974, 40354, 1190);
INSERT INTO municipio VALUES (21, 'Honduras', 1190, 15061, 'Pimienta', 0.330660000000000009, 0.00492599999999999982, 25469, 1190);
INSERT INTO municipio VALUES (22, 'Honduras', 1190, 15062, 'Potrerillos', 0.52779100000000001, 0.00768100000000000033, 3715, 1190);
INSERT INTO municipio VALUES (23, 'Honduras', 1190, 15063, 'Puerto Cortés', 1.79127400000000003, 0.0300370000000000012, 115186, 1190);
INSERT INTO municipio VALUES (24, 'Honduras', 1190, 15064, 'San Antonio de Cortés', 0.641330999999999984, 0.018495000000000001, 20160, 1190);
INSERT INTO municipio VALUES (25, 'Honduras', 1190, 15065, 'San Francisco de Yojoa', 0.370062000000000002, 0.00716400000000000023, 9646, 1190);
INSERT INTO municipio VALUES (26, 'Honduras', 1190, 15066, 'San Manuel', 0.643275999999999959, 0.0113189999999999992, 53461, 1190);
INSERT INTO municipio VALUES (27, 'Honduras', 1190, 15067, 'San Pedro Sula', 1.67006399999999999, 0.0769500000000000045, 719447, 1190);
INSERT INTO municipio VALUES (28, 'Honduras', 1190, 15068, 'Santa Cruz de Yojoa', 1.46652399999999994, 0.0654700000000000004, 79858, 1190);
INSERT INTO municipio VALUES (29, 'Honduras', 1190, 15069, 'Villanueva', 0.862439999999999984, 0.0292639999999999983, 137657, 1190);
INSERT INTO municipio VALUES (30, 'Honduras', 1191, 15070, 'Alauca', 0.693945999999999952, 0.0150100000000000008, 9386, 1191);
INSERT INTO municipio VALUES (31, 'Honduras', 1191, 15071, 'Danlí', 2.15425699999999987, 0.213934000000000013, 181188, 1191);
INSERT INTO municipio VALUES (32, 'Honduras', 1191, 15072, 'El Paraíso', 0.953358999999999956, 0.0325179999999999983, 45179, 1191);
INSERT INTO municipio VALUES (33, 'Honduras', 1191, 15073, 'Guinope', 0.718967000000000023, 0.0165030000000000003, 7705, 1191);
INSERT INTO municipio VALUES (34, 'Honduras', 1191, 15074, 'Jacaleapa', 0.599457000000000018, 0.00917600000000000013, 3955, 1191);
INSERT INTO municipio VALUES (35, 'Honduras', 1191, 15075, 'Liure', 0.394643999999999995, 0.0071050000000000002, 10975, 1191);
INSERT INTO municipio VALUES (36, 'Honduras', 1191, 15076, 'Morocelí', 1.02980300000000002, 0.030127000000000001, 14731, 1191);
INSERT INTO municipio VALUES (37, 'Honduras', 1191, 15077, 'Oropolí', 0.569614999999999982, 0.0139190000000000008, 5946, 1191);
INSERT INTO municipio VALUES (38, 'Honduras', 1191, 15078, 'Potrerillos', 0.522221999999999964, 0.0103459999999999993, 23083, 1191);
INSERT INTO municipio VALUES (39, 'Honduras', 1191, 15079, 'San Antonio de Flores', 0.570635000000000003, 0.0120940000000000006, 5364, 1191);
INSERT INTO municipio VALUES (40, 'Honduras', 1191, 15080, 'San Lucas', 0.56012099999999998, 0.0103420000000000005, 7934, 1191);
INSERT INTO municipio VALUES (41, 'Honduras', 1191, 15081, 'San Matías', 0.502862999999999949, 0.00940000000000000037, 4991, 1191);
INSERT INTO municipio VALUES (42, 'Honduras', 1191, 15082, 'Soledad', 0.509723999999999955, 0.0132289999999999994, 10217, 1191);
INSERT INTO municipio VALUES (43, 'Honduras', 1191, 15083, 'Teupasenti', 1.21827799999999997, 0.0559539999999999968, 40269, 1191);
INSERT INTO municipio VALUES (49, 'Honduras', 1192, 15089, 'Alubarén', 0.303308000000000022, 0.00385399999999999979, 5775, 1192);
INSERT INTO municipio VALUES (50, 'Honduras', 1192, 15090, 'Cedros', 1.55546800000000007, 0.0660629999999999967, 18300, 1192);
INSERT INTO municipio VALUES (51, 'Honduras', 1192, 15091, 'Curarén', 0.737072999999999978, 0.0252770000000000009, 19658, 1192);
INSERT INTO municipio VALUES (52, 'Honduras', 1192, 15092, 'Distrito Central', 2.11029100000000014, 0.123716999999999994, 1126534, 1192);
INSERT INTO municipio VALUES (53, 'Honduras', 1192, 15093, 'El Porvenir', 1.20967200000000008, 0.0346990000000000007, 22517, 1192);
INSERT INTO municipio VALUES (54, 'Honduras', 1192, 15094, 'Guaimaca', 1.26186899999999991, 0.0658159999999999995, 29936, 1192);
INSERT INTO municipio VALUES (55, 'Honduras', 1192, 15095, 'La Libertad', 0.274094999999999978, 0.0030379999999999999, 21312, 1192);
INSERT INTO municipio VALUES (56, 'Honduras', 1192, 15096, 'La Venta', 0.48516999999999999, 0.0103180000000000008, 6090, 1192);
INSERT INTO municipio VALUES (57, 'Honduras', 1192, 15097, 'Lepaterique', 0.948926000000000047, 0.0466350000000000028, 14899, 1192);
INSERT INTO municipio VALUES (58, 'Honduras', 1192, 15098, 'Maraita', 0.674734999999999974, 0.0216229999999999999, 5851, 1192);
INSERT INTO municipio VALUES (59, 'Honduras', 1192, 15099, 'Marale', 0.96488700000000005, 0.0395080000000000015, 6953, 1192);
INSERT INTO municipio VALUES (60, 'Honduras', 1192, 15100, 'Nueva Armenia', 0.658463000000000021, 0.0144829999999999993, 2239, 1192);
INSERT INTO municipio VALUES (61, 'Honduras', 1192, 15101, 'Ojojona', 0.771946000000000021, 0.0215709999999999999, 22517, 1192);
INSERT INTO municipio VALUES (62, 'Honduras', 1192, 15102, 'Orica', 0.915352999999999972, 0.0284729999999999983, 11253, 1192);
INSERT INTO municipio VALUES (63, 'Honduras', 1192, 15103, 'Reitoca', 0.571774000000000004, 0.0160719999999999995, 10911, 1192);
INSERT INTO municipio VALUES (64, 'Honduras', 1192, 15104, 'Sabanagrande', 0.807232999999999978, 0.0206549999999999997, 17005, 1192);
INSERT INTO municipio VALUES (65, 'Honduras', 1199, 15211, 'El Rosario', 0.491744000000000014, 0.0116480000000000004, 4625, 1199);
INSERT INTO municipio VALUES (66, 'Honduras', 1199, 15212, 'Esquipulas del Norte', 0.941652000000000045, 0.0394829999999999973, 9581, 1199);
INSERT INTO municipio VALUES (67, 'Honduras', 1199, 15213, 'Gualaco', 2.69396499999999994, 0.186599999999999988, 21532, 1199);
INSERT INTO municipio VALUES (68, 'Honduras', 1199, 15214, 'Guarizama', 0.596922999999999981, 0.016691000000000001, 7912, 1199);
INSERT INTO municipio VALUES (69, 'Honduras', 1199, 15215, 'Guata', 1.29195100000000007, 0.0698590000000000044, 11888, 1199);
INSERT INTO municipio VALUES (70, 'Honduras', 1199, 15216, 'Guayape', 0.905737000000000014, 0.0349659999999999971, 11798, 1199);
INSERT INTO municipio VALUES (71, 'Honduras', 1199, 15217, 'Jano', 0.997936999999999963, 0.0290189999999999997, 3915, 1199);
INSERT INTO municipio VALUES (72, 'Honduras', 1199, 15218, 'Juticalpa', 2.78074300000000019, 0.224570999999999993, 119488, 1199);
INSERT INTO municipio VALUES (73, 'Honduras', 1199, 15219, 'La Unión', 1.02115500000000003, 0.0467950000000000033, 13592, 1199);
INSERT INTO municipio VALUES (81, 'Honduras', 1199, 15227, 'Santa Maria del Real', 0.867960999999999983, 0.0194809999999999983, 12412, 1199);
INSERT INTO municipio VALUES (111, 'Honduras', 1187, 15004, 'Balfate', 1.272621, 0.0338800000000000004, 10898, NULL);
INSERT INTO municipio VALUES (112, 'Honduras', 1187, 15005, 'Bonito Oriental', 1.2139279999999999, 0.0433240000000000014, 38083, NULL);
INSERT INTO municipio VALUES (113, 'Honduras', 1187, 15006, 'Iriona', 3.015625, 0.32992100000000002, 21550, NULL);
INSERT INTO municipio VALUES (114, 'Honduras', 1187, 15007, 'Limón', 1.28126399999999996, 0.0529340000000000019, 10745, NULL);
INSERT INTO municipio VALUES (115, 'Honduras', 1187, 15008, 'Sabá', 0.948250000000000037, 0.0306340000000000015, 26021, NULL);
INSERT INTO municipio VALUES (116, 'Honduras', 1187, 15009, 'Santa Fé', 0.658676000000000039, 0.0159350000000000012, 6762, NULL);
INSERT INTO municipio VALUES (117, 'Honduras', 1187, 15010, 'Santa Rosa de Aguán', 1.10615100000000011, 0.0111680000000000008, 3105, NULL);
INSERT INTO municipio VALUES (118, 'Honduras', 1187, 15011, 'Sonaguera', 1.01069699999999996, 0.037657000000000003, 38348, NULL);
INSERT INTO municipio VALUES (119, 'Honduras', 1187, 15012, 'Tocoa', 1.42371500000000006, 0.0754380000000000051, 81154, NULL);
INSERT INTO municipio VALUES (120, 'Honduras', 1187, 15013, 'Trujillo', 2.72142399999999984, 0.0783169999999999977, 56874, NULL);
INSERT INTO municipio VALUES (102, 'Honduras', 1186, 14988, 'Apacilagua', 0.610102999999999951, 0.0179549999999999987, 9588, 1186);
INSERT INTO municipio VALUES (103, 'Honduras', 1186, 14996, 'Namasigue', 0.663464000000000054, 0.0173610000000000014, 31537, 1186);
INSERT INTO municipio VALUES (104, 'Honduras', 1186, 14997, 'Orocuina', 0.546049000000000007, 0.00987599999999999936, 17626, 1186);
INSERT INTO municipio VALUES (105, 'Honduras', 1186, 14998, 'Pespire', 0.910734000000000044, 0.0284209999999999983, 25825, 1186);
INSERT INTO municipio VALUES (106, 'Honduras', 1186, 14999, 'San Antonio de Flores', 0.276349000000000011, 0.00432399999999999972, 6029, 1186);
INSERT INTO municipio VALUES (107, 'Honduras', 1186, 15000, 'San Isidro', 0.293403999999999998, 0.00557100000000000043, 3594, 1186);
INSERT INTO municipio VALUES (108, 'Honduras', 1186, 15001, 'San José', 0.377699000000000007, 0.00536399999999999984, 3795, 1186);
INSERT INTO municipio VALUES (121, 'Honduras', 1188, 15014, 'Ajuterique', 0.343322000000000016, 0.00493700000000000042, 11374, 1188);
INSERT INTO municipio VALUES (122, 'Honduras', 1188, 15015, 'Comayagua', 1.5445040000000001, 0.0663340000000000041, 118406, 1188);
INSERT INTO municipio VALUES (123, 'Honduras', 1188, 15016, 'El Rosario', 0.995908000000000015, 0.0230279999999999999, 26065, 1188);
INSERT INTO municipio VALUES (124, 'Honduras', 1188, 15017, 'Esquías', 1.09650800000000004, 0.0309840000000000011, 17906, 1188);
INSERT INTO municipio VALUES (125, 'Honduras', 1188, 15018, 'Humuya', 0.415285000000000015, 0.00407800000000000003, 1351, 1188);
INSERT INTO municipio VALUES (126, 'Honduras', 1188, 15019, 'La Libertad', 1.15222500000000005, 0.0252609999999999987, 2970, 1188);
INSERT INTO municipio VALUES (127, 'Honduras', 1188, 15020, 'La Trinidad', 0.439682999999999991, 0.00761600000000000037, 4654, 1188);
INSERT INTO municipio VALUES (128, 'Honduras', 1188, 15021, 'Lamaní', 0.912453999999999987, 0.0256690000000000008, 6442, 1188);
INSERT INTO municipio VALUES (129, 'Honduras', 1188, 15022, 'Las Lajas', 0.578142000000000045, 0.0130849999999999994, 7766, 1188);
INSERT INTO municipio VALUES (142, 'Honduras', 1189, 15035, 'Cabañas', 0.458428999999999975, 0.0113539999999999995, 12634, 1189);
INSERT INTO municipio VALUES (143, 'Honduras', 1189, 15036, 'Concepción', 0.519369999999999998, 0.00622800000000000003, 7087, 1189);
INSERT INTO municipio VALUES (144, 'Honduras', 1189, 15037, 'Copán Ruinas', 1.20690699999999995, 0.0315459999999999977, 39378, 1189);
INSERT INTO municipio VALUES (145, 'Honduras', 1189, 15038, 'Corquín', 0.632911000000000001, 0.0115160000000000002, 15795, 1189);
INSERT INTO municipio VALUES (146, 'Honduras', 1189, 15039, 'Cucuyagua', 0.578474000000000044, 0.0113449999999999992, 14118, 1189);
INSERT INTO municipio VALUES (147, 'Honduras', 1189, 15040, 'Dolores', 0.368754999999999999, 0.00396900000000000031, 5857, 1189);
INSERT INTO municipio VALUES (148, 'Honduras', 1192, 15105, 'San Antonio de Oriente', 0.673826000000000036, 0.0176639999999999991, 13886, 1192);
INSERT INTO municipio VALUES (149, 'Honduras', 1192, 15106, 'San Buenaventura', 0.333832999999999991, 0.00562, 2084, 1192);
INSERT INTO municipio VALUES (150, 'Honduras', 1192, 15107, 'San Ignacio', 0.823867000000000016, 0.0283190000000000004, 7409, 1192);
INSERT INTO municipio VALUES (151, 'Honduras', 1192, 15108, 'San Juan de Flores', 0.823852999999999946, 0.0327479999999999993, 13495, 1192);
INSERT INTO municipio VALUES (152, 'Honduras', 1192, 15109, 'San Miguelito', 0.271345999999999976, 0.00355600000000000013, 1943, 1192);
INSERT INTO municipio VALUES (153, 'Honduras', 1192, 15110, 'Santa Ana', 0.555848000000000009, 0.00707200000000000016, 10768, 1192);
INSERT INTO municipio VALUES (154, 'Honduras', 1192, 15111, 'Santa Lucía', 0.297219999999999984, 0.00492800000000000009, 7649, 1192);
INSERT INTO municipio VALUES (155, 'Honduras', 1192, 15112, 'Talanga', 1.02787399999999995, 0.0355439999999999992, 36610, 1192);
INSERT INTO municipio VALUES (156, 'Honduras', 1192, 15113, 'Tatumbla', 0.362153999999999976, 0.00657999999999999991, 5708, 1192);
INSERT INTO municipio VALUES (157, 'Honduras', 1192, 15114, 'Valle de Ángeles', 0.50932299999999997, 0.00817400000000000071, 14652, 1192);
INSERT INTO municipio VALUES (158, 'Honduras', 1192, 15115, 'Vallecillo', 0.634735000000000049, 0.0173379999999999992, 7008, 1192);
INSERT INTO municipio VALUES (159, 'Honduras', 1192, 15116, 'Villa de San Francisco', 0.420200999999999991, 0.0073959999999999998, 10060, 1192);
INSERT INTO municipio VALUES (160, 'Honduras', 1193, 15117, 'Ahuas', 2.26016299999999992, 0.113337999999999994, 9872, 1193);
INSERT INTO municipio VALUES (161, 'Honduras', 1193, 15118, 'Brus Laguna', 6.45474499999999995, 0.376008999999999982, 14346, 1193);
INSERT INTO municipio VALUES (82, 'Honduras', 1199, 15228, 'Silca', 0.692566000000000015, 0.0195940000000000003, 7846, 1199);
INSERT INTO municipio VALUES (83, 'Honduras', 1199, 15229, 'Yocón', 0.701718999999999982, 0.0207630000000000002, 10764, 1199);
INSERT INTO municipio VALUES (84, 'Honduras', 1200, 15230, 'Arada', 0.534511999999999987, 0.00903900000000000016, 9663, 1200);
INSERT INTO municipio VALUES (85, 'Honduras', 1200, 15231, 'Atima', 0.673358000000000012, 0.0163480000000000014, 14906, 1200);
INSERT INTO municipio VALUES (86, 'Honduras', 1200, 15232, 'Azacualpa', 0.592173999999999978, 0.0181650000000000006, 19500, 1200);
INSERT INTO municipio VALUES (87, 'Honduras', 1200, 15233, 'Ceguaca', 0.320218999999999976, 0.00444999999999999996, 4386, 1200);
INSERT INTO municipio VALUES (88, 'Honduras', 1201, 15261, 'Caridad', 0.29059299999999999, 0.00386099999999999985, 3743, 1201);
INSERT INTO municipio VALUES (89, 'Honduras', 1201, 15262, 'Goascorán', 0.685455999999999954, 0.0154199999999999997, 14060, 1201);
INSERT INTO municipio VALUES (90, 'Honduras', 1201, 15263, 'Langue', 0.491061999999999999, 0.0111889999999999993, 21605, 1201);
INSERT INTO municipio VALUES (91, 'Honduras', 1201, 15264, 'Nacaome', 1.81685600000000003, 0.0508639999999999995, 58470, 1201);
INSERT INTO municipio VALUES (92, 'Honduras', 1201, 15265, 'San Francisco de Coray', 0.430059000000000025, 0.0074920000000000004, 15537, 1201);
INSERT INTO municipio VALUES (93, 'Honduras', 1201, 15266, 'San Lorenzo', 1.68717899999999998, 0.0150340000000000005, 38897, 1201);
INSERT INTO municipio VALUES (187, 'Honduras', 1196, 15144, 'Aguaqueterique', 0.593018000000000045, 0.0147159999999999999, 5300, 1196);
INSERT INTO municipio VALUES (188, 'Honduras', 1196, 15145, 'Cabañas', 0.68846099999999999, 0.0125769999999999996, 2799, 1196);
INSERT INTO municipio VALUES (189, 'Honduras', 1196, 15146, 'Cane', 0.35521999999999998, 0.00374800000000000003, 2572, 1196);
INSERT INTO municipio VALUES (190, 'Honduras', 1196, 15147, 'Chinacla', 0.444147999999999987, 0.00503099999999999988, 8520, 1196);
INSERT INTO municipio VALUES (183, 'Honduras', 1195, 15140, 'Guanaja', 0.757855999999999974, 0.00484400000000000022, 5660, 1195);
INSERT INTO municipio VALUES (184, 'Honduras', 1195, 15141, 'José Santos Guardiola', 1.06631900000000002, 0.00429899999999999987, 11090, 1195);
INSERT INTO municipio VALUES (185, 'Honduras', 1195, 15142, 'Roatán', 1.43984599999999996, 0.0069639999999999997, 29636, 1195);
INSERT INTO municipio VALUES (186, 'Honduras', 1195, 15143, 'Utila', 0.496033999999999975, 0.00348800000000000021, 2772, 1195);
INSERT INTO municipio VALUES (191, 'Honduras', 1196, 15148, 'Guajiquiro', 0.831640999999999964, 0.027827000000000001, 14745, 1196);
INSERT INTO municipio VALUES (192, 'Honduras', 1196, 15149, 'La Paz', 0.907797999999999994, 0.0183450000000000002, 41250, 1196);
INSERT INTO municipio VALUES (193, 'Honduras', 1196, 15150, 'Lauterique', 0.236081999999999986, 0.00280400000000000007, 2960, 1196);
INSERT INTO municipio VALUES (194, 'Honduras', 1196, 15151, 'Marcala', 0.964829999999999965, 0.0181809999999999992, 33402, 1196);
INSERT INTO municipio VALUES (166, 'Honduras', 1194, 15123, 'Camasca', 0.351144000000000012, 0.00469300000000000012, 7347, 1194);
INSERT INTO municipio VALUES (167, 'Honduras', 1194, 15124, 'Colomoncagua', 0.64831799999999995, 0.0182579999999999999, 19655, 1194);
INSERT INTO municipio VALUES (168, 'Honduras', 1194, 15125, 'Concepción', 0.401778000000000024, 0.00705200000000000011, 10605, 1194);
INSERT INTO municipio VALUES (169, 'Honduras', 1194, 15126, 'Dolores', 0.351534999999999986, 0.00665500000000000033, 5176, 1194);
INSERT INTO municipio VALUES (195, 'Honduras', 1196, 15152, 'Mercedes de Oriente', 0.320718999999999976, 0.00294500000000000014, 1164, 1196);
INSERT INTO municipio VALUES (196, 'Honduras', 1196, 15153, 'Opatoro', 0.890113999999999961, 0.0208220000000000002, 8289, 1196);
INSERT INTO municipio VALUES (197, 'Honduras', 1196, 15154, 'San Antonio del Norte', 0.401639000000000024, 0.00550099999999999981, 2745, 1196);
INSERT INTO municipio VALUES (198, 'Honduras', 1196, 15155, 'San José', 0.43535299999999999, 0.00644899999999999987, 9394, 1196);
INSERT INTO municipio VALUES (199, 'Honduras', 1196, 15156, 'San Juan', 0.298329999999999984, 0.00393999999999999993, 2142, 1196);
INSERT INTO municipio VALUES (200, 'Honduras', 1196, 15157, 'San Pedro de Tutule', 0.304375000000000007, 0.00396200000000000024, 6411, 1196);
INSERT INTO municipio VALUES (201, 'Honduras', 1196, 15158, 'Santa Ana', 1.029304, 0.015796000000000001, 11800, 1196);
INSERT INTO municipio VALUES (202, 'Honduras', 1196, 15159, 'Santa Elena', 0.576038999999999968, 0.0139530000000000001, 9208, 1196);
INSERT INTO municipio VALUES (206, 'Honduras', 1197, 15163, 'Belen', 0.70067299999999999, 0.0164739999999999991, 6148, 1197);
INSERT INTO municipio VALUES (207, 'Honduras', 1197, 15164, 'Candelaria', 0.278612000000000026, 0.00438299999999999974, 6916, 1197);
INSERT INTO municipio VALUES (208, 'Honduras', 1197, 15165, 'Cololaca', 0.778255999999999948, 0.0183099999999999999, 6792, 1197);
INSERT INTO municipio VALUES (209, 'Honduras', 1197, 15166, 'Erandique', 0.845825999999999967, 0.0250049999999999994, 14500, 1197);
INSERT INTO municipio VALUES (210, 'Honduras', 1197, 15167, 'Gracias', 1.02852800000000011, 0.0360040000000000013, 49798, 1197);
INSERT INTO municipio VALUES (211, 'Honduras', 1197, 15168, 'Gualcince', 0.602098000000000022, 0.0138200000000000007, 11012, 1197);
INSERT INTO municipio VALUES (212, 'Honduras', 1197, 15169, 'Guarita', 1.03748400000000007, 0.01473, 8765, 1197);
INSERT INTO municipio VALUES (213, 'Honduras', 1197, 15170, 'La Campa', 0.491153999999999979, 0.00983200000000000046, 5297, 1197);
INSERT INTO municipio VALUES (214, 'Honduras', 1197, 15171, 'La Iguala', 1.071882, 0.0308490000000000014, 21951, 1197);
INSERT INTO municipio VALUES (215, 'Honduras', 1197, 15172, 'La Unión', 0.371497000000000022, 0.00760300000000000038, 15647, 1197);
INSERT INTO municipio VALUES (216, 'Honduras', 1197, 15173, 'La Virtud', 0.412320999999999993, 0.00679000000000000003, 6264, 1197);
INSERT INTO municipio VALUES (217, 'Honduras', 1197, 15174, 'Las Flores', 0.527814000000000005, 0.00596499999999999982, 9580, 1197);
INSERT INTO municipio VALUES (218, 'Honduras', 1197, 15175, 'Lepaera', 0.721156000000000019, 0.0259999999999999988, 38200, 1197);
INSERT INTO municipio VALUES (219, 'Honduras', 1197, 15176, 'Mapulaca', 0.247481000000000007, 0.00242500000000000007, 4394, 1197);
INSERT INTO municipio VALUES (220, 'Honduras', 1197, 15177, 'Piraera', 0.64508500000000002, 0.0146389999999999992, 13086, 1197);
INSERT INTO municipio VALUES (221, 'Honduras', 1197, 15178, 'San Andrés', 0.698857999999999979, 0.0205089999999999995, 12677, 1197);
INSERT INTO municipio VALUES (222, 'Honduras', 1197, 15179, 'San Francisco', 0.536766999999999994, 0.0120289999999999998, 18535, 1197);
INSERT INTO municipio VALUES (223, 'Honduras', 1197, 15180, 'San Juan Guarita', 0.391417999999999988, 0.00424699999999999991, 3033, 1197);
INSERT INTO municipio VALUES (234, 'Honduras', 1198, 15191, 'Belén Gualcho', 0.516898999999999997, 0.0133639999999999991, 13680, 1198);
INSERT INTO municipio VALUES (235, 'Honduras', 1198, 15192, 'Concepción', 0.670761999999999969, 0.0110069999999999994, 4852, 1198);
INSERT INTO municipio VALUES (236, 'Honduras', 1198, 15193, 'Dolores Merendon', 0.331880000000000008, 0.00349100000000000018, 3343, 1198);
INSERT INTO municipio VALUES (237, 'Honduras', 1198, 15194, 'Fraternidad', 0.442778999999999978, 0.00725500000000000016, 3237, 1198);
INSERT INTO municipio VALUES (238, 'Honduras', 1198, 15195, 'La Encarnación', 0.310943000000000025, 0.00309800000000000006, 4283, 1198);
INSERT INTO municipio VALUES (239, 'Honduras', 1198, 15196, 'La Labor', 0.43530000000000002, 0.00902500000000000004, 8455, 1198);
INSERT INTO municipio VALUES (240, 'Honduras', 1198, 15197, 'Lucerna', 0.779169, 0.0100059999999999993, 4534, 1198);
INSERT INTO municipio VALUES (241, 'Honduras', 1198, 15198, 'Mercedes', 0.586164000000000018, 0.00699099999999999982, 7955, 1198);
INSERT INTO municipio VALUES (242, 'Honduras', 1198, 15199, 'Ocotepeque', 0.668304000000000009, 0.015514, 21089, 1198);
INSERT INTO municipio VALUES (243, 'Honduras', 1198, 15200, 'San Fernando', 0.382718000000000003, 0.00625000000000000035, 8455, 1198);
INSERT INTO municipio VALUES (94, 'Honduras', 1185, 14980, 'Arizona', 1.38275799999999993, 0.0412720000000000031, 21376, 1185);
INSERT INTO municipio VALUES (95, 'Honduras', 1185, 14981, 'El Porvenir', 1.06903199999999998, 0.0248099999999999987, 15926, 1185);
INSERT INTO municipio VALUES (96, 'Honduras', 1185, 14982, 'Esparta', 1.71604899999999994, 0.0408379999999999993, 16089, 1185);
INSERT INTO municipio VALUES (97, 'Honduras', 1185, 14983, 'Jutiapa', 0.998211999999999988, 0.0453249999999999972, 33842, 1185);
INSERT INTO municipio VALUES (98, 'Honduras', 1185, 14984, 'La Ceiba', 1.48419400000000001, 0.0561019999999999991, 185831, 1185);
INSERT INTO municipio VALUES (99, 'Honduras', 1185, 14985, 'La Masica', 1.31955, 0.0391849999999999976, 28202, 1185);
INSERT INTO municipio VALUES (100, 'Honduras', 1185, 14986, 'San Francisco', 1.08565500000000004, 0.024107, 9945, 1185);
INSERT INTO municipio VALUES (101, 'Honduras', 1185, 14987, 'Tela', 2.34853200000000006, 0.103653999999999996, 87644, 1185);
INSERT INTO municipio VALUES (74, 'Honduras', 1186, 14989, 'Choluteca', 2.64651799999999993, 0.0910549999999999971, 169113, 1186);
INSERT INTO municipio VALUES (75, 'Honduras', 1186, 14990, 'Concepción de Maria', 0.562606999999999968, 0.0134680000000000008, 26950, 1186);
INSERT INTO municipio VALUES (76, 'Honduras', 1186, 14991, 'Duyure', 0.539417999999999953, 0.00877999999999999961, 2882, 1186);
INSERT INTO municipio VALUES (77, 'Honduras', 1186, 14992, 'El Corpus', 0.726231999999999989, 0.019838999999999999, 23603, 1186);
INSERT INTO municipio VALUES (78, 'Honduras', 1186, 14993, 'El Triunfo', 0.737595000000000001, 0.024955999999999999, 46605, 1186);
INSERT INTO municipio VALUES (79, 'Honduras', 1186, 14994, 'Marcovia', 2.2384590000000002, 0.0412700000000000011, 47971, 1186);
INSERT INTO municipio VALUES (80, 'Honduras', 1186, 14995, 'Morolica', 0.734523000000000037, 0.0229740000000000014, 5731, 1186);
INSERT INTO municipio VALUES (109, 'Honduras', 1186, 15002, 'San Marcos de Colón', 1.05136399999999997, 0.0508849999999999997, 24750, 1186);
INSERT INTO municipio VALUES (110, 'Honduras', 1186, 15003, 'Santa Ana de Yusguare', 0.387961999999999974, 0.00619700000000000025, 13524, 1186);
INSERT INTO municipio VALUES (130, 'Honduras', 1188, 15023, 'Lejamaní', 0.236346000000000001, 0.001686, 5246, 1188);
INSERT INTO municipio VALUES (131, 'Honduras', 1188, 15024, 'Meámbar', 0.935339999999999949, 0.0346129999999999979, 12195, 1188);
INSERT INTO municipio VALUES (132, 'Honduras', 1188, 15025, 'Minas de Oro', 1.15423100000000001, 0.0315729999999999969, 12571, 1188);
INSERT INTO municipio VALUES (133, 'Honduras', 1188, 15026, 'Ojo de Agua', 0.412073999999999996, 0.00739300000000000027, 8237, 1188);
INSERT INTO municipio VALUES (134, 'Honduras', 1188, 15027, 'San Jerónimo', 0.615727000000000024, 0.017989999999999999, 19577, 1188);
INSERT INTO municipio VALUES (135, 'Honduras', 1188, 15028, 'San José de Comayagua', 0.435224, 0.00719500000000000001, 6727, 1188);
INSERT INTO municipio VALUES (136, 'Honduras', 1188, 15029, 'San José del Potrero', 0.687173000000000034, 0.0162069999999999992, 6039, 1188);
INSERT INTO municipio VALUES (250, 'Honduras', 1199, 15207, 'Campamento', 0.824856999999999951, 0.0319470000000000032, 20013, 1199);
INSERT INTO municipio VALUES (251, 'Honduras', 1199, 15208, 'Catacamas', 4.49241199999999985, 0.612485999999999975, 112909, 1199);
INSERT INTO municipio VALUES (252, 'Honduras', 1199, 15209, 'Concordia', 0.684320000000000039, 0.0198820000000000004, 6921, 1199);
INSERT INTO municipio VALUES (253, 'Honduras', 1199, 15210, 'Dulce Nombre de Culmí', 2.69302799999999998, 0.246882999999999991, 31431, 1199);
INSERT INTO municipio VALUES (254, 'Honduras', 1199, 15220, 'Mangulile', 1.1307259999999999, 0.0369130000000000014, 8992, 1199);
INSERT INTO municipio VALUES (255, 'Honduras', 1199, 15221, 'Manto', 1.181751, 0.0447950000000000015, 11630, 1199);
INSERT INTO municipio VALUES (261, 'Honduras', 1200, 15234, 'Chinda', 0.550292000000000003, 0.00556400000000000037, 4072, 1200);
INSERT INTO municipio VALUES (262, 'Honduras', 1200, 15235, 'Concepción del Norte', 0.490022999999999986, 0.0117769999999999993, 8186, 1200);
INSERT INTO municipio VALUES (263, 'Honduras', 1200, 15236, 'Concepción del Sur', 0.366449000000000025, 0.00492200000000000016, 7228, 1200);
INSERT INTO municipio VALUES (264, 'Honduras', 1200, 15237, 'El Nispero', 0.384852000000000027, 0.00662599999999999995, 7604, 1200);
INSERT INTO municipio VALUES (265, 'Honduras', 1200, 15238, 'Gualala', 0.353600000000000025, 0.00538999999999999983, 5009, 1200);
INSERT INTO municipio VALUES (266, 'Honduras', 1200, 15239, 'Ilama', 0.587363999999999997, 0.0153709999999999992, 9556, 1200);
INSERT INTO municipio VALUES (267, 'Honduras', 1200, 15240, 'Las Vegas', 0.515695000000000014, 0.0104689999999999991, 19828, 1200);
INSERT INTO municipio VALUES (268, 'Honduras', 1200, 15241, 'Macuelizo', 0.716420999999999975, 0.0205819999999999996, 34998, 1200);
INSERT INTO municipio VALUES (269, 'Honduras', 1200, 15242, 'Naranjito', 0.520588999999999968, 0.0118090000000000001, 11808, 1200);
INSERT INTO municipio VALUES (272, 'Honduras', 1200, 15245, 'Petoa', 0.775019000000000013, 0.0177439999999999994, 11196, 1200);
INSERT INTO municipio VALUES (285, 'Honduras', 1201, 15258, 'Alianza', 1.43642399999999992, 0.0165609999999999993, 6566, 1201);
INSERT INTO municipio VALUES (286, 'Honduras', 1201, 15259, 'Amapala', 1.19214500000000001, 0.0076769999999999998, 11855, 1201);
INSERT INTO municipio VALUES (287, 'Honduras', 1201, 15260, 'Aramecina', 0.425873999999999975, 0.00765599999999999961, 6472, 1201);
INSERT INTO municipio VALUES (288, 'Honduras', 1202, 15267, 'Arenal', 0.767653999999999948, 0.0158039999999999986, 5096, 1202);
INSERT INTO municipio VALUES (289, 'Honduras', 1202, 15268, 'El Negrito', 1.42565699999999995, 0.0420079999999999967, 44054, 1202);
INSERT INTO municipio VALUES (290, 'Honduras', 1202, 15269, 'El Progreso', 1.94144699999999992, 0.0462129999999999971, 204429, 1202);
INSERT INTO municipio VALUES (291, 'Honduras', 1202, 15270, 'Jocón', 0.894256999999999969, 0.0313970000000000013, 8105, 1202);
INSERT INTO municipio VALUES (292, 'Honduras', 1202, 15271, 'Morazán', 1.16814599999999991, 0.0426920000000000008, 38732, 1202);
INSERT INTO municipio VALUES (293, 'Honduras', 1202, 15272, 'Olanchito', 3.01397499999999985, 0.180575000000000013, 95953, 1202);
INSERT INTO municipio VALUES (294, 'Honduras', 1202, 15273, 'Santa Rita', 0.546977999999999964, 0.00992900000000000033, 19702, 1202);
INSERT INTO municipio VALUES (295, 'Honduras', 1202, 15274, 'Sulaco', 0.794030000000000014, 0.0195910000000000008, 13887, 1202);
INSERT INTO municipio VALUES (296, 'Honduras', 1202, 15275, 'Victoria', 1.59195400000000009, 0.0607320000000000013, 28504, 1202);
INSERT INTO municipio VALUES (297, 'Honduras', 1202, 15276, 'Yorito', 0.732218000000000035, 0.0168829999999999987, 14841, 1202);
INSERT INTO municipio VALUES (298, 'Honduras', 1202, 15277, 'Yoro', 2.55145499999999981, 0.189530000000000004, 78797, 1202);
INSERT INTO municipio VALUES (137, 'Honduras', 1188, 15030, 'San Luis', 0.423926000000000025, 0.0100120000000000001, 9041, 1188);
INSERT INTO municipio VALUES (138, 'Honduras', 1188, 15031, 'San Sebastián', 0.601446000000000036, 0.0073959999999999998, 3326, 1188);
INSERT INTO municipio VALUES (139, 'Honduras', 1188, 15032, 'Siguatepeque', 1.05611900000000003, 0.0316559999999999966, 85213, 1188);
INSERT INTO municipio VALUES (140, 'Honduras', 1188, 15033, 'Taulabe', 0.68510099999999996, 0.0183929999999999996, 23362, 1188);
INSERT INTO municipio VALUES (141, 'Honduras', 1188, 15034, 'Villa de San Antonio', 0.961467999999999989, 0.0281099999999999996, 22516, 1188);
INSERT INTO municipio VALUES (8, 'Honduras', 1189, 15048, 'San Antonio', 0.475208000000000019, 0.0105830000000000004, 10562, 1189);
INSERT INTO municipio VALUES (9, 'Honduras', 1189, 15049, 'San Jerónimo', 0.423067000000000026, 0.00615999999999999968, 5267, 1189);
INSERT INTO municipio VALUES (10, 'Honduras', 1189, 15050, 'San José', 0.385518000000000027, 0.00520699999999999982, 6134, 1189);
INSERT INTO municipio VALUES (11, 'Honduras', 1189, 15051, 'San Juan de Opoa', 0.390755000000000019, 0.0062750000000000002, 8792, 1189);
INSERT INTO municipio VALUES (12, 'Honduras', 1189, 15052, 'San Nicolás', 0.454317000000000026, 0.00663300000000000001, 6544, 1189);
INSERT INTO municipio VALUES (13, 'Honduras', 1189, 15053, 'San Pedro', 0.431398000000000004, 0.00517800000000000031, 6482, 1189);
INSERT INTO municipio VALUES (14, 'Honduras', 1189, 15054, 'Santa Rita', 0.745282, 0.0257660000000000007, 29256, 1189);
INSERT INTO municipio VALUES (15, 'Honduras', 1189, 15055, 'Santa Rosa de Copán', 1.23004399999999992, 0.0249179999999999992, 56099, 1189);
INSERT INTO municipio VALUES (16, 'Honduras', 1189, 15056, 'Trinidad', 0.431647000000000003, 0.00649499999999999991, 19400, 1189);
INSERT INTO municipio VALUES (17, 'Honduras', 1189, 15057, 'Veracruz', 0.260118999999999989, 0.00284600000000000001, 3204, 1189);
INSERT INTO municipio VALUES (44, 'Honduras', 1191, 15084, 'Texiguat', 0.648608999999999991, 0.0158140000000000017, 9030, 1191);
INSERT INTO municipio VALUES (45, 'Honduras', 1191, 15085, 'Trojes', 2.04282800000000009, 0.112766000000000005, 44955, 1191);
INSERT INTO municipio VALUES (46, 'Honduras', 1191, 15086, 'Vado Ancho', 0.410250999999999977, 0.00538199999999999963, 4189, 1191);
INSERT INTO municipio VALUES (47, 'Honduras', 1191, 15087, 'Yauyupe', 0.336112000000000022, 0.00605400000000000035, 1493, 1191);
INSERT INTO municipio VALUES (48, 'Honduras', 1191, 15088, 'Yuscarán', 0.82955599999999996, 0.0272760000000000016, 16011, 1191);
INSERT INTO municipio VALUES (162, 'El Salvador', 1193, 15119, 'Juan Francisco Bulnes', 2.48513699999999993, 0.0573079999999999978, 8343, 1193);
INSERT INTO municipio VALUES (163, 'Honduras', 1193, 15120, 'Puerto Lempira', 8.85964599999999969, 0.627499000000000029, 35338, 1193);
INSERT INTO municipio VALUES (164, 'Honduras', 1193, 15121, 'Ramón Villeda Morales', 1.82771400000000006, 0.0528689999999999993, 14034, 1193);
INSERT INTO municipio VALUES (165, 'Honduras', 1193, 15122, 'Wampusirpi', 2.84039000000000019, 0.148065000000000002, 6381, 1193);
INSERT INTO municipio VALUES (170, 'Honduras', 1194, 15127, 'Intibucá', 1.33151599999999992, 0.0434780000000000028, 54321, 1194);
INSERT INTO municipio VALUES (171, 'Honduras', 1194, 15128, 'Jesús de Otoro', 0.969059000000000004, 0.036194999999999998, 28803, 1194);
INSERT INTO municipio VALUES (172, 'Honduras', 1194, 15129, 'La Esperanza', 0.545318999999999998, 0.0123759999999999998, 8946, 1194);
INSERT INTO municipio VALUES (173, 'Honduras', 1194, 15130, 'Magdalena', 0.323882000000000003, 0.00326200000000000014, 4710, 1194);
INSERT INTO municipio VALUES (174, 'Honduras', 1194, 15131, 'Masaguara', 0.846632999999999969, 0.0209289999999999997, 16532, 1194);
INSERT INTO municipio VALUES (175, 'Honduras', 1194, 15132, 'San Antonio', 0.478783999999999987, 0.00796000000000000006, 5549, 1194);
INSERT INTO municipio VALUES (176, 'Honduras', 1194, 15133, 'San Francisco de Opalaca', 0.877604999999999968, 0.0262919999999999994, 9806, 1194);
INSERT INTO municipio VALUES (177, 'Honduras', 1194, 15134, 'San Isidro', 0.387705000000000022, 0.00732899999999999958, 4278, 1194);
INSERT INTO municipio VALUES (178, 'Honduras', 1194, 15135, 'San Juan', 0.515657000000000032, 0.0146820000000000006, 14587, 1194);
INSERT INTO municipio VALUES (179, 'Honduras', 1194, 15136, 'San Marcos de la Sierra', 0.513261999999999996, 0.0119240000000000006, 8610, 1194);
INSERT INTO municipio VALUES (180, 'Honduras', 1194, 15137, 'San Miguelito', 0.654542999999999986, 0.0133089999999999996, 6627, 1194);
INSERT INTO municipio VALUES (181, 'Honduras', 1194, 15138, 'Santa Lucía', 0.405540999999999985, 0.00413300000000000039, 5475, 1194);
INSERT INTO municipio VALUES (182, 'Honduras', 1194, 15139, 'Yamaranguila', 0.82866799999999996, 0.0252670000000000013, 21640, 1194);
INSERT INTO municipio VALUES (203, 'Honduras', 1196, 15160, 'Santa María', 0.536534999999999984, 0.00802800000000000041, 9912, 1196);
INSERT INTO municipio VALUES (204, 'Honduras', 1196, 15161, 'Santiago de Puringla', 0.622454999999999981, 0.011658, 15492, 1196);
INSERT INTO municipio VALUES (205, 'Honduras', 1196, 15162, 'Yarula', 0.665553999999999979, 0.00852499999999999959, 8218, 1196);
INSERT INTO municipio VALUES (224, 'Honduras', 1197, 15181, 'San Manuel Colohete', 0.601858000000000004, 0.0144580000000000004, 14036, 1197);
INSERT INTO municipio VALUES (225, 'Honduras', 1197, 15182, 'San Marcos de Caiquín', 0.48061100000000001, 0.00737499999999999961, 5170, 1197);
INSERT INTO municipio VALUES (226, 'Honduras', 1197, 15183, 'San Rafael', 0.472621999999999987, 0.00870199999999999967, 12919, 1197);
INSERT INTO municipio VALUES (227, 'Honduras', 1197, 15184, 'San Sebastian', 0.678026000000000018, 0.0192879999999999996, 9714, 1197);
INSERT INTO municipio VALUES (228, 'Honduras', 1197, 15185, 'Santa Cruz', 0.621176999999999979, 0.0123180000000000008, 6326, 1197);
INSERT INTO municipio VALUES (229, 'Honduras', 1197, 15186, 'Talgua', 0.412654000000000021, 0.00683000000000000013, 10181, 1197);
INSERT INTO municipio VALUES (230, 'Honduras', 1197, 15187, 'Tambla', 0.482121000000000022, 0.00518900000000000004, 2516, 1197);
INSERT INTO municipio VALUES (231, 'Honduras', 1197, 15188, 'Tomalá', 0.35178100000000001, 0.00365100000000000017, 6370, 1197);
INSERT INTO municipio VALUES (232, 'Honduras', 1197, 15189, 'Valladolid', 0.391753000000000018, 0.00647299999999999959, 3647, 1197);
INSERT INTO municipio VALUES (233, 'Honduras', 1197, 15190, 'Virginia', 0.239404000000000006, 0.00226500000000000009, 2874, 1197);
INSERT INTO municipio VALUES (244, 'Honduras', 1198, 15201, 'San Francisco del Valle', 0.530886999999999998, 0.00890400000000000046, 7928, 1198);
INSERT INTO municipio VALUES (245, 'Honduras', 1198, 15202, 'San Jorge', 0.352899999999999991, 0.00421600000000000013, 5073, 1198);
INSERT INTO municipio VALUES (246, 'Honduras', 1198, 15203, 'San Marcos', 0.791459000000000024, 0.0142010000000000001, 20824, 1198);
INSERT INTO municipio VALUES (247, 'Honduras', 1198, 15204, 'Santa Fé', 0.530098999999999987, 0.00657799999999999965, 4639, 1198);
INSERT INTO municipio VALUES (248, 'Honduras', 1198, 15205, 'Sensenti', 0.629873000000000016, 0.0098750000000000001, 9895, 1198);
INSERT INTO municipio VALUES (249, 'Honduras', 1198, 15206, 'Sinuapa', 0.644658999999999982, 0.0122749999999999995, 6696, 1198);
INSERT INTO municipio VALUES (256, 'Honduras', 1199, 15222, 'Patuca', 1.2987740000000001, 0.0655870000000000064, 29575, 1199);
INSERT INTO municipio VALUES (257, 'Honduras', 1199, 15223, 'Salamá', 0.946575999999999973, 0.0286159999999999991, 7015, 1199);
INSERT INTO municipio VALUES (258, 'Honduras', 1199, 15224, 'San Esteban', 1.94329200000000002, 0.163069999999999993, 24708, 1199);
INSERT INTO municipio VALUES (259, 'Honduras', 1199, 15225, 'San Francisco de Becerra', 0.735016000000000003, 0.0250140000000000015, 6010, 1199);
INSERT INTO municipio VALUES (260, 'Honduras', 1199, 15226, 'San Francisco de la Paz', 0.832813000000000025, 0.0425579999999999986, 5971, 1199);
INSERT INTO municipio VALUES (270, 'Honduras', 1200, 15243, 'Nueva Frontera', 0.494420999999999999, 0.0137029999999999999, 16136, 1200);
INSERT INTO municipio VALUES (271, 'Honduras', 1200, 15244, 'Nuevo Celilac', 0.627615000000000034, 0.0127130000000000003, 7361, 1200);
INSERT INTO municipio VALUES (273, 'Honduras', 1200, 15246, 'Protección', 0.52981900000000004, 0.0129999999999999994, 16880, 1200);
INSERT INTO municipio VALUES (274, 'Honduras', 1200, 15247, 'Quimistán', 1.27746899999999997, 0.0676159999999999956, 37834, 1200);
INSERT INTO municipio VALUES (275, 'Honduras', 1200, 15248, 'San Francisco de Ojuera', 0.642414999999999958, 0.0154009999999999998, 12050, 1200);
INSERT INTO municipio VALUES (276, 'Honduras', 1200, 15249, 'San José de Colinas', 0.772862999999999967, 0.0192470000000000002, 17205, 1200);
INSERT INTO municipio VALUES (277, 'Honduras', 1200, 15250, 'San Luis', 0.932674000000000003, 0.0336790000000000006, 29672, 1200);
INSERT INTO municipio VALUES (278, 'Honduras', 1200, 15251, 'San Marcos', 0.659067999999999987, 0.0186969999999999983, 14748, 1200);
INSERT INTO municipio VALUES (279, 'Honduras', 1200, 15252, 'San Nicolás', 0.646484999999999976, 0.00727299999999999995, 13909, 1200);
INSERT INTO municipio VALUES (280, 'Honduras', 1200, 15253, 'San Pedro Zacapa', 0.664968000000000004, 0.0159359999999999988, 9268, 1200);
INSERT INTO municipio VALUES (281, 'Honduras', 1200, 15254, 'San Vicente Centenario', 0.251058999999999977, 0.00275999999999999987, 3492, 1200);
INSERT INTO municipio VALUES (282, 'Honduras', 1200, 15255, 'Santa Bárbara', 0.915660000000000029, 0.0255249999999999991, 39237, 1200);
INSERT INTO municipio VALUES (283, 'Honduras', 1200, 15256, 'Santa Rita', 0.357126999999999972, 0.00674899999999999979, 3272, 1200);
INSERT INTO municipio VALUES (284, 'Honduras', 1200, 15257, 'Trinidad de Copán', 0.829589000000000021, 0.0173169999999999991, 6408, 1200);


--
-- Name: municipios_gid_seq; Type: SEQUENCE SET; Schema: curso; Owner: alumno
--

SELECT pg_catalog.setval('municipios_gid_seq', 298, true);


--
-- Data for Name: responsable; Type: TABLE DATA; Schema: curso; Owner: alumno
--

INSERT INTO responsable VALUES ('1111-dfdsf', 'Luis', 'García', 'equipo-1');
INSERT INTO responsable VALUES ('34234-fd', 'Pedro', 'Montesiones', 'equipo-3');
INSERT INTO responsable VALUES ('jkhlkjhdf', 'Manuel', 'Solano', 'equipo-4');


--
-- Data for Name: trabajador; Type: TABLE DATA; Schema: curso; Owner: alumno
--

INSERT INTO trabajador VALUES ('111111-aa', 'Miguel', 'García', 'equipo-1');
INSERT INTO trabajador VALUES ('2222222-bb', 'Pedro', 'Luis', 'equipo-1');
INSERT INTO trabajador VALUES ('333333-cc', 'Juan', 'Di Mará', 'equipo-2');
INSERT INTO trabajador VALUES ('4444444-dd', 'Lionel', 'Messi', 'equipo-2');
INSERT INTO trabajador VALUES ('5555555-cc', 'Marc', 'Marcquez', 'equipo-3');
INSERT INTO trabajador VALUES ('66666-gg', 'Jorge', 'Lorenzo', 'equipo-3');
INSERT INTO trabajador VALUES ('77777-hh', 'Cristiano', 'Ronaldo', 'equipo-3');


--
-- Data for Name: zona; Type: TABLE DATA; Schema: curso; Owner: alumno
--

INSERT INTO zona VALUES (1, 1);
INSERT INTO zona VALUES (2, 2);
INSERT INTO zona VALUES (3, 3);
INSERT INTO zona VALUES (4, 4);
INSERT INTO zona VALUES (5, 5);
INSERT INTO zona VALUES (6, 6);
INSERT INTO zona VALUES (7, 7);
INSERT INTO zona VALUES (8, 8);
INSERT INTO zona VALUES (9, 9);
INSERT INTO zona VALUES (10, 10);


--
-- Data for Name: zona_equipo; Type: TABLE DATA; Schema: curso; Owner: alumno
--

INSERT INTO zona_equipo VALUES (1, 'equipo-1');
INSERT INTO zona_equipo VALUES (2, 'equipo-2');
INSERT INTO zona_equipo VALUES (3, 'equipo-2');
INSERT INTO zona_equipo VALUES (4, 'equipo-5');
INSERT INTO zona_equipo VALUES (5, 'equipo-5');
INSERT INTO zona_equipo VALUES (6, 'equipo-5');
INSERT INTO zona_equipo VALUES (7, 'equipo-3');
INSERT INTO zona_equipo VALUES (8, 'equipo-4');


--
-- Name: zona_id_seq; Type: SEQUENCE SET; Schema: curso; Owner: alumno
--

SELECT pg_catalog.setval('zona_id_seq', 10, true);


--
-- Name: departamentos_pkey; Type: CONSTRAINT; Schema: curso; Owner: alumno; Tablespace: 
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id);


--
-- Name: municipios_pkey; Type: CONSTRAINT; Schema: curso; Owner: alumno; Tablespace: 
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT municipios_pkey PRIMARY KEY (id);


--
-- Name: pk_barrios; Type: CONSTRAINT; Schema: curso; Owner: alumno; Tablespace: 
--

ALTER TABLE ONLY barrio
    ADD CONSTRAINT pk_barrios PRIMARY KEY (id);


--
-- Name: pk_equipo; Type: CONSTRAINT; Schema: curso; Owner: alumno; Tablespace: 
--

ALTER TABLE ONLY equipo
    ADD CONSTRAINT pk_equipo PRIMARY KEY (nombre);


--
-- Name: pk_persona; Type: CONSTRAINT; Schema: curso; Owner: alumno; Tablespace: 
--

ALTER TABLE ONLY trabajador
    ADD CONSTRAINT pk_persona PRIMARY KEY (numero_sanitario);


--
-- Name: pk_responsable; Type: CONSTRAINT; Schema: curso; Owner: alumno; Tablespace: 
--

ALTER TABLE ONLY responsable
    ADD CONSTRAINT pk_responsable PRIMARY KEY (numero_sanitario);


--
-- Name: pk_zona; Type: CONSTRAINT; Schema: curso; Owner: alumno; Tablespace: 
--

ALTER TABLE ONLY zona
    ADD CONSTRAINT pk_zona PRIMARY KEY (id);


--
-- Name: pk_zona_equipo; Type: CONSTRAINT; Schema: curso; Owner: alumno; Tablespace: 
--

ALTER TABLE ONLY zona_equipo
    ADD CONSTRAINT pk_zona_equipo PRIMARY KEY (id_zona);


--
-- Name: fk_barrio_zona; Type: FK CONSTRAINT; Schema: curso; Owner: alumno
--

ALTER TABLE ONLY barrio
    ADD CONSTRAINT fk_barrio_zona FOREIGN KEY (zona) REFERENCES zona(id);


--
-- Name: fk_equipo; Type: FK CONSTRAINT; Schema: curso; Owner: alumno
--

ALTER TABLE ONLY zona_equipo
    ADD CONSTRAINT fk_equipo FOREIGN KEY (id_equipo) REFERENCES equipo(nombre);


--
-- Name: fk_municipio_barrios; Type: FK CONSTRAINT; Schema: curso; Owner: alumno
--

ALTER TABLE ONLY barrio
    ADD CONSTRAINT fk_municipio_barrios FOREIGN KEY (municipio) REFERENCES municipio(id);


--
-- Name: fk_municipios_departamento; Type: FK CONSTRAINT; Schema: curso; Owner: alumno
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT fk_municipios_departamento FOREIGN KEY (departamento) REFERENCES departamento(id);


--
-- Name: fk_persona_equipo; Type: FK CONSTRAINT; Schema: curso; Owner: alumno
--

ALTER TABLE ONLY trabajador
    ADD CONSTRAINT fk_persona_equipo FOREIGN KEY (equipo) REFERENCES equipo(nombre);


--
-- Name: fk_responsable_equipo; Type: FK CONSTRAINT; Schema: curso; Owner: alumno
--

ALTER TABLE ONLY responsable
    ADD CONSTRAINT fk_responsable_equipo FOREIGN KEY (equipo) REFERENCES equipo(nombre);


--
-- Name: fk_zona; Type: FK CONSTRAINT; Schema: curso; Owner: alumno
--

ALTER TABLE ONLY zona_equipo
    ADD CONSTRAINT fk_zona FOREIGN KEY (id_zona) REFERENCES zona(id);


--
-- PostgreSQL database dump complete
--


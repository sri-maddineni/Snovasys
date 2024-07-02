drop table if exists customers;

drop table if exists orders;

drop table if exists shippings;

drop table if exists trains;

drop table if exists costs;

drop table if exists stations;

drop table if exists timings;

drop table if exists dist;

create table trains(
    number int,
    name varchar,
    scode varchar,
    dcode varchar,
    type varchar,
    cpk float
);

create table stations(sno int, stcode varchar, name varchar);

create table timings(
    tnum int,
    stcode varchar,
    arr time,
    dep time
);

create table dist (
    tid int,
    st1 varchar,
    st2 varchar,
    distance int
);

create table distances(
    tnum int,
    st1 varchar,
    st2 varchar,
    cost int,
    dur time
);

delete from
    trains;

INSERT INTO
    trains (number, name, scode, dcode, type, cpk)
VALUES
    (
        22834,
        'BHUBANESWAR HUMSAFAR EXPRESS',
        'NLR',
        'OGL',
        'EXPRESS',
        0.64
    ),
    (
        13352,
        'DHANBAD EXPRESS',
        'NLR',
        'OGL',
        'EXPRESS',
        0.51
    ),
    (
        17249,
        'KAKINADA TOWN EXPRESS',
        'NLR',
        'OGL',
        'EXPRESS',
        0.51
    ),
    (
        22648,
        'KORBA SF EXPRESS',
        'NLR',
        'OGL',
        'EXPRESS',
        0.64
    ),
    (
        17229,
        'SABARI EXPRESS',
        'NLR',
        'OGL',
        'EXPRESS',
        0.51
    );

INSERT INTO
    trains (number, name, scode, dcode, type, cpk)
VALUES
    (
        22833,
        'SMVT BENGALURU HUMSAFAR EXPRESS',
        'OGL',
        'NLR',
        'EXPRESS',
        0.64
    ),
    (
        13351,
        'ALAPPUZHA EXPRESS',
        'OGL',
        'NLR',
        'EXPRESS',
        0.51
    ),
    (
        17250,
        'TIRUPATI EXPRESS',
        'OGL',
        'NLR',
        'EXPRESS',
        0.51
    ),
    (
        22647,
        'KOCHUVELI SF EXPRESS',
        'OGL',
        'NLR',
        'EXPRESS',
        0.64
    ),
    (
        17230,
        'SABARI EXPRESS',
        'OGL',
        'NLR',
        'EXPRESS',
        0.51
    );

insert into
    trains
values
    (
        22708,
        'VISAKHAPATNAM AC DOUBLE DECKER EXPRESS',
        'NLR',
        'BZA',
        'EXPRESS',
        0.41
    ),
    (
        08312,
        'SAMBALPUR ED SBP SPL EXPRESS',
        'NLR',
        'BZA',
        'EXPRESS',
        0.37
    ),
    (
        12846,
        'BHUBANESWAR SF EXPRESS',
        'NLR',
        'BZA',
        'SF EXPRESS',
        0.43
    ),
    (
        08544,
        'VISAKHAPATNAM SPECIAL FARE SF EXPRESS',
        'NLR',
        'BZA',
        'SF EXPRESS',
        0.43
    ),
    (
        17643,
        'CIRCAR EXPRESS',
        'VM',
        'CCT',
        'EXPRESS',
        0.51
    ),
    (
        06507,
        'KHARAGPUR SPECIAL FARE SUMMER SPECIAL',
        'NLR',
        'BZA',
        'EXPRESS',
        0.37
    );

delete from
    stations;

INSERT INTO
    stations (sno, stcode, name)
VALUES
    (1, 'NLR', 'NELLORE'),
    (2, 'BTTR', 'BITRAGUNTA'),
    (3, 'KVZ', 'KAVALI'),
    (4, 'SKM', 'SINGARAYAKONDA'),
    (5, 'TNR', 'TANGUTURU'),
    (6, 'OGL', 'ONGOLE'),
    (7, 'CLX', 'CHIRALA'),
    (8, 'BPP', 'BAPATLA'),
    (9, 'NDO', 'NIDUBROLU'),
    (10, 'TEL', 'TENALI'),
    (11, 'BZA', 'VIJAYAWADA'),
    (12, 'GDV', 'GUDIVADA'),
    (13, 'KKLR', 'KAIKALURU'),
    (14, 'AKVD', 'AKIVIDU'),
    (15, 'BVRT', 'BHIMAVARAM TOWN'),
    (16, 'TNKU', 'TANUKU'),
    (17, 'NDD', 'NIDADAVOLU'),
    (18, 'RJY', 'RAJAHMUNDRY'),
    (19, 'APT', 'ANAPARTI'),
    (20, 'SLO', 'SAMALKOT JUNCTION'),
    (21, 'CCT', 'KAKINADA');

DELETE FROM
    DIST;

INSERT INTO
    dist (tid, st1, st2, distance)
VALUES
    (1, 'NLR', 'BTTR', 34),
    (2, 'NLR', 'KVZ', 50),
    (3, 'NLR', 'SKM', 88),
    (4, 'NLR', 'TNR', 90),
    (5, 'NLR', 'OGL', 116),
    (6, 'NLR', 'CLX', 166),
    (7, 'NLR', 'BPP', 181),
    (8, 'NLR', 'NDO', 201),
    (9, 'NLR', 'TEL', 233),
    (10, 'NLR', 'BZA', 255),
    (11, 'NLR', 'GDV', 298),
    (12, 'NLR', 'KKLR', 327),
    (13, 'NLR', 'AKVD', 344),
    (14, 'NLR', 'BVRT', 362),
    (15, 'NLR', 'TNKU', 393),
    (16, 'NLR', 'NDD', 382),
    (17, 'NLR', 'RJY', 404),
    (18, 'NLR', 'APT', 428),
    (19, 'NLR', 'SLO', 454),
    (20, 'NLR', 'CCT', 467);

-- inserting into costs table from here
DELETE FROM
    COSTS;

INSERT INTO
    COSTS
VALUES
    (22834, 'NLR', 'OGL', 75, '01:30:00');

INSERT INTO
    COSTS
VALUES
    (13352, 'NLR', 'KVZ', 30, '00:40:00'),
    (13352, 'NLR', 'SKM', 50, '01:10:00'),
    (13352, 'NLR', 'OGL', 60, '01:45:00'),
    (13352, 'KVZ', 'SKM', 30, '00:30:00'),
    (13352, 'KVZ', 'OGL', 40, '01:05:00'),
    (13352, 'SKM', 'OGL', 30, '00:35:00');

INSERT INTO
    COSTS
VALUES
    (17249, 'NLR', 'KVZ', 30, '00:45:00'),
    (17249, 'NLR', 'SKM', 50, '01:10:00'),
    (17249, 'NLR', 'TNR', 50, '01:20:00'),
    (17249, 'NLR', 'OGL', 60, '02:00:00'),
    (17249, 'KVZ', 'SKM', 30, '00:25:00'),
    (17249, 'KVZ', 'TNR', 30, '00:35:00'),
    (17249, 'KVZ', 'OGL', 40, '01:15:00'),
    (17249, 'SKM', 'TNR', 30, '00:10:00'),
    (17249, 'SKM', 'OGL', 30, '00:35:00'),
    (17249, 'TNR', 'OGL', 30, '00:40:00');

INSERT INTO
    COSTS
VALUES
    (22648, 'NLR', 'OGL', 75, '01:45:00');

INSERT INTO
    COSTS
VALUES
    (17229, 'NLR', 'SKM', 50, '01:05:00'),
    (17229, 'NLR', 'OGL', 75, '01:40:00'),
    (17229, 'SKM', 'OGL', 30, '00:35:00');

--RETURNING TRAINS FROM HERE
INSERT INTO
    COSTS
VALUES
    (22833, 'OGL', 'NLR', 75, '01:30:00');

INSERT INTO
    COSTS
VALUES
    (13351, 'KVZ', 'NLR', 30, '00:45:00'),
    (13351, 'SKM', 'NLR', 50, '01:15:00'),
    (13351, 'OGL', 'NLR', 60, '01:35:00'),
    (13351, 'SKM', 'KVZ', 30, '00:30:00'),
    (13351, 'OGL', 'KVZ', 40, '00:50:00'),
    (13351, 'OGL', 'SKM', 30, '00:20:00');

INSERT INTO
    COSTS
VALUES
    (17250, 'KVZ', 'NLR', 30, '01:55:00'),
    (17250, 'SKM', 'NLR', 50, '02:20:00'),
    (17250, 'TNR', 'NLR', 50, '02:30:00'),
    (17250, 'OGL', 'NLR', 60, '02:40:00'),
    (17250, 'SKM', 'KVZ', 30, '00:25:00'),
    (17250, 'TNR', 'KVZ', 30, '00:35:00'),
    (17250, 'OGL', 'KVZ', 40, '00:45:00'),
    (17250, 'TNR', 'SKM', 30, '00:10:00'),
    (17250, 'OGL', 'SKM', 30, '00:20:00'),
    (17250, 'OGL', 'TNR', 30, '00:10:00');

INSERT INTO
    COSTS
VALUES
    (22647, 'OGL', 'NLR', 75, '01:35:00');

INSERT INTO
    COSTS
VALUES
    (17230, 'SKM', 'NLR', 50, '01:15:00'),
    (17230, 'OGL', 'NLR', 75, '01:40:00'),
    (17230, 'OGL', 'SKM', 30, '00:25:00');

--ISNERTING INTO TIMINGS TABLE
insert into
    timings
values
    (22834, 'NLR', '12:43:00', '12:45:00'),
    (22834, 'OGL', '02:13:00', '02:15:00');

insert into
    timings
values
    (13352, 'NLR', '12:58:00', '01:00:00'),
    (13352, 'KVZ', '01:38:00', '01:40:00'),
    (13352, 'SKM', '02:09:00', '02:10:00'),
    (13352, 'OGL', '02:43:00', '02:45:00');

insert into
    timings
values
    (17249, 'NLR', '01:28:00', '01:30:00'),
    (17249, 'KVZ', '02:13:00', '02:15:00'),
    (17249, 'SKM', '02:38:00', '02:40:00'),
    (17249, 'TNR', '02:48:00', '02:50:00'),
    (17249, 'OGL', '03:28:00', '03:30:00'),
    (17249, 'CLX', '04:09:00', '04:10:00'),
    (17249, 'BPP', '04:28:00', '04:30:00'),
    (17249, 'NDO', '04:53:00', '04:55:00'),
    (17249, 'TEL', '05:18:00', '05:20:00'),
    (17249, 'BZA', '06:55:00', '07:00:00'),
    (17249, 'NDD', '09:09:00', '09:10:00'),
    (17249, 'RJY', '09:48:00', '09:50:00'),
    (17249, 'APT', '10:14:00', '10:15:00'),
    (17249, 'SLO', '10:43:00', '10:45:00'),
    (17249, 'CCT', '11:45:00', '-');

insert into
    timings
values
    (22648, 'NLR', '01:59:00', '02:00:00'),
    (22648, 'OGL', '03:44:00', '03:45:00');

insert into
    timings
values
    (17229, 'NLR', '02:34:00', '02:35:00'),
    (17229, 'SKM', '03:39:00', '03:40:00'),
    (17229, 'OGL', '04:13:00', '04:15:00');

--return trains from ong to nellore timings
insert into
    timings
values
    (22833, 'NLR', '04:33:00', '04:35:00'),
    (22833, 'OGL', '03:08:00', '03:10:00');

insert into
    timings
values
    (13351, 'NLR', '19:53:00', '19:55:00'),
    (13351, 'KVZ', '19:09:00', '19:10:00'),
    (13351, 'SKM', '18:38:00', '18:40:00'),
    (13351, 'OGL', '18:19:00', '18:20:00');

insert into
    timings
values
    (17250, 'NLR', '01:08:00', '01:10:00'),
    (17250, 'KVZ', '23:13:00', '23:15:00'),
    (17250, 'SKM', '22:49:00', '22:50:00'),
    (17250, 'TNR', '22:39:00', '22:40:00'),
    (17250, 'OGL', '22:29:00', '22:30:00');

insert into
    timings
values
    (22647, 'NLR', '19:18:00', '19:20:00'),
    (22647, 'OGL', '17:43:00', '17:45:00');

insert into
    timings
values
    (17230, 'NLR', '21:24:00', '21:25:00'),
    (17230, 'SKM', '20:09:00', '20:10:00'),
    (17230, 'OGL', '19:44:00', '19:45:00');

insert into
    timings
values
    (22708, 'NLR', '12:03:00', '12:05:00'),
    (22708, 'OGL', '01:34:00', '01:35:00'),
    (22708, 'CLX', '02:09:00', '02:10:00'),
    (22708, 'TEL', '02:58:00', '03:00:00'),
    (22708, 'BZA', '04:25:00', '04:35:00');

insert into
    timings
values
    (08312, 'NLR', '12:05:00', '12:07:00'),
    (08312, 'OGL', '01:38:00', '01:40:00'),
    (08312, 'CLX', '02:17:00', '02:19:00'),
    (08312, 'TEL', '03:03:00', '03:05:00'),
    (08312, 'BZA', '04:10:00', '04:30:00');

insert into
    timings
values
    (12846, 'NLR', '12:44:00', '12:45:00'),
    (12846, 'BZA', '04:15:00', '04:25:00');

insert into
    timings
values
    (08544, 'NLR', '01:13:00', '01:15:00'),
    (08544, 'OGL', '02:42:00', '02:44:00'),
    (08544, 'BZA', '04:45:00', '04:55:00');

insert into
    timings
values
    (08544, 'NLR', '01:13:00', '01:15:00'),
    (08544, 'OGL', '02:42:00', '02:44:00'),
    (08544, 'BZA', '04:45:00', '04:55:00');

------------------------------
------------------------------
------------------------------
------------------------------
------------------------------
------------------------------
------------------------------
------------------------------
------------------------------
-------------------------------
SELECT STCODE FROM (
        SELECT STCODE, ARR 
        FROM TIMINGS 
        WHERE TNUM = 13352 
        ORDER BY ARR 
        LIMIT (
                SELECT COUNT(*) / 2
                FROM TIMINGS
                WHERE TNUM = 13352
            )
    )
ORDER BY ARR DESC
LIMIT 1;
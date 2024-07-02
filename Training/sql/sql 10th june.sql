drop table if exists customers;

drop table if exists orders;

drop table if exists shippings;

drop table if exists trains;

drop table if exists stops;

create table trains(
    tno int,
    name varchar,
    source varchar,
    dest varchar,
    type varchar
);

create table stops(
    tno int,
    stopno int,
    stop varchar,
    arr time,
    dep time,
    sdis int,
    cost float
);

delete from
    stops;

INSERT INTO
    stops (tno, stopno, stop, sdis, arr, dep, cost)
VALUES
    (17249, 1, 'TPTY', 0, NULL, '22:45', 0),
    (17249, 2, 'RU', 9, '23:08', '23:10', 30),
    (17249, 3, 'YPD', 19, '23:24', '23:25', 30),
    (17249, 4, 'KHT', 33, '23:34', '23:35', 30),
    (17249, 5, 'YLK', 45, '23:44', '23:45', 30),
    (17249, 6, 'VKI', 57, '23:54', '23:55', 35),
    (17249, 7, 'NDZ', 65, '00:01', '00:02', 40),
    (17249, 8, 'VDD', 74, '00:09', '00:10', 45),
    (17249, 9, 'KQA', 83, '00:19', '00:20', 45),
    (17249, 10, 'NLR', 131, '01:28', '01:30', 60),
    (17249, 11, 'KVZ', 182, '02:13', '02:15', 75),
    (17249, 12, 'SKM', 220, '02:38', '02:40', 85),
    (17249, 13, 'TNR', 229, '02:48', '02:50', 90),
    (17249, 14, 'OGL', 248, '03:28', '03:30', 95),
    (6507, 1, 'SMVB', 0, NULL, '15:50', 0),
    (6507, 2, 'KJM', 4, '16:00', '16:05', 30),
    (6507, 3, 'BWT', 60, '16:38', '16:40', 35),
    (6507, 4, 'KPN', 95, '17:04', '17:05', 50),
    (6507, 5, 'JTJ', 135, '18:45', '18:50', 60),
    (6507, 6, 'KPD', 220, '20:00', '20:10', 85),
    (6507, 7, 'RU', 344, '22:30', '22:35', 125),
    (6507, 8, 'GDR', 428, '00:35', '00:45', 145),
    (6507, 9, 'NLR', 456, '01:13', '01:15', 155),
    (8312, 1, 'ED', 0, NULL, '14:45', 0),
    (8312, 2, 'SA', 59, '15:47', '15:50', 35),
    (8312, 3, 'JTJ', 180, '17:45', '18:10', 75),
    (8312, 4, 'KPD', 264, '19:00', '19:05', 100),
    (8312, 5, 'PER', 388, '20:50', '20:55', 135),
    (8312, 6, 'GDR', 526, '23:33', '23:35', 170),
    (8312, 7, 'NLR', 564, '00:05', '00:07', 180),
    (8312, 8, 'OGL', 681, '01:38', '01:40', 210),
    (8312, 9, 'CLX', 730, '02:17', '02:19', 220),
    (8312, 10, 'TEL', 788, '03:03', '03:05', 230),
    (8312, 11, 'BZA', 819, '04:10', '04:30', 235),
    (8312, 12, 'GDV', 863, '05:20', '05:22', 250),
    (8312, 13, 'KKLR', 892, '05:56', '05:58', 255),
    (8312, 14, 'BVRT', 926, '06:28', '06:30', 260);

INSERT INTO
    trains (tno, name, source, dest, type)
VALUES
    (
        17249,
        'KAKINADA TOWN EXPRESS',
        'TPTY',
        'CCT',
        'EXPRESS'
    ),
    (
        6507,
        'KHARAGPUR SPECIAL FARE SUMMER SPECIAL',
        'SMVB',
        'NLR',
        'EXPRESS'
    ),
    (
        8312,
        'SAMBALPUR ED SBP SPL',
        'ED',
        'SBP',
        'EXPRESS'
    );

create table stations(
    sno int,
    stcode varchar,
    name varchar
);

INSERT INTO
    stations (sno, stcode, name)
VALUES
    (1, 'TPTY', 'TIRUPATI'),
    (2, 'RU', 'RENIGUNTA JUNCTION'),
    (3, 'YPD', 'YERPEDU'),
    (4, 'KHT', 'SRI KALAHASTI'),
    (5, 'YLK', 'YELLAKURU'),
    (6, 'VKI', 'VENKATAGIRI'),
    (7, 'NDZ', 'NIDIGALLU'),
    (8, 'VDD', 'VENDODU'),
    (9, 'KQA', 'KONDAGUNTA'),
    (10, 'NLR', 'NELLORE'),
    (11, 'KVZ', 'KAVALI'),
    (12, 'SKM', 'SINGARAYAKONDA'),
    (13, 'TNR', 'TANGUTURU'),
    (14, 'OGL', 'ONGOLE'),
    (15, 'SMVB', 'SMVT BENGALURU'),
    (16, 'KJM', 'KRISHNARAJAPURAM'),
    (17, 'BWT', 'BANGARAPET'),
    (18, 'KPN', 'KUPPAM'),
    (19, 'JTJ', 'JOLARPETTAI JUNCTION'),
    (20, 'KPD', 'KATPADI JUNCTION'),
    (21, 'GDR', 'GUDUR JUNCTION'),
    (22, 'ED', 'ERODE JUNCTION'),
    (23, 'SA', 'SALEM JUNCTION'),
    (24, 'PER', 'PERAMBUR'),
    (25, 'CLX', 'CHIRALA'),
    (26, 'TEL', 'TENALI JUNCTION'),
    (27, 'BZA', 'VIJAYAWADA JUNCTION'),
    (28, 'GDV', 'GUDLA VALLERU'),
    (29, 'KKLR', 'KAIKALUR'),
    (30, 'BVRT', 'BHIMAVARAM TOWN');
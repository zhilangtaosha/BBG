--1.
CREATE TABLE RADM.W_MCAL_DAY_D_FUTURE AS
SELECT * FROM RADM.W_MCAL_DAY_D T 
WHERE 1=2;
COMMIT;
--2.
SELECT * FROM RADM.W_MCAL_DAY_D ORDER BY 1;
--3.
CREATE TABLE SOLARDATA
(
YEARID INTEGER NOT NULL, -- 农历表
DATA CHAR(7) NOT NULL, -- 农历年对应的16进制数
DATAINT INTEGER NOT NULL -- 农历年对应的10进制数
);
--4.
INSERT INTO SOLARDATA VALUES(1900, '0x04bd8', 19416);
INSERT INTO SOLARDATA VALUES(1901, '0x04ae0', 19168);
INSERT INTO SOLARDATA VALUES(1902, '0x0a570', 42352);
INSERT INTO SOLARDATA VALUES(1903, '0x054d5', 21717);
INSERT INTO SOLARDATA VALUES(1904, '0x0d260', 53856);
INSERT INTO SOLARDATA VALUES(1905, '0x0d950', 55632);
INSERT INTO SOLARDATA VALUES(1906, '0x16554', 91476);
INSERT INTO SOLARDATA VALUES(1907, '0x056a0', 22176);
INSERT INTO SOLARDATA VALUES(1908, '0x09ad0', 39632);
INSERT INTO SOLARDATA VALUES(1909, '0x055d2', 21970);
INSERT INTO SOLARDATA VALUES(1910, '0x04ae0', 19168);
INSERT INTO SOLARDATA VALUES(1911, '0x0a5b6', 42422);
INSERT INTO SOLARDATA VALUES(1912, '0x0a4d0', 42192);
INSERT INTO SOLARDATA VALUES(1913, '0x0d250', 53840);
INSERT INTO SOLARDATA VALUES(1914, '0x1d255', 119381);
INSERT INTO SOLARDATA VALUES(1915, '0x0b540', 46400);
INSERT INTO SOLARDATA VALUES(1916, '0x0d6a0', 54944);
INSERT INTO SOLARDATA VALUES(1917, '0x0ada2', 44450);
INSERT INTO SOLARDATA VALUES(1918, '0x095b0', 38320);
INSERT INTO SOLARDATA VALUES(1919, '0x14977', 84343);
INSERT INTO SOLARDATA VALUES(1920, '0x04970', 18800);
INSERT INTO SOLARDATA VALUES(1921, '0x0a4b0', 42160);
INSERT INTO SOLARDATA VALUES(1922, '0x0b4b5', 46261);
INSERT INTO SOLARDATA VALUES(1923, '0x06a50', 27216);
INSERT INTO SOLARDATA VALUES(1924, '0x06d40', 27968);
INSERT INTO SOLARDATA VALUES(1925, '0x1ab54', 109396);
INSERT INTO SOLARDATA VALUES(1926, '0x02b60', 11104);
INSERT INTO SOLARDATA VALUES(1927, '0x09570', 38256);
INSERT INTO SOLARDATA VALUES(1928, '0x052f2', 21234);
INSERT INTO SOLARDATA VALUES(1929, '0x04970', 18800);
INSERT INTO SOLARDATA VALUES(1930, '0x06566', 25958);
INSERT INTO SOLARDATA VALUES(1931, '0x0d4a0', 54432);
INSERT INTO SOLARDATA VALUES(1932, '0x0ea50', 59984);
INSERT INTO SOLARDATA VALUES(1933, '0x06e95', 28309);
INSERT INTO SOLARDATA VALUES(1934, '0x05ad0', 23248);
INSERT INTO SOLARDATA VALUES(1935, '0x02b60', 11104);
INSERT INTO SOLARDATA VALUES(1936, '0x186e3', 100067);
INSERT INTO SOLARDATA VALUES(1937, '0x092e0', 37600);
INSERT INTO SOLARDATA VALUES(1938, '0x1c8d7', 116951);
INSERT INTO SOLARDATA VALUES(1939, '0x0c950', 51536);
INSERT INTO SOLARDATA VALUES(1940, '0x0d4a0', 54432);
INSERT INTO SOLARDATA VALUES(1941, '0x1d8a6', 120998);
INSERT INTO SOLARDATA VALUES(1942, '0x0b550', 46416);
INSERT INTO SOLARDATA VALUES(1943, '0x056a0', 22176);
INSERT INTO SOLARDATA VALUES(1944, '0x1a5b4', 107956);
INSERT INTO SOLARDATA VALUES(1945, '0x025d0', 9680);
INSERT INTO SOLARDATA VALUES(1946, '0x092d0', 37584);
INSERT INTO SOLARDATA VALUES(1947, '0x0d2b2', 53938);
INSERT INTO SOLARDATA VALUES(1948, '0x0a950', 43344);
INSERT INTO SOLARDATA VALUES(1949, '0x0b557', 46423);
INSERT INTO SOLARDATA VALUES(1950, '0x06ca0', 27808);
INSERT INTO SOLARDATA VALUES(1951, '0x0b550', 46416);
INSERT INTO SOLARDATA VALUES(1952, '0x15355', 86869);
INSERT INTO SOLARDATA VALUES(1953, '0x04da0', 19872);
INSERT INTO SOLARDATA VALUES(1954, '0x0a5d0', 42448);
INSERT INTO SOLARDATA VALUES(1955, '0x14573', 83315);
INSERT INTO SOLARDATA VALUES(1956, '0x052d0', 21200);
INSERT INTO SOLARDATA VALUES(1957, '0x0a9a8', 43432);
INSERT INTO SOLARDATA VALUES(1958, '0x0e950', 59728);
INSERT INTO SOLARDATA VALUES(1959, '0x06aa0', 27296);
INSERT INTO SOLARDATA VALUES(1960, '0x0aea6', 44710);
INSERT INTO SOLARDATA VALUES(1961, '0x0ab50', 43856);
INSERT INTO SOLARDATA VALUES(1962, '0x04b60', 19296);
INSERT INTO SOLARDATA VALUES(1963, '0x0aae4', 43748);
INSERT INTO SOLARDATA VALUES(1964, '0x0a570', 42352);
INSERT INTO SOLARDATA VALUES(1965, '0x05260', 21088);
INSERT INTO SOLARDATA VALUES(1966, '0x0f263', 62051);
INSERT INTO SOLARDATA VALUES(1967, '0x0d950', 55632);
INSERT INTO SOLARDATA VALUES(1968, '0x05b57', 23383);
INSERT INTO SOLARDATA VALUES(1969, '0x056a0', 22176);
INSERT INTO SOLARDATA VALUES(1970, '0x096d0', 38608);
INSERT INTO SOLARDATA VALUES(1971, '0x04dd5', 19925);
INSERT INTO SOLARDATA VALUES(1972, '0x04ad0', 19152);
INSERT INTO SOLARDATA VALUES(1973, '0x0a4d0', 42192);
INSERT INTO SOLARDATA VALUES(1974, '0x0d4d4', 54484);
INSERT INTO SOLARDATA VALUES(1975, '0x0d250', 53840);
INSERT INTO SOLARDATA VALUES(1976, '0x0d558', 54616);
INSERT INTO SOLARDATA VALUES(1977, '0x0b540', 46400);
INSERT INTO SOLARDATA VALUES(1978, '0x0b5a0', 46496);
INSERT INTO SOLARDATA VALUES(1979, '0x195a6', 103846);
INSERT INTO SOLARDATA VALUES(1980, '0x095b0', 38320);
INSERT INTO SOLARDATA VALUES(1981, '0x049b0', 18864);
INSERT INTO SOLARDATA VALUES(1982, '0x0a974', 43380);
INSERT INTO SOLARDATA VALUES(1983, '0x0a4b0', 42160);
INSERT INTO SOLARDATA VALUES(1984, '0x0b27a', 45690);
INSERT INTO SOLARDATA VALUES(1985, '0x06a50', 27216);
INSERT INTO SOLARDATA VALUES(1986, '0x06d40', 27968);
INSERT INTO SOLARDATA VALUES(1987, '0x0af46', 44870);
INSERT INTO SOLARDATA VALUES(1988, '0x0ab60', 43872);
INSERT INTO SOLARDATA VALUES(1989, '0x09570', 38256);
INSERT INTO SOLARDATA VALUES(1990, '0x04af5', 19189);
INSERT INTO SOLARDATA VALUES(1991, '0x04970', 18800);
INSERT INTO SOLARDATA VALUES(1992, '0x064b0', 25776);
INSERT INTO SOLARDATA VALUES(1993, '0x074a3', 29859);
INSERT INTO SOLARDATA VALUES(1994, '0x0ea50', 59984);
INSERT INTO SOLARDATA VALUES(1995, '0x06b58', 27480);
INSERT INTO SOLARDATA VALUES(1996, '0x055c0', 21952);
INSERT INTO SOLARDATA VALUES(1997, '0x0ab60', 43872);
INSERT INTO SOLARDATA VALUES(1998, '0x096d5', 38613);
INSERT INTO SOLARDATA VALUES(1999, '0x092e0', 37600);
INSERT INTO SOLARDATA VALUES(2000, '0x0c960', 51552);
INSERT INTO SOLARDATA VALUES(2001, '0x0d954', 55636);
INSERT INTO SOLARDATA VALUES(2002, '0x0d4a0', 54432);
INSERT INTO SOLARDATA VALUES(2003, '0x0da50', 55888);
INSERT INTO SOLARDATA VALUES(2004, '0x07552', 30034);
INSERT INTO SOLARDATA VALUES(2005, '0x056a0', 22176);
INSERT INTO SOLARDATA VALUES(2006, '0x0abb7', 43959);
INSERT INTO SOLARDATA VALUES(2007, '0x025d0', 9680);
INSERT INTO SOLARDATA VALUES(2008, '0x092d0', 37584);
INSERT INTO SOLARDATA VALUES(2009, '0x0cab5', 51893);
INSERT INTO SOLARDATA VALUES(2010, '0x0a950', 43344);
INSERT INTO SOLARDATA VALUES(2011, '0x0b4a0', 46240);
INSERT INTO SOLARDATA VALUES(2012, '0x0baa4', 47780);
INSERT INTO SOLARDATA VALUES(2013, '0x0ad50', 44368);
INSERT INTO SOLARDATA VALUES(2014, '0x055d9', 21977);
INSERT INTO SOLARDATA VALUES(2015, '0x04ba0', 19360);
INSERT INTO SOLARDATA VALUES(2016, '0x0a5b0', 42416);
INSERT INTO SOLARDATA VALUES(2017, '0x15176', 86390);
INSERT INTO SOLARDATA VALUES(2018, '0x052b0', 21168);
INSERT INTO SOLARDATA VALUES(2019, '0x0a930', 43312);
INSERT INTO SOLARDATA VALUES(2020, '0x07954', 31060);
INSERT INTO SOLARDATA VALUES(2021, '0x06aa0', 27296);
INSERT INTO SOLARDATA VALUES(2022, '0x0ad50', 44368);
INSERT INTO SOLARDATA VALUES(2023, '0x05b52', 23378);
INSERT INTO SOLARDATA VALUES(2024, '0x04b60', 19296);
INSERT INTO SOLARDATA VALUES(2025, '0x0a6e6', 42726);
INSERT INTO SOLARDATA VALUES(2026, '0x0a4e0', 42208);
INSERT INTO SOLARDATA VALUES(2027, '0x0d260', 53856);
INSERT INTO SOLARDATA VALUES(2028, '0x0ea65', 60005);
INSERT INTO SOLARDATA VALUES(2029, '0x0d530', 54576);
INSERT INTO SOLARDATA VALUES(2030, '0x05aa0', 23200);
INSERT INTO SOLARDATA VALUES(2031, '0x076a3', 30371);
INSERT INTO SOLARDATA VALUES(2032, '0x096d0', 38608);
INSERT INTO SOLARDATA VALUES(2033, '0x04bd7', 19415);
INSERT INTO SOLARDATA VALUES(2034, '0x04ad0', 19152);
INSERT INTO SOLARDATA VALUES(2035, '0x0a4d0', 42192);
INSERT INTO SOLARDATA VALUES(2036, '0x1d0b6', 118966);
INSERT INTO SOLARDATA VALUES(2037, '0x0d250', 53840);
INSERT INTO SOLARDATA VALUES(2038, '0x0d520', 54560);
INSERT INTO SOLARDATA VALUES(2039, '0x0dd45', 56645);
INSERT INTO SOLARDATA VALUES(2040, '0x0b5a0', 46496);
INSERT INTO SOLARDATA VALUES(2041, '0x056d0', 22224);
INSERT INTO SOLARDATA VALUES(2042, '0x055b2', 21938);
INSERT INTO SOLARDATA VALUES(2043, '0x049b0', 18864);
INSERT INTO SOLARDATA VALUES(2044, '0x0a577', 42359);
INSERT INTO SOLARDATA VALUES(2045, '0x0a4b0', 42160);
INSERT INTO SOLARDATA VALUES(2046, '0x0aa50', 43600);
INSERT INTO SOLARDATA VALUES(2047, '0x1b255', 111189);
INSERT INTO SOLARDATA VALUES(2048, '0x06d20', 27936);
INSERT INTO SOLARDATA VALUES(2049, '0x0ada0', 44448);
COMMIT;
--5.
CREATE OR REPLACE FUNCTION F_GETNONGLI(I_SOLARDAY DATE) 
RETURN VARCHAR2
  -- 功能：计算阳历1900/01/31 - 2050/01/22间某一天对应的阴历是多少
  -- 算法：在一张表中用10进制格式保存某个农历年每月大小,有无闰月,闰月大小信息
  --           1.用12个2进制位来表示某个农历年每月的大小，大月记为1，否则为0
  --           2.用低4位来表示闰月的月份，没有闰月记为0
  --           3.用一个高位表示闰月的大小，闰月大记为0，闰月小或无闰月记为0
  --           4.再将该2进制数转化为10进制，存入表中
  --       农历2000年: 0 110010010110 0000 -> 0x0c960 -> 51552
  --       农历2001年: 0 110110010101 0100 -> 0x0d954 -> 55636
  --       采用查表的方式计算出农历日期
  -- 作者：Angel_XJW        
  -- 修改：1.
  --       2.
AS
  V_OFFSET         INT;
  V_LUNAR          INT;          -- 农历年是否含闰月,几月是闰月,闰月天数,其它月天数
  V_YEARDAYS       INT;          -- 农历年所含天数
  V_MONTHDAYS      INT;          -- 农历月所含天数
  V_LEAPMONTHDAYS  INT;          -- 农历闰月所含天数
  V_LEAPMONTH      INT;          -- 农历年闰哪个月 1-12 , 没闰传回 0
  V_LEAPFLAG       INT;          -- 某农历月是否为闰月  1:是  0:不是
  V_MONTHNO        INT;          -- 某农历月所对应的2进制数 如农历3月: 001000000000 
  I                INT;
  J                INT; 
  K                INT;
  V_YEAR           INT;          -- I_SOLARDAY 对应的农历年
  V_MONTH          INT;          -- I_SOLARDAY 对应的农历月
  V_DAY            INT;          -- I_SOLARDAY 对应的农历日
  
  O_OUTPUTDATE     VARCHAR2(25); -- 返回值  格式：农历 ****年 **(闰)月 **日  
  E_ERRMSG         VARCHAR2(200);
  E_ERRDATE        EXCEPTION;
BEGIN
   --输入参数判断
   IF I_SOLARDAY<TO_DATE('2000-01-31','YYYY-MM-DD') OR I_SOLARDAY>=TO_DATE('2050-01-23','YYYY-MM-DD') THEN
     RAISE E_ERRDATE;
   END IF ;
 
  -- I_SOLARDAY 到 1900-01-30(即农历1900-01-01的前一天) 的天数
  V_OFFSET := TRUNC(I_SOLARDAY, 'DD') - TO_DATE('1900-01-30', 'YYYY-MM-DD');
 
  -- 确定农历年开始
  I := 1900;
  WHILE I < 2050 AND V_OFFSET > 0 LOOP
    V_YEARDAYS := 348;    --  29*12 以每年12个农历月,每个农历月含29个农历日为基数
    V_LEAPMONTHDAYS := 0;
    
    -- 取出农历年是否含闰月,几月是闰月,闰月天数,其它月天数
    -- 如农历2001年: 0X0D954(16进制) -> 55636(10进制) -> 0 110110010101 0100(2进制)
    -- 1,2,4,5,8,10,12月大, 3,6,7,9,11月小, 4月为闰月，闰月小
    SELECT DATAINT INTO V_LUNAR FROM SOLARDATA WHERE YEARID = I;
    -- 传回农历年的总天数
    J := 32768;            --   100000000000 0000 -> 32768
                           -- 0 110110010101 0100 -> 55636(农历2001年)
    -- 依次判断V_LUNAR年个月是否为大月，是则加一天 
    WHILE J > 8 LOOP       -- 闰月另行判断 8 -> 0 000000000000 1000    
      IF BITAND(V_LUNAR, J) + 0 > 0 THEN
        V_YEARDAYS := V_YEARDAYS + 1;
      END IF;
      J := J/2;            -- 判断下一个月是否为大
    END LOOP;
    -- 传回农历年闰哪个月 1-12 , 没闰传回 0   15 -> 1 0000
    V_LEAPMONTH := BITAND(V_LUNAR, 15) + 0;
    -- 传回农历年闰月的天数 ,加在年的总天数上
    IF V_LEAPMONTH > 0 THEN
      -- 判断闰月大小 65536 -> 1 000000000000 0000 
      IF BITAND(V_LUNAR, 65536)+0 > 0 THEN
        V_LEAPMONTHDAYS := 30;
      ELSE
        V_LEAPMONTHDAYS := 29;
      END IF;
      V_YEARDAYS := V_YEARDAYS + V_LEAPMONTHDAYS;
    END IF;
    V_OFFSET := V_OFFSET - V_YEARDAYS;
    I := I + 1;
  END LOOP;
  IF V_OFFSET <= 0 THEN
    -- I_SOLARDAY 在所属农历年(即I年)中的第 V_OFFSET 天 
    V_OFFSET := V_OFFSET + V_YEARDAYS;  
    I := I - 1;
  END IF;
  -- 确定农历年结束
  V_YEAR := I;
  -- 确定农历月开始
  I := 1;
  SELECT DATAINT INTO V_LUNAR FROM SOLARDATA WHERE YEARID = V_YEAR; 
  -- 判断那个月是润月
  -- 如农历2001年 (55636,15 -> 0 1101100101010100, 1111 -> 4) 即润4月,且闰月小
  V_LEAPMONTH := BITAND(V_LUNAR, 15) + 0; 
  V_LEAPFLAG := 0;
 
  WHILE I < 13 AND V_OFFSET > 0 LOOP
    -- 判断是否为闰月
    V_MONTHDAYS := 0;
    IF (V_LEAPMONTH > 0 AND I = (V_LEAPMONTH + 1) AND V_LEAPFLAG = 0) THEN
      -- 是闰月
      I := I - 1;
      K := I;                -- 保存是闰月的时I的值
      V_LEAPFLAG := 1;
      -- 传回农历年闰月的天数
      IF BITAND(V_LUNAR, 65536)+0 > 0 THEN
        V_MONTHDAYS := 30;
      ELSE
        V_MONTHDAYS := 29;
      END IF;
      
    ELSE
      -- 不是闰月
      J := 1;
      V_MONTHNO := 65536;
      -- 计算 I 月对应的2进制数 如农历3月: 001000000000
      WHILE J<= I LOOP
        V_MONTHNO := V_MONTHNO/2;
        J := J + 1;
      END LOOP;
      -- 计算农历 V_YEAR 年 I 月的天数
      IF BITAND(V_LUNAR, V_MONTHNO)+0 > 0 THEN
        V_MONTHDAYS := 30;
      ELSE
        V_MONTHDAYS := 29;
      END IF;
    END IF;
 
    -- 解除闰月
    IF V_LEAPFLAG = 1 AND I = V_LEAPMONTH +1 THEN
      V_LEAPFLAG := 0;
    END IF;
    V_OFFSET := V_OFFSET - V_MONTHDAYS;
    I := I + 1;
  END LOOP;
 
  IF V_OFFSET <= 0 THEN
    -- I_SOLARDAY 在所属农历月(即I月)中的第 V_OFFSET 天 
    V_OFFSET := V_OFFSET + V_MONTHDAYS;
    I := I - 1;
  END IF;
 
  -- 确定农历月结束
  V_MONTH := I;
 
  -- 确定农历日结束
  V_DAY := V_OFFSET;
 
  -- 格式化返回值
  O_OUTPUTDATE := TO_CHAR(V_YEAR);
  IF K = I THEN
     O_OUTPUTDATE := O_OUTPUTDATE || LPAD(TO_CHAR(V_MONTH), 2, '0');
  ELSE
     O_OUTPUTDATE := O_OUTPUTDATE || LPAD(TO_CHAR(V_MONTH), 2, '0');
  END IF;
  O_OUTPUTDATE := O_OUTPUTDATE || LPAD(TO_CHAR(V_DAY), 2, '0');
  RETURN O_OUTPUTDATE;
EXCEPTION
  WHEN E_ERRDATE THEN
    RETURN '日期错误! 有效范围(阳历): 1900/01/31 - 2050/01/22';
  WHEN OTHERS THEN
    E_ERRMSG :=SUBSTR(SQLERRM,1,200);
    RETURN E_ERRMSG;
END;
/
--6.
CREATE TABLE T_YANGLI_YINLI(YANGLI DATE,YINLI VARCHAR2(10));

--7.
INSERT INTO T_YANGLI_YINLI
  SELECT TRUNC(TO_DATE('2021-01-01', 'yyyy-mm-dd')) + ROWNUM - 1 AS DATES,
         F_GETNONGLI(TRUNC(TO_DATE('2021-01-01', 'yyyy-mm-dd')) + ROWNUM - 1) AS DATES2 --对应的农历
    FROM ALL_OBJECTS
   WHERE TRUNC(TO_DATE('2021-01-01', 'yyyy-mm-dd')) + ROWNUM - 1 <
         TRUNC(TO_DATE('2049-12-31', 'yyyy-mm-dd'));
COMMIT;
--8.
begin
  -- Call the procedure
  bbg_ins_w_mcal_day_d_future(begin_date => :begin_date,
                              end_date => :end_date);
end;
/
--9.




SELECT * FROM RADM.W_MCAL_DAY_DV ORDER BY 1;

SELECT * FROM ALL_ALL_TABLES T WHERE T.table_name LIKE '%MCAL%';

SELECT * FROM RADM.W_MCAL_DAY_D ORDER BY 1;
SELECT * FROM RADM.W_MCAL_PERIOD_D ORDER BY 1;
SELECT * FROM RADM.W_MCAL_CAL_D;
SELECT * FROM RADM.W_MCAL_CONTEXT_G;
SELECT * FROM RADM.W_MCAL_DAY_DS;
SELECT * FROM W_MCAL_PERIOD_TMP ORDER BY 1;
SELECT * FROM CALENDAR;

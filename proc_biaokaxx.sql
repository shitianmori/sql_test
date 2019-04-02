create or replace procedure proc_biaokaxx (
	v_number	in number
)is
begin
	DECLARE
  CURSOR CUR_BIAOKAXX IS
  SELECT
    S_SHOUCHAOBZ,
    S_SHOUCHAOZT,
    S_SHOUQUANHTH,
    I_SHUIBIAOBL,
    S_SHUIBIAOCJID,
    S_SHUIBIAOFL,
    S_SHUIBIAOGYH,
    S_SHUIBIAOTXM,
    S_SHUIBIAOZL,
    S_SHUIZIYQ,
    S_SIMKAH,
    S_ST,
    S_TUOSHOUHTH,
    S_USERID,
    S_WEIZHIFL,
    S_WUYE,
    S_WUYEDH,
    S_X,
    S_X1,
    S_XIAOQU,
    S_XIAOQUDZ,
    S_XINGZHENGQ,
    S_Y,
    S_Y1,
    S_YUANCHUANID,
    S_ZHONGDUANH,
    S_ZONGBIAOCID,
    CRUD_TYPE,
    IS_USED,
    ID,
    D_CAOZUOSJ,
    D_GONGSHUIHTNX,
    D_GONGSHUIHTQDRQ,
    D_HUANBIAO,
    D_HUANBIAOHTQRSJ,
    D_HUICHUANSJ,
    D_LIHU,
    D_QIANYUERQ,
    D_RUCE,
    D_SHOUCHAORQ,
    D_XIAOHU,
    D_ZHUANGBIAO,
    I_CENEIXH,
    I_CUIJIAOBM,
    I_DIANZIZD,
    I_DINGESL,
    I_DUANSHUIID,
    I_ERCIGS,
    I_HUANBIAOFS,
    I_JIHUAYS,
    I_JIUBIAOCM,
    I_RENKOUS,
    I_SFFS,
    I_SHOUCHAOCM,
    I_SHUIBIAOGS,
    I_XINBIAODM,
    I_YUANCHUANBSS,
    I_ZIDONGCJ,
    N_FENTANL,
    N_LAJIFZKL,
    N_PAISHUIZKL,
    N_YONGSHUIZKL,
    N_ZHEKOUL1,
    N_ZHEKOUL2,
    N_ZHEKOUL3,
    S_ANZHUANGWZ,
    S_BEIZHU,
    S_BEIZHU1,
    S_BEIZHU2,
    S_BEIZHU3,
    S_BEIZHU4,
    S_BEIZHU5,
    S_BEIZHU6,
    S_BEIZHU7,
    S_BEIZHU8,
    S_BEIZHU9,
    S_BIAOKAZT,
    S_BIAOXINGID,
    S_CAOZUOR,
    S_CH,
    S_DZ,
    S_FENTANFS,
    S_FUFEIYHM,
    S_GONGNENGFL,
    S_GONGSHUIHTH,
    S_GUANWANGFQBH,
    S_JH,
    S_JIAGELB,
    S_JIANKONGID,
    S_JIEDAO,
    S_JIESHUIBH,
    S_KAIHUMC,
    S_KAIZHANGFL,
    S_KEHUID,
    S_KOUJINGBH,
    S_KUAIHAO,
    S_QIANFENGH,
    S_QIANYUEBZ,
    S_SANLAIDH,
    S_SHEBEIH,
    S_SHEQU,
    S_SHESHUIID,
    S_SHIYONGZT
  FROM TMP_SG_BIAOKAXX WHERE IS_USED = 0 and rownum<=v_number ;
  V_ID TMP_SG_BIAOKAXX.ID%TYPE;
  V_TYPE TMP_SG_BIAOKAXX.CRUD_TYPE%TYPE;
  IS_EXIST INTEGER := 0;
BEGIN
FOR V_BIAOKA IN CUR_BIAOKAXX LOOP
  V_ID := V_BIAOKA.ID;
  V_TYPE := V_BIAOKA.CRUD_TYPE;
  IF V_TYPE = 1 THEN
    SELECT COUNT(*) INTO IS_EXIST FROM SG_BIAOKAXX WHERE S_USERID = V_BIAOKA.S_USERID;
    IF IS_EXIST = 0 THEN
      -- INSERT DATA
      INSERT INTO SG_BIAOKAXX
      (
        D_CAOZUOSJ,
        D_GONGSHUIHTNX,
        D_GONGSHUIHTQDRQ,
        D_HUANBIAO,
        D_HUANBIAOHTQRSJ,
        D_HUICHUANSJ,
        D_LIHU,
        D_QIANYUERQ,
        D_RUCE,
        D_SHOUCHAORQ,
        D_XIAOHU,
        D_ZHUANGBIAO,
        I_CENEIXH,
        I_CUIJIAOBM,
        I_DIANZIZD,
        I_DINGESL,
        I_DUANSHUIID,
        I_ERCIGS,
        I_HUANBIAOFS,
        I_JIHUAYS,
        I_JIUBIAOCM,
        I_RENKOUS,
        I_SFFS,
        I_SHOUCHAOCM,
        I_SHUIBIAOGS,
        I_XINBIAODM,
        I_YUANCHUANBSS,
        I_ZIDONGCJ,
        N_FENTANL,
        N_LAJIFZKL,
        N_PAISHUIZKL,
        N_YONGSHUIZKL,
        N_ZHEKOUL1,
        N_ZHEKOUL2,
        N_ZHEKOUL3,
        S_ANZHUANGWZ,
        S_BEIZHU,
        S_BEIZHU1,
        S_BEIZHU2,
        S_BEIZHU3,
        S_BEIZHU4,
        S_BEIZHU5,
        S_BEIZHU6,
        S_BEIZHU7,
        S_BEIZHU8,
        S_BEIZHU9,
        S_BIAOKAZT,
        S_BIAOXINGID,
        S_CAOZUOR,
        S_CH,
        S_DZ,
        S_FENTANFS,
        S_FUFEIYHM,
        S_GONGNENGFL,
        S_GONGSHUIHTH,
        S_GUANWANGFQBH,
        S_JH,
        S_JIAGELB,
        S_JIANKONGID,
        S_JIEDAO,
        S_JIESHUIBH,
        S_KAIHUMC,
        S_KAIZHANGFL,
        S_KEHUID,
        S_KOUJINGBH,
        S_KUAIHAO,
        S_QIANFENGH,
        S_QIANYUEBZ,
        S_SANLAIDH,
        S_SHEBEIH,
        S_SHEQU,
        S_SHESHUIID,
        S_SHIYONGZT,
        S_SHOUCHAOBZ,
        S_SHOUCHAOZT,
        S_SHOUQUANHTH,
        I_SHUIBIAOBL,
        S_SHUIBIAOCJID,
        S_SHUIBIAOFL,
        S_SHUIBIAOGYH,
        S_SHUIBIAOTXM,
        S_SHUIBIAOZL,
        S_SHUIZIYQ,
        S_SIMKAH,
        S_ST,
        S_TUOSHOUHTH,
        S_USERID,
        S_WEIZHIFL,
        S_WUYE,
        S_WUYEDH,
        S_X,
        S_X1,
        S_XIAOQU,
        S_XIAOQUDZ,
        S_XINGZHENGQ,
        S_Y,
        S_Y1,
        S_YUANCHUANID,
        S_ZHONGDUANH,
        S_ZONGBIAOCID
      ) VALUES
      (
        V_BIAOKA.D_CAOZUOSJ,
        V_BIAOKA.D_GONGSHUIHTNX,
        V_BIAOKA.D_GONGSHUIHTQDRQ,
        V_BIAOKA.D_HUANBIAO,
        V_BIAOKA.D_HUANBIAOHTQRSJ,
        V_BIAOKA.D_HUICHUANSJ,
        V_BIAOKA.D_LIHU,
        V_BIAOKA.D_QIANYUERQ,
        V_BIAOKA.D_RUCE,
        V_BIAOKA.D_SHOUCHAORQ,
        V_BIAOKA.D_XIAOHU,
        V_BIAOKA.D_ZHUANGBIAO,
        V_BIAOKA.I_CENEIXH,
        V_BIAOKA.I_CUIJIAOBM,
        V_BIAOKA.I_DIANZIZD,
        V_BIAOKA.I_DINGESL,
        V_BIAOKA.I_DUANSHUIID,
        V_BIAOKA.I_ERCIGS,
        V_BIAOKA.I_HUANBIAOFS,
        V_BIAOKA.I_JIHUAYS,
        V_BIAOKA.I_JIUBIAOCM,
        V_BIAOKA.I_RENKOUS,
        V_BIAOKA.I_SFFS,
        V_BIAOKA.I_SHOUCHAOCM,
        V_BIAOKA.I_SHUIBIAOGS,
        V_BIAOKA.I_XINBIAODM,
        V_BIAOKA.I_YUANCHUANBSS,
        V_BIAOKA.I_ZIDONGCJ,
        V_BIAOKA.N_FENTANL,
        V_BIAOKA.N_LAJIFZKL,
        V_BIAOKA.N_PAISHUIZKL,
        V_BIAOKA.N_YONGSHUIZKL,
        V_BIAOKA.N_ZHEKOUL1,
        V_BIAOKA.N_ZHEKOUL2,
        V_BIAOKA.N_ZHEKOUL3,
        V_BIAOKA.S_ANZHUANGWZ,
        V_BIAOKA.S_BEIZHU,
        V_BIAOKA.S_BEIZHU1,
        V_BIAOKA.S_BEIZHU2,
        V_BIAOKA.S_BEIZHU3,
        V_BIAOKA.S_BEIZHU4,
        V_BIAOKA.S_BEIZHU5,
        V_BIAOKA.S_BEIZHU6,
        V_BIAOKA.S_BEIZHU7,
        V_BIAOKA.S_BEIZHU8,
        V_BIAOKA.S_BEIZHU9,
        CASE V_BIAOKA.S_BIAOKAZT WHEN '0' THEN '正常' WHEN '1' THEN '停水' WHEN '-2' THEN '注销' WHEN '-1' THEN '拆表' ELSE '未知' END,
        (select S_CANSHUMC from SG_YONGHUPZ where I_LISHUID = 12 and S_CANSHUZ = V_BIAOKA.S_BIAOXINGID),
        V_BIAOKA.S_CAOZUOR,
        V_BIAOKA.S_CH,
        V_BIAOKA.S_DZ,
        V_BIAOKA.S_FENTANFS,
        V_BIAOKA.S_FUFEIYHM,
        CASE V_BIAOKA.S_GONGNENGFL WHEN '0' THEN '开账' ELSE '计量' END,
        V_BIAOKA.S_GONGSHUIHTH,
        V_BIAOKA.S_GUANWANGFQBH,
        V_BIAOKA.S_JH,
        V_BIAOKA.S_JIAGELB,
        V_BIAOKA.S_JIANKONGID,
        V_BIAOKA.S_JIEDAO,
        V_BIAOKA.S_JIESHUIBH,
        V_BIAOKA.S_KAIHUMC,
        V_BIAOKA.S_KAIZHANGFL,
        V_BIAOKA.S_KEHUID,
        V_BIAOKA.S_KOUJINGBH,
        V_BIAOKA.S_KUAIHAO,
        V_BIAOKA.S_QIANFENGH,
        V_BIAOKA.S_QIANYUEBZ,
        V_BIAOKA.S_SANLAIDH,
        V_BIAOKA.S_SHEBEIH,
        V_BIAOKA.S_SHEQU,
        V_BIAOKA.S_SHESHUIID,
        V_BIAOKA.S_SHIYONGZT,
        V_BIAOKA.S_SHOUCHAOBZ,
        V_BIAOKA.S_SHOUCHAOZT,
        V_BIAOKA.S_SHOUQUANHTH,
        V_BIAOKA.I_SHUIBIAOBL,
        (select S_CANSHUMC from SG_YONGHUPZ where I_LISHUID = 9 and S_CANSHUZ = V_BIAOKA.S_SHUIBIAOCJID),
        V_BIAOKA.S_SHUIBIAOFL,
        V_BIAOKA.S_SHUIBIAOGYH,
        V_BIAOKA.S_SHUIBIAOTXM,
        CASE V_BIAOKA.S_SHUIBIAOZL WHEN '1' THEN '地下表' WHEN '2' THEN '普通表' ELSE NULL END,
        V_BIAOKA.S_SHUIZIYQ,
        V_BIAOKA.S_SIMKAH,
        V_BIAOKA.S_ST,
        V_BIAOKA.S_TUOSHOUHTH,
        V_BIAOKA.S_USERID,
        V_BIAOKA.S_WEIZHIFL,
        V_BIAOKA.S_WUYE,
        V_BIAOKA.S_WUYEDH,
        V_BIAOKA.S_X,
        V_BIAOKA.S_X1,
        V_BIAOKA.S_XIAOQU,
        V_BIAOKA.S_XIAOQUDZ,
        V_BIAOKA.S_XINGZHENGQ,
        V_BIAOKA.S_Y,
        V_BIAOKA.S_Y1,
        V_BIAOKA.S_YUANCHUANID,
        V_BIAOKA.S_ZHONGDUANH,
        V_BIAOKA.S_ZONGBIAOCID
      );
     -- DBMS_OUTPUT.PUT_LINE('添加表卡信息数据');
      -- UPDATE IS_USER
      UPDATE TMP_SG_BIAOKAXX SET IS_USED = 1 WHERE ID = V_ID;
     ELSE
      UPDATE TMP_SG_BIAOKAXX SET IS_USED = -1 WHERE ID = V_ID;
     END IF;
  ELSIF V_TYPE = 2 THEN
    -- ALTER DATA
    UPDATE SG_BIAOKAXX SET
      S_USERID = V_BIAOKA.S_USERID,
      S_KEHUID = V_BIAOKA.S_KEHUID,
      S_ST = V_BIAOKA.S_ST,
      S_CH = V_BIAOKA.S_CH,
      I_CENEIXH = V_BIAOKA.I_CENEIXH,
      S_DZ = V_BIAOKA.S_DZ,
      I_SFFS = V_BIAOKA.I_SFFS,
      S_TUOSHOUHTH = V_BIAOKA.S_TUOSHOUHTH,
      S_KUAIHAO = V_BIAOKA.S_KUAIHAO,
      S_GUANWANGFQBH = V_BIAOKA.S_GUANWANGFQBH,
      S_GONGSHUIHTH = V_BIAOKA.S_GONGSHUIHTH,
      D_GONGSHUIHTQDRQ = V_BIAOKA.D_GONGSHUIHTQDRQ,
      D_GONGSHUIHTNX = V_BIAOKA.D_GONGSHUIHTNX,
      S_JIESHUIBH = V_BIAOKA.S_JIESHUIBH,
      S_JH = V_BIAOKA.S_JH,
      S_SHESHUIID = V_BIAOKA.S_SHESHUIID,
      S_X = V_BIAOKA.S_X,
      S_Y = V_BIAOKA.S_Y,
      S_X1 = V_BIAOKA.S_X1,
      S_Y1 = V_BIAOKA.S_Y1,
      S_XINGZHENGQ = V_BIAOKA.S_XINGZHENGQ,
      S_SHUIZIYQ = V_BIAOKA.S_SHUIZIYQ,
      S_JIEDAO = V_BIAOKA.S_JIEDAO,
      S_SHEQU = V_BIAOKA.S_SHEQU,
      S_XIAOQU = V_BIAOKA.S_XIAOQU,
      S_XIAOQUDZ = V_BIAOKA.S_XIAOQUDZ,
      S_WUYE = V_BIAOKA.S_WUYE,
      S_WUYEDH = V_BIAOKA.S_WUYEDH,
      D_LIHU = V_BIAOKA.D_LIHU,
      D_RUCE = V_BIAOKA.D_RUCE,
      D_XIAOHU = V_BIAOKA.D_XIAOHU,
      S_BIAOKAZT =
      CASE V_BIAOKA.S_BIAOKAZT WHEN '0' THEN '正常' WHEN '1' THEN '停水' WHEN '-2' THEN '注销' WHEN '-1' THEN '拆表' ELSE '未知' END,
      N_YONGSHUIZKL = V_BIAOKA.N_YONGSHUIZKL,
      N_PAISHUIZKL = V_BIAOKA.N_PAISHUIZKL,
      N_LAJIFZKL = V_BIAOKA.N_LAJIFZKL,
      N_ZHEKOUL1 = V_BIAOKA.N_ZHEKOUL1,
      N_ZHEKOUL2 = V_BIAOKA.N_ZHEKOUL2,
      N_ZHEKOUL3 = V_BIAOKA.N_ZHEKOUL3,
      I_RENKOUS = V_BIAOKA.I_RENKOUS,
      S_JIAGELB = V_BIAOKA.S_JIAGELB,
      S_CAOZUOR = V_BIAOKA.S_CAOZUOR,
      D_CAOZUOSJ = V_BIAOKA.D_CAOZUOSJ,
      I_DINGESL = V_BIAOKA.I_DINGESL,
      S_FUFEIYHM = V_BIAOKA.S_FUFEIYHM,
      I_ERCIGS = V_BIAOKA.I_ERCIGS,
      I_JIHUAYS = V_BIAOKA.I_JIHUAYS,
      I_DIANZIZD = V_BIAOKA.I_DIANZIZD,
      S_SANLAIDH = V_BIAOKA.S_SANLAIDH,
      I_CUIJIAOBM = V_BIAOKA.I_CUIJIAOBM,
      S_SHUIBIAOGYH = V_BIAOKA.S_SHUIBIAOGYH,
      S_SHUIBIAOTXM = V_BIAOKA.S_SHUIBIAOTXM,
      S_SHUIBIAOCJID = (select S_CANSHUMC from SG_YONGHUPZ where I_LISHUID = 9 and S_CANSHUZ = V_BIAOKA.S_SHUIBIAOCJID),
      S_BIAOXINGID = (select S_CANSHUMC from SG_YONGHUPZ where I_LISHUID = 12 and S_CANSHUZ = V_BIAOKA.S_BIAOXINGID),
      S_KOUJINGBH = V_BIAOKA.S_KOUJINGBH,
      S_ANZHUANGWZ = V_BIAOKA.S_ANZHUANGWZ,
      D_ZHUANGBIAO = V_BIAOKA.D_ZHUANGBIAO,
      D_HUANBIAO = V_BIAOKA.D_HUANBIAO,
      I_XINBIAODM = V_BIAOKA.I_XINBIAODM,
      I_JIUBIAOCM = V_BIAOKA.I_JIUBIAOCM,
      S_WEIZHIFL = V_BIAOKA.S_WEIZHIFL,
      S_KAIZHANGFL = V_BIAOKA.S_KAIZHANGFL,
      S_ZONGBIAOCID = V_BIAOKA.S_ZONGBIAOCID,
      S_GONGNENGFL =
      CASE V_BIAOKA.S_GONGNENGFL WHEN '0' THEN '开账' ELSE '计量' END,
      S_SHIYONGZT = V_BIAOKA.S_SHIYONGZT,
      I_SHUIBIAOBL = V_BIAOKA.I_SHUIBIAOBL,
      S_FENTANFS = V_BIAOKA.S_FENTANFS,
      N_FENTANL = V_BIAOKA.N_FENTANL,
      I_SHUIBIAOGS = V_BIAOKA.I_SHUIBIAOGS,
      S_YUANCHUANID = V_BIAOKA.S_YUANCHUANID,
      S_JIANKONGID = V_BIAOKA.S_JIANKONGID,
      I_DUANSHUIID = V_BIAOKA.I_DUANSHUIID,
      S_BEIZHU = V_BIAOKA.S_BEIZHU,
      S_BEIZHU1 = V_BIAOKA.S_BEIZHU1,
      S_BEIZHU2 = V_BIAOKA.S_BEIZHU2,
      S_BEIZHU3 = V_BIAOKA.S_BEIZHU3,
      S_BEIZHU4 = V_BIAOKA.S_BEIZHU4,
      I_HUANBIAOFS = V_BIAOKA.I_HUANBIAOFS,
      D_HUANBIAOHTQRSJ = V_BIAOKA.D_HUANBIAOHTQRSJ,
      S_SHOUQUANHTH = V_BIAOKA.S_SHOUQUANHTH,
      D_QIANYUERQ = V_BIAOKA.D_QIANYUERQ,
      S_SHUIBIAOZL =
      CASE V_BIAOKA.S_SHUIBIAOZL WHEN '1' THEN '地下表' WHEN '2' THEN '普通表' ELSE NULL END,
      S_SHUIBIAOFL = V_BIAOKA.S_SHUIBIAOFL,
      S_KAIHUMC = V_BIAOKA.S_KAIHUMC,
      S_QIANYUEBZ = V_BIAOKA.S_QIANYUEBZ,
      S_BEIZHU5 = V_BIAOKA.S_BEIZHU5,
      S_BEIZHU6 = V_BIAOKA.S_BEIZHU6,
      S_BEIZHU7 = V_BIAOKA.S_BEIZHU7,
      S_BEIZHU8 = V_BIAOKA.S_BEIZHU8,
      S_BEIZHU9 = V_BIAOKA.S_BEIZHU9,
      I_SHOUCHAOCM = V_BIAOKA.I_SHOUCHAOCM,
      S_SHOUCHAOZT = V_BIAOKA.S_SHOUCHAOZT,
      D_SHOUCHAORQ = V_BIAOKA.D_SHOUCHAORQ,
      S_SHOUCHAOBZ = V_BIAOKA.S_SHOUCHAOBZ,
      I_ZIDONGCJ = V_BIAOKA.I_ZIDONGCJ,
      S_SHEBEIH = V_BIAOKA.S_SHEBEIH,
      S_ZHONGDUANH = V_BIAOKA.S_ZHONGDUANH,
      S_SIMKAH = V_BIAOKA.S_SIMKAH,
      I_YUANCHUANBSS = V_BIAOKA.I_YUANCHUANBSS,
      S_QIANFENGH = V_BIAOKA.S_QIANFENGH,
      D_HUICHUANSJ = V_BIAOKA.D_HUICHUANSJ
    WHERE S_USERID = V_BIAOKA.S_USERID;
  --  DBMS_OUTPUT.PUT_LINE('修改表卡信息数据');
    -- UPDATE IS_USER
    UPDATE TMP_SG_BIAOKAXX SET IS_USED = 1 WHERE ID = V_ID;
  ELSIF V_TYPE = 3 THEN
    -- DELETE DATA
    DELETE FROM SG_BIAOKAXX WHERE S_USERID = V_BIAOKA.S_USERID;
   -- DBMS_OUTPUT.PUT_LINE('删除表卡信息数据');
    -- UPDATE IS_USER
    UPDATE TMP_SG_BIAOKAXX SET IS_USED = 1 WHERE ID = V_ID;
  ELSE
    DBMS_OUTPUT.PUT_LINE('数据不可用或没有对应的数据操作类型CRUD_TYPE' || V_BIAOKA.CRUD_TYPE);
  END IF;
END LOOP;

  --DELETE  TMP_SG_BIAOKAXX where sysdate-7>d_huichuansj AND IS_USED =1;

END;
end;
/

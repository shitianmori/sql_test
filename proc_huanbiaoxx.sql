create or replace procedure proc_huanbiaoxx (
	v_number in number
)is
begin
	DECLARE
  CURSOR CUR_HUANBIAOXX IS
  SELECT
    CRUD_TYPE,
    IS_USED,
    ID,
    D_DENGJIRQ,
    D_FUHERQ,
    D_HUANBIAORIQI,
    D_HUICHUANSJ,
    D_HUITIANRQ,
    D_QUERENGRQ,
    D_SHIGONGRQ,
    I_JIUBIAODS,
    I_JIUBIAOFHDS,
    I_JIUBIAOFHYL,
    I_JIUBIAOQDDS,
    I_JIUBIAOQRYL,
    I_JIUBIAOYL,
    I_XINBIAODS,
    I_XINBIAOFHDS,
    I_XINBIAOQDDS,
    S_BEIZHU,
    S_HUANBIAOCS,
    S_HUANBIAOYY,
    S_HUANBIAOYYSM,
    S_USERID,
    S_XINBIAOTXM,
    S_ZHUBIAOBH,
    S_YEWULX
  FROM TMP_SG_HUANBIAOXX WHERE IS_USED = 0 and rownum<=v_number;
  V_ID TMP_SG_HUANBIAOXX.ID%TYPE;
  V_TYPE TMP_SG_HUANBIAOXX.CRUD_TYPE%TYPE;
  IS_EXIST INTEGER := 0;
BEGIN
FOR V_HUANBIAOXX IN CUR_HUANBIAOXX LOOP
  V_ID := V_HUANBIAOXX.ID;
  V_TYPE := V_HUANBIAOXX.CRUD_TYPE;
  IF V_TYPE = 1 THEN
    SELECT COUNT(*) INTO IS_EXIST FROM SG_HUANBIAOXX WHERE S_USERID = V_HUANBIAOXX.S_USERID AND S_ZHUBIAOBH = V_HUANBIAOXX.S_ZHUBIAOBH;
    IF IS_EXIST = 0 THEN
      -- INSERT DATA
      INSERT INTO SG_HUANBIAOXX
      (
        S_USERID,
        S_XINBIAOTXM,
        D_DENGJIRQ,
        D_FUHERQ,
        D_HUANBIAORIQI,
        D_HUICHUANSJ,
        D_HUITIANRQ,
        D_QUERENGRQ,
        D_SHIGONGRQ,
        I_JIUBIAODS,
        I_JIUBIAOFHDS,
        I_JIUBIAOFHYL,
        I_JIUBIAOQDDS,
        I_JIUBIAOQRYL,
        I_JIUBIAOYL,
        I_XINBIAODS,
        I_XINBIAOFHDS,
        I_XINBIAOQDDS,
        S_BEIZHU,
        S_HUANBIAOCS,
        S_HUANBIAOYY,
        S_HUANBIAOYYSM,
        S_ZHUBIAOBH,
        S_YEWULX
      ) VALUES
      (
        V_HUANBIAOXX.S_USERID,
        V_HUANBIAOXX.S_XINBIAOTXM,
        V_HUANBIAOXX.D_DENGJIRQ,
        V_HUANBIAOXX.D_FUHERQ,
        V_HUANBIAOXX.D_HUANBIAORIQI,
        V_HUANBIAOXX.D_HUICHUANSJ,
        V_HUANBIAOXX.D_HUITIANRQ,
        V_HUANBIAOXX.D_QUERENGRQ,
        V_HUANBIAOXX.D_SHIGONGRQ,
        V_HUANBIAOXX.I_JIUBIAODS,
        V_HUANBIAOXX.I_JIUBIAOFHDS,
        V_HUANBIAOXX.I_JIUBIAOFHYL,
        V_HUANBIAOXX.I_JIUBIAOQDDS,
        V_HUANBIAOXX.I_JIUBIAOQRYL,
        V_HUANBIAOXX.I_JIUBIAOYL,
        V_HUANBIAOXX.I_XINBIAODS,
        V_HUANBIAOXX.I_XINBIAOFHDS,
        V_HUANBIAOXX.I_XINBIAOQDDS,
        V_HUANBIAOXX.S_BEIZHU,
        V_HUANBIAOXX.S_HUANBIAOCS,
        V_HUANBIAOXX.S_HUANBIAOYY,
        V_HUANBIAOXX.S_HUANBIAOYYSM,
        V_HUANBIAOXX.S_ZHUBIAOBH,
        V_HUANBIAOXX.S_YEWULX
      );
     -- DBMS_OUTPUT.PUT_LINE('添加换表数据');
      -- UPDATE IS_USER
      UPDATE TMP_SG_HUANBIAOXX SET IS_USED = 1 WHERE ID = V_ID;
    ELSE
      UPDATE TMP_SG_HUANBIAOXX SET IS_USED = -1 WHERE ID = V_ID;
    END IF;
  ELSIF V_TYPE = 2 THEN
    -- ALTER DATA
    UPDATE SG_HUANBIAOXX SET
      S_XINBIAOTXM = V_HUANBIAOXX.S_XINBIAOTXM,
      D_DENGJIRQ = V_HUANBIAOXX.D_DENGJIRQ,
      D_FUHERQ = V_HUANBIAOXX.D_FUHERQ,
      D_HUANBIAORIQI = V_HUANBIAOXX.D_HUANBIAORIQI,
      D_HUICHUANSJ = V_HUANBIAOXX.D_HUICHUANSJ,
      D_HUITIANRQ = V_HUANBIAOXX.D_HUITIANRQ,
      D_QUERENGRQ = V_HUANBIAOXX.D_QUERENGRQ,
      D_SHIGONGRQ = V_HUANBIAOXX.D_SHIGONGRQ,
      I_JIUBIAODS = V_HUANBIAOXX.I_JIUBIAODS,
      I_JIUBIAOFHDS = V_HUANBIAOXX.I_JIUBIAOFHDS,
      I_JIUBIAOFHYL = V_HUANBIAOXX.I_JIUBIAOFHYL,
      I_JIUBIAOQDDS = V_HUANBIAOXX.I_JIUBIAOQDDS,
      I_JIUBIAOQRYL = V_HUANBIAOXX.I_JIUBIAOQRYL,
      I_JIUBIAOYL = V_HUANBIAOXX.I_JIUBIAOYL,
      I_XINBIAODS = V_HUANBIAOXX.I_XINBIAODS,
      I_XINBIAOFHDS = V_HUANBIAOXX.I_XINBIAOFHDS,
      I_XINBIAOQDDS = V_HUANBIAOXX.I_XINBIAOQDDS,
      S_BEIZHU = V_HUANBIAOXX.S_BEIZHU,
      S_HUANBIAOCS = V_HUANBIAOXX.S_HUANBIAOCS,
      S_HUANBIAOYY = V_HUANBIAOXX.S_HUANBIAOYY,
      S_HUANBIAOYYSM = V_HUANBIAOXX.S_HUANBIAOYYSM,
      S_ZHUBIAOBH = V_HUANBIAOXX.S_ZHUBIAOBH,
      S_YEWULX = V_HUANBIAOXX.S_YEWULX
    WHERE S_USERID = V_HUANBIAOXX.S_USERID AND S_ZHUBIAOBH = V_HUANBIAOXX.S_ZHUBIAOBH;
    --DBMS_OUTPUT.PUT_LINE('修改换表数据');
    -- UPDATE IS_USER
    UPDATE TMP_SG_HUANBIAOXX SET IS_USED = 1 WHERE ID = V_ID;
  ELSIF V_TYPE = 3 THEN
    -- DELETE DATA
    DELETE FROM SG_HUANBIAOXX WHERE S_USERID = V_HUANBIAOXX.S_USERID AND S_ZHUBIAOBH = V_HUANBIAOXX.S_ZHUBIAOBH;
    --DBMS_OUTPUT.PUT_LINE('删除换表数据');
    -- UPDATE IS_USER
    UPDATE TMP_SG_HUANBIAOXX SET IS_USED = 1 WHERE ID = V_ID;
  ELSE
    DBMS_OUTPUT.PUT_LINE('数据不可用或没有对应的数据操作类型CRUD_TYPE' || V_HUANBIAOXX.CRUD_TYPE);
  END IF;
END LOOP;
--DELETE  TMP_SG_HUANBIAOXX where sysdate-7>d_huichuansj AND IS_USED =1;
end;
end;
/

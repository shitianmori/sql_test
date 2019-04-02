create or replace procedure proc_lianxirxx (
  v_number in number
)is
begin
 DECLARE
  CURSOR CUR_LIANXIRXX IS
  SELECT
    CRUD_TYPE,
    IS_USED,
    ID,
    D_CAOZUOSJ,
    D_HUICHUANSJ,
    D_SHENGXIAO,
    D_SHIXIAO,
    I_ZHUSONGDZ,
    S_CAOZUOR,
    S_DIANHUA,
    S_DIZHI,
    S_EMAIL,
    S_FENLEI,
    S_MINGCHENG,
    S_SHOUJI,
    S_USERID,
    S_XIUXIR,
    S_YOUBIAN,
    S_YOUJIDZ,
    S_ZHUANGTAI,
    I_LIANXIRID
  FROM TMP_SG_LIANXIRXX WHERE IS_USED = 0 and rownum<=v_number;
  V_ID TMP_SG_LIANXIRXX.ID%TYPE;
  V_TYPE TMP_SG_LIANXIRXX.CRUD_TYPE%TYPE;
  IS_EXIST INTEGER := 0;
BEGIN
FOR V_LIANXIRXX IN CUR_LIANXIRXX LOOP
  V_ID := V_LIANXIRXX.ID;
  V_TYPE := V_LIANXIRXX.CRUD_TYPE;
  IF V_TYPE = 1 THEN
    SELECT COUNT(*) INTO IS_EXIST FROM SG_LIANXIRXX WHERE S_USERID = V_LIANXIRXX.S_USERID AND I_LIANXIRID = V_LIANXIRXX.I_LIANXIRID;
    IF IS_EXIST = 0 THEN
      -- INSERT DATA
      INSERT INTO SG_LIANXIRXX
      (
        D_CAOZUOSJ,
        D_HUICHUANSJ,
        D_SHENGXIAO,
        D_SHIXIAO,
        I_ZHUSONGDZ,
        S_CAOZUOR,
        S_DIANHUA,
        S_DIZHI,
        S_EMAIL,
        S_FENLEI,
        S_MINGCHENG,
        S_SHOUJI,
        S_USERID,
        S_XIUXIR,
        S_YOUBIAN,
        S_YOUJIDZ,
        S_ZHUANGTAI,
        I_LIANXIRID
      ) VALUES
      (
        V_LIANXIRXX.D_CAOZUOSJ,
        V_LIANXIRXX.D_HUICHUANSJ,
        V_LIANXIRXX.D_SHENGXIAO,
        V_LIANXIRXX.D_SHIXIAO,
        V_LIANXIRXX.I_ZHUSONGDZ,
        V_LIANXIRXX.S_CAOZUOR,
        V_LIANXIRXX.S_DIANHUA,
        V_LIANXIRXX.S_DIZHI,
        V_LIANXIRXX.S_EMAIL,
        CASE
          WHEN V_LIANXIRXX.S_FENLEI = 0 THEN '������'
          WHEN V_LIANXIRXX.S_FENLEI = 1 THEN '���'
          WHEN V_LIANXIRXX.S_FENLEI = 2 THEN '������'
          WHEN V_LIANXIRXX.S_FENLEI = 4 THEN '��������ͥ��Ա'
          WHEN V_LIANXIRXX.S_FENLEI = 5 THEN '����'
          WHEN V_LIANXIRXX.S_FENLEI = 6 THEN '���̲�' ELSE '����'
        END,
        V_LIANXIRXX.S_MINGCHENG,
        V_LIANXIRXX.S_SHOUJI,
        V_LIANXIRXX.S_USERID,
        V_LIANXIRXX.S_XIUXIR,
        V_LIANXIRXX.S_YOUBIAN,
        V_LIANXIRXX.S_YOUJIDZ,
        CASE
          WHEN V_LIANXIRXX.S_ZHUANGTAI = 0 THEN '����'
          WHEN V_LIANXIRXX.S_ZHUANGTAI = 1 THEN '��ͣ' ELSE '����'
        END,
        V_LIANXIRXX.I_LIANXIRID
      );
     -- DBMS_OUTPUT.PUT_LINE('������ϵ������');
      -- UPDATE IS_USER
      UPDATE TMP_SG_LIANXIRXX SET IS_USED = 1 WHERE ID = V_ID;
    ELSE
      UPDATE TMP_SG_LIANXIRXX SET IS_USED = -1 WHERE ID = V_ID;
    END IF;
  ELSIF V_TYPE = 2 THEN
    -- ALTER DATA
    UPDATE SG_LIANXIRXX SET
      S_USERID = V_LIANXIRXX.S_USERID,
      S_FENLEI =
      CASE
        WHEN V_LIANXIRXX.S_FENLEI = 0 THEN '������'
        WHEN V_LIANXIRXX.S_FENLEI = 1 THEN '���'
        WHEN V_LIANXIRXX.S_FENLEI = 2 THEN '������'
        WHEN V_LIANXIRXX.S_FENLEI = 4 THEN '��������ͥ��Ա'
        WHEN V_LIANXIRXX.S_FENLEI = 5 THEN '����'
        WHEN V_LIANXIRXX.S_FENLEI = 6 THEN '���̲�' ELSE '����'
      END,
      S_MINGCHENG = V_LIANXIRXX.S_MINGCHENG,
      S_DIZHI = V_LIANXIRXX.S_DIZHI,
      S_DIANHUA = V_LIANXIRXX.S_DIANHUA,
      S_SHOUJI = V_LIANXIRXX.S_SHOUJI,
      S_EMAIL = V_LIANXIRXX.S_EMAIL,
      S_XIUXIR = V_LIANXIRXX.S_XIUXIR,
      S_YOUBIAN = V_LIANXIRXX.S_YOUBIAN,
      S_YOUJIDZ = V_LIANXIRXX.S_YOUJIDZ,
      I_ZHUSONGDZ = V_LIANXIRXX.I_ZHUSONGDZ,
      D_SHENGXIAO = V_LIANXIRXX.D_SHENGXIAO,
      D_SHIXIAO = V_LIANXIRXX.D_SHIXIAO,
      S_ZHUANGTAI =
      CASE
        WHEN V_LIANXIRXX.S_ZHUANGTAI = 0 THEN '����'
        WHEN V_LIANXIRXX.S_ZHUANGTAI = 1 THEN '��ͣ' ELSE '����'
      END,
      S_CAOZUOR = V_LIANXIRXX.S_CAOZUOR,
      D_CAOZUOSJ = V_LIANXIRXX.D_CAOZUOSJ,
      D_HUICHUANSJ = V_LIANXIRXX.D_HUICHUANSJ,
      I_LIANXIRID = V_LIANXIRXX.I_LIANXIRID
    WHERE S_USERID = V_LIANXIRXX.S_USERID AND I_LIANXIRID = V_LIANXIRXX.I_LIANXIRID;
    --DBMS_OUTPUT.PUT_LINE('�޸���ϵ������');
    -- UPDATE IS_USER
    UPDATE TMP_SG_LIANXIRXX SET IS_USED = 1 WHERE ID = V_ID;
  ELSIF V_TYPE = 3 THEN
    -- DELETE DATA
    DELETE FROM SG_LIANXIRXX WHERE S_USERID = V_LIANXIRXX.S_USERID AND I_LIANXIRID = V_LIANXIRXX.I_LIANXIRID;
   -- DBMS_OUTPUT.PUT_LINE('ɾ����ϵ������');
    -- UPDATE IS_USER
    UPDATE TMP_SG_LIANXIRXX SET IS_USED = 1 WHERE ID = V_ID;
  ELSE
    DBMS_OUTPUT.PUT_LINE('���ݲ����û�û�ж�Ӧ�����ݲ�������CRUD_TYPE' || V_LIANXIRXX.CRUD_TYPE);
  END IF;
END LOOP;
--DELETE  TMP_SG_LIANXIRXX  where sysdate-7 > d_huichuansj AND IS_USED =1;
end;
end;
/
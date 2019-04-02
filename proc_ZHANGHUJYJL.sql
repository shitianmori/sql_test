create or replace procedure proc_ZHANGHUJYJL(
  v_number in number
)is
begin
DECLARE
  CURSOR CUR_ZHANGHUJYJL IS
  SELECT
    ID,
    D_CAOZUOSJ,
    D_HUICHUANSJ,
    I_ZHANGWUNY,
    N_BIANGENGJE,
    N_YUE,
    S_CAOZUOR,
    S_JILUZT,
    S_LEIXING,
    S_SHOUFEIPH,
    S_SHOUFEIYUAN,
    S_USERID,
    CRUD_TYPE,
    IS_USED
  FROM TMP_SG_ZHANGHUJYJL WHERE IS_USED = 0 and rownum<=v_number;
  V_ID TMP_SG_ZHANGHUJYJL.ID%TYPE;
  V_TYPE TMP_SG_ZHANGHUJYJL.CRUD_TYPE%TYPE;
  IS_EXIST INTEGER := 0;
BEGIN
FOR V_ZHANGHUJYJL IN CUR_ZHANGHUJYJL LOOP
  V_ID := V_ZHANGHUJYJL.ID;
  V_TYPE := V_ZHANGHUJYJL.CRUD_TYPE;
  IF V_TYPE = 1 THEN
    SELECT COUNT(*) INTO IS_EXIST FROM SG_ZHANGHUJYJL WHERE S_USERID = V_ZHANGHUJYJL.S_USERID
    AND S_SHOUFEIPH = V_ZHANGHUJYJL.S_SHOUFEIPH
    AND S_LEIXING = (CASE V_ZHANGHUJYJL.S_LEIXING
                      WHEN '1' THEN '存入'
                      WHEN '2' THEN '退出'
                      WHEN '3' THEN '收费抵扣'
                      WHEN '4' THEN '收费转入'
                    END);
    IF IS_EXIST = 0 THEN
      -- INSERT DATA
      INSERT INTO SG_ZHANGHUJYJL
      (
        D_HUICHUANSJ,
        I_ZHANGWUNY,
        N_BIANGENGJE,
        N_YUE,
        S_CAOZUOR,
        S_JILUZT,
        S_LEIXING,
        S_SHOUFEIPH,
        S_SHOUFEIYUAN,
        S_USERID,
        D_CAOZUOSJ
      ) VALUES
      (
        V_ZHANGHUJYJL.D_HUICHUANSJ,
        V_ZHANGHUJYJL.I_ZHANGWUNY,
        V_ZHANGHUJYJL.N_BIANGENGJE,
        V_ZHANGHUJYJL.N_YUE,
        V_ZHANGHUJYJL.S_CAOZUOR,
        CASE V_ZHANGHUJYJL.S_JILUZT
          WHEN '-1' THEN '无效或红冲'
          WHEN '0' THEN '正常'
        END,
        CASE V_ZHANGHUJYJL.S_LEIXING
          WHEN '1' THEN '存入'
          WHEN '2' THEN '退出'
          WHEN '3' THEN '收费抵扣'
          WHEN '4' THEN '收费转入'
        END,
        V_ZHANGHUJYJL.S_SHOUFEIPH,
        V_ZHANGHUJYJL.S_SHOUFEIYUAN,
        V_ZHANGHUJYJL.S_USERID,
        V_ZHANGHUJYJL.D_CAOZUOSJ
      );
    --  DBMS_OUTPUT.PUT_LINE('添加账户交易记录数据');
      -- UPDATE IS_USER
      UPDATE TMP_SG_ZHANGHUJYJL SET IS_USED = 1 WHERE ID = V_ID;
    ELSE
      UPDATE TMP_SG_ZHANGHUJYJL SET IS_USED = -1 WHERE ID = V_ID;
    END IF;
  ELSIF V_TYPE = 2 THEN
    -- ALTER DATA
    UPDATE SG_ZHANGHUJYJL SET
      S_USERID = V_ZHANGHUJYJL.S_USERID,
      N_YUE = V_ZHANGHUJYJL.N_YUE,
      S_SHOUFEIYUAN = V_ZHANGHUJYJL.S_SHOUFEIYUAN,
      S_SHOUFEIPH = V_ZHANGHUJYJL.S_SHOUFEIPH,
      N_BIANGENGJE = V_ZHANGHUJYJL.N_BIANGENGJE,
      S_JILUZT =
      CASE V_ZHANGHUJYJL.S_JILUZT
        WHEN '-1' THEN '无效或红冲'
        WHEN '0' THEN '正常'
      END,
      S_LEIXING =
      CASE V_ZHANGHUJYJL.S_LEIXING
        WHEN '1' THEN '存入'
        WHEN '2' THEN '退出'
        WHEN '3' THEN '收费抵扣'
        WHEN '4' THEN '收费转入'
      END,
      S_CAOZUOR = V_ZHANGHUJYJL.S_CAOZUOR,
      I_ZHANGWUNY = V_ZHANGHUJYJL.I_ZHANGWUNY,
      D_CAOZUOSJ = V_ZHANGHUJYJL.D_CAOZUOSJ,
      D_HUICHUANSJ = V_ZHANGHUJYJL.D_HUICHUANSJ
    WHERE S_USERID = V_ZHANGHUJYJL.S_USERID
    AND S_SHOUFEIPH = V_ZHANGHUJYJL.S_SHOUFEIPH
    AND S_LEIXING = (CASE V_ZHANGHUJYJL.S_LEIXING
                      WHEN '1' THEN '存入'
                      WHEN '2' THEN '退出'
                      WHEN '3' THEN '收费抵扣'
                      WHEN '4' THEN '收费转入'
                    END);
   -- DBMS_OUTPUT.PUT_LINE('修改账户交易记录数据');
    -- UPDATE IS_USER
    UPDATE TMP_SG_ZHANGHUJYJL SET IS_USED = 1 WHERE ID = V_ID;
  ELSIF V_TYPE = 3 THEN
    -- DELETE DATA
    DELETE FROM SG_ZHANGHUJYJL WHERE S_USERID = V_ZHANGHUJYJL.S_USERID
    AND S_SHOUFEIPH = V_ZHANGHUJYJL.S_SHOUFEIPH
    AND S_LEIXING = (CASE V_ZHANGHUJYJL.S_LEIXING
                      WHEN '1' THEN '存入'
                      WHEN '2' THEN '退出'
                      WHEN '3' THEN '收费抵扣'
                      WHEN '4' THEN '收费转入'
                    END);
   -- DBMS_OUTPUT.PUT_LINE('删除账户交易记录数据');
    -- UPDATE IS_USER
    UPDATE TMP_SG_ZHANGHUJYJL SET IS_USED = 1 WHERE ID = V_ID;
  ELSE
    DBMS_OUTPUT.PUT_LINE('数据不可用或没有对应的数据操作类型CRUD_TYPE' || V_ZHANGHUJYJL.CRUD_TYPE);
  END IF;
END LOOP;
--DELETE  TMP_SG_ZHANGHUJYJL  where sysdate-7 > d_huichuansj AND IS_USED =1;
end;
end;
/

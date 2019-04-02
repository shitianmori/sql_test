create or replace procedure proc_yonghuxx(
  v_number in number
)is
begin
DECLARE
  CURSOR CUR_YONGHUXX IS
  SELECT
    CRUD_TYPE,
    IS_USED,
    ID,
    D_HUICHUANSJ,
    S_KEHUID,
    S_USERID,
    S_USERNAME
  FROM TMP_SG_YONGHUXX WHERE IS_USED = 0 and rownum<=v_number;
  V_ID TMP_SG_YONGHUXX.ID%TYPE;
  V_TYPE TMP_SG_YONGHUXX.CRUD_TYPE%TYPE;
BEGIN
FOR V_YONGHUXX IN CUR_YONGHUXX LOOP
  V_ID := V_YONGHUXX.ID;
  V_TYPE := V_YONGHUXX.CRUD_TYPE;
  IF V_TYPE = 1 THEN
    -- INSERT DATA
    INSERT INTO SG_YONGHUXX
    (
      D_HUICHUANSJ,
      S_KEHUID,
      S_USERID,
      S_USERNAME
    ) VALUES
    (
      V_YONGHUXX.D_HUICHUANSJ,
      V_YONGHUXX.S_KEHUID,
      V_YONGHUXX.S_USERID,
      V_YONGHUXX.S_USERNAME
    );
    --DBMS_OUTPUT.PUT_LINE('添加用户信息数据');
    -- UPDATE IS_USER
    UPDATE TMP_SG_YONGHUXX SET IS_USED = 1 WHERE ID = V_ID;
  ELSIF V_TYPE = 2 THEN
    -- ALTER DATA
    UPDATE SG_YONGHUXX SET
      S_USERID = V_YONGHUXX.S_USERID,
      S_USERNAME = V_YONGHUXX.S_USERNAME,
      S_KEHUID = V_YONGHUXX.S_KEHUID,
      D_HUICHUANSJ = V_YONGHUXX.D_HUICHUANSJ
    WHERE S_USERID = V_YONGHUXX.S_USERID;
   -- DBMS_OUTPUT.PUT_LINE('修改用户信息数据');
    -- UPDATE IS_USER
    UPDATE TMP_SG_YONGHUXX SET IS_USED = 1 WHERE ID = V_ID;
  ELSIF V_TYPE = 3 THEN
    -- DELETE DATA
    DELETE FROM SG_YONGHUXX WHERE S_USERID = V_YONGHUXX.S_USERID;
   -- DBMS_OUTPUT.PUT_LINE('删除用户信息数据');
    -- UPDATE IS_USER
    UPDATE TMP_SG_YONGHUXX SET IS_USED = 1 WHERE ID = V_ID;
  ELSE
    DBMS_OUTPUT.PUT_LINE('没有对应的数据操作类型CRUD_TYPE' || V_YONGHUXX.CRUD_TYPE);
  END IF;
END LOOP;
--DELETE  TMP_SG_YONGHUXX  where sysdate-7 > d_huichuansj AND IS_USED =1;
end;
END;
/

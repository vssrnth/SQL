
SET SERVEROUTPUT ON;

DROP TABLE restaurant_location;


CREATE TABLE restaurant_location (
    rid              INT,
    namer            VARCHAR2(100),
    street_address   VARCHAR2(150),
    city             VARCHAR2(20),
    state          VARCHAR2(20),
    zipcode          VARCHAR2(10),
    cuisine          VARCHAR2(100)
    
); 





DECLARE
    fulladdress   VARCHAR2(200);
    st            VARCHAR2(150);
    ct            VARCHAR2(20);
    stt           VARCHAR2(20);
    zipc           VARCHAR2(10);
    restid int;
    restname varchar2(100);
    cuisine varchar2(100);
    
    CURSOR c1 IS
    SELECT DISTINCT   
        reverse(substr(reverse(address), 0, instr(reverse(address), ' ')-1)) zip,
        reverse(substr(reverse(address), instr(reverse(address), ' ')+1,instr(reverse(address),' ',2)-3)) statepos,
        reverse(substr(reverse(address),instr(reverse(address),' ',2)+5,instr(reverse(address),' ',3)+2)) cityn,
        reverse(substr(reverse(address),instr(reverse(address),' ',5)+12)) strt,
        rid,
        name,
        cuisine
       
    FROM
        restaurant;

BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO zipc,stt,ct,st,restid,restname,cuisine;
        DBMS_OUTPUT.PUT_LINE('The zipcode is :'||zipc||' The state is : '||stt || ' City is : '||ct ||' Street is : '||st);
        EXIT WHEN c1%notfound;
        insert into restaurant_location values(restid,restname,st,ct,stt,zipc,cuisine);
        
        
         
    END loop;
    close c1;
END;







        
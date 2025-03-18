CREATE OR REPLACE FUNCTION SAMPLEUSER.GET_AREA(
	v_deptno	emp2.deptno%TYPE 
) RETURN varchar2  
IS
	darea	dept2.area%TYPE;
BEGIN
	SELECT area INTO darea
	FROM dept2 WHERE dcode = v_deptno;

	RETURN darea; -- 빼먹으면 안됨
END GET_AREA;

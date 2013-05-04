
CREATE OR REPLACE PROCEDURE 
update_decision(
  inCredit_Score NUMBER, 
  inSalary NUMBER, 
  inAge NUMBER, 
  inDependents NUMBER,
  inkNN NUMBER) as
  c_credit_score NUMBER := 0;
  c_salary NUMBER := 0;
  c_age NUMBER := 0;
  c_dependents NUMBER := 0;
  c_decision STRING(3) := null;
  maxNum NUMBER := 0;
  minNum NUMBER := 0;
  knn NUMBER := 0;
CURSOR c_app IS
  SELECT credit_score, salary, age, dependents, decision
  FROM applicant_credit;
BEGIN
  OPEN c_app;
	LOOP
		FETCH c_app INTO c_credit_score, c_salary, c_age, c_dependents, c_decision;
    IF c_app%NOTFOUND THEN -- fetch failed, so exit loop
       EXIT;
    ELSE   -- fetch succeeded
      --get distanceAge
      knn:= 0;
      maxNum:= 0;
      minNum:= 0;
      SELECT max(age) INTO maxNum from applicant_credit;
      SELECT min(age) INTO minNum FROM applicant_credit;
      knn:= knn + (abs(inAge - c_age) / (maxNum - minNum));
      --get distanceCredit
      maxNum:= 0;
      minNum:= 0;
      SELECT max(credit_score) INTO maxNum from applicant_credit;
      SELECT min(credit_score) INTO minNum FROM applicant_credit;
      knn:= knn + (abs(inCredit_Score - c_credit_score) / (maxNum - minNum));
      --get distanceSalary
      maxNum:= 0;
      minNum:= 0;
      SELECT max(salary) INTO maxNum from applicant_credit;
      SELECT min(salary) INTO minNum FROM applicant_credit;
      knn:= knn + (abs(inSalary - c_salary) / (maxNum - minNum));
      --get distanceDependents
      maxNum:= 0;
      minNum:= 0;
      SELECT max(dependents) INTO maxNum from applicant_credit;
      SELECT min(dependents) INTO minNum FROM applicant_credit;
      knn:= knn + (abs(inDependents - c_dependents) / (maxNum - minNum));
      --end of gets
      insert into APPLICANT_CREDIT_TEMP values (knn, c_decision); 
      knn:= 0;
    END IF;
	END LOOP;
  CLOSE c_app;
  SELECT COUNT(DECISION) INTO knn FROM
  (SELECT * 
  FROM (SELECT KNN, DECISION FROM APPLICANT_CREDIT_TEMP ORDER BY KNN) APPLICANT_CREDIT2
  WHERE ROWNUM <=inkNN 
  ORDER BY ROWNUM DESC)
  WHERE DECISION='YES';
  IF knn >= (inkNN/2) THEN
    INSERT INTO APPLICANT_CREDIT values (APP_ID_SEQ.NEXTVAL,inCredit_Score,inSalary,inAge,inDependents,'YES');
  ELSE
    INSERT INTO APPLICANT_CREDIT values (APP_ID_SEQ.NEXTVAL,inCredit_Score,inSalary,inAge,inDependents,'NO');
  END IF;
  delete from applicant_credit_temp;
END update_decision;

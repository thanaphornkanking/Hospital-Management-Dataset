-- preview data ���͡�������Ҵ� 5 ��� ��������ú�ҧ
Select TOP 5*
From patients;

-- ���ç���ҧ���ҧ������
EXEC sp_columns patients;

-- �Ѻ�ӹǹ����������е��ҧ
SELECT COUNT(*) AS total_patients FROM patients;
SELECT COUNT(*) AS total_doctors FROM doctors;
SELECT COUNT(*) AS total_appointments FROM appointments;
SELECT COUNT(*) AS total_treatments FROM treatments;
SELECT COUNT(*) AS total_billing FROM billing;

-- ��Ǩ�ͺ Null (Data Quality Check)
SELECT COUNT(*) AS null_first_name FROM patients WHERE first_name IS NULL;
SELECT COUNT(*) AS null_last_name FROM patients WHERE last_name IS NULL;

-- �ʴ�������ҧ������ 5 ���á
SELECT TOP 5 * FROM patients;
SELECT TOP 5 * FROM doctors;
SELECT TOP 5 * FROM appointments;
SELECT TOP 5 * FROM treatments;
SELECT TOP 5 * FROM billing;

-- preview table doctor ��������ú�ҧ
Select*
From doctors;

--���͡��ͷ�����ջ��ʺ��ó��ҡ���� 5 �� �ҡtable doctor �����§�ҡ�ҡ仹���
Select first_name, last_name, specialization, years_experience
From doctors
where years_experience > 5
Order by years_experience Desc;

--�� primary key ����е��ҧ价�� view->�Դ Object Explorer->��ԡ��ҷ��Tables->���͡���ҧ->Design->��ԡ������������ͧ�������� Primary Key->��ԡ�����ٻ�حᨺ� Toolbar (Set Primary Key)->Save

--���͡���͢����ż����ª�����ͷ��ӡ�ùѴ����
--3�繡�� join 3 table ���� patient_id ��� doctor_id 
Select patients.first_name as patient_name,
		doctors.first_name as doctor_name,
		appointments.appointment_date
from appointments
join patients on appointments.patient_id = patients.patient_id
join doctors on appointments.doctor_id = doctors.doctor_id
order by appointments.appointment_date DESC;

--4��ػ�ӹǹ����㹡���ѡ�����л���������ա�������Ф�����������������§�ҡ�Ҥ��ҡ仹���
SELECT 
    treatment_type, 
    COUNT(*) AS treatment_count, 
    SUM(cost) AS total_cost
FROM treatments
GROUP BY treatment_type
Order BY total_cost Desc;

--5��������ç��Һ���������͹
Select 
    FORMAT(bill_date, 'yyyy-MM') AS billing_month,
    SUM(amount) AS total_revenue
FROM billing
GROUP BY FORMAT(bill_date, 'yyyy-MM')
Order BY billing_month;


--6�����������Ф���������������
SELECT
    doctors.first_name + ' ' + doctors.last_name AS doctor_name,
    SUM(billing.amount) AS revenue
FROM billing
JOIN treatments ON billing.treatment_id = treatments.treatment_id
JOIN appointments ON treatments.appointment_id = appointments.appointment_id
JOIN doctors ON appointments.doctor_id = doctors.doctor_id
GROUP BY doctors.first_name, doctors.last_name
ORDER BY revenue DESC;

--7����Ҥ��餹�˹�ա�ùѴ�ҡ����ش 5 �ѹ�Ѻ�á
SELECT TOP 5
       patients.first_name + ' ' + patients.last_name AS patient_name,
        count(*) AS total_appointments
From appointments
join patients on appointments.patient_id = patients.patient_id
group by patients.first_name, patients.last_name
order by total_appointments Desc;

--8�����������յ���Ѵ�ҡ����ش 5 �ѹ�Ѻ�á
SELECT TOP 5
       patients.first_name + ' ' + patients.last_name AS patient_name,
        count(*) AS missed
From appointments
join patients on appointments.patient_id = patients.patient_id
where status = 'No-show'
group by patients.first_name, patients.last_name
order by missed DESC;


--9KPI :�����ͧ������Ф�������ҷ��Ѵ
SELECT doctors.first_name + ' ' + doctors.last_name AS doctor_name,
        count(distinct appointments.appointment_id) AS num_appointments,
        sum(billing.amount) AS total_revenue
From billing
Join treatments on billing.treatment_id = treatments.treatment_id
join appointments on treatments.appointment_id = appointments.appointment_id
join doctors on appointments.doctor_id = doctors.doctor_id
Group by doctors.first_name, doctors.last_name
order by total_revenue DESC;

--�����
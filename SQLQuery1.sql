-- preview data เลือกข้อมูลมาดู 5 ตัว ว่ามีอะไรบ้าง
Select TOP 5*
From patients;

-- ดูโครงสร้างตารางผู้ป่วย
EXEC sp_columns patients;

-- นับจำนวนข้อมูลในแต่ละตาราง
SELECT COUNT(*) AS total_patients FROM patients;
SELECT COUNT(*) AS total_doctors FROM doctors;
SELECT COUNT(*) AS total_appointments FROM appointments;
SELECT COUNT(*) AS total_treatments FROM treatments;
SELECT COUNT(*) AS total_billing FROM billing;

-- ตรวจสอบ Null (Data Quality Check)
SELECT COUNT(*) AS null_first_name FROM patients WHERE first_name IS NULL;
SELECT COUNT(*) AS null_last_name FROM patients WHERE last_name IS NULL;

-- แสดงตัวอย่างข้อมูล 5 แถวแรก
SELECT TOP 5 * FROM patients;
SELECT TOP 5 * FROM doctors;
SELECT TOP 5 * FROM appointments;
SELECT TOP 5 * FROM treatments;
SELECT TOP 5 * FROM billing;

-- preview table doctor ว่ามีอะไรบ้าง
Select*
From doctors;

--เลือกหมอที่ที่มีประสบการณ์มากกว่า 5 ปี จากtable doctor โดยเรียงจากมากไปน้อย
Select first_name, last_name, specialization, years_experience
From doctors
where years_experience > 5
Order by years_experience Desc;

--เซ็ต primary key ในแต่ละตารางไปที่ view->เปิด Object Explorer->คลิกขวาที่Tables->เลือกตาราง->Design->คลิกที่คอลัมน์ที่ต้องการให้เป็น Primary Key->คลิกปุ่มรูปกุญแจบน Toolbar (Set Primary Key)->Save

--เลือกชื่อข้อมูลผู้ป่วยชื่อหมอที่ทำการนัดหมาย
--3เป็นการ join 3 table โดยใช้ patient_id และ doctor_id 
Select patients.first_name as patient_name,
		doctors.first_name as doctor_name,
		appointments.appointment_date
from appointments
join patients on appointments.patient_id = patients.patient_id
join doctors on appointments.doctor_id = doctors.doctor_id
order by appointments.appointment_date DESC;

--4สรุปจำนวนครั้งในการรักษาแต่ละประเภทว่ามีกี่ครั้งและค่าใช้จ่ายเท่าไหร่เรียงจากราคามากไปน้อย
SELECT 
    treatment_type, 
    COUNT(*) AS treatment_count, 
    SUM(cost) AS total_cost
FROM treatments
GROUP BY treatment_type
Order BY total_cost Desc;

--5หารายได้โรงพยาบาลในแต่ละเดือน
Select 
    FORMAT(bill_date, 'yyyy-MM') AS billing_month,
    SUM(amount) AS total_revenue
FROM billing
GROUP BY FORMAT(bill_date, 'yyyy-MM')
Order BY billing_month;


--6ดูว่าหมอแต่ละคนมีรายได้เท่าไหร่
SELECT
    doctors.first_name + ' ' + doctors.last_name AS doctor_name,
    SUM(billing.amount) AS revenue
FROM billing
JOIN treatments ON billing.treatment_id = treatments.treatment_id
JOIN appointments ON treatments.appointment_id = appointments.appointment_id
JOIN doctors ON appointments.doctor_id = doctors.doctor_id
GROUP BY doctors.first_name, doctors.last_name
ORDER BY revenue DESC;

--7ดูว่าคนไข้คนไหนมีการนัดมากที่สุด 5 อันดับแรก
SELECT TOP 5
       patients.first_name + ' ' + patients.last_name AS patient_name,
        count(*) AS total_appointments
From appointments
join patients on appointments.patient_id = patients.patient_id
group by patients.first_name, patients.last_name
order by total_appointments Desc;

--8ดูว่าใครไม่มีตามนัดมากที่สุด 5 อันดับแรก
SELECT TOP 5
       patients.first_name + ' ' + patients.last_name AS patient_name,
        count(*) AS missed
From appointments
join patients on appointments.patient_id = patients.patient_id
where status = 'No-show'
group by patients.first_name, patients.last_name
order by missed DESC;


--9KPI :รายได้ของหมอแต่ละคนต่อเวลาที่นัด
SELECT doctors.first_name + ' ' + doctors.last_name AS doctor_name,
        count(distinct appointments.appointment_id) AS num_appointments,
        sum(billing.amount) AS total_revenue
From billing
Join treatments on billing.treatment_id = treatments.treatment_id
join appointments on treatments.appointment_id = appointments.appointment_id
join doctors on appointments.doctor_id = doctors.doctor_id
Group by doctors.first_name, doctors.last_name
order by total_revenue DESC;

--ดูว่า
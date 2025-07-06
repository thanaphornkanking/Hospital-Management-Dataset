# 🏥 โปรเจกต์ SQL Hospital Management System (Data Analyst Portfolio)

โปรเจกต์นี้เป็นตัวอย่างงาน **Data Analysis** ด้วย SQL สำหรับระบบจัดการโรงพยาบาล (Hospital Management System) โดยใช้ชุดข้อมูลที่จำลองขึ้น (synthetic data) เพื่อแสดงทักษะ:

✅ การออกแบบฐานข้อมูลเชิงสัมพันธ์ (Relational Schema)  
✅ การเขียน SQL Query สำหรับการวิเคราะห์ธุรกิจ  
✅ การสร้าง KPI และสรุป Insight สำหรับการตัดสินใจ

---

## 📚 เกี่ยวกับชุดข้อมูล

ข้อมูลถูกออกแบบให้เป็นหลายตารางเชื่อมโยงกัน เหมาะสำหรับฝึก:

- SQL joins
- Data exploration
- KPI analysis
- Healthcare analytics

### **ประกอบด้วย 5 ไฟล์ CSV**

| ไฟล์              | คำอธิบาย                                                        |
|--------------------|-----------------------------------------------------------------|
| `patients.csv`     | ข้อมูลผู้ป่วย (ประชากร, ที่อยู่, ประกัน)                       |
| `doctors.csv`      | ข้อมูลแพทย์ (ชื่อ, ความเชี่ยวชาญ, ประสบการณ์)                  |
| `appointments.csv` | ข้อมูลนัดหมาย (วันเวลา, เหตุผล, สถานะ)                         |
| `treatments.csv`   | ข้อมูลการรักษา (ประเภท, รายละเอียด, ค่าใช้จ่าย)                 |
| `billing.csv`      | ข้อมูลการเรียกเก็บเงิน (ยอด, วิธีจ่าย, สถานะ)                   |

> ⚠️ **หมายเหตุ:** ข้อมูลทั้งหมดเป็นข้อมูลสมมติ (Synthetic) ไม่มีข้อมูลผู้ป่วยจริง

---

## 🗂️ รายละเอียดคอลัมน์

<details>
<summary>patients.csv</summary>

| คอลัมน์             | คำอธิบาย                                 |
|----------------------|------------------------------------------|
| patient_id           | รหัสผู้ป่วย                              |
| first_name           | ชื่อ                                      |
| last_name            | นามสกุล                                   |
| gender               | เพศ (M/F)                                 |
| date_of_birth        | วันเกิด                                    |
| contact_number       | เบอร์โทรศัพท์                             |
| address              | ที่อยู่                                    |
| registration_date    | วันที่ลงทะเบียนครั้งแรก                   |
| insurance_provider   | บริษัทประกัน                              |
| insurance_number     | เลขกรมธรรม์                               |
| email                | อีเมล                                     |

</details>

<details>
<summary>doctors.csv</summary>

| คอลัมน์          | คำอธิบาย                           |
|-------------------|-------------------------------------|
| doctor_id         | รหัสแพทย์                          |
| first_name        | ชื่อ                                |
| last_name         | นามสกุล                             |
| specialization    | ความเชี่ยวชาญ                      |
| phone_number      | เบอร์โทร                            |
| years_experience  | ประสบการณ์ (ปี)                    |
| hospital_branch   | สาขาที่ประจำ                        |
| email             | อีเมล                               |

</details>

<details>
<summary>appointments.csv</summary>

| คอลัมน์           | คำอธิบาย                                      |
|--------------------|-----------------------------------------------|
| appointment_id     | รหัสการนัดหมาย                               |
| patient_id         | รหัสผู้ป่วย                                   |
| doctor_id          | รหัสแพทย์                                    |
| appointment_date   | วันที่นัดหมาย                                 |
| appointment_time   | เวลานัดหมาย                                  |
| reason_for_visit   | เหตุผลการมาโรงพยาบาล                          |
| status             | สถานะ (Scheduled, Completed, Cancelled)      |

</details>

<details>
<summary>treatments.csv</summary>

| คอลัมน์         | คำอธิบาย                        |
|------------------|---------------------------------|
| treatment_id     | รหัสการรักษา                   |
| appointment_id   | รหัสการนัดหมาย                 |
| treatment_type   | ประเภทการรักษา                 |
| description      | รายละเอียด                     |
| cost             | ค่าใช้จ่าย                      |
| treatment_date   | วันที่รักษา                     |

</details>

<details>
<summary>billing.csv</summary>

| คอลัมน์         | คำอธิบาย                                        |
|------------------|-------------------------------------------------|
| bill_id          | รหัสบิล                                         |
| patient_id       | รหัสผู้ป่วย                                      |
| treatment_id     | รหัสการรักษา                                    |
| bill_date        | วันที่เรียกเก็บเงิน                              |
| amount           | จำนวนเงิน                                       |
| payment_method   | วิธีจ่าย (Cash, Card, Insurance)                |
| payment_status   | สถานะการจ่าย (Paid, Pending, Failed)           |

</details>

---

## 🎯 วัตถุประสงค์ของการวิเคราะห์

- สรุปรายได้โรงพยาบาล
- วิเคราะห์รายได้ของแพทย์แต่ละคน
- หาคนไข้ที่นัดบ่อยที่สุด
- หาคนไข้ที่ไม่มาตามนัดบ่อยที่สุด
- ทำ KPI: รายได้ต่อจำนวนการนัดของแพทย์

---

## 💻 ตัวอย่าง SQL Queries

```sql
-- 1️⃣ Preview Data
-- ดูข้อมูลผู้ป่วย 5 แถว
SELECT TOP 5 * FROM patients;

-- ดูข้อมูลหมอทั้งหมด
SELECT * FROM doctors;
```

-- 2️⃣ เลือกหมอที่มีประสบการณ์มากกว่า 5 ปี
SELECT first_name, last_name, specialization, years_experience
FROM doctors
WHERE years_experience > 5
ORDER BY years_experience DESC;


-- 3️⃣ JOIN 3 ตาราง: ชื่อผู้ป่วย, ชื่อหมอ, วันนัด
SELECT 
    patients.first_name AS patient_name,
    doctors.first_name AS doctor_name,
    appointments.appointment_date
FROM appointments
JOIN patients ON appointments.patient_id = patients.patient_id
JOIN doctors ON appointments.doctor_id = doctors.doctor_id
ORDER BY appointments.appointment_date DESC;


-- 4️⃣ สรุปการรักษา: จำนวนครั้งและค่าใช้จ่าย
SELECT 
    treatment_type, 
    COUNT(*) AS treatment_count, 
    SUM(cost) AS total_cost
FROM treatments
GROUP BY treatment_type
ORDER BY total_cost DESC;


-- 5️⃣ รายได้โรงพยาบาลรายเดือน
SELECT 
    FORMAT(bill_date, 'yyyy-MM') AS billing_month,
    SUM(amount) AS total_revenue
FROM billing
GROUP BY FORMAT(bill_date, 'yyyy-MM')
ORDER BY billing_month;


-- 6️⃣ รายได้แพทย์แต่ละคน
SELECT
    doctors.first_name + ' ' + doctors.last_name AS doctor_name,
    SUM(billing.amount) AS revenue
FROM billing
JOIN treatments ON billing.treatment_id = treatments.treatment_id
JOIN appointments ON treatments.appointment_id = appointments.appointment_id
JOIN doctors ON appointments.doctor_id = doctors.doctor_id
GROUP BY doctors.first_name, doctors.last_name
ORDER BY revenue DESC;


-- 7️⃣ Top 5 ผู้ป่วยที่นัดบ่อยที่สุด
SELECT TOP 5
    patients.first_name + ' ' + patients.last_name AS patient_name,
    COUNT(*) AS total_appointments
FROM appointments
JOIN patients ON appointments.patient_id = patients.patient_id
GROUP BY patients.first_name, patients.last_name
ORDER BY total_appointments DESC;


-- 8️⃣ Top 5 ผู้ป่วยที่ไม่มาตามนัดบ่อยที่สุด
SELECT TOP 5
    patients.first_name + ' ' + patients.last_name AS patient_name,
    COUNT(*) AS missed
FROM appointments
JOIN patients ON appointments.patient_id = patients.patient_id
WHERE status = 'No-show'
GROUP BY patients.first_name, patients.last_name
ORDER BY missed DESC;


-- 9️⃣ KPI: รายได้ต่อจำนวนการนัดของหมอ
SELECT 
    doctors.first_name + ' ' + doctors.last_name AS doctor_name,
    COUNT(DISTINCT appointments.appointment_id) AS num_appointments,
    SUM(billing.amount) AS total_revenue
FROM billing
JOIN treatments ON billing.treatment_id = treatments.treatment_id
JOIN appointments ON treatments.appointment_id = appointments.appointment_id
JOIN doctors ON appointments.doctor_id = doctors.doctor_id
GROUP BY doctors.first_name, doctors.last_name
ORDER BY total_revenue DESC;

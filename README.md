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


### 1️⃣ Preview Data

**Description:**
เริ่มด้วยการ Preview ข้อมูล เพื่อทำความเข้าใจโครงสร้างและตัวอย่างข้อมูลเบื้องต้นในแต่ละตาราง

#### 🟢 1.1 ดูโครงสร้างตาราง (Schema / Columns)
**Query ตัวอย่าง:**
```sql
EXEC sp_columns patients;
```
```text
📋 **ผลลัพธ์ (สรุป Schema):**

| 🏷️ COLUMN_NAME       | 🗂️ TYPE_NAME  | 📌 ความหมาย                               
|-----------------------|---------------|-------------------------------------------
| patient_id            | nvarchar      | รหัสผู้ป่วย (Primary Key)                
| first_name            | nvarchar      | ชื่อจริงผู้ป่วย                            
| last_name             | nvarchar      | นามสกุลผู้ป่วย                             
| gender                | nvarchar      | เพศ (M / F)                                
| date_of_birth         | datetime2     | วันเดือนปีเกิด                             
| contact_number        | float         | เบอร์โทรศัพท์                              
| address               | nvarchar      | ที่อยู่ผู้ป่วย                              
| registration_date     | datetime2     | วันที่ลงทะเบียนครั้งแรก                    
| insurance_provider    | nvarchar      | บริษัทประกันสุขภาพ                         
| insurance_number      | nvarchar      | เลขกรมธรรม์ประกัน                          
| email                 | nvarchar      | อีเมลผู้ป่วย                                
```


🟢 1.2 นับจำนวนข้อมูลในแต่ละตาราง
```sql
SELECT COUNT(*) AS total_patients FROM patients;
```
📋 **ผลลัพธ์ (สรุป):มีข้อมูลจำนวน 50 ตัว**

| total_patients      |                              
|-----------------------|
| 50             |

```sql
SELECT COUNT(*) AS total_doctors FROM doctors;
```
📋 **ผลลัพธ์ (สรุป):มีข้อมูลจำนวน 10 ตัว**

| total_doctors      |                              
|-----------------------|
| 10             |

```sql
SELECT COUNT(*) AS total_appointments FROM appointments;
```
📋 **ผลลัพธ์ (สรุป):มีข้อมูลจำนวน 200 ตัว**

| total_appointments      |                              
|-----------------------|
| 200             |

```sql
SELECT COUNT(*) AS total_treatments FROM treatments;
```
📋 **ผลลัพธ์ (สรุป):มีข้อมูลจำนวน 200 ตัว**

| total_treatments     |                              
|-----------------------|
| 200             |

```sql
SELECT COUNT(*) AS total_billing FROM billing;
```
📋 **ผลลัพธ์ (สรุป):มีข้อมูลจำนวน 200 ตัว**

| total_billing     |                              
|-----------------------|
| 200             |

🟢 1.3 ตรวจสอบ Null (Data Quality Check)
```sql
SELECT COUNT(*) AS null_first_name FROM patients WHERE first_name IS NULL;
```
| null_first_name     |                              
|-----------------------|
| 0             |

📋 **ผลลัพธ์ (สรุป):ไม่มีชื่อข้อมูล Null**

```sql
SELECT COUNT(*) AS null_last_name FROM patients WHERE last_name IS NULL;
```
| null_last_name     |                              
|-----------------------|
| 0             |

📋 **ผลลัพธ์ (สรุป):ไม่มีนามสกุลข้อมูล Null**


🟢 1.4 แสดงตัวอย่างข้อมูล 5 แถวแรก
```sql
SELECT TOP 5 * FROM patients;
SELECT TOP 5 * FROM doctors;
SELECT TOP 5 * FROM appointments;
SELECT TOP 5 * FROM treatments;
SELECT TOP 5 * FROM billing;
```


### 2️⃣ เลือกหมอที่มีประสบการณ์มากกว่า 5 ปี
```sql
SELECT first_name, last_name, specialization, years_experience
FROM doctors
WHERE years_experience > 5
ORDER BY years_experience DESC;
```
**ตัวอย่างผลลัพธ์:**

```text
first_name | last_name | specialization | years_experience
----------------------------------------------------------
David      | Jones     | Pediatrics     | 28
Sarah      | Taylor    | Dermatology    | 26
Robert     | Davis     | Oncology       | 26
Sarah      | Smith     | Pediatrics     | 26
Jane       | Davis     | Pediatrics     | 24
Alex       | Davis     | Pediatrics     | 23
Linda      | Wilson    | Oncology       | 21
Jane       | Smith     | Pediatrics     | 19
David      | Taylor    | Dermatology    | 17
```
**คำอธิบายผลลัพธ์:**

ผลลัพธ์นี้แสดงรายชื่อแพทย์ที่มี ประสบการณ์มากกว่า 5 ปี พร้อมรายละเอียด ชื่อ-นามสกุล, สาขาความเชี่ยวชาญ และ จำนวนปีประสบการณ์ โดยเรียงจากผู้ที่มีประสบการณ์มากที่สุดลงมา
ข้อมูลนี้ช่วยให้ผู้บริหารหรือแอดมินโรงพยาบาลสามารถวิเคราะห์ความพร้อมด้านบุคลากรเชี่ยวชาญ วางแผนแบ่งงาน หรือมอบหมายเคสที่เหมาะสมได้

### 3️⃣ JOIN 3 ตาราง: ชื่อผู้ป่วย, ชื่อหมอ, วันนัด
```sql
SELECT 
    patients.first_name AS patient_name,
    doctors.first_name AS doctor_name,
    appointments.appointment_date
FROM appointments
JOIN patients ON appointments.patient_id = patients.patient_id
JOIN doctors ON appointments.doctor_id = doctors.doctor_id
ORDER BY appointments.appointment_date DESC;
```
**ตัวอย่างผลลัพธ์:**

```text
patient_name | doctor_name | appointment_date
----------------------------------------------
Alex         | Sarah       | 2023-12-30 00:00:00.000
Laura        | Jane        | 2023-12-26 00:00:00.000
David        | Robert      | 2023-12-26 00:00:00.000
Emily        | Jane        | 2023-12-24 00:00:00.000
Sarah        | Jane        | 2023-12-20 00:00:00.000
```

**คำอธิบายผลลัพธ์:**

ตารางผลลัพธ์นี้แสดงข้อมูล **ชื่อผู้ป่วย, ชื่อแพทย์, และวันที่นัดหมาย** หลังจาก JOIN ตาราง appointments, patients และ doctors เข้าด้วยกัน
ข้อมูลนี้ช่วยให้เห็นความสัมพันธ์ระหว่างผู้ป่วยและแพทย์อย่างชัดเจน ว่า **ผู้ป่วยแต่ละคนมีนัดกับแพทย์คนใด และในวันใด** 
สามารถใช้ในการวิเคราะห์ภาระงานของแพทย์ วางแผนทรัพยากรบุคลากร หรือทำรายงานติดตามการนัดหมายได้

### 4️⃣ สรุปการรักษา: จำนวนครั้งและค่าใช้จ่าย
```sql
SELECT 
    treatment_type, 
    COUNT(*) AS treatment_count, 
    SUM(cost) AS total_cost
FROM treatments
GROUP BY treatment_type
ORDER BY total_cost DESC;
```
**ตัวอย่างผลลัพธ์:**

```text
treatment_type | treatment_count | total_cost
---------------------------------------------
Chemotherapy   | 49              | 128855.68
MRI            | 36              | 116098.16
X-Ray          | 41              | 110653.67
Physiotherapy  | 39              | 99418.1
ECG            | 38              | 96224.24
```
**คำอธิบายผลลัพธ์:**

ผลลัพธ์นี้สรุปจำนวนครั้งของการรักษาแต่ละประเภท (treatment_type) และค่าใช้จ่ายรวม (total_cost) โดยจัดเรียงจากประเภทที่มีค่าใช้จ่ายรวมสูงที่สุดลงมา
ข้อมูลนี้ช่วยให้โรงพยาบาลเข้าใจว่า ประเภทการรักษาใดมีการใช้บริการบ่อย และสร้างค่าใช้จ่ายสูง เพื่อใช้วิเคราะห์ทรัพยากร, วางแผนงบประมาณ หรือเจรจาราคากับผู้ให้บริการเครื่องมือและยาได้

### 5️⃣ รายได้โรงพยาบาลรายเดือน
```sql
SELECT 
    FORMAT(bill_date, 'yyyy-MM') AS billing_month,
    SUM(amount) AS total_revenue
FROM billing
GROUP BY FORMAT(bill_date, 'yyyy-MM')
ORDER BY billing_month;
```
**ตัวอย่างผลลัพธ์:**

```text
billing_month | total_revenue
--------------------------------
2023-01       | 58701.23
2023-02       | 36669.69
2023-03       | 47304.29
2023-04       | 64271.54
2023-05       | 48791.05
2023-06       | 56887.82
2023-07       | 39880.19
2023-08       | 41958.67
2023-09       | 45185.91
2023-10       | 43144.15
2023-11       | 52474.98
2023-12       | 27569.71
```
**คำอธิบายผลลัพธ์:**

ผลลัพธ์นี้แสดง รายได้รวมของโรงพยาบาลแยกรายเดือน โดยแสดงเดือน (billing_month) และยอดรายได้รวม (total_revenue) สำหรับปี 2023
ข้อมูลนี้ช่วยให้โรงพยาบาล วิเคราะห์แนวโน้มรายได้ตามฤดูกาลหรือเดือน, วางแผนจัดสรรงบประมาณ, และทำการคาดการณ์ (forecast) รายได้ในอนาคตได้

### 6️⃣ รายได้แพทย์แต่ละคน
```sql
SELECT
    doctors.first_name + ' ' + doctors.last_name AS doctor_name,
    SUM(billing.amount) AS revenue
FROM billing
JOIN treatments ON billing.treatment_id = treatments.treatment_id
JOIN appointments ON treatments.appointment_id = appointments.appointment_id
JOIN doctors ON appointments.doctor_id = doctors.doctor_id
GROUP BY doctors.first_name, doctors.last_name
ORDER BY revenue DESC;
```
**ตัวอย่างผลลัพธ์:**

```text
doctor_name   | revenue
---------------------------
Sarah Taylor  | 82696.48
Alex Davis    | 69586.10
David Taylor  | 66585.39
Jane Davis    | 59803.46
Linda Brown   | 53427.42
Jane Smith    | 52791.41
Linda Wilson  | 49436.23
Robert Davis  | 40166.50
David Jones   | 39315.95
Sarah Smith   | 37440.91
```
**คำอธิบายผลลัพธ์:**

ผลลัพธ์นี้แสดง รายได้รวมของแพทย์แต่ละคน จากการรักษาทั้งหมดที่ดูแล โดยเรียงจากมากไปน้อย
ข้อมูลนี้ช่วยให้โรงพยาบาลสามารถ ประเมินผลงานแพทย์, กำหนด KPI หรือโบนัส และวางแผนการจัดสรรทรัพยากรบุคลากรได้อย่างมีประสิทธิภาพ

### 7️⃣ Top 5 ผู้ป่วยที่นัดบ่อยที่สุด
```sql
SELECT TOP 5
    patients.first_name + ' ' + patients.last_name AS patient_name,
    COUNT(*) AS total_appointments
FROM appointments
JOIN patients ON appointments.patient_id = patients.patient_id
GROUP BY patients.first_name, patients.last_name
ORDER BY total_appointments DESC;
```
**ตัวอย่างผลลัพธ์:**

```text
patient_name    | total_appointments
------------------------------------
Michael Taylor  | 16
David Wilson    | 15
Laura Davis     | 14
Michael Wilson  | 14
David Smith     | 9
```
**คำอธิบายผลลัพธ์:**

ผลลัพธ์นี้แสดง ผู้ป่วย 5 อันดับแรกที่มีจำนวนการนัดหมายมากที่สุด พร้อมจำนวนครั้งการนัด (total_appointments)
ข้อมูลนี้ช่วยให้โรงพยาบาลระบุ กลุ่มผู้ป่วยที่ใช้บริการเป็นประจำ ซึ่งสามารถนำไปวางแผนโปรแกรมดูแลสุขภาพเฉพาะบุคคล ติดตามการรักษาอย่างใกล้ชิด หรือปรับปรุงการให้บริการให้เหมาะสม

### 8️⃣ Top 5 ผู้ป่วยที่ไม่มาตามนัดบ่อยที่สุด
```sql
SELECT TOP 5
    patients.first_name + ' ' + patients.last_name AS patient_name,
    COUNT(*) AS missed
FROM appointments
JOIN patients ON appointments.patient_id = patients.patient_id
WHERE status = 'No-show'
GROUP BY patients.first_name, patients.last_name
ORDER BY missed DESC;
```
**ตัวอย่างผลลัพธ์:**

```text
patient_name    | missed
------------------------------
Alex Moore      | 6
Laura Davis     | 5
Michael Taylor  | 5
David Wilson    | 5
Michael Wilson  | 4
```
**คำอธิบายผลลัพธ์:**

ผลลัพธ์นี้แสดง ผู้ป่วย 5 อันดับแรกที่ขาดนัดหมายบ่อยที่สุด (missed) โดยระบุจำนวนครั้งการขาดนัด
ข้อมูลนี้ช่วยให้โรงพยาบาล วิเคราะห์และระบุผู้ป่วยกลุ่มเสี่ยงที่มีแนวโน้มขาดนัด เพื่อนำไปใช้วางแผนส่ง SMS/โทรเตือน นัดซ้ำอย่างเหมาะสม หรือออกแบบมาตรการลดการขาดนัดให้มีประสิทธิภาพ

### 9️⃣ KPI: รายได้ต่อจำนวนการนัดของหมอ
```sql
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
```
**ตัวอย่างผลลัพธ์:**

```text
doctor_name   | num_appointments | total_revenue
-------------------------------------------------
Sarah Taylor  | 29                | 82696.48
Alex Davis    | 24                | 69586.10
David Taylor  | 25                | 66585.39
Jane Davis    | 21                | 59803.46
Linda Brown   | 16                | 53427.42
Jane Smith    | 14                | 52791.41
Linda Wilson  | 19                | 49436.23
Robert Davis  | 13                | 40166.50
David Jones   | 14                | 39315.95
Sarah Smith   | 17                | 37440.91
```
**คำอธิบายผลลัพธ์:**
ผลลัพธ์นี้แสดง KPI รายได้รวมและจำนวนการนัดหมายของแพทย์แต่ละคน โดยแสดงจำนวนการนัด (num_appointments) และรายได้รวม (total_revenue)
ข้อมูลนี้ช่วยให้โรงพยาบาล ประเมินผลงานของแพทย์แต่ละคน ทั้งด้านภาระงานและประสิทธิภาพการสร้างรายได้ เพื่อใช้กำหนด KPI, ประเมินโบนัส หรือวางแผนปรับทรัพยากรบุคลากรได้อย่างเหมาะสม

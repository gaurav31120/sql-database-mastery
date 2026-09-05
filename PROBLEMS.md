# 🗄️ SQL + PostgreSQL Mastery — Problems

> **Goal:** Beginner → Advanced SQL → PostgreSQL  

## Progress

**Completed: 03/ 220**.

---

## 📊 Overall Progress

| Level | Topic | Problems | Progress |
|---|---|---:|---:|
| 01 | SQL Fundamentals | 01–20 | 🟢 3/20 |
| 02 | CRUD + Table Operations | 21–40 | ⬜ 0/20 |
| 03 | Aggregation | 41–60 | ⬜ 0/20 |
| 04 | JOINs | 61–90 | ⬜ 0/30 |
| 05 | Subqueries | 91–115 | ⬜ 0/25 |
| 06 | Advanced SQL — CTE / CASE / UNION | 116–127 | ⬜ 0/12 |
| 06B | Window Functions | 128–145 | ⬜ 0/18 |
| 07 | Real Interview Problems | 146–165 | ⬜ 0/20 |
| 08 | Database Design | 166–180 | ⬜ 0/15 |
| 09 | Performance + Transactions | 181–195 | ⬜ 0/15 |
| 10 | Spring Boot + JPA | 196–220 | ⬜ 0/25 |
| | **TOTAL** | **01–220** | **🟢 3/220** |

### Legend

- ☑️ = Completed
- ⬜ = Not completed
- 🔄 = In progress

---

# 🟢 LEVEL 1 — SQL FUNDAMENTALS

**Problems 01–20**

- [x] **01. Display all employees** — ✅ DONE
- [x] **02. Display employee names and salaries** — ✅ DONE
- [x] **03. Display unique department IDs** — ✅ DONE
- [ ] **04. Find employees whose salary is greater than 50,000**
- [ ] **05. Find employees whose salary is less than 50,000**
- [ ] **06. Find employees earning exactly 60,000**
- [ ] **07. Find employees whose salary is between 40,000 and 70,000**
- [ ] **08. Find employees belonging to the IT department**
- [ ] **09. Find employees belonging to IT or HR**
- [ ] **10. Find employees whose name starts with A**
- [ ] **11. Find employees whose name ends with n**
- [ ] **12. Find employees whose name contains ar**
- [ ] **13. Find employees whose department is not IT**
- [ ] **14. Find employees whose salary is NULL**
- [ ] **15. Find employees whose salary is NOT NULL**
- [ ] **16. Display employees ordered by salary ascending**
- [ ] **17. Display employees ordered by salary descending**
- [ ] **18. Display the top 5 highest-paid employees**
- [ ] **19. Display the 3 lowest-paid employees**
- [ ] **20. Display employees sorted by department and then salary**

---

# 🟢 LEVEL 2 — CRUD + TABLE OPERATIONS

**Problems 21–40**

- [ ] **21. Create an employees table**
- [ ] **22. Create a departments table**
- [ ] **23. Add a primary key**
- [ ] **24. Add a foreign key from employees → departments**
- [ ] **25. Add a NOT NULL constraint**
- [ ] **26. Add a UNIQUE constraint on email**
- [ ] **27. Insert 10 employees**
- [ ] **28. Insert 5 departments**
- [ ] **29. Update an employee's salary**
- [ ] **30. Increase every IT employee's salary by 10%**
- [ ] **31. Change an employee's department**
- [ ] **32. Delete an employee**
- [ ] **33. Delete employees belonging to a particular department**
- [ ] **34. Add an email column**
- [ ] **35. Add a joining_date column**
- [ ] **36. Rename a column**
- [ ] **37. Change a column's datatype**
- [ ] **38. Add a DEFAULT value**
- [ ] **39. Add a CHECK constraint for salary**
- [ ] **40. Create a new table using CREATE TABLE AS**

---

# 🟡 LEVEL 3 — AGGREGATION

**Problems 41–60**

- [ ] **41. Count total employees**
- [ ] **42. Find the highest salary**
- [ ] **43. Find the lowest salary**
- [ ] **44. Find average salary**
- [ ] **45. Find total salary paid**
- [ ] **46. Count employees per department**
- [ ] **47. Find average salary per department**
- [ ] **48. Find highest salary per department**
- [ ] **49. Find lowest salary per department**
- [ ] **50. Find total salary per department**
- [ ] **51. Find departments having more than 5 employees**
- [ ] **52. Find departments whose average salary is greater than 60,000**
- [ ] **53. Find the department with the highest average salary**
- [ ] **54. Find the department with the highest total salary**
- [ ] **55. Find departments with no employees**
- [ ] **56. Find the number of employees hired each year**
- [ ] **57. Find average salary by joining year**
- [ ] **58. Find the salary difference between highest and lowest employee**
- [ ] **59. Find the second-highest salary using aggregation**
- [ ] **60. Find the department containing the highest-paid employee**

---

# 🔥 LEVEL 4 — JOINs

**Problems 61–90**

> Tables: `employees`, `departments`, `projects`, `employee_projects`

- [ ] **61. Display employee name + department name**
- [ ] **62. Display all employees even if they don't belong to a department**
- [ ] **63. Find employees who don't belong to any department**
- [ ] **64. Find departments having no employees**
- [ ] **65. Display employee + department + manager**
- [ ] **66. Find employees working in IT**
- [ ] **67. Find employees working in departments located in Kolkata**
- [ ] **68. Find employees whose department salary average is > 60,000**
- [ ] **69. Display department-wise employee count**
- [ ] **70. Display department-wise maximum salary**
- [ ] **71. Display department-wise average salary**
- [ ] **72. Display employee and project name**
- [ ] **73. Find employees working on more than one project**
- [ ] **74. Find projects with no employees**
- [ ] **75. Find employees not assigned to any project**
- [ ] **76. Find the highest-paid employee in each department**
- [ ] **77. Find the lowest-paid employee in each department**
- [ ] **78. Find employees earning more than their department average**
- [ ] **79. Find employees working on the same project**
- [ ] **80. Find projects having more than 5 employees**
- [ ] **81. Find departments with employees working on Project A**
- [ ] **82. Find employees working on both Project A and Project B**
- [ ] **83. Find employees working on Project A but not Project B**
- [ ] **84. Find the department with the highest number of projects**
- [ ] **85. Find the employee with the highest number of projects**
- [ ] **86. Find employees whose manager belongs to another department**
- [ ] **87. Find employees who earn more than their manager**
- [ ] **88. Find employees who joined before their manager**
- [ ] **89. Find pairs of employees working in the same department**
- [ ] **90. Build a complete employee-project-department report**

---

# 🔥 LEVEL 5 — SUBQUERIES

**Problems 91–115**

- [ ] **91. Find employees earning above average salary**
- [ ] **92. Find employees earning below average salary**
- [ ] **93. Find employees earning the highest salary**
- [ ] **94. Find employees earning the second-highest salary**
- [ ] **95. Find employees earning the third-highest salary**
- [ ] **96. Find employees earning more than their department average**
- [ ] **97. Find departments whose average salary is above company average**
- [ ] **98. Find employees working in the department with the highest average salary**
- [ ] **99. Find employees who work in the same department as Gaurav**
- [ ] **100. Find employees who earn more than every HR employee**
- [ ] **101. Find employees who earn more than at least one IT employee**
- [ ] **102. Find departments having at least one employee earning > 100,000**
- [ ] **103. Find departments where every employee earns > 50,000**
- [ ] **104. Find employees who have never worked on a project**
- [ ] **105. Find projects that have no employees**
- [ ] **106. Find customers who have never placed an order**
- [ ] **107. Find customers whose order total exceeds average order total**
- [ ] **108. Find the highest order for every customer**
- [ ] **109. Find customers with the highest total spending**
- [ ] **110. Find the second-highest spending customer**
- [ ] **111. Find products that have never been ordered**
- [ ] **112. Find products ordered more than average**
- [ ] **113. Find customers who purchased the most expensive product**
- [ ] **114. Find employees whose salary equals another employee's salary**
- [ ] **115. Find duplicate emails**

---

# 🟠 LEVEL 6 — ADVANCED SQL

## CTEs — 116–120

- [ ] **116. Calculate department salary statistics using a CTE**
- [ ] **117. Find employees earning above department average using CTE**
- [ ] **118. Find the top 3 departments by salary**
- [ ] **119. Build a multi-step sales report using CTEs**
- [ ] **120. Find customers whose spending increased month-over-month**

## CASE — 121–124

- [ ] **121. Categorize employees into salary bands**
- [ ] **122. Categorize customers based on spending**
- [ ] **123. Categorize orders as Small/Medium/Large**
- [ ] **124. Generate employee performance categories**

## UNION — 125–127

- [ ] **125. Combine employees from two tables**
- [ ] **126. Find records existing in either dataset**
- [ ] **127. Find common records between datasets**

---

# 🔴 LEVEL 6B — WINDOW FUNCTIONS

**Problems 128–145**

- [ ] **128. Rank employees by salary**
- [ ] **129. Rank employees within each department**
- [ ] **130. Find top 3 employees per department**
- [ ] **131. Find second-highest employee per department**
- [ ] **132. Find third-highest employee per department**
- [ ] **133. Assign row numbers to employees**
- [ ] **134. Compare ROW_NUMBER, RANK, and DENSE_RANK**
- [ ] **135. Calculate running salary total**
- [ ] **136. Calculate department running salary total**
- [ ] **137. Calculate employee salary difference from department average**
- [ ] **138. Find previous employee salary using LAG**
- [ ] **139. Find next employee salary using LEAD**
- [ ] **140. Find employees whose salary increased compared with previous employee**
- [ ] **141. Calculate cumulative sales**
- [ ] **142. Find monthly sales growth**
- [ ] **143. Find top 3 products by sales per category**
- [ ] **144. Find highest order per customer**
- [ ] **145. Find latest transaction per account**

---

# 🟣 LEVEL 7 — REAL INTERVIEW PROBLEMS

**Problems 146–165**

- [ ] **146. Find duplicate customer records**
- [ ] **147. Find customers with no orders**
- [ ] **148. Find customers with more than 3 orders**
- [ ] **149. Find customers whose total spending exceeds ₹100,000**
- [ ] **150. Find the highest-selling product**
- [ ] **151. Find the second-highest-selling product**
- [ ] **152. Find top 5 products by revenue**
- [ ] **153. Find top 3 products in every category**
- [ ] **154. Find the highest order per customer**
- [ ] **155. Find the latest order for every customer**
- [ ] **156. Find customers who ordered in January but not February**
- [ ] **157. Find customers who ordered in both January and February**
- [ ] **158. Find consecutive transaction dates**
- [ ] **159. Find users who logged in for 3 consecutive days**
- [ ] **160. Find monthly revenue**
- [ ] **161. Find month-over-month revenue growth**
- [ ] **162. Find the percentage contribution of each product to total sales**
- [ ] **163. Find the percentage contribution of each department to company salary**
- [ ] **164. Find inactive customers**
- [ ] **165. Find the most loyal customer**

---

# 🗄️ LEVEL 8 — DATABASE DESIGN

**Problems 166–180**

- [ ] **166. Design an employee management database**
- [ ] **167. Design a library management database**
- [ ] **168. Design an online shopping database**
- [ ] **169. Design a food-delivery database**
- [ ] **170. Design a banking database**
- [ ] **171. Design a hotel booking database**
- [ ] **172. Design a course management database**
- [ ] **173. Design a hospital management database**
- [ ] **174. Design a ticket booking database**
- [ ] **175. Design a wallet/payment database**
- [ ] **176. Normalize an unnormalized table to 1NF**
- [ ] **177. Convert it to 2NF**
- [ ] **178. Convert it to 3NF**
- [ ] **179. Identify one-to-one, one-to-many and many-to-many relationships**
- [ ] **180. Decide where foreign keys should exist**

---

# ⚡ LEVEL 9 — PERFORMANCE + TRANSACTIONS

**Problems 181–195**

- [ ] **181. Create an index on email**
- [ ] **182. Create an index on customer_id**
- [ ] **183. Create a composite index**
- [ ] **184. Compare query performance with and without an index**
- [ ] **185. Use EXPLAIN**
- [ ] **186. Understand an index scan vs sequential scan**
- [ ] **187. Determine which columns should be indexed**
- [ ] **188. Demonstrate a transaction**
- [ ] **189. Demonstrate COMMIT**
- [ ] **190. Demonstrate ROLLBACK**
- [ ] **191. Simulate money transfer using a transaction**
- [ ] **192. Understand ACID using the banking project**
- [ ] **193. Understand dirty reads**
- [ ] **194. Understand non-repeatable reads**
- [ ] **195. Understand phantom reads**

---

# 🚀 LEVEL 10 — SPRING BOOT + JPA

**Problems 196–220**

- [ ] **196. Connect Spring Boot to PostgreSQL**
- [ ] **197. Configure datasource**
- [ ] **198. Create an Employee entity**
- [ ] **199. Create EmployeeRepository**
- [ ] **200. Implement CRUD APIs**
- [ ] **201. Create Department entity**
- [ ] **202. Implement @ManyToOne**
- [ ] **203. Implement @OneToMany**
- [ ] **204. Implement @OneToOne**
- [ ] **205. Implement @ManyToMany**
- [ ] **206. Create custom Spring Data query methods**
- [ ] **207. Write JPQL query**
- [ ] **208. Write a native SQL query**
- [ ] **209. Implement pagination**
- [ ] **210. Implement sorting**
- [ ] **211. Implement filtering**
- [ ] **212. Implement search**
- [ ] **213. Use DTO projections**
- [ ] **214. Implement a transactional service**
- [ ] **215. Understand @Transactional**
- [ ] **216. Handle lazy vs eager loading**
- [ ] **217. Identify the N+1 query problem**
- [ ] **218. Fix an N+1 problem**
- [ ] **219. Add database indexes to your Spring Boot application**
- [ ] **220. Optimize a slow database query**

---

# 🎯 CURRENT PROGRESS

```text
P001 ✅
P002 ✅
P003 ✅

P004 🔥 NEXT
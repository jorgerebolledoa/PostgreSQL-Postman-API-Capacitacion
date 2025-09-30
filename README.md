# 📚 Etapa 1: PostgreSQL + Postman + API mínima con Express

## 🎯 Objetivo
Aprender a:
1. Crear y manipular datos en PostgreSQL usando SQL.
2. Exponer esos datos a través de una API con Node.js + Express.
3. Probar los endpoints usando Postman.

---

## 🔧 Requisitos
- [PostgreSQL](https://www.postgresql.org/download/)
- [Node.js](https://nodejs.org/) (versión 18+ recomendada)
- [Postman](https://www.postman.com/downloads/)

---

## 🚀 Paso 1: Crear la base de datos
1. Abrir la terminal de PostgreSQL (`psql`) o pgAdmin.  
2. Crear la base de datos:

```sql
CREATE DATABASE university;
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE courses (
  id SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  credits INT NOT NULL
);
```
```sql
INSERT INTO students (name, email)
VALUES ('Ana Pérez', 'ana@uni.cl'),
       ('Luis Soto', 'luis@uni.cl');

INSERT INTO courses (title, credits)
VALUES ('Bases de Datos', 5),
       ('Programación Web', 4);
```
```sql
-- Ver todos los estudiantes
SELECT * FROM students;

-- Buscar por ID
SELECT name FROM students WHERE id = 1;

-- Cursos con créditos >= 5
SELECT * FROM courses WHERE credits >= 5;

-- Actualizar correo
UPDATE students SET email = 'anaperez@uni.cl' WHERE id = 1;

-- Eliminar curso
DELETE FROM courses WHERE id = 2;

-- Relación estudiante-curso
ALTER TABLE students ADD COLUMN course_id INT REFERENCES courses(id);
UPDATE students SET course_id = 1 WHERE id = 1;

SELECT s.name, c.title
FROM students s
JOIN courses c ON s.course_id = c.id;
```
bash iniciar nuestra api
```bash
mkdir api-university && cd api-university
npm init -y
npm install express pg cors
```
Creamos nuestro archivo index.js
```js
import express from "express";
import pkg from "pg";
const { Pool } = pkg;

const app = express();
app.use(express.json());

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "university",
  password: "tu_password",
  port: 5432,
});

// GET todos los estudiantes
app.get("/students", async (req, res) => {
  const result = await pool.query("SELECT * FROM students");
  res.json(result.rows);
});

// POST agregar estudiante
app.post("/students", async (req, res) => {
  const { name, email } = req.body;
  const result = await pool.query(
    "INSERT INTO students (name, email) VALUES ($1, $2) RETURNING *",
    [name, email]
  );
  res.json(result.rows[0]);
});

app.listen(3000, () => console.log("✅ API corriendo en http://localhost:3000"));
```
levantamos nuestra api
```bash
node index.js
```
probamos con postman o similares
GET http://localhost:3000/students
→ Devuelve todos los estudiantes.

POST http://localhost:3000/students
En el body (JSON):
```
```js

{
  "name": "Carla Gómez",
  "email": "carla@uni.cl"
}
```




import express from "express";
import pkg from "pg";
import dotenv from "dotenv";
dotenv.config(); // Carga variables del archivo .env

const { Pool } = pkg;
const app = express();
app.use(express.json());

// Conexión a PostgreSQL usando variables de entorno
const pool = new Pool({
  user: process.env.PGUSER,
  host: process.env.PGHOST,
  database: process.env.PGDATABASE,
  password: String(process.env.PGPASSWORD ?? ""),
  port: Number(process.env.PGPORT ?? 5432),
});
// Obtener todos los estudiantes
app.get("/students", async (_req, res) => {
  try {
    const { rows } = await pool.query("SELECT * FROM students ORDER BY id");
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Error al obtener estudiantes" });
  }
});

// Agregar un nuevo estudiante
app.post("/students", async (req, res) => {
  try {
    const { name, email } = req.body;
    const { rows } = await pool.query(
      "INSERT INTO students (name, email) VALUES ($1, $2) RETURNING *",
      [name, email]
    );
    res.status(201).json(rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Error al agregar estudiante" });
  }
});

// Obtener todos los cursos
app.get("/courses", async (_req, res) => {
  try {
    const { rows } = await pool.query("SELECT * FROM courses ORDER BY id");
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Error al obtener cursos" });
  }
});

// Agregar un nuevo curso
app.post("/courses", async (req, res) => {
  try {
    const { title, credits } = req.body;
    const { rows } = await pool.query(
      "INSERT INTO courses (title, credits) VALUES ($1, $2) RETURNING *",
      [title, credits]
    );
    res.status(201).json(rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Error al agregar curso" });
  }
});

// Obtener estudiantes junto con su curso (JOIN)
app.get("/students-with-course", async (_req, res) => {
  try {
    const { rows } = await pool.query(`
      SELECT s.id, s.name, s.email, c.title AS course, c.credits
      FROM students s
      LEFT JOIN courses c ON c.id = s.course_id
      ORDER BY s.id
    `);
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Error al obtener estudiantes con curso" });
  }
});

// Servidor activo
app.listen(3000, () => console.log("✅ API corriendo en http://localhost:3000"));

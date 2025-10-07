import express from "express";
import pg from "pg";
const { Pool } = pg;
const app = express()

app.use(express.json())

const pool = new Pool({
    user: 'database',
    host: 'localhost',
    database: 'universidad',
    password: 'password_arbitrario',
    port: 5432,
});

app.get("/estudiantes", async (req, res) => {
  const result = await pool.query("SELECT * FROM estudiantes");
  res.json(result.rows);
});

app.post("/estudiantes", async (req, res) => {
  const { name, email } = req.body;
  const result = await pool.query(
    "INSERT INTO estudiantes (nombre, apelllido, email, fecha_nacimiento) VALUES ($1, $2, $3, NOW()) RETURNING *",
    [nombre, apellido, email, fecha_nacimiento]
  );
  res.json(result.rows[0]);
});

app.listen(3000, () => {
  console.log("Server is running on port 3000");
}); 


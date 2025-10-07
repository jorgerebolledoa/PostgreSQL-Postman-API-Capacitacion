import express from "express";
import pkg from "pg";
const { Pool } = pkg;

const app = express();
app.use(express.json());

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "university",
  password: "9603",
  port: 5432,
});

app.get("/students", async (req, res) => {
  const result = await pool.query("SELECT * FROM students");
  res.json(result.rows);
});

app.post("/students", async (req, res) => {
  const { name, email } = req.body;
  const result = await pool.query(
    "INSERT INTO students (name, email) VALUES ($1, $2) RETURNING *",
    [name, email]
  );
  res.json(result.rows[0]);
});


app.listen(3000, () => console.log("✅ API corriendo en http://localhost:3000"));

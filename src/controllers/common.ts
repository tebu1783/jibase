import sqlite3 from "sqlite3";
import { open } from "sqlite";

export const dbRunAll = async (sql: string) => {
  const db = await open({
    filename: "database.db",
    driver: sqlite3.Database,
  });
  const result = await db.all(sql);
  await db.close();
  return result;
};

export const dbRunGet = async (sql: string) => {
  const db = await open({
    filename: "database.db",
    driver: sqlite3.Database,
  });
  const result = await db.get(sql);
  await db.close();
  return result;
};

export const dbRunExec = async (sql: string) => {
  const db = await open({
    filename: "database.db",
    driver: sqlite3.Database,
  });
  const result = await db.exec(sql);
  await db.close();
  return result;
};

export const sqlSelectAllPosts = (): string => {
  return `SELECT
posts.id as post_id,
posts.title,
posts.content,
fields.name as field_name,
users.username as author_name
FROM posts
LEFT JOIN post_fields ON posts.id = post_fields.post_id
JOIN fields ON post_fields.field_id = fields.id
LEFT JOIN users ON posts.author_id = users.id`;
};

export const sqlSelectPostById = (id: number): string => {
  return (
    sqlSelectAllPosts() +
    `
WHERE posts.id = ${id}`
  );
};

export const sqlSearchPosts = (q: string): string => {
  return (
    sqlSelectAllPosts() +
    `
WHERE
posts.title LIKE '%${q}%'
OR posts.content LIKE '%${q}%'
OR fields.name LIKE '%${q}%'`
  );
};

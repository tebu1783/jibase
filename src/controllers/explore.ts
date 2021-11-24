import { Request, Response } from "express";
import {
  dbRunAll,
  dbRunExec,
  dbRunGet,
  sqlSearchPosts,
  sqlSelectAllPosts,
  sqlSelectPostById,
} from "./common";

const wrapResultContent = (result: any[], wrapLength: number = 500) => {
  return result.map((row: any) => {
    return {
      ...row,
      content:
        row.content.length > wrapLength
          ? row.content.slice(0, wrapLength) + "..."
          : row.content,
    };
  });
};

/**
 * @route GET /explore
 */
export const getExplore = async (req: Request, res: Response) => {
  const result = await dbRunAll(
    "q" in req.query &&
      typeof req.query.q === "string" &&
      req.query.q.length > 0
      ? sqlSearchPosts(req.query.q)
      : sqlSelectAllPosts()
  );

  res.render("explore/index", {
    title: "Explore",
    content: wrapResultContent(result),
  });
};

/**
 * @route GET /explore/view
 */
export const getExploreView = async (req: Request, res: Response) => {
  const result =
    "post_id" in req.query &&
    typeof req.query.post_id === "string" &&
    req.query.post_id.length > 0
      ? await dbRunGet(sqlSelectPostById(parseInt(req.query.post_id)))
      : null;

  res.render("explore/view", {
    title: "Explore",
    content: result,
  });
};

/**
 * @route POST /explore/view
 */
export const postExploreView = async (req: Request, res: Response) => {
  if ("delete" in req.body) {
    const post_id = req.query.post_id;
    await dbRunExec(`DELETE FROM posts WHERE posts.id = ${post_id}`);
    await dbRunExec(
      `DELETE FROM post_fields WHERE post_fields.post_id = ${post_id}`
    );
  }
  res.redirect("/explore");
};

/**
 * @route POST /explore
 */
export const postExplore = async (req: Request, res: Response) => {
  res.redirect("/explore/post");
};

/**
 * @route GET /explore/post
 */
export const getExplorePost = async (req: Request, res: Response) => {
  const result = await dbRunAll("SELECT name FROM fields;");
  console.log(result);

  res.render("explore/post", {
    title: "Explore",
    content: {
      fields: result.map((row: any) => row.name),
    },
  });
};

/**
 * @route POST /explore/post
 */
export const postExplorePost = async (req: Request, res: Response) => {
  console.log(req.body);
  const title = req.body.postTitle;
  const content = req.body.postContent;

  await dbRunExec(
    `INSERT INTO posts (title, content) VALUES ('${title}', '${content}')`
  );

  const fieldId = (
    await dbRunGet(
      `SELECT id FROM fields WHERE fields.name = '${req.body.postField}'`
    )
  ).id;

  const newPostId = (await dbRunGet("SELECT MAX(id) AS max FROM posts;")).max;
  await dbRunExec(
    `INSERT INTO post_fields (post_id, field_id) VALUES (${newPostId}, ${fieldId})`
  );
  res.redirect("/explore");
};

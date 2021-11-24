
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT NOT NULL,
  password TEXT NOT NULL,
  registered_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE admins (
  id INTEGER PRIMARY KEY,
  FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE teachers (
  id INTEGER PRIMARY KEY,
  FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE learners (
  id INTEGER PRIMARY KEY,
  FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE posts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE post_fields (
  post_id INTEGER NOT NULL,
  field_id INTEGER NOT NULL,
  PRIMARY KEY (post_id, field_id),
  FOREIGN KEY (post_id) REFERENCES posts(id),
  FOREIGN KEY (field_id) REFERENCES fields(id)
);

CREATE TABLE fields (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL
);

CREATE TABLE learnings (
  learner_id INTEGER NOT NULL,
  field_id INTEGER NOT NULL,
  PRIMARY KEY (learner_id, field_id),
  FOREIGN KEY (learner_id) REFERENCES learners(id),
  FOREIGN KEY (field_id) REFERENCES fields(id)
);

CREATE TABLE expertises (
  teacher_id INTEGER NOT NULL,
  field_id INTEGER NOT NULL,
  PRIMARY KEY (teacher_id, field_id),
  FOREIGN KEY (teacher_id) REFERENCES teachers(id),
  FOREIGN KEY (field_id) REFERENCES fields(id)
);

CREATE TABLE post_views (
  user_id INTEGER NOT NULL,
  post_id INTEGER NOT NULL,
  n_views INTEGER NOT NULL,
  last_viewed_at TEXT,
  PRIMARY KEY (user_id, post_id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (post_id) REFERENCES posts(id)
);

CREATE TABLE post_dependencies (
    depending_post_id INTEGER NOT NULL,
    depended_post_id INTEGER NOT NULL,
    PRIMARY KEY (depending_post_id, depended_post_id),
    FOREIGN KEY (depending_post_id) REFERENCES posts(id),
    FOREIGN KEY (depended_post_id) REFERENCES posts(id)
);

CREATE TABLE post_relations (
    post_id INTEGER NOT NULL,
    related_post_id INTEGER NOT NULL,
    PRIMARY KEY (post_id, related_post_id),
    FOREIGN KEY (post_id) REFERENCES posts(id),
    FOREIGN KEY (related_post_id) REFERENCES posts(id)
);











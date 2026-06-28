CREATE TABLE IF NOT EXISTS careers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT
);

CREATE TABLE IF NOT EXISTS semesters (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  start_date DATE,
  end_date DATE
);

CREATE TABLE IF NOT EXISTS subjects (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  code VARCHAR(50),
  career_id INT,
  description TEXT,
  FOREIGN KEY (career_id) REFERENCES careers(id)
);

CREATE TABLE IF NOT EXISTS professors (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  notes TEXT
);

CREATE TABLE IF NOT EXISTS professor_personalities (
  id INT AUTO_INCREMENT PRIMARY KEY,
  professor_id INT NOT NULL,
  aspect VARCHAR(50) NOT NULL,
  detail TEXT NOT NULL,
  FOREIGN KEY (professor_id) REFERENCES professors(id)
);

CREATE TABLE IF NOT EXISTS professor_subjects (
  id INT AUTO_INCREMENT PRIMARY KEY,
  professor_id INT NOT NULL,
  subject_id INT NOT NULL,
  semester_id INT,
  section VARCHAR(50),
  FOREIGN KEY (professor_id) REFERENCES professors(id),
  FOREIGN KEY (subject_id) REFERENCES subjects(id),
  FOREIGN KEY (semester_id) REFERENCES semesters(id)
);

CREATE TABLE IF NOT EXISTS grading_criteria (
  id INT AUTO_INCREMENT PRIMARY KEY,
  professor_subject_id INT NOT NULL,
  description TEXT NOT NULL,
  breakdown JSON,
  FOREIGN KEY (professor_subject_id) REFERENCES professor_subjects(id)
);

CREATE TABLE IF NOT EXISTS units (
  id INT AUTO_INCREMENT PRIMARY KEY,
  subject_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  order_index INT,
  FOREIGN KEY (subject_id) REFERENCES subjects(id)
);

CREATE TABLE IF NOT EXISTS topics (
  id INT AUTO_INCREMENT PRIMARY KEY,
  unit_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  order_index INT,
  FOREIGN KEY (unit_id) REFERENCES units(id)
);

CREATE TABLE IF NOT EXISTS assessments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  professor_subject_id INT NOT NULL,
  unit_id INT,
  name VARCHAR(255) NOT NULL,
  type ENUM('exam', 'lab', 'assignment', 'project', 'quiz', 'other') NOT NULL,
  weight DECIMAL(5,2),
  max_score DECIMAL(5,2),
  date DATE,
  description TEXT,
  FOREIGN KEY (professor_subject_id) REFERENCES professor_subjects(id),
  FOREIGN KEY (unit_id) REFERENCES units(id)
);

CREATE TABLE IF NOT EXISTS grades (
  id INT AUTO_INCREMENT PRIMARY KEY,
  assessment_id INT NOT NULL,
  score DECIMAL(5,2),
  feedback TEXT,
  date DATE,
  FOREIGN KEY (assessment_id) REFERENCES assessments(id)
);

CREATE TABLE IF NOT EXISTS labs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  professor_subject_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  due_date DATE,
  max_score DECIMAL(5,2),
  grading_rubric TEXT,
  FOREIGN KEY (professor_subject_id) REFERENCES professor_subjects(id)
);

CREATE TABLE IF NOT EXISTS materials (
  id INT AUTO_INCREMENT PRIMARY KEY,
  professor_subject_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  type ENUM('slide', 'syllabus', 'notebook', 'dataset', 'document', 'other'),
  file_path VARCHAR(500),
  description TEXT,
  FOREIGN KEY (professor_subject_id) REFERENCES professor_subjects(id)
);

CREATE TABLE IF NOT EXISTS academic_errors (
  id INT AUTO_INCREMENT PRIMARY KEY,
  subject_id INT NOT NULL,
  description TEXT NOT NULL,
  error_type VARCHAR(100),
  solution TEXT,
  date DATE,
  FOREIGN KEY (subject_id) REFERENCES subjects(id)
);

CREATE TABLE IF NOT EXISTS exam_tips (
  id INT AUTO_INCREMENT PRIMARY KEY,
  assessment_id INT NOT NULL,
  tip TEXT NOT NULL,
  source ENUM('professor', 'ai', 'personal') NOT NULL,
  FOREIGN KEY (assessment_id) REFERENCES assessments(id)
);

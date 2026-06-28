import express from 'express';
import cors from 'cors';
import { fileURLToPath } from 'url';
import path from 'path';
import { env } from './config/env.js';

/* infrastructure */
import { MySQLProfessorRepository } from './infrastructure/database/repositories/mysql-professor-repository.js';
import { MySQLGradeRepository } from './infrastructure/database/repositories/mysql-grade-repository.js';
import { MySQLSubjectRepository } from './infrastructure/database/repositories/mysql-subject-repository.js';
import { OpencodeClient } from './infrastructure/ai/opencode-client.js';

/* application */
import { GetPersonalityUseCase } from './application/use-cases/get-personality.js';
import { GetSummaryUseCase } from './application/use-cases/get-summary.js';
import { GetMistakesUseCase } from './application/use-cases/get-mistakes.js';
import { GenerateStudyMaterialUseCase } from './application/use-cases/generate-study-material.js';
import { GetStudentUseCase } from './application/use-cases/get-student.js';
import { GetAverageUseCase } from './application/use-cases/get-average.js';

/* interfaces */
import { PersonalityController } from './interfaces/controllers/personality-controller.js';
import { SummaryController } from './interfaces/controllers/summary-controller.js';
import { MistakesController } from './interfaces/controllers/mistakes-controller.js';
import { ChatController } from './interfaces/controllers/chat-controller.js';
import { StudentController } from './interfaces/controllers/student-controller.js';
import { AverageController } from './interfaces/controllers/average-controller.js';
import { buildRoutes } from './interfaces/routes/index.js';

const professorRepo = new MySQLProfessorRepository();
const gradeRepo = new MySQLGradeRepository();
const subjectRepo = new MySQLSubjectRepository();
const opencode = new OpencodeClient();

const getPersonality = new GetPersonalityUseCase(professorRepo);
const getSummary = new GetSummaryUseCase(subjectRepo, gradeRepo);
const getMistakes = new GetMistakesUseCase(gradeRepo);
const generateStudyMaterial = new GenerateStudyMaterialUseCase(professorRepo, opencode);
const getStudent = new GetStudentUseCase();
const getAverage = new GetAverageUseCase();

const controllers = {
  personality: new PersonalityController(getPersonality),
  summary: new SummaryController(getSummary),
  mistakes: new MistakesController(getMistakes),
  chat: new ChatController(generateStudyMaterial),
  student: new StudentController(getStudent),
  average: new AverageController(getAverage),
};

const __dirname = path.dirname(fileURLToPath(import.meta.url));

const app = express();
app.use(cors());
app.use(express.json());
app.use('/api', buildRoutes(controllers));
app.use(express.static(path.join(__dirname, 'interfaces/presentation/dist')));

app.get('*', (_req, res) => {
  res.sendFile(path.join(__dirname, 'interfaces/presentation/dist/index.html'));
});

app.listen(env.port, () => {
  console.log(`EAWS backend en http://127.0.0.1:${env.port}`);
});

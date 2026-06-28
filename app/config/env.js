import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { config } from 'dotenv';

const currentDir = path.dirname(fileURLToPath(import.meta.url));

config({ path: path.resolve(currentDir, '../.env') });

export const env = {
  port: Number(process.env.PORT) || 4000,
  db: {
    host: process.env.DB_HOST || '127.0.0.1',
    port: Number(process.env.DB_PORT) || 3306,
    user: process.env.DB_USER || 'jef',
    password: process.env.DB_PASSWORD || 'jef',
    name: process.env.DB_NAME || 'eaws',
  },
  opencode: {
    url: process.env.OPENCODE_SERVER_URL || process.env.OPencode_SERVER_URL || 'http://127.0.0.1:4096',
    token: process.env.OPENCODE_AUTH_TOKEN || '',
  },
};

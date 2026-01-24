/**
 * Python 学习应用类型定义
 */

export enum Tab {
  LEARN = 'LEARN',
  SYNTAX = 'SYNTAX',
  QUIZ = 'QUIZ',
  INTERVIEW = 'INTERVIEW',
  SETTINGS = 'SETTINGS'
}

export type Difficulty = '入门' | '进阶' | '高阶';

export interface CourseChapter {
  id: string;
  unitId: string;
  title: string;
  description: string;
  content: string;
  exampleCode: string;
  summary: string[];
  difficulty: Difficulty;
}

export interface CourseUnit {
  id: string;
  name: string;
  description: string;
  order: number;
}

export enum QuestionType {
  SINGLE_CHOICE = 'SINGLE_CHOICE',      // 单选题
  MULTIPLE_CHOICE = 'MULTIPLE_CHOICE',  // 多选题
  TRUE_FALSE = 'TRUE_FALSE'             // 判断题
}

export interface QuizQuestion {
  id: string;
  type: QuestionType;
  question: string;
  options: string[];
  correctIndices: number[];  // 支持多选题，判断题时只有0或1
  explanation: string;
  // 向后兼容：保留correctIndex，但优先使用correctIndices
  correctIndex?: number;
}

export interface QuizModule {
  id: string;
  title: string;
  questions: QuizQuestion[];
}

export interface ReferenceItem {
  keyword: string;
  description: string;
  code?: string;
}

export interface ReferenceCategory {
  title: string;
  items: ReferenceItem[];
}

export type InterviewDifficulty = '简单' | '中等' | '困难';

export interface InterviewItem {
  id: string;
  question: string;
  answer: string;
  difficulty: InterviewDifficulty;
  tags: string[];
}


import { InterviewDifficulty, InterviewItem, Language } from '../data/RustTypes';
import { PreferencesManager } from './PreferencesManager';

/**
 * 自定义面试问题管理工具类
 */
export class InterviewQuestionsManager {
  private static readonly STORAGE_KEY = 'custom_interview_questions';
  private static readonly VALID_DIFFICULTIES: InterviewDifficulty[] = ['简单', '中等', '困难'];

  private static normalizeTags(rawTags: string | string[] | null | undefined): string[] {
    if (Array.isArray(rawTags)) {
      return rawTags.map(t => String(t).trim()).filter(t => t.length > 0);
    }
    if (typeof rawTags === 'string') {
      return rawTags.split(/[,，]/).map(t => t.trim()).filter(t => t.length > 0);
    }
    return [];
  }

  private static normalizeDifficulty(rawDifficulty: string | null | undefined): InterviewDifficulty {
    const candidate = typeof rawDifficulty === 'string' ? (rawDifficulty as InterviewDifficulty) : '简单';
    return InterviewQuestionsManager.VALID_DIFFICULTIES.includes(candidate) ? candidate : '简单';
  }

  private static normalizeQuestion(raw: Record<string, Object> | null | undefined): InterviewItem | null {
    if (typeof raw !== 'object' || raw === null) {
      return null;
    }
    const obj = raw as Record<string, Object>;
    const id = typeof obj.id === 'string' ? obj.id : '';
    const question = typeof obj.question === 'string' ? obj.question : '';
    const answer = typeof obj.answer === 'string' ? obj.answer : '';
    const language = typeof obj.language === 'number' ? obj.language as Language : undefined;
    
    if (!id || !question || !answer) {
      return null;
    }
    return {
      id,
      question,
      answer,
      difficulty: InterviewQuestionsManager.normalizeDifficulty(obj.difficulty as string),
      tags: InterviewQuestionsManager.normalizeTags(obj.tags as string | string[] | null | undefined),
      language
    };
  }

  /**
   * 获取自定义面试问题，支持按语言过滤
   */
  static async getCustomQuestions(language?: Language): Promise<InterviewItem[]> {
    try {
      const prefs = await PreferencesManager.getPreferences('app_settings');
      const questionsJson: string = await prefs.get(InterviewQuestionsManager.STORAGE_KEY, '[]') as string;
      const parsed: Object = JSON.parse(questionsJson) as Object;
      if (!Array.isArray(parsed)) {
        return [];
      }
      const result: InterviewItem[] = [];
      for (let i = 0; i < parsed.length; i++) {
        const raw = parsed[i] as Record<string, Object>;
        const normalized = InterviewQuestionsManager.normalizeQuestion(raw);
        if (normalized !== null) {
          // 如果指定了语言，则进行过滤。如果没有 language 字段，则视为通用（旧数据兼容）
          if (language === undefined || normalized.language === undefined || normalized.language === language) {
            result.push(normalized);
          }
        }
      }
      return result;
    } catch (err) {
      console.error(`Failed to get custom interview questions: ${JSON.stringify(err)}`);
      return [];
    }
  }

  /**
   * 保存所有自定义面试问题列表
   */
  private static async saveAllCustomQuestions(questions: InterviewItem[]): Promise<void> {
    try {
      const prefs = await PreferencesManager.getPreferences('app_settings');
      await prefs.put(InterviewQuestionsManager.STORAGE_KEY, JSON.stringify(questions));
      await prefs.flush();
    } catch (err) {
      console.error(`Failed to save custom interview questions: ${JSON.stringify(err)}`);
    }
  }

  /**
   * 获取不分语言的所有自定义问题（内部使用）
   */
  private static async getAllCustomQuestions(): Promise<InterviewItem[]> {
    return await InterviewQuestionsManager.getCustomQuestions(undefined);
  }

  /**
   * 添加自定义面试问题
   */
  static async addCustomQuestion(question: InterviewItem): Promise<boolean> {
    try {
      const allQuestions = await InterviewQuestionsManager.getAllCustomQuestions();
      // 检查是否已存在相同ID的问题
      const exists = allQuestions.some((q: InterviewItem) => q.id === question.id);
      if (exists) {
        return false;
      }
      allQuestions.push(question);
      await InterviewQuestionsManager.saveAllCustomQuestions(allQuestions);
      return true;
    } catch (err) {
      console.error(`Failed to add custom interview question: ${JSON.stringify(err)}`);
      return false;
    }
  }

  /**
   * 删除自定义面试问题
   */
  static async deleteCustomQuestion(questionId: string): Promise<boolean> {
    try {
      const allQuestions = await InterviewQuestionsManager.getAllCustomQuestions();
      const index = allQuestions.findIndex((q: InterviewItem) => q.id === questionId);
      if (index === -1) {
        return false;
      }
      allQuestions.splice(index, 1);
      await InterviewQuestionsManager.saveAllCustomQuestions(allQuestions);
      return true;
    } catch (err) {
      console.error(`Failed to delete custom interview question: ${JSON.stringify(err)}`);
      return false;
    }
  }

  /**
   * 更新自定义面试问题
   */
  static async updateCustomQuestion(questionId: string, updatedQuestion: InterviewItem): Promise<boolean> {
    try {
      const allQuestions = await InterviewQuestionsManager.getAllCustomQuestions();
      const index = allQuestions.findIndex((q: InterviewItem) => q.id === questionId);
      if (index === -1) {
        return false;
      }
      allQuestions[index] = updatedQuestion;
      await InterviewQuestionsManager.saveAllCustomQuestions(allQuestions);
      return true;
    } catch (err) {
      console.error(`Failed to update custom interview question: ${JSON.stringify(err)}`);
      return false;
    }
  }

  /**
   * 生成唯一的问题ID
   */
  static generateQuestionId(): string {
    return `custom_${Date.now()}_${Math.random().toString(36).substring(2, 9)}`;
  }
}
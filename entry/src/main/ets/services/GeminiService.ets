import { ExecutionResult, Language } from '../data/RustTypes';
import http from '@ohos.net.http';

/**
 * Gemini API 服务
 * 注意：需要配置 API Key 才能使用
 */
export class GeminiService {
  private static readonly API_KEY = ''; // 需要配置 API Key
  private static readonly BASE_URL = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent';

  /**
   * 模拟代码执行
   */
  static async simulateCodeExecution(code: string, language: Language): Promise<ExecutionResult> {
    if (!GeminiService.API_KEY) {
      return {
        output: "错误: 未找到 API Key。请检查环境变量配置。",
        isError: true
      };
    }

    try {
      const prompt = `你是一个代码执行模拟器。
编程语言: ${language}
代码:
${code}

任务:
1. 分析代码逻辑。
2. 精确模拟控制台输出 (Console Output)。
3. 如果代码包含 UI 框架逻辑，请用文字描述 UI 呈现 (例如: "[UI 渲染]: 一个按钮显示'你好'")。
4. 如果有语法错误或运行时错误，请输出错误信息。

注意: 所有的解释、错误信息或非代码输出必须使用中文 (Simplified Chinese)。

输出格式:
只返回模拟的输出内容，不要使用 Markdown 代码块。`;

      const response = await GeminiService.callGeminiAPI(prompt);
      return {
        output: response || "无输出生成。",
        isError: false
      };
    } catch (error) {
      return {
        output: `执行错误: ${(error as Error).message || "未知错误"}`,
        isError: true
      };
    }
  }

  /**
   * 解释代码
   */
  static async explainCode(code: string, language: Language): Promise<string> {
    if (!GeminiService.API_KEY) {
      return "API Key 缺失。";
    }

    try {
      const prompt = `请用中文(简体)简明扼要地解释以下 ${language} 代码，适合初学者理解：\n\n${code}`;
      const response = await GeminiService.callGeminiAPI(prompt);
      return response || "无法生成解释。";
    } catch (e) {
      return "代码解释失败。";
    }
  }

  /**
   * 修复代码
   */
  static async fixCode(code: string, language: Language): Promise<string> {
    if (!GeminiService.API_KEY) {
      return "API Key 缺失。";
    }

    try {
      const prompt = `请修复以下 ${language} 代码中的 Bug，并仅返回修复后的代码。如果代码正确，则原样返回。\n\n${code}`;
      let response = await GeminiService.callGeminiAPI(prompt);
      
      // 移除 Markdown 代码块标记
      if (response.startsWith('```')) {
        response = response.replace(/^```[a-z]*\n/, '').replace(/\n```$/, '');
      }
      
      return response;
    } catch (e) {
      return "代码修复失败。";
    }
  }

  /**
   * 调用 Gemini API
   */
  private static async callGeminiAPI(prompt: string): Promise<string> {
    const httpRequest = http.createHttp();
    
    try {
      const response = await httpRequest.request(
        `${GeminiService.BASE_URL}?key=${GeminiService.API_KEY}`,
        {
          method: http.RequestMethod.POST,
          header: {
            'Content-Type': 'application/json'
          },
          extraData: JSON.stringify({
            contents: [{
              parts: [{
                text: prompt
              }]
            }]
          })
        }
      );

      if (response.responseCode === 200) {
        const result = JSON.parse(response.result.toString());
        if (result.candidates && result.candidates[0] && result.candidates[0].content) {
          return result.candidates[0].content.parts[0].text || '';
        }
      }
      
      throw new Error(`API 请求失败: ${response.responseCode}`);
    } finally {
      httpRequest.destroy();
    }
  }
}


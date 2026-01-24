import { CourseChapter, CourseUnit, InterviewItem, Language, QuizModule, ReferenceCategory } from '../data/RustTypes';
// Rust data
import { COURSE_CHAPTERS as RustCourseChapters, COURSE_UNITS as RustCourseUnits, QUIZ_MODULES as RustQuizModules, REFERENCE_DATA as RustReferenceData, INTERVIEW_QUESTIONS as RustInterviewQuestions } from '../data/RustConstants';
// Python data
import { COURSE_CHAPTERS as PythonCourseChapters, COURSE_UNITS as PythonCourseUnits, QUIZ_MODULES as PythonQuizModules, REFERENCE_DATA as PythonReferenceData, INTERVIEW_QUESTIONS as PythonInterviewQuestions } from '../data/PythonConstants';
// Go data
import { COURSE_CHAPTERS as GoCourseChapters, COURSE_UNITS as GoCourseUnits, QUIZ_MODULES as GoQuizModules, REFERENCE_DATA as GoReferenceData, INTERVIEW_QUESTIONS as GoInterviewQuestions } from '../data/GoConstants';

// Debug: Log imported data at module load time
console.info(`[LDM Module Load] RustCourseChapters: ${RustCourseChapters?.length || 0}, first: ${RustCourseChapters?.[0]?.title || 'none'}`);
console.info(`[LDM Module Load] PythonCourseChapters: ${PythonCourseChapters?.length || 0}, first: ${PythonCourseChapters?.[0]?.title || 'none'}`);
console.info(`[LDM Module Load] GoCourseChapters: ${GoCourseChapters?.length || 0}, first: ${GoCourseChapters?.[0]?.title || 'none'}`);

/**
 * Language Data Manager
 * Provides unified access to language-specific data
 */
export class LanguageDataManager {
  /**
   * Get course chapters for the specified language
   */
  static getCourseChapters(language: Language): CourseChapter[] {
    // Convert to number explicitly to ensure proper comparison
    const langNum: number = Number(language);
    const pythonNum: number = Number(Language.PYTHON);
    const goNum: number = Number(Language.GO);
    
    console.info(`[LDM] getCourseChapters - language: ${language}, langNum: ${langNum}, pythonNum: ${pythonNum}, goNum: ${goNum}`);
    console.info(`[LDM] Comparison: langNum === pythonNum: ${langNum === pythonNum}, langNum === goNum: ${langNum === goNum}`);
    console.info(`[LDM] Data lengths - Rust: ${RustCourseChapters?.length || 0}, Python: ${PythonCourseChapters?.length || 0}, Go: ${GoCourseChapters?.length || 0}`);
    
    let result: CourseChapter[] = [];
    let selectedBranch: string = '';
    
    // Use number comparison for reliability
    if (langNum === pythonNum && PythonCourseChapters && PythonCourseChapters.length > 0) {
      result = PythonCourseChapters;
      selectedBranch = 'PYTHON';
    } else if (langNum === goNum && GoCourseChapters && GoCourseChapters.length > 0) {
      result = GoCourseChapters;
      selectedBranch = 'GO';
    } else if (RustCourseChapters && RustCourseChapters.length > 0) {
      result = RustCourseChapters;
      selectedBranch = 'RUST (default)';
    }
    
    console.info(`[LDM] Selected branch: ${selectedBranch}, returning ${result.length} chapters`);
    if (result.length > 0) {
      console.info(`[LDM] First chapter title: ${result[0].title}`);
    }
    return result;
  }

  /**
   * Get course units for the specified language
   */
  static getCourseUnits(language: Language): CourseUnit[] {
    const langNum: number = Number(language);
    const pythonNum: number = Number(Language.PYTHON);
    const goNum: number = Number(Language.GO);
    
    console.info(`[LDM] getCourseUnits - langNum: ${langNum}, pythonNum: ${pythonNum}, goNum: ${goNum}`);
    
    let result: CourseUnit[] = [];
    if (langNum === pythonNum && PythonCourseUnits && PythonCourseUnits.length > 0) {
      result = PythonCourseUnits;
      console.info(`[LDM] Using Python units, first: ${result[0]?.name || 'none'}`);
    } else if (langNum === goNum && GoCourseUnits && GoCourseUnits.length > 0) {
      result = GoCourseUnits;
      console.info(`[LDM] Using Go units, first: ${result[0]?.name || 'none'}`);
    } else if (RustCourseUnits && RustCourseUnits.length > 0) {
      result = RustCourseUnits;
      console.info(`[LDM] Using Rust units (default), first: ${result[0]?.name || 'none'}`);
    }
    
    console.info(`[LDM] getCourseUnits returning ${result.length} units`);
    return result;
  }

  /**
   * Get quiz modules for the specified language
   */
  static getQuizModules(language: Language): QuizModule[] {
    const langNum: number = Number(language);
    const pythonNum: number = Number(Language.PYTHON);
    const goNum: number = Number(Language.GO);
    
    console.info(`[LDM] getQuizModules - langNum: ${langNum}, pythonNum: ${pythonNum}, goNum: ${goNum}`);
    
    if (langNum === pythonNum && PythonQuizModules && PythonQuizModules.length > 0) {
      console.info(`[LDM] Using Python quiz modules: ${PythonQuizModules.length}`);
      return PythonQuizModules;
    }
    if (langNum === goNum && GoQuizModules && GoQuizModules.length > 0) {
      console.info(`[LDM] Using Go quiz modules: ${GoQuizModules.length}`);
      return GoQuizModules;
    }
    console.info(`[LDM] Using Rust quiz modules (default): ${RustQuizModules?.length || 0}`);
    return RustQuizModules || [];
  }

  /**
   * Get reference data for the specified language
   */
  static getReferenceData(language: Language): ReferenceCategory[] {
    const langNum: number = Number(language);
    const pythonNum: number = Number(Language.PYTHON);
    const goNum: number = Number(Language.GO);
    
    if (langNum === pythonNum && PythonReferenceData && PythonReferenceData.length > 0) {
      return PythonReferenceData;
    }
    if (langNum === goNum && GoReferenceData && GoReferenceData.length > 0) {
      return GoReferenceData;
    }
    return RustReferenceData || [];
  }

  /**
   * Get interview questions for the specified language
   */
  static getInterviewQuestions(language: Language): InterviewItem[] {
    const langNum: number = Number(language);
    const pythonNum: number = Number(Language.PYTHON);
    const goNum: number = Number(Language.GO);
    
    if (langNum === pythonNum && PythonInterviewQuestions && PythonInterviewQuestions.length > 0) {
      return PythonInterviewQuestions;
    }
    if (langNum === goNum && GoInterviewQuestions && GoInterviewQuestions.length > 0) {
      return GoInterviewQuestions;
    }
    return RustInterviewQuestions || [];
  }

  /**
   * Get the preference key for storing progress for the specified language
   */
  static getLearnPreferencesKey(language: Language): string {
    if (language === Language.PYTHON) {
      return 'python_learn';
    }
    if (language === Language.GO) {
      return 'go_learn';
    }
    return 'rust_learn';
  }

  /**
   * Get the display name for the specified language
   */
  static getLanguageDisplayName(language: Language): string {
    if (language === Language.PYTHON) {
      return 'Python';
    }
    if (language === Language.GO) {
      return 'Go';
    }
    if (language === Language.ARKTS) {
      return 'ArkTS';
    }
    return 'Rust';
  }

  /**
   * Get the primary color for the specified language
   */
  static getLanguagePrimaryColor(language: Language): string {
    if (language === Language.PYTHON) {
      return 'app.color.python_primary';
    }
    if (language === Language.GO) {
      return 'app.color.go_primary';
    }
    if (language === Language.ARKTS) {
      return 'app.color.arkts_primary';
    }
    return 'app.color.rust_primary';
  }

  /**
   * Get the light background color for the specified language
   */
  static getLanguageBgLightColor(language: Language): string {
    if (language === Language.PYTHON) {
      return 'app.color.python_bg_light';
    }
    if (language === Language.GO) {
      return 'app.color.go_bg_light';
    }
    if (language === Language.ARKTS) {
      return 'app.color.arkts_bg_light';
    }
    return 'app.color.rust_bg_light';
  }
}

import { z } from 'zod';
import { BaseSectionSettingsSchema } from '@/lib/base-schemas';
import { FaqSectionSchema } from './schema';

export type FaqSectionData = z.infer<typeof FaqSectionSchema>;
export type FaqSectionSettings = z.infer<typeof BaseSectionSettingsSchema>;

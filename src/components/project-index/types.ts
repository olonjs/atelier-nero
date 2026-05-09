import { z } from 'zod';
import { BaseSectionSettingsSchema } from '@/lib/base-schemas';
import { ProjectIndexSchema } from './schema';

export type ProjectIndexData = z.infer<typeof ProjectIndexSchema>;
export type ProjectIndexSettings = z.infer<typeof BaseSectionSettingsSchema>;

import { z } from 'zod';
import { BaseSectionSettingsSchema } from '@/lib/base-schemas';
import { ManifestoGridSchema } from './schema';

export type ManifestoGridData = z.infer<typeof ManifestoGridSchema>;
export type ManifestoGridSettings = z.infer<typeof BaseSectionSettingsSchema>;

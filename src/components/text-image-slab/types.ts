import { z } from 'zod';
import { BaseSectionSettingsSchema } from '@/lib/base-schemas';
import { TextImageSlabSchema } from './schema';

export type TextImageSlabData = z.infer<typeof TextImageSlabSchema>;
export type TextImageSlabSettings = z.infer<typeof BaseSectionSettingsSchema>;

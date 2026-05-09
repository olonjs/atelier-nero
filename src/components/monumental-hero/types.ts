import { z } from 'zod';
import { BaseSectionSettingsSchema } from '@/lib/base-schemas';
import { MonumentalHeroSchema } from './schema';

export type MonumentalHeroData = z.infer<typeof MonumentalHeroSchema>;
export type MonumentalHeroSettings = z.infer<typeof BaseSectionSettingsSchema>;

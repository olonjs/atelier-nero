import { z } from 'zod';
import { HeroSchema, HeroSettingsSchema } from './schema';

export type HeroData     = z.infer<typeof HeroSchema>;
export type HeroSettings = z.infer<typeof HeroSettingsSchema>;
